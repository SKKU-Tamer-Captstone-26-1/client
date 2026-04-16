import 'package:flutter/material.dart';

import '../../../core/theme/app_colors.dart';
import '../../board/presentation/board_screen.dart';
import '../data/mock_notifications.dart';
import '../models/notification_models.dart';

class NotificationScreen extends StatelessWidget {
  const NotificationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final palette = context.palette;
    final unreadCount = mockNotifications
        .where((notification) => notification.isUnread)
        .length;

    return Scaffold(
      backgroundColor: palette.surfaceContainerLow,
      appBar: AppBar(
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
              onPressed: () => Navigator.of(context).pop(),
              tooltip: 'Back',
              icon: Icon(Icons.arrow_back, color: palette.onSurface),
            ),
            Expanded(
              child: Text(
                'Notifications',
                style: TextStyle(
                  color: palette.onSurface,
                  fontSize: 20,
                  fontWeight: FontWeight.w900,
                ),
              ),
            ),
          ],
        ),
        actions: [
          TextButton(
            onPressed: () {},
            child: const Text(
              'Mark all read',
              style: TextStyle(fontSize: 12, fontWeight: FontWeight.w800),
            ),
          ),
          const SizedBox(width: 8),
        ],
      ),
      body: SafeArea(
        top: false,
        child: Center(
          child: ConstrainedBox(
            constraints: const BoxConstraints(maxWidth: 720),
            child: ListView(
              padding: const EdgeInsets.fromLTRB(16, 24, 16, 32),
              children: [
                _NotificationSummary(unreadCount: unreadCount),
                const SizedBox(height: 18),
                for (final notification in mockNotifications) ...[
                  _NotificationCard(notification: notification),
                  const SizedBox(height: 12),
                ],
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class _NotificationSummary extends StatelessWidget {
  const _NotificationSummary({required this.unreadCount});

  final int unreadCount;

  @override
  Widget build(BuildContext context) {
    final palette = context.palette;

    return Row(
      children: [
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Recent activity',
                style: TextStyle(
                  color: palette.onSurface,
                  fontSize: 28,
                  fontWeight: FontWeight.w900,
                  height: 1.1,
                ),
              ),
              const SizedBox(height: 6),
              Text(
                'Board posts, chats, collection updates, and local drops.',
                style: TextStyle(
                  color: palette.secondary,
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ],
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
                fontWeight: FontWeight.w900,
              ),
            ),
          ),
        ),
      ],
    );
  }
}

class _NotificationCard extends StatelessWidget {
  const _NotificationCard({required this.notification});

  final AppNotification notification;

  @override
  Widget build(BuildContext context) {
    final palette = context.palette;

    return InkWell(
      onTap: () => _handleTap(context, notification),
      borderRadius: BorderRadius.circular(16),
      child: DecoratedBox(
        decoration: BoxDecoration(
          color: palette.surfaceContainerLowest,
          borderRadius: BorderRadius.circular(16),
          border: Border.all(
            color: notification.isUnread
                ? AppColors.primaryContainer.withValues(alpha: 0.38)
                : palette.outlineVariant.withValues(alpha: 0.5),
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Stack(
                clipBehavior: Clip.none,
                children: [
                  Container(
                    width: 42,
                    height: 42,
                    decoration: BoxDecoration(
                      color: AppColors.primaryContainer.withValues(alpha: 0.14),
                      shape: BoxShape.circle,
                    ),
                    child: Icon(
                      notification.icon,
                      color: AppColors.primaryContainer,
                      size: 21,
                    ),
                  ),
                  if (notification.isUnread)
                    const Positioned(
                      top: -1,
                      right: -1,
                      child: SizedBox(
                        width: 10,
                        height: 10,
                        child: DecoratedBox(
                          decoration: BoxDecoration(
                            color: AppColors.error,
                            shape: BoxShape.circle,
                          ),
                        ),
                      ),
                    ),
                ],
              ),
              const SizedBox(width: 14),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Expanded(
                          child: Text(
                            notification.title,
                            style: TextStyle(
                              color: palette.onSurface,
                              fontSize: 15,
                              fontWeight: FontWeight.w900,
                              height: 1.22,
                            ),
                          ),
                        ),
                        const SizedBox(width: 8),
                        Text(
                          notification.timeLabel,
                          style: TextStyle(
                            color: palette.secondary,
                            fontSize: 11,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 5),
                    Text(
                      notification.body,
                      style: TextStyle(
                        color: palette.onSurfaceVariant,
                        fontSize: 13,
                        height: 1.35,
                      ),
                    ),
                    if (notification.targetType ==
                        AppNotificationTargetType.boardPost) ...[
                      const SizedBox(height: 10),
                      const Text(
                        'Open board',
                        style: TextStyle(
                          color: AppColors.primaryContainer,
                          fontSize: 12,
                          fontWeight: FontWeight.w900,
                        ),
                      ),
                    ],
                  ],
                ),
              ),
              const SizedBox(width: 8),
              Icon(Icons.chevron_right, color: palette.secondary),
            ],
          ),
        ),
      ),
    );
  }

  void _handleTap(BuildContext context, AppNotification notification) {
    if (notification.targetType == AppNotificationTargetType.boardPost) {
      Navigator.of(
        context,
      ).push(MaterialPageRoute<void>(builder: (_) => const BoardScreen()));
    }
  }
}
