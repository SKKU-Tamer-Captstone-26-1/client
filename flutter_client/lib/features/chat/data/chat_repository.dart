import '../models/groupchat_models.dart';
import 'chat_remote_data_source.dart';
import 'grpc_gen/chat/v1/chat.pb.dart';
import 'grpc_gen/google/protobuf/timestamp.pb.dart';

abstract class ChatRepository {
  Future<GroupchatRoomSummary> createRoom({
    required String creatorUserId,
    required String title,
  });

  Future<void> joinRoom({required String roomId, required String userId});

  Future<void> sendTextMessage({
    required String roomId,
    required String senderUserId,
    required String content,
  });

  Future<AttachmentUploadTarget> createAttachmentUploadURL({
    required String userId,
    required String roomId,
    required String fileName,
    required String contentType,
  });

  Future<void> uploadToSignedUrl({
    required String uploadUrl,
    required String contentType,
    required List<int> bytes,
  });

  Future<void> sendImageMessage({
    required String roomId,
    required String senderUserId,
    required String imageUrl,
  });

  Future<void> sendFileMessage({
    required String roomId,
    required String senderUserId,
    required String fileUrl,
    required String fileName,
    required String contentType,
  });

  Future<void> deleteMessage({
    required String roomId,
    required String messageId,
    required String ownerUserId,
  });

  Future<void> deactivateRoom({
    required String roomId,
    required String ownerUserId,
  });

  Future<ChatRoomPage> listMyRooms({
    required String userId,
    int pageSize = 20,
    String pageToken = '',
  });

  Future<List<GroupchatMessage>> getMessages({
    required String roomId,
    required String userId,
    int beforeSequenceNo = 0,
    int limit = 20,
  });

  Future<void> markAsRead({
    required String roomId,
    required String userId,
    required int lastReadSequenceNo,
  });

  Stream<GroupchatMessage> streamMessages({
    required String roomId,
    required String userId,
    int afterSequenceNo = 0,
  });

  Future<void> dispose();
}

class ChatRoomPage {
  const ChatRoomPage({required this.rooms, required this.nextPageToken});

  final List<GroupchatRoomSummary> rooms;
  final String nextPageToken;
}

class AttachmentUploadTarget {
  const AttachmentUploadTarget({
    required this.objectName,
    required this.uploadUrl,
    required this.fileUrl,
  });

  final String objectName;
  final String uploadUrl;
  final String fileUrl;
}

class GrpcChatRepository implements ChatRepository {
  GrpcChatRepository(this._remote);

  final ChatRemoteDataSource _remote;

  @override
  Future<GroupchatRoomSummary> createRoom({
    required String creatorUserId,
    required String title,
  }) async {
    final response = await _remote.createRoom(
      creatorUserId: creatorUserId,
      title: title,
    );
    return response.room.toUiRoomSummary();
  }

  @override
  Future<void> joinRoom({required String roomId, required String userId}) {
    return _remote.joinRoom(roomId: roomId, userId: userId);
  }

  @override
  Future<void> sendTextMessage({
    required String roomId,
    required String senderUserId,
    required String content,
  }) {
    return _remote.sendTextMessage(
      roomId: roomId,
      senderUserId: senderUserId,
      content: content,
    );
  }

  @override
  Future<AttachmentUploadTarget> createAttachmentUploadURL({
    required String userId,
    required String roomId,
    required String fileName,
    required String contentType,
  }) async {
    final response = await _remote.createAttachmentUploadURL(
      userId: userId,
      roomId: roomId,
      fileName: fileName,
      contentType: contentType,
    );
    return AttachmentUploadTarget(
      objectName: response.objectName,
      uploadUrl: response.uploadUrl,
      fileUrl: response.fileUrl,
    );
  }

  @override
  Future<void> uploadToSignedUrl({
    required String uploadUrl,
    required String contentType,
    required List<int> bytes,
  }) {
    return _remote.uploadToSignedUrl(
      uploadUrl: uploadUrl,
      contentType: contentType,
      bytes: bytes,
    );
  }

  @override
  Future<void> sendImageMessage({
    required String roomId,
    required String senderUserId,
    required String imageUrl,
  }) {
    return _remote.sendImageMessage(
      roomId: roomId,
      senderUserId: senderUserId,
      imageUrl: imageUrl,
    );
  }

  @override
  Future<void> sendFileMessage({
    required String roomId,
    required String senderUserId,
    required String fileUrl,
    required String fileName,
    required String contentType,
  }) {
    return _remote.sendFileMessage(
      roomId: roomId,
      senderUserId: senderUserId,
      fileUrl: fileUrl,
      fileName: fileName,
      contentType: contentType,
    );
  }

  @override
  Future<void> deleteMessage({
    required String roomId,
    required String messageId,
    required String ownerUserId,
  }) {
    return _remote.deleteMessage(
      roomId: roomId,
      messageId: messageId,
      ownerUserId: ownerUserId,
    );
  }

  @override
  Future<void> deactivateRoom({
    required String roomId,
    required String ownerUserId,
  }) {
    return _remote.deactivateRoom(roomId: roomId, ownerUserId: ownerUserId);
  }

  @override
  Future<ChatRoomPage> listMyRooms({
    required String userId,
    int pageSize = 20,
    String pageToken = '',
  }) async {
    final response = await _remote.listMyRooms(
      userId: userId,
      pageSize: pageSize,
      pageToken: pageToken,
    );
    return ChatRoomPage(
      rooms: response.rooms.map((room) => room.toUiRoomSummary()).toList(),
      nextPageToken: response.pagination.nextPageToken,
    );
  }

