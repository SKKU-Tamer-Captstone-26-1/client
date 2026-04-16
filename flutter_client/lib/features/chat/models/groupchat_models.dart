import 'package:flutter/material.dart';

@immutable
class ActiveBoardRoom {
  const ActiveBoardRoom({
    required this.name,
    required this.imageUrl,
    this.hasUnreadActivity = false,
  });

  final String name;
  final String imageUrl;
  final bool hasUnreadActivity;
}

@immutable
class GroupchatRoomSummary {
  const GroupchatRoomSummary({
    required this.title,
    required this.memberSummary,
    required this.location,
    required this.lastMessage,
    required this.timeLabel,
    required this.tags,
    required this.avatarUrls,
    this.unreadCount = 0,
    this.isMuted = false,
    this.trailingIcon,
    this.extraMemberCount = 0,
  });

  final String title;
  final String memberSummary;
  final String location;
  final String lastMessage;
  final String timeLabel;
  final List<String> tags;
  final List<String> avatarUrls;
  final int unreadCount;
  final bool isMuted;
  final IconData? trailingIcon;
  final int extraMemberCount;

  bool get hasUnread => unreadCount > 0;
}

enum GroupchatMessageKind { incoming, outgoing }

@immutable
class GroupchatMessage {
  const GroupchatMessage({
    required this.kind,
    required this.text,
    required this.timeLabel,
    this.senderName,
    this.senderAvatarUrl,
    this.deliveryLabel,
  });

  final GroupchatMessageKind kind;
  final String text;
  final String timeLabel;
  final String? senderName;
  final String? senderAvatarUrl;
  final String? deliveryLabel;

  bool get isOutgoing => kind == GroupchatMessageKind.outgoing;
}
