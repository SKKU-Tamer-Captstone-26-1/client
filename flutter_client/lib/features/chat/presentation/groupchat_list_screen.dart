import 'package:flutter/material.dart';

import '../../../core/theme/app_colors.dart';
import '../../../core/theme/app_icons.dart';
import '../../../shared/widgets/app_bottom_nav_bar.dart';
import '../../../shared/widgets/app_network_image.dart';
import '../../../shared/widgets/app_top_app_bar.dart';
import '../data/chat_repository.dart';
import '../models/groupchat_models.dart';

class GroupchatListScreen extends StatefulWidget {
  const GroupchatListScreen({
    super.key,
    this.onBottomNavSelected,
    this.onRoomSelected,
    this.chatRepository,
    this.currentUserId,
    this.excludedRoomIds = const <String>{},
  });

  final ValueChanged<AppBottomNavItem>? onBottomNavSelected;
  final ValueChanged<GroupchatRoomSummary>? onRoomSelected;
  final ChatRepository? chatRepository;
  final String? currentUserId;
  final Set<String> excludedRoomIds;

  @override
  State<GroupchatListScreen> createState() => _GroupchatListScreenState();
}

class _GroupchatListScreenState extends State<GroupchatListScreen> {
  List<GroupchatRoomSummary> _rooms = const [];
  final ScrollController _scrollController = ScrollController();
  bool _loading = false;
  bool _loadingMore = false;
  String _nextPageToken = '';
  bool _hasMore = false;

