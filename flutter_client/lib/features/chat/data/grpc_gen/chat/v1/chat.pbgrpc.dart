//
//  Generated code. Do not modify.
//  source: chat/v1/chat.proto
//
// @dart = 2.12

// ignore_for_file: annotate_overrides, camel_case_types, comment_references
// ignore_for_file: constant_identifier_names, library_prefixes
// ignore_for_file: non_constant_identifier_names, prefer_final_fields
// ignore_for_file: unnecessary_import, unnecessary_this, unused_import

import 'dart:async' as $async;
import 'dart:core' as $core;

import 'package:grpc/service_api.dart' as $grpc;
import 'package:protobuf/protobuf.dart' as $pb;

import 'chat.pb.dart' as $0;

export 'chat.pb.dart';

@$pb.GrpcServiceName('ontheblock.chat.v1.ChatService')
class ChatServiceClient extends $grpc.Client {
  static final _$createRoom = $grpc.ClientMethod<$0.CreateRoomRequest, $0.CreateRoomResponse>(
      '/ontheblock.chat.v1.ChatService/CreateRoom',
      ($0.CreateRoomRequest value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $0.CreateRoomResponse.fromBuffer(value));
  static final _$createBoardLinkedRoom = $grpc.ClientMethod<$0.CreateBoardLinkedRoomRequest, $0.CreateBoardLinkedRoomResponse>(
      '/ontheblock.chat.v1.ChatService/CreateBoardLinkedRoom',
      ($0.CreateBoardLinkedRoomRequest value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $0.CreateBoardLinkedRoomResponse.fromBuffer(value));
  static final _$joinRoom = $grpc.ClientMethod<$0.JoinRoomRequest, $0.JoinRoomResponse>(
      '/ontheblock.chat.v1.ChatService/JoinRoom',
      ($0.JoinRoomRequest value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $0.JoinRoomResponse.fromBuffer(value));
  static final _$leaveRoom = $grpc.ClientMethod<$0.LeaveRoomRequest, $0.LeaveRoomResponse>(
      '/ontheblock.chat.v1.ChatService/LeaveRoom',
      ($0.LeaveRoomRequest value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $0.LeaveRoomResponse.fromBuffer(value));
  static final _$listMyRooms = $grpc.ClientMethod<$0.ListMyRoomsRequest, $0.ListMyRoomsResponse>(
      '/ontheblock.chat.v1.ChatService/ListMyRooms',
      ($0.ListMyRoomsRequest value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $0.ListMyRoomsResponse.fromBuffer(value));
  static final _$getMessages = $grpc.ClientMethod<$0.GetMessagesRequest, $0.GetMessagesResponse>(
      '/ontheblock.chat.v1.ChatService/GetMessages',
      ($0.GetMessagesRequest value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $0.GetMessagesResponse.fromBuffer(value));
  static final _$sendMessage = $grpc.ClientMethod<$0.SendMessageRequest, $0.SendMessageResponse>(
      '/ontheblock.chat.v1.ChatService/SendMessage',
      ($0.SendMessageRequest value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $0.SendMessageResponse.fromBuffer(value));
  static final _$markAsRead = $grpc.ClientMethod<$0.MarkAsReadRequest, $0.MarkAsReadResponse>(
      '/ontheblock.chat.v1.ChatService/MarkAsRead',
      ($0.MarkAsReadRequest value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $0.MarkAsReadResponse.fromBuffer(value));
  static final _$removeMember = $grpc.ClientMethod<$0.RemoveMemberRequest, $0.RemoveMemberResponse>(
      '/ontheblock.chat.v1.ChatService/RemoveMember',
      ($0.RemoveMemberRequest value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $0.RemoveMemberResponse.fromBuffer(value));
  static final _$deleteMessage = $grpc.ClientMethod<$0.DeleteMessageRequest, $0.DeleteMessageResponse>(
      '/ontheblock.chat.v1.ChatService/DeleteMessage',
      ($0.DeleteMessageRequest value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $0.DeleteMessageResponse.fromBuffer(value));
  static final _$deactivateRoom = $grpc.ClientMethod<$0.DeactivateRoomRequest, $0.DeactivateRoomResponse>(
      '/ontheblock.chat.v1.ChatService/DeactivateRoom',
      ($0.DeactivateRoomRequest value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $0.DeactivateRoomResponse.fromBuffer(value));
  static final _$streamMessages = $grpc.ClientMethod<$0.StreamMessagesRequest, $0.StreamMessagesResponse>(
      '/ontheblock.chat.v1.ChatService/StreamMessages',
      ($0.StreamMessagesRequest value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $0.StreamMessagesResponse.fromBuffer(value));

  ChatServiceClient($grpc.ClientChannel channel,
      {$grpc.CallOptions? options,
      $core.Iterable<$grpc.ClientInterceptor>? interceptors})
      : super(channel, options: options,
        interceptors: interceptors);

  $grpc.ResponseFuture<$0.CreateRoomResponse> createRoom($0.CreateRoomRequest request, {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$createRoom, request, options: options);
  }

  $grpc.ResponseFuture<$0.CreateBoardLinkedRoomResponse> createBoardLinkedRoom($0.CreateBoardLinkedRoomRequest request, {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$createBoardLinkedRoom, request, options: options);
  }

  $grpc.ResponseFuture<$0.JoinRoomResponse> joinRoom($0.JoinRoomRequest request, {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$joinRoom, request, options: options);
  }

  $grpc.ResponseFuture<$0.LeaveRoomResponse> leaveRoom($0.LeaveRoomRequest request, {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$leaveRoom, request, options: options);
  }

  $grpc.ResponseFuture<$0.ListMyRoomsResponse> listMyRooms($0.ListMyRoomsRequest request, {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$listMyRooms, request, options: options);
  }

  $grpc.ResponseFuture<$0.GetMessagesResponse> getMessages($0.GetMessagesRequest request, {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$getMessages, request, options: options);
  }

  $grpc.ResponseFuture<$0.SendMessageResponse> sendMessage($0.SendMessageRequest request, {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$sendMessage, request, options: options);
  }

  $grpc.ResponseFuture<$0.MarkAsReadResponse> markAsRead($0.MarkAsReadRequest request, {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$markAsRead, request, options: options);
  }

  $grpc.ResponseFuture<$0.RemoveMemberResponse> removeMember($0.RemoveMemberRequest request, {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$removeMember, request, options: options);
  }

  $grpc.ResponseFuture<$0.DeleteMessageResponse> deleteMessage($0.DeleteMessageRequest request, {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$deleteMessage, request, options: options);
  }

  $grpc.ResponseFuture<$0.DeactivateRoomResponse> deactivateRoom($0.DeactivateRoomRequest request, {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$deactivateRoom, request, options: options);
  }

  $grpc.ResponseStream<$0.StreamMessagesResponse> streamMessages($0.StreamMessagesRequest request, {$grpc.CallOptions? options}) {
    return $createStreamingCall(_$streamMessages, $async.Stream.fromIterable([request]), options: options);
  }
}

@$pb.GrpcServiceName('ontheblock.chat.v1.ChatService')
abstract class ChatServiceBase extends $grpc.Service {
  $core.String get $name => 'ontheblock.chat.v1.ChatService';

  ChatServiceBase() {
    $addMethod($grpc.ServiceMethod<$0.CreateRoomRequest, $0.CreateRoomResponse>(
        'CreateRoom',
        createRoom_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $0.CreateRoomRequest.fromBuffer(value),
        ($0.CreateRoomResponse value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$0.CreateBoardLinkedRoomRequest, $0.CreateBoardLinkedRoomResponse>(
        'CreateBoardLinkedRoom',
        createBoardLinkedRoom_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $0.CreateBoardLinkedRoomRequest.fromBuffer(value),
        ($0.CreateBoardLinkedRoomResponse value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$0.JoinRoomRequest, $0.JoinRoomResponse>(
        'JoinRoom',
        joinRoom_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $0.JoinRoomRequest.fromBuffer(value),
        ($0.JoinRoomResponse value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$0.LeaveRoomRequest, $0.LeaveRoomResponse>(
        'LeaveRoom',
        leaveRoom_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $0.LeaveRoomRequest.fromBuffer(value),
        ($0.LeaveRoomResponse value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$0.ListMyRoomsRequest, $0.ListMyRoomsResponse>(
        'ListMyRooms',
        listMyRooms_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $0.ListMyRoomsRequest.fromBuffer(value),
        ($0.ListMyRoomsResponse value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$0.GetMessagesRequest, $0.GetMessagesResponse>(
        'GetMessages',
        getMessages_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $0.GetMessagesRequest.fromBuffer(value),
        ($0.GetMessagesResponse value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$0.SendMessageRequest, $0.SendMessageResponse>(
        'SendMessage',
        sendMessage_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $0.SendMessageRequest.fromBuffer(value),
        ($0.SendMessageResponse value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$0.MarkAsReadRequest, $0.MarkAsReadResponse>(
        'MarkAsRead',
        markAsRead_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $0.MarkAsReadRequest.fromBuffer(value),
        ($0.MarkAsReadResponse value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$0.RemoveMemberRequest, $0.RemoveMemberResponse>(
        'RemoveMember',
        removeMember_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $0.RemoveMemberRequest.fromBuffer(value),
        ($0.RemoveMemberResponse value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$0.DeleteMessageRequest, $0.DeleteMessageResponse>(
        'DeleteMessage',
        deleteMessage_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $0.DeleteMessageRequest.fromBuffer(value),
        ($0.DeleteMessageResponse value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$0.DeactivateRoomRequest, $0.DeactivateRoomResponse>(
        'DeactivateRoom',
        deactivateRoom_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $0.DeactivateRoomRequest.fromBuffer(value),
        ($0.DeactivateRoomResponse value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$0.StreamMessagesRequest, $0.StreamMessagesResponse>(
        'StreamMessages',
        streamMessages_Pre,
        false,
        true,
        ($core.List<$core.int> value) => $0.StreamMessagesRequest.fromBuffer(value),
        ($0.StreamMessagesResponse value) => value.writeToBuffer()));
  }

  $async.Future<$0.CreateRoomResponse> createRoom_Pre($grpc.ServiceCall call, $async.Future<$0.CreateRoomRequest> request) async {
    return createRoom(call, await request);
  }

  $async.Future<$0.CreateBoardLinkedRoomResponse> createBoardLinkedRoom_Pre($grpc.ServiceCall call, $async.Future<$0.CreateBoardLinkedRoomRequest> request) async {
    return createBoardLinkedRoom(call, await request);
  }

  $async.Future<$0.JoinRoomResponse> joinRoom_Pre($grpc.ServiceCall call, $async.Future<$0.JoinRoomRequest> request) async {
    return joinRoom(call, await request);
  }

  $async.Future<$0.LeaveRoomResponse> leaveRoom_Pre($grpc.ServiceCall call, $async.Future<$0.LeaveRoomRequest> request) async {
    return leaveRoom(call, await request);
  }

  $async.Future<$0.ListMyRoomsResponse> listMyRooms_Pre($grpc.ServiceCall call, $async.Future<$0.ListMyRoomsRequest> request) async {
    return listMyRooms(call, await request);
  }

  $async.Future<$0.GetMessagesResponse> getMessages_Pre($grpc.ServiceCall call, $async.Future<$0.GetMessagesRequest> request) async {
    return getMessages(call, await request);
  }

  $async.Future<$0.SendMessageResponse> sendMessage_Pre($grpc.ServiceCall call, $async.Future<$0.SendMessageRequest> request) async {
    return sendMessage(call, await request);
  }

  $async.Future<$0.MarkAsReadResponse> markAsRead_Pre($grpc.ServiceCall call, $async.Future<$0.MarkAsReadRequest> request) async {
    return markAsRead(call, await request);
  }

  $async.Future<$0.RemoveMemberResponse> removeMember_Pre($grpc.ServiceCall call, $async.Future<$0.RemoveMemberRequest> request) async {
    return removeMember(call, await request);
  }

  $async.Future<$0.DeleteMessageResponse> deleteMessage_Pre($grpc.ServiceCall call, $async.Future<$0.DeleteMessageRequest> request) async {
    return deleteMessage(call, await request);
  }

  $async.Future<$0.DeactivateRoomResponse> deactivateRoom_Pre($grpc.ServiceCall call, $async.Future<$0.DeactivateRoomRequest> request) async {
    return deactivateRoom(call, await request);
  }

  $async.Stream<$0.StreamMessagesResponse> streamMessages_Pre($grpc.ServiceCall call, $async.Future<$0.StreamMessagesRequest> request) async* {
    yield* streamMessages(call, await request);
  }

  $async.Future<$0.CreateRoomResponse> createRoom($grpc.ServiceCall call, $0.CreateRoomRequest request);
  $async.Future<$0.CreateBoardLinkedRoomResponse> createBoardLinkedRoom($grpc.ServiceCall call, $0.CreateBoardLinkedRoomRequest request);
  $async.Future<$0.JoinRoomResponse> joinRoom($grpc.ServiceCall call, $0.JoinRoomRequest request);
  $async.Future<$0.LeaveRoomResponse> leaveRoom($grpc.ServiceCall call, $0.LeaveRoomRequest request);
  $async.Future<$0.ListMyRoomsResponse> listMyRooms($grpc.ServiceCall call, $0.ListMyRoomsRequest request);
  $async.Future<$0.GetMessagesResponse> getMessages($grpc.ServiceCall call, $0.GetMessagesRequest request);
  $async.Future<$0.SendMessageResponse> sendMessage($grpc.ServiceCall call, $0.SendMessageRequest request);
  $async.Future<$0.MarkAsReadResponse> markAsRead($grpc.ServiceCall call, $0.MarkAsReadRequest request);
  $async.Future<$0.RemoveMemberResponse> removeMember($grpc.ServiceCall call, $0.RemoveMemberRequest request);
  $async.Future<$0.DeleteMessageResponse> deleteMessage($grpc.ServiceCall call, $0.DeleteMessageRequest request);
  $async.Future<$0.DeactivateRoomResponse> deactivateRoom($grpc.ServiceCall call, $0.DeactivateRoomRequest request);
  $async.Stream<$0.StreamMessagesResponse> streamMessages($grpc.ServiceCall call, $0.StreamMessagesRequest request);
}
