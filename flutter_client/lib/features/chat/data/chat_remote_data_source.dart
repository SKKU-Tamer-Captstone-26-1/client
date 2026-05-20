import 'dart:convert';
import 'dart:io';

import 'package:fixnum/fixnum.dart' as fixnum;
import 'package:grpc/grpc.dart';
import 'grpc_gen/google/protobuf/struct.pb.dart' as structpb;

import 'chat_grpc_endpoint.dart';
import 'grpc_gen/chat/v1/chat.pbgrpc.dart';

abstract class ChatRemoteDataSource {
  Future<CreateRoomResponse> createRoom({
    required String creatorUserId,
    required String title,
    String authToken = '',
  });

  Future<GetOrCreateBoardChatRoomResponse> getOrCreateBoardChatRoom({
    required String boardId,
    String? title,
    String? boardOwnerUserId,
    required String authToken,
  });

  Future<JoinRoomResponse> joinRoom({
    required String roomId,
    required String userId,
  });

  Future<SendMessageResponse> sendTextMessage({
    required String roomId,
    required String senderUserId,
    required String content,
    String authToken = '',
  });

  Future<CreateAttachmentUploadURLResponse> createAttachmentUploadURL({
    required String userId,
    required String roomId,
    required String fileName,
    required String contentType,
    String authToken = '',
  });

  Future<void> uploadToSignedUrl({
    required String uploadUrl,
    required String contentType,
    required List<int> bytes,
  });

  Future<SendMessageResponse> sendImageMessage({
    required String roomId,
    required String senderUserId,
    required String imageUrl,
    String authToken = '',
  });

  Future<SendMessageResponse> sendFileMessage({
    required String roomId,
    required String senderUserId,
    required String fileUrl,
    required String fileName,
    required String contentType,
    String authToken = '',
  });

  Future<DeleteMessageResponse> deleteMessage({
    required String roomId,
    required String messageId,
    required String ownerUserId,
  });

  Future<DeactivateRoomResponse> deactivateRoom({
    required String roomId,
    required String ownerUserId,
  });

  Future<GetMessagesResponse> getMessages({
    required String roomId,
    required String userId,
    String authToken = '',
    int beforeSequenceNo = 0,
    int limit = 20,
  });

  Future<MarkAsReadResponse> markAsRead({
    required String roomId,
    required String userId,
    required int lastReadSequenceNo,
  });

  Future<MarkChatRoomReadResponse> markChatRoomRead({
    required String roomId,
    required String authToken,
  });

  Future<RegisterDeviceTokenResponse> registerDeviceToken({
    required String deviceId,
    required String token,
    required DevicePlatform platform,
    required String authToken,
  });

  Future<UnregisterDeviceTokenResponse> unregisterDeviceToken({
    required String deviceId,
    required String authToken,
  });

  Future<ListMyRoomsResponse> listMyRooms({
    required String userId,
    String authToken = '',
    int pageSize = 20,
    String pageToken = '',
  });

  Stream<StreamMessagesResponse> streamMessages({
    required String roomId,
    required String userId,
    String authToken = '',
    int afterSequenceNo = 0,
  });

  Future<void> dispose();
}

class GrpcChatRemoteDataSource implements ChatRemoteDataSource {
  factory GrpcChatRemoteDataSource({ChatGrpcEndpoint? endpoint}) {
    final resolvedEndpoint = endpoint ?? ChatGrpcEndpoint.fromEnvironment();
    final channel = ClientChannel(
      resolvedEndpoint.host,
      port: resolvedEndpoint.port,
      options: ChannelOptions(
        credentials: resolvedEndpoint.useTls
            ? ChannelCredentials.secure()
            : ChannelCredentials.insecure(),
      ),
    );

    final client = ChatServiceClient(channel);

    return GrpcChatRemoteDataSource._(resolvedEndpoint, channel, client);
  }

  GrpcChatRemoteDataSource._(this._endpoint, this._channel, this._client);

  final ChatGrpcEndpoint _endpoint;
  final ClientChannel _channel;
  final ChatServiceClient _client;

  @override
  Future<CreateRoomResponse> createRoom({
    required String creatorUserId,
    required String title,
    String authToken = '',
  }) {
    return _client.createRoom(
      CreateRoomRequest()
        ..creatorUserId = creatorUserId
        ..title = title,
      options: authToken.trim().isEmpty
          ? CallOptions(timeout: const Duration(seconds: 10))
          : _authenticatedOptions(authToken),
    );
  }

