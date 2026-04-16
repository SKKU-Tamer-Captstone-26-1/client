import 'package:flutter/material.dart';

enum AppNotificationTargetType {
  boardPost,
  chatRoom,
  collectionItem,
  storeDrop,
}

@immutable
class AppNotification {
  const AppNotification({
    required this.title,
    required this.body,
    required this.timeLabel,
    required this.icon,
    required this.targetType,
    this.targetId,
    this.isUnread = false,
  });

  final String title;
  final String body;
  final String timeLabel;
  final IconData icon;
  final AppNotificationTargetType targetType;
  final String? targetId;
  final bool isUnread;
}
