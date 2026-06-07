import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import '../../../core/theme/app_colors.dart';
import '../../../core/theme/app_icons.dart';
import '../../../shared/widgets/app_bottom_nav_bar.dart';
import '../../../shared/widgets/app_network_image.dart';
import '../../../shared/widgets/app_top_app_bar.dart';
import '../data/chat_repository.dart';
import '../data/mock_groupchat_data.dart';
import '../models/groupchat_models.dart';

class GroupchatListScreen extends StatefulWidget {
  const GroupchatListScreen({
    super.key,
    this.onBottomNavSelected,
    this.onRoomSelected,
    this.chatRepository,
    this.currentUserId,
    this.authToken = '',
    this.excludedRoomIds = const <String>{},
    this.bottomNavBadgeCounts = const <AppBottomNavItem, int>{},
    this.onUnreadCountChanged,
    this.onProfileSelected,
  });

  final ValueChanged<AppBottomNavItem>? onBottomNavSelected;
  final ValueChanged<GroupchatRoomSummary>? onRoomSelected;
  final ChatRepository? chatRepository;
  final String? currentUserId;
  final String authToken;
  final Set<String> excludedRoomIds;
  final Map<AppBottomNavItem, int> bottomNavBadgeCounts;
  final ValueChanged<int>? onUnreadCountChanged;
  final VoidCallback? onProfileSelected;

  @override
  State<GroupchatListScreen> createState() => _GroupchatListScreenState();
}