  @override
  Future<List<GroupchatMessage>> getMessages({
    required String roomId,
    required String userId,
    int beforeSequenceNo = 0,
    int limit = 20,
  }) async {
    final response = await _remote.getMessages(
      roomId: roomId,
      userId: userId,
      beforeSequenceNo: beforeSequenceNo,
      limit: limit,
    );
    return response.messages
        .map((message) => message.toUiMessage(currentUserId: userId))
        .toList();
  }

  @override
  Future<void> markAsRead({
    required String roomId,
    required String userId,
    required int lastReadSequenceNo,
  }) {
    return _remote.markAsRead(
      roomId: roomId,
      userId: userId,
      lastReadSequenceNo: lastReadSequenceNo,
    );
  }

  @override
  Stream<GroupchatMessage> streamMessages({
    required String roomId,
    required String userId,
    int afterSequenceNo = 0,
  }) {
    return _remote
        .streamMessages(
          roomId: roomId,
          userId: userId,
          afterSequenceNo: afterSequenceNo,
        )
        .map((response) => response.message.toUiMessage(currentUserId: userId));
  }

  @override
  Future<void> dispose() {
    return _remote.dispose();
  }
}

extension _ChatRoomMapper on ChatRoom {
  GroupchatRoomSummary toUiRoomSummary() {
    return GroupchatRoomSummary(
      roomId: roomId,
      title: title,
      memberSummary: '-/-',
      location: 'Unknown',
      lastMessage: 'No messages yet',
      timeLabel: _formatTimestamp(hasUpdatedAt() ? updatedAt : null),
      tags: const [],
      avatarUrls: const [],
      unreadCount: 0,
    );
  }
}

extension _ChatRoomSummaryMapper on ChatRoomSummary {
  GroupchatRoomSummary toUiRoomSummary() {
    final preview = lastMessage.contentPreview.isNotEmpty
        ? lastMessage.contentPreview
        : 'No messages yet';
    return GroupchatRoomSummary(
      roomId: roomId,
      title: title,
      memberSummary: '-/-',
      location: 'Unknown',
      lastMessage: preview,
      timeLabel: _formatTimestamp(hasUpdatedAt() ? updatedAt : null),
      tags: const [],
      avatarUrls: const [],
      unreadCount: unreadCount.toInt(),
    );
  }
}

extension _ChatMessageMapper on ChatMessage {
  GroupchatMessage toUiMessage({required String currentUserId}) {
    final isOutgoing = senderUserId == currentUserId;
    final sentAtDateTime = hasSentAt() ? sentAt.toDateTime().toLocal() : null;

    return GroupchatMessage(
      messageId: messageId,
      roomId: roomId,
      sequenceNo: sequenceNo.toInt(),
      kind: isOutgoing
          ? GroupchatMessageKind.outgoing
          : GroupchatMessageKind.incoming,
      contentType: _toContentType(),
      imageUrl: imageUrl,
      fileUrl: _resolvedFileUrl(),
      fileName: _metadataString('file_name'),
      fileContentType: _metadataString('content_type'),
      text: _toPreviewText(),
      timeLabel: _formatTimestamp(hasSentAt() ? sentAt : null),
      sentAt: sentAtDateTime,
      senderName: isOutgoing ? null : _shortUserLabel(senderUserId),
      senderAvatarUrl: null,
      deliveryLabel: isOutgoing ? 'Sent' : null,
    );
  }

  GroupchatMessageContentType _toContentType() {
    switch (messageType) {
      case MessageType.MESSAGE_TYPE_IMAGE:
        return GroupchatMessageContentType.image;
      case MessageType.MESSAGE_TYPE_SYSTEM:
        return GroupchatMessageContentType.system;
      case MessageType.MESSAGE_TYPE_FILE:
        return GroupchatMessageContentType.file;
      case MessageType.MESSAGE_TYPE_TEXT:
      case MessageType.MESSAGE_TYPE_UNSPECIFIED:
        return GroupchatMessageContentType.text;
      default:
        return GroupchatMessageContentType.text;
    }
  }

  String _toPreviewText() {
    if (isDeleted) {
      return 'This message was deleted.';
    }
    if (content.isNotEmpty) {
      return content;
    }
    if (messageType == MessageType.MESSAGE_TYPE_IMAGE) {
      return '[Image]';
    }
    if (messageType == MessageType.MESSAGE_TYPE_FILE) {
      final fileName = _metadataString('file_name');
      return fileName.isNotEmpty ? '[File] $fileName' : '[File]';
    }
    if (messageType == MessageType.MESSAGE_TYPE_SYSTEM) {
      return '[System message]';
    }
    return '';
  }

  String _metadataString(String key) {
    if (!hasMetadata()) {
      return '';
    }
    final value = metadata.fields[key];
    if (value == null || !value.hasStringValue()) {
      return '';
    }
    return value.stringValue;
  }

  String _resolvedFileUrl() {
    if (fileUrl.trim().isNotEmpty) {
      return fileUrl;
    }
    return _metadataString('file_url');
  }
}

String _formatTimestamp(Timestamp? timestamp) {
  if (timestamp == null) {
    return '';
  }
  if (timestamp.seconds == 0 && timestamp.nanos == 0) {
    return '';
  }

  try {
    final dateTime = timestamp.toDateTime().toLocal();
    final hour = dateTime.hour.toString().padLeft(2, '0');
    final minute = dateTime.minute.toString().padLeft(2, '0');
    return '$hour:$minute';
  } catch (_) {
    return '';
  }
}

String _shortUserLabel(String userId) {
  if (userId.isEmpty) {
    return 'Member';
  }
  if (userId.length <= 8) {
    return userId;
  }
  return '${userId.substring(0, 8)}...';
}
