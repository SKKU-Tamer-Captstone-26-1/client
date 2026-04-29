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
  });

  final ValueChanged<AppBottomNavItem>? onBottomNavSelected;
  final ValueChanged<GroupchatRoomSummary>? onRoomSelected;
  final ChatRepository? chatRepository;
  final String? currentUserId;

  @override
  State<GroupchatListScreen> createState() => _GroupchatListScreenState();
}

class _GroupchatListScreenState extends State<GroupchatListScreen> {
  List<GroupchatRoomSummary> _rooms = mockGroupchatRooms;
  bool _loading = false;

  int get _unreadCount =>
      _rooms.fold<int>(0, (sum, room) => sum + room.unreadCount);

  @override
  void initState() {
    super.initState();
    _loadRooms();
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
      final rooms = await repo.listMyRooms(userId: userId, pageSize: 20);
      if (!mounted) {
        return;
      }
      setState(() {
        _rooms = rooms;
      });
    } catch (_) {
      // Keep mock fallback on remote errors.
    } finally {
      if (mounted) {
        setState(() {
          _loading = false;
        });
      }
    }
  }

  Future<void> _createRoomFromFab() async {
    final repo = widget.chatRepository;
    final userId = widget.currentUserId;
    if (repo == null || userId == null || userId.isEmpty) {
      final localRoom = _buildLocalRoom();
      setState(() {
        _rooms = [localRoom, ..._rooms];
      });
      widget.onRoomSelected?.call(localRoom);
      _showInfo('Chat backend unavailable. Opened local preview room.');
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
        _rooms = [created, ..._rooms];
      });
      widget.onRoomSelected?.call(created);
      _showInfo('Room created.');
    } catch (_) {
      final localRoom = _buildLocalRoom();
      setState(() {
        _rooms = [localRoom, ..._rooms];
      });
      widget.onRoomSelected?.call(localRoom);
      _showInfo('Could not create server room. Opened local preview room.');
    } finally {
      if (mounted) {
        setState(() {
          _loading = false;
        });
      }
    }
  }

  GroupchatRoomSummary _buildLocalRoom() {
    final now = DateTime.now();
    final hour = now.hour.toString().padLeft(2, '0');
    final minute = now.minute.toString().padLeft(2, '0');
    final title = 'New chat $hour:$minute';
    return GroupchatRoomSummary(
      roomId: 'mock-room-local-${now.microsecondsSinceEpoch}',
      title: title,
      memberSummary: '1/1',
      location: 'Local Preview',
      lastMessage: 'No messages yet',
      timeLabel: '$hour:$minute',
      tags: const [],
      avatarUrls: const [],
      unreadCount: 0,
    );
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
                padding: const EdgeInsets.fromLTRB(16, 24, 16, 96),
                children: [
                  _MessagesHeader(unreadCount: _unreadCount),
                  const SizedBox(height: 26),
                  const _ActiveBoardSection(rooms: mockActiveBoardRooms),
                  const SizedBox(height: 24),
                  if (_loading)
                    const Padding(
                      padding: EdgeInsets.only(bottom: 16),
                      child: LinearProgressIndicator(minHeight: 2),
                    ),
                  _ChatRoomList(
                    rooms: _rooms,
                    onRoomSelected: widget.onRoomSelected,
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

class _ActiveBoardSection extends StatelessWidget {
  const _ActiveBoardSection({required this.rooms});

  final List<ActiveBoardRoom> rooms;

  @override
  Widget build(BuildContext context) {
    final palette = context.palette;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Active Board',
          style: TextStyle(
            color: palette.secondary.withValues(alpha: 0.72),
            fontSize: 12,
            fontWeight: FontWeight.w900,
            letterSpacing: 1.8,
          ),
        ),
        const SizedBox(height: 14),
        SizedBox(
          height: 94,
          child: ListView.separated(
            scrollDirection: Axis.horizontal,
            itemCount: rooms.length,
            separatorBuilder: (_, _) => const SizedBox(width: 16),
            itemBuilder: (context, index) {
              return _ActiveBoardCard(room: rooms[index]);
            },
          ),
        ),
      ],
    );
  }
}

class _ActiveBoardCard extends StatelessWidget {
  const _ActiveBoardCard({required this.room});

  final ActiveBoardRoom room;

  @override
  Widget build(BuildContext context) {
    final palette = context.palette;
    final accentColor = room.hasUnreadActivity
        ? AppColors.primaryContainer
        : Colors.transparent;

    return SizedBox(
      width: 74,
      child: Column(
        children: [
          Container(
            width: 64,
            height: 64,
            padding: const EdgeInsets.all(2),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12),
              border: Border.all(color: accentColor, width: 2),
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: AppNetworkImage(url: room.imageUrl),
            ),
          ),
          const SizedBox(height: 8),
          Text(
            room.name,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            textAlign: TextAlign.center,
            style: TextStyle(
              color: room.hasUnreadActivity
                  ? palette.onSurface
                  : palette.secondary,
              fontSize: 11,
              fontWeight: room.hasUnreadActivity
                  ? FontWeight.w800
                  : FontWeight.w500,
            ),
          ),
        ],
      ),
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