  @override
  Future<GetOrCreateBoardChatRoomResponse> getOrCreateBoardChatRoom({
    required String boardId,
    String? title,
    String? boardOwnerUserId,
    required String authToken,
  }) {
    final request = GetOrCreateBoardChatRoomRequest()..boardId = boardId;
    final normalizedTitle = title?.trim();
    if (normalizedTitle != null && normalizedTitle.isNotEmpty) {
      request.title = normalizedTitle;
    }
    final normalizedBoardOwnerUserId = boardOwnerUserId?.trim();
    if (normalizedBoardOwnerUserId != null &&
        normalizedBoardOwnerUserId.isNotEmpty) {
      request.boardOwnerUserId = normalizedBoardOwnerUserId;
    }

    return _client.getOrCreateBoardChatRoom(
      request,
      options: _authenticatedOptions(authToken),
    );
  }

  @override
  Future<JoinRoomResponse> joinRoom({
    required String roomId,
    required String userId,
  }) {
    return _client.joinRoom(
      JoinRoomRequest()
        ..roomId = roomId
        ..userId = userId,
      options: CallOptions(timeout: const Duration(seconds: 10)),
    );
  }

  @override
  Future<SendMessageResponse> sendTextMessage({
    required String roomId,
    required String senderUserId,
    required String content,
    String authToken = '',
  }) {
    return _client.sendMessage(
      SendMessageRequest()
        ..roomId = roomId
        ..senderUserId = senderUserId
        ..messageType = MessageType.MESSAGE_TYPE_TEXT
        ..content = content,
      options: _callOptions(authToken),
    );
  }

  @override
  Future<CreateAttachmentUploadURLResponse> createAttachmentUploadURL({
    required String userId,
    required String roomId,
    required String fileName,
    required String contentType,
    String authToken = '',
  }) {
    return _client.createAttachmentUploadURL(
      CreateAttachmentUploadURLRequest()
        ..userId = userId
        ..roomId = roomId
        ..fileName = fileName
        ..contentType = contentType,
      options: _callOptions(authToken),
    );
  }

  @override
  Future<void> uploadToSignedUrl({
    required String uploadUrl,
    required String contentType,
    required List<int> bytes,
  }) async {
    final client = HttpClient();
    try {
      final request = await client.putUrl(Uri.parse(uploadUrl));
      request.headers.set(HttpHeaders.contentTypeHeader, contentType);
      request.contentLength = bytes.length;
      request.add(bytes);
      final response = await request.close();
      if (response.statusCode < 200 || response.statusCode >= 300) {
        final responseBody = await response.transform(utf8.decoder).join();
        final compactBody = responseBody.replaceAll(RegExp(r'\s+'), ' ').trim();
        throw HttpException(
          'upload failed with status ${response.statusCode}'
          '${compactBody.isEmpty ? '' : ': $compactBody'}',
          uri: Uri.parse(uploadUrl),
        );
      }
    } finally {
      client.close(force: true);
    }
  }

  @override
  Future<SendMessageResponse> sendImageMessage({
    required String roomId,
    required String senderUserId,
    required String imageUrl,
    String authToken = '',
  }) {
    return _client.sendMessage(
      SendMessageRequest()
        ..roomId = roomId
        ..senderUserId = senderUserId
        ..messageType = MessageType.MESSAGE_TYPE_IMAGE
        ..imageUrl = imageUrl,
      options: _callOptions(authToken),
    );
  }

  @override
  Future<SendMessageResponse> sendFileMessage({
    required String roomId,
    required String senderUserId,
    required String fileUrl,
    required String fileName,
    required String contentType,
    String authToken = '',
  }) {
    return _client.sendMessage(
      SendMessageRequest()
        ..roomId = roomId
        ..senderUserId = senderUserId
        ..messageType = MessageType.MESSAGE_TYPE_FILE
        ..fileUrl = fileUrl
        ..metadata = (structpb.Struct()
          ..fields.addAll({
            'file_url': structpb.Value()..stringValue = fileUrl,
            'file_name': structpb.Value()..stringValue = fileName,
            'content_type': structpb.Value()..stringValue = contentType,
          })),
      options: _callOptions(authToken),
    );
  }

  @override
  Future<DeleteMessageResponse> deleteMessage({
    required String roomId,
    required String messageId,
    required String ownerUserId,
  }) {
    return _client.deleteMessage(
      DeleteMessageRequest()
        ..roomId = roomId
        ..messageId = messageId
        ..ownerUserId = ownerUserId,
      options: CallOptions(timeout: const Duration(seconds: 10)),
    );
  }

