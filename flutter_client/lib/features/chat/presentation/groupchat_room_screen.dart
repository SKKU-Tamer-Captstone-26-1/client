import 'package:flutter/material.dart';

import '../../../core/theme/app_colors.dart';
import '../../../core/theme/app_icons.dart';
import '../../../shared/widgets/app_bottom_nav_bar.dart';
import '../../../shared/widgets/app_network_image.dart';
import '../data/mock_groupchat_data.dart';
import '../models/groupchat_models.dart';

class GroupchatRoomScreen extends StatelessWidget {
  const GroupchatRoomScreen({
    super.key,
    required this.room,
    this.onBack,
    this.onBottomNavSelected,
  });

  final GroupchatRoomSummary room;
  final VoidCallback? onBack;
  final ValueChanged<AppBottomNavItem>? onBottomNavSelected;

  @override
  Widget build(BuildContext context) {
    final palette = context.palette;

    return Scaffold(
      backgroundColor: palette.surfaceContainerLow,
      appBar: _GroupchatRoomAppBar(room: room, onBack: onBack),
      bottomNavigationBar: AppBottomNavBar(
        currentItem: AppBottomNavItem.chat,
        onItemSelected: onBottomNavSelected,
      ),
      body: SafeArea(
        top: false,
        child: Column(
          children: [
            Expanded(
              child: Center(
                child: ConstrainedBox(
                  constraints: const BoxConstraints(maxWidth: 768),
                  child: ListView(
                    padding: const EdgeInsets.fromLTRB(16, 22, 16, 22),
                    children: const [
                      _DateDivider(label: 'Today'),
                      SizedBox(height: 20),
                      _MessageList(messages: mockGroupchatMessages),
                      SizedBox(height: 22),
                      _LiveDropPreview(),
                      SizedBox(height: 22),
                      _SuggestionChips(),
                    ],
                  ),
                ),
              ),
            ),
            const _MessageComposer(),
          ],
        ),
      ),
    );
  }
}

class _GroupchatRoomAppBar extends StatelessWidget
    implements PreferredSizeWidget {
  const _GroupchatRoomAppBar({required this.room, this.onBack});

  final GroupchatRoomSummary room;
  final VoidCallback? onBack;

  @override
  Size get preferredSize => const Size.fromHeight(64);

  @override
  Widget build(BuildContext context) {
    final palette = context.palette;

    return AppBar(
      automaticallyImplyLeading: false,
      elevation: 0,
      scrolledUnderElevation: 0,
      backgroundColor: palette.surfaceContainerLowest,
      foregroundColor: palette.onSurface,
      shape: Border(bottom: BorderSide(color: palette.outlineVariant)),
      titleSpacing: 8,
      title: Row(
        children: [
          IconButton(
            onPressed: onBack,
            tooltip: 'Back to messages',
            icon: const Icon(
              Icons.arrow_back,
              color: AppColors.primaryContainer,
            ),
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  room.title,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                    color: palette.onSurface,
                    fontSize: 18,
                    fontWeight: FontWeight.w800,
                    height: 1.15,
                  ),
                ),
                const SizedBox(height: 2),
                Text(
                  '${room.memberSummary.split('/').first} members',
                  style: TextStyle(
                    color: palette.secondary,
                    fontSize: 12,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
      actions: [
        IconButton(
          onPressed: () {},
          tooltip: 'Room options',
          icon: const Icon(Icons.more_vert, color: AppColors.primaryContainer),
        ),
        const SizedBox(width: 6),
      ],
    );
  }
}

class _DateDivider extends StatelessWidget {
  const _DateDivider({required this.label});

  final String label;

  @override
  Widget build(BuildContext context) {
    final palette = context.palette;

    return Center(
      child: DecoratedBox(
        decoration: BoxDecoration(
          color: palette.surfaceContainerLowest.withValues(alpha: 0.72),
          borderRadius: BorderRadius.circular(999),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 5),
          child: Text(
            label.toUpperCase(),
            style: TextStyle(
              color: palette.secondary,
              fontSize: 10,
              fontWeight: FontWeight.w800,
              letterSpacing: 1.2,
            ),
          ),
        ),
      ),
    );
  }
}

class _MessageList extends StatelessWidget {
  const _MessageList({required this.messages});

  final List<GroupchatMessage> messages;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        for (final message in messages) ...[
          _MessageBubble(message: message),
          const SizedBox(height: 20),
        ],
      ],
    );
  }
}

class _MessageBubble extends StatelessWidget {
  const _MessageBubble({required this.message});

  final GroupchatMessage message;

  @override
  Widget build(BuildContext context) {
    return message.isOutgoing
        ? _OutgoingMessage(message: message)
        : _IncomingMessage(message: message);
  }
}