class _GroupchatListScreenState extends State<GroupchatListScreen> {
  List<GroupchatRoomSummary> _rooms = const [];
  final ScrollController _scrollController = ScrollController();
  bool _loading = false;
  bool _loadingMore = false;
  bool _creatingRoom = false;
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
      final page = await repo.listMyRooms(
        userId: userId,
        authToken: widget.authToken,
        pageSize: 20,
      );
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
      _notifyUnreadCountChanged();
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
        authToken: widget.authToken,
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
      _notifyUnreadCountChanged();
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
    _notifyUnreadCountChanged();
  }

  Future<void> _openRoom(GroupchatRoomSummary room) async {
    var selectedRoom = room;
    if (room.unreadCount > 0) {
      try {
        await widget.chatRepository?.markChatRoomRead(
          roomId: room.roomId,
          authToken: widget.authToken,
        );
        if (!mounted) {
          return;
        }
        selectedRoom = room.copyWith(unreadCount: 0);
        setState(() {
          _rooms = [
            for (final candidate in _rooms)
              candidate.roomId == room.roomId ? selectedRoom : candidate,
          ];
        });
        _notifyUnreadCountChanged();
      } catch (_) {
        // Keep opening the room if read-state sync fails.
      }
    }
    widget.onRoomSelected?.call(selectedRoom);
  }

  Future<void> _createGeneralRoom() async {
    final repo = widget.chatRepository;
    final userId = widget.currentUserId;
    if (repo == null || userId == null || userId.isEmpty || _creatingRoom) {
      return;
    }

    final title = await showDialog<String>(
      context: context,
      builder: (context) => const _NewChatDialog(),
    );
    final normalizedTitle = title?.trim();
    if (!mounted || normalizedTitle == null || normalizedTitle.isEmpty) {
      return;
    }

    setState(() {
      _creatingRoom = true;
    });

    try {
      final room = await repo.createRoom(
        creatorUserId: userId,
        title: normalizedTitle,
        authToken: widget.authToken,
      );
      if (!mounted) {
        return;
      }
      final selectedRoom = room.copyWith(unreadCount: 0);
      setState(() {
        _rooms = [
          selectedRoom,
          ..._rooms.where((candidate) => candidate.roomId != room.roomId),
        ];
        _creatingRoom = false;
      });
      _notifyUnreadCountChanged();
      widget.onRoomSelected?.call(selectedRoom);
    } catch (error) {
      if (kDebugMode) {
        debugPrint('CREATE_ROOM_FAILED: $error');
        debugPrint('CREATE_ROOM_ENDPOINT: $repo');
      }
      if (!mounted) {
        return;
      }
      setState(() {
        _creatingRoom = false;
      });
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Unable to create chat room.')),
      );
    }
  }

  void _notifyUnreadCountChanged() {
    widget.onUnreadCountChanged?.call(_unreadCount);
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
        onProfileSelected: widget.onProfileSelected,
      ),
      bottomNavigationBar: AppBottomNavBar(
        currentItem: AppBottomNavItem.chat,
        onItemSelected: widget.onBottomNavSelected,
        badgeCounts: widget.bottomNavBadgeCounts,
      ),
      body: SafeArea(
        top: false,
        child: Center(
          child: ConstrainedBox(
            constraints: const BoxConstraints(maxWidth: 672),
            child: RefreshIndicator(
              color: AppColors.primaryContainer,
              onRefresh: _loadRooms,
              child: ListView(
                controller: _scrollController,
                padding: const EdgeInsets.fromLTRB(16, 18, 16, 96),
                children: [
                  _MessagesHeader(
                    unreadCount: _unreadCount,
                    isCreatingRoom: _creatingRoom,
                    onNewChatPressed: _createGeneralRoom,
                  ),
                  const SizedBox(height: 24),
                  _NearbyBoardPreview(
                    boards: mockActiveBoardRooms,
                    onBoardSelected: () {
                      widget.onBottomNavSelected?.call(AppBottomNavItem.board);
                    },
                  ),
                  const SizedBox(height: 24),
                  if (_loading)
                    Padding(
                      padding: const EdgeInsets.only(bottom: 16),
                      child: DecoratedBox(
                        decoration: BoxDecoration(
                          color: palette.surfaceContainerLowest,
                          borderRadius: BorderRadius.circular(999),
                        ),
                        child: const LinearProgressIndicator(minHeight: 3),
                      ),
                    ),
                  _ChatRoomList(
                    rooms: _rooms
                        .where(
                          (room) =>
                              !widget.excludedRoomIds.contains(room.roomId),
                        )
                        .toList(),
                    onRoomSelected: _openRoom,
                  ),
                  if (_loadingMore)
                    const Padding(
                      padding: EdgeInsets.only(top: 12),
                      child: Center(
                        child: SizedBox(
                          width: 22,
                          height: 22,
                          child: CircularProgressIndicator(strokeWidth: 2),
                        ),
                      ),
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

class _NearbyBoardPreview extends StatelessWidget {
  const _NearbyBoardPreview({
    required this.boards,
    required this.onBoardSelected,
  });

  final List<ActiveBoardRoom> boards;
  final VoidCallback onBoardSelected;

  @override
  Widget build(BuildContext context) {
    final palette = context.palette;

    if (boards.isEmpty) {
      return const SizedBox.shrink();
    }

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Expanded(
              child: Text(
                'Nearby Board',
                style: TextStyle(
                  color: palette.onSurface,
                  fontSize: 16,
                  fontWeight: FontWeight.w900,
                ),
              ),
            ),
            TextButton(
              onPressed: onBoardSelected,
              child: const Text('View Board'),
            ),
          ],
        ),
        const SizedBox(height: 10),
        SizedBox(
          height: 112,
          child: ListView.separated(
            scrollDirection: Axis.horizontal,
            itemCount: boards.length,
            separatorBuilder: (_, _) => const SizedBox(width: 12),
            itemBuilder: (context, index) {
              return _NearbyBoardCard(
                board: boards[index],
                onTap: onBoardSelected,
              );
            },
          ),
        ),
      ],
    );
  }
}

class _NearbyBoardCard extends StatelessWidget {
  const _NearbyBoardCard({required this.board, required this.onTap});

  final ActiveBoardRoom board;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    final palette = context.palette;

    return SizedBox(
      width: 132,
      child: Material(
        color: palette.surfaceContainerLowest,
        borderRadius: BorderRadius.circular(14),
        clipBehavior: Clip.antiAlias,
        child: InkWell(
          onTap: onTap,
          child: Stack(
            fit: StackFit.expand,
            children: [
              AppNetworkImage(url: board.imageUrl),
              DecoratedBox(
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [
                      Colors.black.withValues(alpha: 0.05),
                      Colors.black.withValues(alpha: 0.68),
                    ],
                  ),
                ),
              ),
              Positioned(
                left: 10,
                right: 10,
                bottom: 10,
                child: Text(
                  board.name,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 13,
                    fontWeight: FontWeight.w900,
                    height: 1.12,
                  ),
                ),
              ),
              if (board.hasUnreadActivity)
                const Positioned(
                  top: 10,
                  right: 10,
                  child: DecoratedBox(
                    decoration: BoxDecoration(
                      color: AppColors.primaryContainer,
                      shape: BoxShape.circle,
                    ),
                    child: SizedBox(width: 9, height: 9),
                  ),
                ),
            ],
          ),
        ),
      ),
    );
  }
}

