import 'package:flutter/material.dart';

import '../../core/theme/app_colors.dart';

Future<void> showNotificationWindow(BuildContext context) {
  return showGeneralDialog<void>(
    context: context,
    barrierDismissible: true,
    barrierLabel: 'Close notifications',
    barrierColor: Colors.black.withValues(alpha: 0.18),
    transitionDuration: const Duration(milliseconds: 160),
    pageBuilder: (context, animation, secondaryAnimation) {
      return const _NotificationWindow();
    },
    transitionBuilder: (context, animation, secondaryAnimation, child) {
      final curved = CurvedAnimation(parent: animation, curve: Curves.easeOut);
      return FadeTransition(
        opacity: curved,
        child: SlideTransition(
          position: Tween<Offset>(
            begin: const Offset(0, -0.03),
            end: Offset.zero,
          ).animate(curved),
          child: child,
        ),
      );
    },
  );
}

class _NotificationWindow extends StatelessWidget {
  const _NotificationWindow();

  @override
  Widget build(BuildContext context) {
    final palette = context.palette;

    return SafeArea(
      child: Align(
        alignment: Alignment.topRight,
        child: Padding(
          padding: const EdgeInsets.fromLTRB(16, 72, 16, 16),
          child: Material(
            color: palette.surfaceContainerLowest,
            elevation: 18,
            shadowColor: Colors.black.withValues(alpha: 0.25),
            borderRadius: BorderRadius.circular(16),
            clipBehavior: Clip.antiAlias,
            child: ConstrainedBox(
              constraints: const BoxConstraints(maxWidth: 380),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  _NotificationHeader(palette: palette),
                  Flexible(
                    child: ListView(
                      shrinkWrap: true,
                      padding: EdgeInsets.zero,
                      children: const [
                        _NotificationItem(
                          icon: Icons.local_bar,
                          title: 'Rare bourbon drop nearby',
                          body:
                              'The Oak & Barrel posted a limited bottle alert.',
                          time: '15m ago',
                        ),
                        _NotificationItem(
                          icon: Icons.forum,
                          title: 'New reply on your board post',
                          body: 'PeatSeeker92 shared an Islay recommendation.',
                          time: '1h ago',
                        ),
                        _NotificationItem(
                          icon: Icons.inventory_2,
                          title: 'Collection reminder',
                          body: 'A saved wishlist bottle is still available.',
                          time: '3h ago',
                        ),
                        _NotificationItem(
                          icon: Icons.event_available,
                          title: 'Outdoor tasting opens tonight',
                          body: 'The Terrace Vault has 4 spots left.',
                          time: 'Today',
                          isLast: true,
                        ),
                      ],
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

class _NotificationHeader extends StatelessWidget {
  const _NotificationHeader({required this.palette});

  final AppPalette palette;

  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
      decoration: BoxDecoration(
        border: Border(bottom: BorderSide(color: palette.outlineVariant)),
      ),
      child: Padding(
        padding: const EdgeInsets.fromLTRB(18, 14, 10, 14),
        child: Row(
          children: [
            Expanded(
              child: Text(
                'Notifications',
                style: TextStyle(
                  color: palette.onSurface,
                  fontSize: 18,
                  fontWeight: FontWeight.w800,
                ),
              ),
            ),
            TextButton(
              onPressed: () {},
              child: const Text(
                'Mark all read',
                style: TextStyle(fontSize: 12, fontWeight: FontWeight.w700),
              ),
            ),
            IconButton(
              onPressed: () => Navigator.of(context).pop(),
              tooltip: 'Close notifications',
              icon: Icon(Icons.close, color: palette.secondary),
            ),
          ],
        ),
      ),
    );
  }
}

class _NotificationItem extends StatelessWidget {
  const _NotificationItem({
    required this.icon,
    required this.title,
    required this.body,
    required this.time,
    this.isLast = false,
  });

  final IconData icon;
  final String title;
  final String body;
  final String time;
  final bool isLast;

  @override
  Widget build(BuildContext context) {
    final palette = context.palette;

    return DecoratedBox(
      decoration: BoxDecoration(
        border: isLast
            ? null
            : Border(bottom: BorderSide(color: palette.outlineVariant)),
      ),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: 38,
              height: 38,
              decoration: BoxDecoration(
                color: AppColors.primaryContainer.withValues(alpha: 0.14),
                shape: BoxShape.circle,
              ),
              child: Icon(icon, color: AppColors.primaryContainer, size: 20),
            ),
            const SizedBox(width: 12),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: TextStyle(
                      color: palette.onSurface,
                      fontSize: 14,
                      fontWeight: FontWeight.w800,
                      height: 1.25,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    body,
                    style: TextStyle(
                      color: palette.onSurfaceVariant,
                      fontSize: 13,
                      height: 1.35,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(width: 8),
            Text(
              time,
              style: TextStyle(
                color: palette.secondary,
                fontSize: 11,
                fontWeight: FontWeight.w600,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