class _IncomingMessage extends StatelessWidget {
  const _IncomingMessage({required this.message});

  final GroupchatMessage message;

  @override
  Widget build(BuildContext context) {
    final palette = context.palette;

    return Align(
      alignment: Alignment.centerLeft,
      child: ConstrainedBox(
        constraints: const BoxConstraints(maxWidth: 640),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(12),
              child: AppNetworkImage(
                url: message.senderAvatarUrl ?? '',
                width: 40,
                height: 40,
              ),
            ),
            const SizedBox(width: 10),
            Flexible(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    message.senderName ?? 'Member',
                    style: TextStyle(
                      color: palette.decorativeTertiary,
                      fontSize: 12,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  const SizedBox(height: 5),
                  DecoratedBox(
                    decoration: BoxDecoration(
                      color: palette.surfaceContainerLowest,
                      borderRadius: const BorderRadius.only(
                        topLeft: Radius.circular(18),
                        topRight: Radius.circular(18),
                        bottomRight: Radius.circular(18),
                        bottomLeft: Radius.circular(2),
                      ),
                      boxShadow: const [
                        BoxShadow(
                          color: Color(0x0F000000),
                          blurRadius: 8,
                          offset: Offset(0, 2),
                        ),
                      ],
                    ),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 16,
                        vertical: 12,
                      ),
                      child: Text(
                        message.text,
                        style: TextStyle(
                          color: palette.onSurfaceVariant,
                          fontSize: 15,
                          height: 1.4,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _OutgoingMessage extends StatelessWidget {
  const _OutgoingMessage({required this.message});

  final GroupchatMessage message;

  @override
  Widget build(BuildContext context) {
    final palette = context.palette;

    return Align(
      alignment: Alignment.centerRight,
      child: ConstrainedBox(
        constraints: const BoxConstraints(maxWidth: 640),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            DecoratedBox(
              decoration: const BoxDecoration(
                color: AppColors.primaryContainer,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(18),
                  topRight: Radius.circular(18),
                  bottomLeft: Radius.circular(18),
                  bottomRight: Radius.circular(2),
                ),
                boxShadow: [
                  BoxShadow(
                    color: Color(0x1A000000),
                    blurRadius: 10,
                    offset: Offset(0, 3),
                  ),
                ],
              ),
              child: Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 16,
                  vertical: 12,
                ),
                child: Text(
                  message.text,
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 15,
                    height: 1.4,
                  ),
                ),
              ),
            ),
            if (message.deliveryLabel != null) ...[
              const SizedBox(height: 5),
              Text(
                message.deliveryLabel!,
                style: TextStyle(
                  color: palette.secondary,
                  fontSize: 10,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ],
          ],
        ),
      ),
    );
  }
}

class _LiveDropPreview extends StatelessWidget {
  const _LiveDropPreview();

  @override
  Widget build(BuildContext context) {
    final palette = context.palette;

    return LayoutBuilder(
      builder: (context, constraints) {
        final compact = constraints.maxWidth < 420;

        final alert = DecoratedBox(
          decoration: BoxDecoration(
            color: palette.surfaceContainerLowest,
            borderRadius: BorderRadius.circular(28),
            border: Border.all(
              color: palette.outlineVariant.withValues(alpha: 0.5),
            ),
          ),
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: 24,
                  child: Stack(
                    children: [
                      _SmallAvatar(
                        url: mockGroupchatMessages[0].senderAvatarUrl!,
                      ),
                      Positioned(
                        left: 18,
                        child: _SmallAvatar(
                          url: mockGroupchatMessages[2].senderAvatarUrl!,
                        ),
                      ),
                      Positioned(
                        left: 36,
                        child: Container(
                          width: 24,
                          height: 24,
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                            color: AppColors.primaryContainer.withValues(
                              alpha: 0.18,
                            ),
                            shape: BoxShape.circle,
                            border: Border.all(
                              color: palette.surfaceContainerLowest,
                              width: 2,
                            ),
                          ),
                          child: const Text(
                            '+15',
                            style: TextStyle(
                              color: AppColors.primaryContainer,
                              fontSize: 8,
                              fontWeight: FontWeight.w900,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 12),
                Text(
                  'Live Drop Alert',
                  style: TextStyle(
                    color: palette.onSurface,
                    fontSize: 13,
                    fontWeight: FontWeight.w800,
                  ),
                ),
                const SizedBox(height: 3),
                Text(
                  '3 people are typing...',
                  style: TextStyle(color: palette.secondary, fontSize: 11),
                ),
              ],
            ),
          ),
        );

        final bottle = ClipRRect(
          borderRadius: BorderRadius.circular(28),
          child: SizedBox(
            height: 112,
            child: Stack(
              fit: StackFit.expand,
              children: [
                const AppNetworkImage(
                  url:
                      'https://lh3.googleusercontent.com/aida-public/AB6AXuA8wvg2QG0ORmF90nqxTX5ewLuegJ-OZnvBYDGQnTTsyrj_L51Km0r3LzRoylI8qcJ0txZVKVwOat9qbOXudFm0O4Kf0CrbxOt8DavqjMdSV-l-hj4Xw1SN9AhYOWjadYkro7C9DUsH9XeakKAmHp_4qKecBGP5cTA2vwAGY1KuAg1fcpJCut1rv5yoQaeqcGnRi7-DB74k64Vhic0gd5DTjZPifnHBoOt2arIO025Y0v3PrHFWmkuIknTGxEbPVbtGNl46aN-fMSg',
                ),
                const DecoratedBox(
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      colors: [Color(0x00000000), Color(0xB3000000)],
                    ),
                  ),
                ),
                const Positioned(
                  left: 14,
                  right: 14,
                  bottom: 12,
                  child: Text(
                    'View Bottle Stock',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 11,
                      fontWeight: FontWeight.w800,
                    ),
                  ),
                ),
              ],
            ),
          ),
        );

        if (compact) {
          return Column(children: [alert, const SizedBox(height: 12), bottle]);
        }

        return Row(
          children: [
            Expanded(child: alert),
            const SizedBox(width: 12),
            Expanded(child: bottle),
          ],
        );
      },
    );
  }
}

class _SmallAvatar extends StatelessWidget {
  const _SmallAvatar({required this.url});

