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
    this.memberCount = 0,
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
  final int memberCount;
  final int unreadCount;
  final bool isMuted;
  final IconData? trailingIcon;
  final int extraMemberCount;

  bool get hasUnread => unreadCount > 0;

  GroupchatRoomSummary copyWith({
    String? roomId,
    String? title,
    String? memberSummary,
    String? location,
    String? lastMessage,
    String? timeLabel,
    List<String>? tags,
    List<String>? avatarUrls,
    int? memberCount,
    int? unreadCount,
    bool? isMuted,
    IconData? trailingIcon,
    int? extraMemberCount,
  }) {
    return GroupchatRoomSummary(
      roomId: roomId ?? this.roomId,
      title: title ?? this.title,
      memberSummary: memberSummary ?? this.memberSummary,
      location: location ?? this.location,
      lastMessage: lastMessage ?? this.lastMessage,
      timeLabel: timeLabel ?? this.timeLabel,
      tags: tags ?? this.tags,
      avatarUrls: avatarUrls ?? this.avatarUrls,
      memberCount: memberCount ?? this.memberCount,
      unreadCount: unreadCount ?? this.unreadCount,
      isMuted: isMuted ?? this.isMuted,
      trailingIcon: trailingIcon ?? this.trailingIcon,
      extraMemberCount: extraMemberCount ?? this.extraMemberCount,
    );
  }
}

enum GroupchatMessageKind { incoming, outgoing }

enum GroupchatMessageContentType { text, image, file, system }

@immutable
class GroupchatMessage {
  const GroupchatMessage({
    required this.messageId,
    required this.roomId,
    required this.sequenceNo,
    required this.kind,
    required this.text,
    required this.timeLabel,
    this.sentAt,
    this.contentType = GroupchatMessageContentType.text,
    this.imageUrl = '',
    this.fileUrl = '',
    this.fileName = '',
    this.fileContentType = '',
    this.senderName,
    this.senderAvatarUrl,
    this.senderId,
    this.deliveryLabel,
  });

  final String messageId;
  final String roomId;
  final int sequenceNo;
  final GroupchatMessageKind kind;
  final String text;
  final String timeLabel;
  final DateTime? sentAt;
  final GroupchatMessageContentType contentType;
  final String imageUrl;
  final String fileUrl;
  final String fileName;
  final String fileContentType;
  final String? senderName;
  final String? senderAvatarUrl;
  final String? senderId;
  final String? deliveryLabel;

  bool get isOutgoing => kind == GroupchatMessageKind.outgoing;
}
