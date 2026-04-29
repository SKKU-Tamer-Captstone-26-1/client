import 'package:fixnum/fixnum.dart' as fixnum;
import 'package:grpc/grpc.dart';

import 'chat_grpc_endpoint.dart';
import 'grpc_gen/chat/v1/chat.pbgrpc.dart';

abstract class ChatRemoteDataSource {
  Future<CreateRoomResponse> createRoom({
    required String creatorUserId,
    required String title,
  });

  Future<JoinRoomResponse> joinRoom({
    required String roomId,
    required String userId,
  });

  Future<SendMessageResponse> sendTextMessage({
    required String roomId,
    required String senderUserId,
    required String content,
  });

  Future<GetMessagesResponse> getMessages({
    required String roomId,
    required String userId,
    int beforeSequenceNo = 0,
    int limit = 20,
  });

  Future<MarkAsReadResponse> markAsRead({
    required String roomId,
    required String userId,
    required int lastReadSequenceNo,
  });

  Future<ListMyRoomsResponse> listMyRooms({
    required String userId,
    int pageSize = 20,
    String pageToken = '',
  });

  Stream<StreamMessagesResponse> streamMessages({
    required String roomId,
    required String userId,
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
  }) {
    return _client.createRoom(
      CreateRoomRequest()
        ..creatorUserId = creatorUserId
        ..title = title,
      options: CallOptions(timeout: const Duration(seconds: 10)),
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
  }) {
    return _client.sendMessage(
      SendMessageRequest()
        ..roomId = roomId
        ..senderUserId = senderUserId
        ..messageType = MessageType.MESSAGE_TYPE_TEXT
        ..content = content,
      options: CallOptions(timeout: const Duration(seconds: 10)),
    );
  }

  @override
  Future<GetMessagesResponse> getMessages({
    required String roomId,
    required String userId,
    int beforeSequenceNo = 0,
    int limit = 20,
  }) {
    return _client.getMessages(
      GetMessagesRequest()
        ..roomId = roomId
        ..userId = userId
        ..beforeSequenceNo = fixnum.Int64(beforeSequenceNo)
        ..limit = limit,
      options: CallOptions(timeout: const Duration(seconds: 10)),
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
  Future<ListMyRoomsResponse> listMyRooms({
    required String userId,
    int pageSize = 20,
    String pageToken = '',
  }) {
    return _client.listMyRooms(
      ListMyRoomsRequest()
        ..userId = userId
        ..pagination = (PaginationRequest()
          ..pageSize = pageSize
          ..pageToken = pageToken),
      options: CallOptions(timeout: const Duration(seconds: 10)),
    );
  }

  @override
  Stream<StreamMessagesResponse> streamMessages({
    required String roomId,
    required String userId,
    int afterSequenceNo = 0,
  }) {
    return _client.streamMessages(
      StreamMessagesRequest()
        ..roomId = roomId
        ..userId = userId
        ..afterSequenceNo = fixnum.Int64(afterSequenceNo),
    );
  }

  @override
  Future<void> dispose() {
    return _channel.shutdown();
  }

  @override
  String toString() {
    return 'GrpcChatRemoteDataSource('
        '${_endpoint.host}:${_endpoint.port}, tls=${_endpoint.useTls})';
  }
}