  final String url;

  @override
  Widget build(BuildContext context) {
    final palette = context.palette;

    return Container(
      width: 24,
      height: 24,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        border: Border.all(color: palette.surfaceContainerLowest, width: 2),
      ),
      clipBehavior: Clip.antiAlias,
      child: AppNetworkImage(url: url),
    );
  }
}

class _SuggestionChips extends StatelessWidget {
  const _SuggestionChips();

  static const _chips = ['Shared Location', 'Log Tasting', 'Send Photo'];

  @override
  Widget build(BuildContext context) {
    final palette = context.palette;

    return SizedBox(
      height: 36,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        itemCount: _chips.length,
        separatorBuilder: (_, _) => const SizedBox(width: 8),
        itemBuilder: (context, index) {
          return OutlinedButton(
            onPressed: () {},
            style: OutlinedButton.styleFrom(
              foregroundColor: AppColors.primaryContainer,
              side: BorderSide(
                color: AppColors.primaryContainer.withValues(alpha: 0.28),
              ),
              backgroundColor: palette.surfaceContainerLowest,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(999),
              ),
              padding: const EdgeInsets.symmetric(horizontal: 14),
            ),
            child: Text(
              _chips[index],
              style: const TextStyle(fontSize: 12, fontWeight: FontWeight.w800),
            ),
          );
        },
      ),
    );
  }
}

class _MessageComposer extends StatelessWidget {
  const _MessageComposer();

  @override
  Widget build(BuildContext context) {
    final palette = context.palette;

    return DecoratedBox(
      decoration: BoxDecoration(
        color: palette.surfaceContainerLowest,
        border: Border(top: BorderSide(color: palette.outlineVariant)),
      ),
      child: Padding(
        padding: const EdgeInsets.fromLTRB(16, 12, 16, 12),
        child: Center(
          child: ConstrainedBox(
            constraints: const BoxConstraints(maxWidth: 768),
            child: Row(
              children: [
                IconButton.filledTonal(
                  onPressed: () {},
                  style: IconButton.styleFrom(
                    backgroundColor: palette.surfaceContainerLow,
                    foregroundColor: palette.onSurfaceVariant,
                    shape: const CircleBorder(),
                  ),
                  icon: const Icon(Icons.add),
                ),
                const SizedBox(width: 10),
                Expanded(
                  child: Container(
                    height: 48,
                    alignment: Alignment.centerLeft,
                    decoration: BoxDecoration(
                      color: palette.surfaceContainerLow,
                      borderRadius: BorderRadius.circular(12),
                      border: Border.all(color: palette.outlineVariant),
                    ),
                    padding: const EdgeInsets.symmetric(horizontal: 14),
                    child: Text(
                      'Type a message...',
                      style: TextStyle(color: palette.secondary, fontSize: 15),
                    ),
                  ),
                ),
                const SizedBox(width: 10),
                IconButton.filled(
                  onPressed: () {},
                  style: IconButton.styleFrom(
                    backgroundColor: AppColors.primaryContainer,
                    foregroundColor: Colors.white,
                    shape: const CircleBorder(),
                    fixedSize: const Size(48, 48),
                  ),
                  icon: const Icon(Icons.send),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
