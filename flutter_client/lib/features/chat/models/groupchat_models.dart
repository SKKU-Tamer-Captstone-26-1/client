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
    required this.roomId,
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

  final String roomId;
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
enum GroupchatMessageContentType { text, image, system }

@immutable
class GroupchatMessage {
  const GroupchatMessage({
    required this.messageId,
    required this.roomId,
    required this.sequenceNo,
    required this.kind,
    required this.text,
    required this.timeLabel,
    this.contentType = GroupchatMessageContentType.text,
    this.imageUrl = '',
    this.senderName,
    this.senderAvatarUrl,
    this.deliveryLabel,
  });

  final String messageId;
  final String roomId;
  final int sequenceNo;
  final GroupchatMessageKind kind;
  final String text;
  final String timeLabel;
  final GroupchatMessageContentType contentType;
  final String imageUrl;
  final String? senderName;
  final String? senderAvatarUrl;
  final String? deliveryLabel;

  bool get isOutgoing => kind == GroupchatMessageKind.outgoing;
}