class _MessagesHeader extends StatelessWidget {
  const _MessagesHeader({
    required this.unreadCount,
    required this.isCreatingRoom,
    required this.onNewChatPressed,
  });

  final int unreadCount;
  final bool isCreatingRoom;
  final VoidCallback onNewChatPressed;

  @override
  Widget build(BuildContext context) {
    final palette = context.palette;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        DecoratedBox(
          decoration: BoxDecoration(
            color: palette.surfaceContainerLowest,
            borderRadius: BorderRadius.circular(22),
            border: Border.all(
              color: palette.outlineVariant.withValues(alpha: 0.62),
            ),
          ),
          child: Padding(
            padding: const EdgeInsets.all(15),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  width: 42,
                  height: 42,
                  decoration: BoxDecoration(
                    color: palette.terracotta.withValues(alpha: 0.13),
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: Icon(
                    Icons.chat_bubble,
                    color: palette.terracotta,
                    size: 22,
                  ),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Messages',
                        style: TextStyle(
                          color: palette.onSurface,
                          fontSize: 24,
                          fontWeight: FontWeight.w900,
                          height: 1.06,
                        ),
                      ),
                      const SizedBox(height: 7),
                      DecoratedBox(
                        decoration: BoxDecoration(
                          color: palette.terracotta.withValues(alpha: 0.08),
                          borderRadius: BorderRadius.circular(999),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 10,
                            vertical: 5,
                          ),
                          child: Text(
                            '$unreadCount Unread',
                            style: TextStyle(
                              color: palette.terracotta,
                              fontSize: 11,
                              fontWeight: FontWeight.w800,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Tooltip(
                  message: 'New Chat',
                  child: FilledButton(
                    onPressed: isCreatingRoom ? null : onNewChatPressed,
                    style: FilledButton.styleFrom(
                      backgroundColor: AppColors.primaryContainer,
                      disabledBackgroundColor: AppColors.primaryContainer
                          .withValues(alpha: 0.45),
                      foregroundColor: Colors.white,
                      disabledForegroundColor: Colors.white,
                      padding: const EdgeInsets.symmetric(horizontal: 12),
                      minimumSize: const Size(0, 38),
                      textStyle: const TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.w900,
                      ),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(14),
                      ),
                    ),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        if (isCreatingRoom)
                          const SizedBox(
                            width: 15,
                            height: 15,
                            child: CircularProgressIndicator(
                              strokeWidth: 2,
                              color: Colors.white,
                            ),
                          )
                        else
                          const Icon(Icons.add, size: 17),
                        const SizedBox(width: 6),
                        Text(isCreatingRoom ? 'Creating' : 'New Chat'),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}

class _NewChatDialog extends StatefulWidget {
  const _NewChatDialog();

  @override
  State<_NewChatDialog> createState() => _NewChatDialogState();
}

class _NewChatDialogState extends State<_NewChatDialog> {
  final TextEditingController _controller = TextEditingController();

  bool get _canCreate => _controller.text.trim().isNotEmpty;

  @override
  void initState() {
    super.initState();
    _controller.addListener(_onTextChanged);
  }

  @override
  void dispose() {
    _controller
      ..removeListener(_onTextChanged)
      ..dispose();
    super.dispose();
  }

  void _onTextChanged() {
    setState(() {});
  }

  void _submit() {
    final title = _controller.text.trim();
    if (title.isEmpty) {
      return;
    }
    Navigator.of(context).pop(title);
  }

  @override
  Widget build(BuildContext context) {
    final palette = context.palette;

    return AlertDialog(
      backgroundColor: palette.surfaceContainerLowest,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(24)),
      title: Text(
        'New Chat',
        style: TextStyle(
          color: palette.onSurface,
          fontSize: 20,
          fontWeight: FontWeight.w900,
        ),
      ),
      content: TextField(
        controller: _controller,
        autofocus: true,
        maxLength: 40,
        textInputAction: TextInputAction.done,
        onSubmitted: (_) => _submit(),
        style: TextStyle(color: palette.onSurface),
        decoration: InputDecoration(
          counterText: '',
          hintText: 'Room name',
          hintStyle: TextStyle(color: palette.secondary),
          filled: true,
          fillColor: palette.surfaceContainerLow,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(16),
            borderSide: BorderSide(color: palette.outlineVariant),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(16),
            borderSide: BorderSide(color: palette.outlineVariant),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(16),
            borderSide: const BorderSide(color: AppColors.primaryContainer),
          ),
        ),
      ),
      actions: [
        TextButton(
          onPressed: () => Navigator.of(context).pop(),
          child: const Text('Cancel'),
        ),
        FilledButton(
          onPressed: _canCreate ? _submit : null,
          style: FilledButton.styleFrom(
            backgroundColor: AppColors.primaryContainer,
            disabledBackgroundColor: AppColors.primaryContainer.withValues(
              alpha: 0.42,
            ),
            foregroundColor: Colors.white,
            disabledForegroundColor: Colors.white,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(14),
            ),
          ),
          child: const Text('Create'),
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
          borderRadius: BorderRadius.circular(22),
          border: Border.all(
            color: palette.outlineVariant.withValues(alpha: 0.62),
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 26),
          child: Row(
            children: [
              Container(
                width: 42,
                height: 42,
                decoration: BoxDecoration(
                  color: palette.surfaceContainerLow,
                  borderRadius: BorderRadius.circular(16),
                ),
                child: Icon(
                  Icons.chat_bubble_outline,
                  color: palette.secondary,
                ),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: Text(
                  'No chat rooms yet. Start a New Chat or join from a Board post.',
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
        borderRadius: BorderRadius.circular(22),
        border: Border.all(
          color: palette.outlineVariant.withValues(alpha: 0.62),
        ),
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(22),
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
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 17),
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
                        DecoratedBox(
                          decoration: BoxDecoration(
                            color: palette.surfaceContainerLow,
                            borderRadius: BorderRadius.circular(999),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 7,
                              vertical: 3,
                            ),
                            child: Text(
                              tag,
                              style: TextStyle(
                                color: palette.secondary,
                                fontSize: 9,
                                fontWeight: FontWeight.w700,
                              ),
                            ),
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
          borderRadius: BorderRadius.circular(18),
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
        borderRadius: BorderRadius.circular(18),
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
        borderRadius: BorderRadius.circular(999),
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
      final unreadLabel = room.unreadCount > 99 ? '99+' : '${room.unreadCount}';
      return Container(
        constraints: const BoxConstraints(minWidth: 22, minHeight: 22),
        padding: const EdgeInsets.symmetric(horizontal: 6),
        height: 22,
        alignment: Alignment.center,
        decoration: const BoxDecoration(
          color: AppColors.primaryContainer,
          borderRadius: BorderRadius.all(Radius.circular(999)),
        ),
        child: Text(
          unreadLabel,
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