  @override
  Future<DeactivateRoomResponse> deactivateRoom({
    required String roomId,
    required String ownerUserId,
  }) {
    return _client.deactivateRoom(
      DeactivateRoomRequest()
        ..roomId = roomId
        ..ownerUserId = ownerUserId,
      options: CallOptions(timeout: const Duration(seconds: 10)),
    );
  }

  @override
  Future<GetMessagesResponse> getMessages({
    required String roomId,
    required String userId,
    String authToken = '',
    int beforeSequenceNo = 0,
    int limit = 20,
  }) {
    return _client.getMessages(
      GetMessagesRequest()
        ..roomId = roomId
        ..userId = userId
        ..beforeSequenceNo = fixnum.Int64(beforeSequenceNo)
        ..limit = limit,
      options: _callOptions(authToken),
    );
  }

  @override
  Future<MarkAsReadResponse> markAsRead({
    required String roomId,
    required String userId,
    required int lastReadSequenceNo,
  }) {
    return _client.markAsRead(
      MarkAsReadRequest()
        ..roomId = roomId
        ..userId = userId
        ..lastReadSequenceNo = fixnum.Int64(lastReadSequenceNo),
      options: CallOptions(timeout: const Duration(seconds: 10)),
    );
  }

  @override
  Future<MarkChatRoomReadResponse> markChatRoomRead({
    required String roomId,
    required String authToken,
  }) {
    return _client.markChatRoomRead(
      MarkChatRoomReadRequest()..roomId = roomId,
      options: _authenticatedOptions(authToken),
    );
  }

  @override
  Future<RegisterDeviceTokenResponse> registerDeviceToken({
    required String deviceId,
    required String token,
    required DevicePlatform platform,
    required String authToken,
  }) {
    return _client.registerDeviceToken(
      RegisterDeviceTokenRequest()
        ..deviceId = deviceId
        ..token = token
        ..platform = platform,
      options: _authenticatedOptions(authToken),
    );
  }

  @override
  Future<UnregisterDeviceTokenResponse> unregisterDeviceToken({
    required String deviceId,
    required String authToken,
  }) {
    return _client.unregisterDeviceToken(
      UnregisterDeviceTokenRequest()..deviceId = deviceId,
      options: _authenticatedOptions(authToken),
    );
  }

  @override
  Future<ListMyRoomsResponse> listMyRooms({
    required String userId,
    String authToken = '',
    int pageSize = 20,
    String pageToken = '',
  }) {
    final request = ListMyRoomsRequest()
      ..pagination = (PaginationRequest()
        ..pageSize = pageSize
        ..pageToken = pageToken);
    if (authToken.trim().isEmpty && userId.isNotEmpty) {
      request.userId = userId;
    }

    return _client.listMyRooms(
      request,
      options: authToken.trim().isEmpty
          ? CallOptions(timeout: const Duration(seconds: 10))
          : _authenticatedOptions(authToken),
    );
  }

  @override
  Stream<StreamMessagesResponse> streamMessages({
    required String roomId,
    required String userId,
    String authToken = '',
    int afterSequenceNo = 0,
  }) {
    return _client.streamMessages(
      StreamMessagesRequest()
        ..roomId = roomId
        ..userId = userId
        ..afterSequenceNo = fixnum.Int64(afterSequenceNo),
      options: _streamOptions(authToken),
    );
  }

  @override
  Future<void> dispose() {
    return _channel.shutdown();
  }

  CallOptions _authenticatedOptions(String authToken) {
    final token = authToken.trim();
    return CallOptions(
      timeout: const Duration(seconds: 10),
      metadata: token.isEmpty
          ? const <String, String>{}
          : <String, String>{'authorization': 'Bearer $token'},
    );
  }

  CallOptions _callOptions(String authToken) {
    return authToken.trim().isEmpty
        ? CallOptions(timeout: const Duration(seconds: 10))
        : _authenticatedOptions(authToken);
  }

  CallOptions _streamOptions(String authToken) {
    final token = authToken.trim();
    return CallOptions(
      metadata: token.isEmpty
          ? const <String, String>{}
          : <String, String>{'authorization': 'Bearer $token'},
    );
  }

  @override
  String toString() {
    return 'GrpcChatRemoteDataSource('
        '${_endpoint.host}:${_endpoint.port}, tls=${_endpoint.useTls})';
  }
}