  int get _unreadCount =>
      _rooms.fold<int>(0, (sum, room) => sum + room.unreadCount);

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(_onScroll);
    _loadRooms();
  }

  @override
  void didUpdateWidget(covariant GroupchatListScreen oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.excludedRoomIds != widget.excludedRoomIds) {
      _applyExclusions();
    }
  }

  @override
  void dispose() {
    _scrollController
      ..removeListener(_onScroll)
      ..dispose();
    super.dispose();
  }

  Future<void> _loadRooms() async {
    final repo = widget.chatRepository;
    final userId = widget.currentUserId;
    if (repo == null || userId == null || userId.isEmpty) {
      return;
    }

    setState(() {
      _loading = true;
    });

    try {
      final page = await repo.listMyRooms(userId: userId, pageSize: 20);
      if (!mounted) {
        return;
      }
      setState(() {
        _rooms = page.rooms
            .where((room) => !widget.excludedRoomIds.contains(room.roomId))
            .toList();
        _nextPageToken = page.nextPageToken;
        _hasMore = _nextPageToken.isNotEmpty;
      });
      _scheduleAutoLoadIfUnderfilled();
    } catch (_) {
      // Keep current list state on remote errors.
    } finally {
      if (mounted) {
        setState(() {
          _loading = false;
        });
      }
    }
  }

  Future<void> _loadMoreRooms() async {
    if (_loading || _loadingMore || !_hasMore) {
      return;
    }
    final repo = widget.chatRepository;
    final userId = widget.currentUserId;
    if (repo == null || userId == null || userId.isEmpty) {
      return;
    }

    setState(() {
      _loadingMore = true;
    });

    try {
      final page = await repo.listMyRooms(
        userId: userId,
        pageSize: 20,
        pageToken: _nextPageToken,
      );
      if (!mounted) {
        return;
      }
      final existingRoomIds = _rooms.map((room) => room.roomId).toSet();
      final merged = [
        ..._rooms,
        ...page.rooms.where(
          (room) =>
              !existingRoomIds.contains(room.roomId) &&
              !widget.excludedRoomIds.contains(room.roomId),
        ),
      ];
      setState(() {
        _rooms = merged;
        _nextPageToken = page.nextPageToken;
        _hasMore = _nextPageToken.isNotEmpty;
      });
      _scheduleAutoLoadIfUnderfilled();
    } catch (_) {
      // Keep current list state on remote errors.
    } finally {
      if (mounted) {
        setState(() {
          _loadingMore = false;
        });
      }
    }
  }

  void _onScroll() {
    if (!_scrollController.hasClients) {
      return;
    }
    final position = _scrollController.position;
    if (position.pixels >= position.maxScrollExtent - 180) {
      _loadMoreRooms();
    }
  }

  void _scheduleAutoLoadIfUnderfilled() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (!mounted || _loading || _loadingMore || !_hasMore) {
        return;
      }
      if (!_scrollController.hasClients) {
        return;
      }
      final position = _scrollController.position;
      final viewportNotFilled = position.maxScrollExtent <= 0;
      if (viewportNotFilled) {
        _loadMoreRooms();
      }
    });
  }

  void _applyExclusions() {
    if (!mounted || widget.excludedRoomIds.isEmpty) {
      return;
    }
    setState(() {
      _rooms = _rooms
          .where((room) => !widget.excludedRoomIds.contains(room.roomId))
          .toList();
    });
  }

  Future<void> _createRoomFromFab() async {
    final repo = widget.chatRepository;
    final userId = widget.currentUserId;
    if (repo == null || userId == null || userId.isEmpty) {
      _showInfo('Chat backend unavailable.');
      return;
    }

    setState(() {
      _loading = true;
    });

    try {
      final created = await repo.createRoom(
        creatorUserId: userId,
        title:
            'New chat ${DateTime.now().hour}:${DateTime.now().minute.toString().padLeft(2, '0')}',
      );
      if (!mounted) {
        return;
      }
      setState(() {
        _rooms = [
          if (!widget.excludedRoomIds.contains(created.roomId)) created,
          ..._rooms,
        ];
      });
      widget.onRoomSelected?.call(created);
      _showInfo('Room created.');
    } catch (_) {
      _showInfo('Could not create room on server.');
    } finally {
      if (mounted) {
        setState(() {
          _loading = false;
        });
      }
    }
  }

  void _showInfo(String message) {
    if (!mounted) {
      return;
    }
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text(message), duration: const Duration(seconds: 2)),
    );
  }

  @override
  Widget build(BuildContext context) {
    final palette = context.palette;

    return Scaffold(
      backgroundColor: palette.surfaceContainerLow,
      appBar: AppTopAppBar(
        onNotificationBoardSelected: () {
          widget.onBottomNavSelected?.call(AppBottomNavItem.board);
        },
      ),
      bottomNavigationBar: AppBottomNavBar(
        currentItem: AppBottomNavItem.chat,
        onItemSelected: widget.onBottomNavSelected,
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _createRoomFromFab,
        tooltip: 'Start chat',
        backgroundColor: AppColors.primaryContainer,
        foregroundColor: Colors.white,
        shape: const CircleBorder(),
        child: const Icon(AppIcons.chat),
      ),
      body: SafeArea(
        top: false,
        child: Center(
          child: ConstrainedBox(
            constraints: const BoxConstraints(maxWidth: 672),
            child: RefreshIndicator(
              onRefresh: _loadRooms,
              child: ListView(
                controller: _scrollController,
                padding: const EdgeInsets.fromLTRB(16, 24, 16, 96),
                children: [
                  _MessagesHeader(unreadCount: _unreadCount),
                  const SizedBox(height: 24),
                  if (_loading)
                    const Padding(
                      padding: EdgeInsets.only(bottom: 16),
                      child: LinearProgressIndicator(minHeight: 2),
                    ),
                  _ChatRoomList(
                    rooms: _rooms
                        .where(
                          (room) =>
                              !widget.excludedRoomIds.contains(room.roomId),
                        )
                        .toList(),
                    onRoomSelected: widget.onRoomSelected,
                  ),
                  if (_loadingMore)
                    const Padding(
                      padding: EdgeInsets.only(top: 12),
                      child: Center(child: CircularProgressIndicator()),
                    ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class _MessagesHeader extends StatelessWidget {
  const _MessagesHeader({required this.unreadCount});

  final int unreadCount;

  @override
  Widget build(BuildContext context) {
    final palette = context.palette;

    return Row(
      children: [
        Expanded(
          child: Text(
            'Messages',
            style: TextStyle(
              color: palette.onSurface,
              fontSize: 28,
              fontWeight: FontWeight.w900,
              height: 1.1,
            ),
          ),
        ),
        DecoratedBox(
          decoration: BoxDecoration(
            color: AppColors.primaryContainer.withValues(alpha: 0.1),
            borderRadius: BorderRadius.circular(999),
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
            child: Text(
              '$unreadCount Unread',
              style: const TextStyle(
                color: AppColors.primaryContainer,
                fontSize: 12,
                fontWeight: FontWeight.w800,
              ),
            ),
          ),
        ),
      ],
    );
  }
}

class _ChatRoomList extends StatelessWidget {
  const _ChatRoomList({required this.rooms, this.onRoomSelected});

  final List<GroupchatRoomSummary> rooms;
  final ValueChanged<GroupchatRoomSummary>? onRoomSelected;

  @override
  Widget build(BuildContext context) {
    final palette = context.palette;

    if (rooms.isEmpty) {
      return DecoratedBox(
        decoration: BoxDecoration(
          color: palette.surfaceContainerLowest,
          borderRadius: BorderRadius.circular(16),
          border: Border.all(
            color: palette.outlineVariant.withValues(alpha: 0.5),
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 24),
          child: Row(
            children: [
              Icon(Icons.chat_bubble_outline, color: palette.secondary),
              const SizedBox(width: 10),
              Expanded(
                child: Text(
                  'No chat rooms yet. Create your first room.',
                  style: TextStyle(
                    color: palette.secondary,
                    fontSize: 14,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ],
          ),
        ),
      );
    }

    return DecoratedBox(
      decoration: BoxDecoration(
        color: palette.surfaceContainerLowest,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(
          color: palette.outlineVariant.withValues(alpha: 0.5),
        ),
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(16),
        child: Column(
          children: [
            for (final (index, room) in rooms.indexed) ...[
              _ChatRoomTile(
                room: room,
                onTap: () => onRoomSelected?.call(room),
              ),
              if (index != rooms.length - 1)
                Divider(
                  height: 1,
                  indent: 16,
                  endIndent: 16,
                  color: palette.outlineVariant.withValues(alpha: 0.5),
                ),
            ],
          ],
        ),
      ),
    );
  }
}

class _ChatRoomTile extends StatelessWidget {
  const _ChatRoomTile({required this.room, required this.onTap});

  final GroupchatRoomSummary room;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    final palette = context.palette;

    return InkWell(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Row(
          children: [
            _RoomAvatar(room: room),
            const SizedBox(width: 14),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.baseline,
                    textBaseline: TextBaseline.alphabetic,
                    children: [
                      Expanded(
                        child: Text(
                          room.title,
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(
                            color: palette.onSurface,
                            fontSize: 15,
                            fontWeight: FontWeight.w800,
                          ),
                        ),
                      ),
                      const SizedBox(width: 8),
                      Text(
                        room.timeLabel,
                        style: TextStyle(
                          color: room.hasUnread
                              ? AppColors.primaryContainer
                              : palette.secondary,
                          fontSize: 10,
                          fontWeight: room.hasUnread
                              ? FontWeight.w800
                              : FontWeight.w500,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 5),
                  Row(
                    children: [
                      _MemberPill(label: room.memberSummary),
                      const SizedBox(width: 8),
                      Flexible(
                        child: Text(
                          '• ${room.location}',
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style: const TextStyle(
                            color: AppColors.primaryContainer,
                            fontSize: 10,
                            fontWeight: FontWeight.w800,
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 5),
                  Text(
                    room.lastMessage,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                      color: room.hasUnread
                          ? palette.onSurface
                          : palette.secondary,
                      fontSize: 14,
                      fontWeight: room.hasUnread
                          ? FontWeight.w800
                          : FontWeight.w500,
                    ),
                  ),
                  const SizedBox(height: 6),
                  Wrap(
                    spacing: 6,
                    runSpacing: 4,
                    children: [
                      for (final tag in room.tags)
                        Text(
                          tag,
                          style: TextStyle(
                            color: palette.secondary,
                            fontSize: 9,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                    ],
                  ),
                ],
              ),
            ),
            const SizedBox(width: 10),
            _RoomTrailing(room: room),
          ],
        ),
      ),
    );
  }
}

class _RoomAvatar extends StatelessWidget {
  const _RoomAvatar({required this.room});

  final GroupchatRoomSummary room;

  @override
  Widget build(BuildContext context) {
    final palette = context.palette;

    if (room.avatarUrls.isEmpty) {
      return Container(
        width: 56,
        height: 56,
        decoration: BoxDecoration(
          color: palette.surfaceContainerLow,
          borderRadius: BorderRadius.circular(12),
        ),
        child: Icon(
          room.trailingIcon ?? Icons.groups,
          color: palette.secondary,
          size: 30,
        ),
      );
    }

    final shownAvatars = room.avatarUrls.take(3).toList();

    return Container(
      width: 56,
      height: 56,
      decoration: BoxDecoration(
        color: palette.surfaceContainerLow,
        borderRadius: BorderRadius.circular(12),
      ),
      clipBehavior: Clip.antiAlias,
      child: GridView.count(
        crossAxisCount: 2,
        padding: EdgeInsets.zero,
        physics: const NeverScrollableScrollPhysics(),
        children: [
          for (final url in shownAvatars)
            AppNetworkImage(url: url, width: 28, height: 28),
          if (room.extraMemberCount > 0)
            ColoredBox(
              color: AppColors.primaryContainer.withValues(alpha: 0.16),
              child: Center(
                child: Text(
                  '+${room.extraMemberCount}',
                  style: const TextStyle(
                    color: AppColors.primaryContainer,
                    fontSize: 8,
                    fontWeight: FontWeight.w900,
                  ),
                ),
              ),
            )
          else
            ColoredBox(
              color: palette.surfaceContainerLow,
              child: Icon(Icons.person, color: palette.secondary, size: 14),
            ),
        ],
      ),
    );
  }
}

class _MemberPill extends StatelessWidget {
  const _MemberPill({required this.label});

  final String label;

  @override
  Widget build(BuildContext context) {
    final palette = context.palette;

    return DecoratedBox(
      decoration: BoxDecoration(
        color: palette.surfaceContainerLow,
        borderRadius: BorderRadius.circular(4),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 2),
        child: Text(
          label,
          style: TextStyle(
            color: palette.secondary,
            fontSize: 10,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
    );
  }
}

class _RoomTrailing extends StatelessWidget {
  const _RoomTrailing({required this.room});

  final GroupchatRoomSummary room;

  @override
  Widget build(BuildContext context) {
    final palette = context.palette;

    if (room.hasUnread) {
      return Container(
        width: 22,
        height: 22,
        alignment: Alignment.center,
        decoration: const BoxDecoration(
          color: AppColors.primaryContainer,
          shape: BoxShape.circle,
        ),
        child: Text(
          '${room.unreadCount}',
          style: const TextStyle(
            color: Colors.white,
            fontSize: 10,
            fontWeight: FontWeight.w900,
          ),
        ),
      );
    }

    if (room.isMuted) {
      return Icon(Icons.notifications_off, color: palette.secondary, size: 18);
    }

    return Icon(
      room.trailingIcon ?? Icons.chevron_right,
      color: palette.secondary,
      size: 18,
    );
  }
}
