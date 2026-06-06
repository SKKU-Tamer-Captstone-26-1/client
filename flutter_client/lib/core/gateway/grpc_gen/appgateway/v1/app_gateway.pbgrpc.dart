//
//  Generated code. Do not modify.
//  source: appgateway/v1/app_gateway.proto
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

import 'app_gateway.pb.dart' as $0;

export 'app_gateway.pb.dart';

@$pb.GrpcServiceName('ontheblock.appgateway.v1.AppGatewayService')
class AppGatewayServiceClient extends $grpc.Client {
  static final _$getMe = $grpc.ClientMethod<$0.GetMeRequest, $0.GetMeResponse>(
      '/ontheblock.appgateway.v1.AppGatewayService/GetMe',
      ($0.GetMeRequest value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $0.GetMeResponse.fromBuffer(value));
  static final _$sendChatbotMessage = $grpc.ClientMethod<
          $0.SendChatbotMessageRequest, $0.SendChatbotMessageResponse>(
      '/ontheblock.appgateway.v1.AppGatewayService/SendChatbotMessage',
      ($0.SendChatbotMessageRequest value) => value.writeToBuffer(),
      ($core.List<$core.int> value) =>
          $0.SendChatbotMessageResponse.fromBuffer(value));
  static final _$getChatbotConversation = $grpc.ClientMethod<
          $0.GetChatbotConversationRequest, $0.GetChatbotConversationResponse>(
      '/ontheblock.appgateway.v1.AppGatewayService/GetChatbotConversation',
      ($0.GetChatbotConversationRequest value) => value.writeToBuffer(),
      ($core.List<$core.int> value) =>
          $0.GetChatbotConversationResponse.fromBuffer(value));
  static final _$recordChatbotFeedback = $grpc.ClientMethod<
          $0.RecordChatbotFeedbackRequest, $0.RecordChatbotFeedbackResponse>(
      '/ontheblock.appgateway.v1.AppGatewayService/RecordChatbotFeedback',
      ($0.RecordChatbotFeedbackRequest value) => value.writeToBuffer(),
      ($core.List<$core.int> value) =>
          $0.RecordChatbotFeedbackResponse.fromBuffer(value));
  static final _$getRecommendationProfileStatus = $grpc.ClientMethod<
          $0.GetRecommendationProfileStatusRequest,
          $0.GetRecommendationProfileStatusResponse>(
      '/ontheblock.appgateway.v1.AppGatewayService/GetRecommendationProfileStatus',
      ($0.GetRecommendationProfileStatusRequest value) => value.writeToBuffer(),
      ($core.List<$core.int> value) =>
          $0.GetRecommendationProfileStatusResponse.fromBuffer(value));
  static final _$getBeverageRecommendations = $grpc.ClientMethod<
          $0.GetBeverageRecommendationsRequest,
          $0.GetBeverageRecommendationsResponse>(
      '/ontheblock.appgateway.v1.AppGatewayService/GetBeverageRecommendations',
      ($0.GetBeverageRecommendationsRequest value) => value.writeToBuffer(),
      ($core.List<$core.int> value) =>
          $0.GetBeverageRecommendationsResponse.fromBuffer(value));
  static final _$getVenueRecommendations = $grpc.ClientMethod<
          $0.GetVenueRecommendationsRequest,
          $0.GetVenueRecommendationsResponse>(
      '/ontheblock.appgateway.v1.AppGatewayService/GetVenueRecommendations',
      ($0.GetVenueRecommendationsRequest value) => value.writeToBuffer(),
      ($core.List<$core.int> value) =>
          $0.GetVenueRecommendationsResponse.fromBuffer(value));
  static final _$recordRecommendationEvent = $grpc.ClientMethod<
          $0.RecordRecommendationEventRequest,
          $0.RecordRecommendationEventResponse>(
      '/ontheblock.appgateway.v1.AppGatewayService/RecordRecommendationEvent',
      ($0.RecordRecommendationEventRequest value) => value.writeToBuffer(),
      ($core.List<$core.int> value) =>
          $0.RecordRecommendationEventResponse.fromBuffer(value));

  AppGatewayServiceClient($grpc.ClientChannel channel,
      {$grpc.CallOptions? options,
      $core.Iterable<$grpc.ClientInterceptor>? interceptors})
      : super(channel, options: options, interceptors: interceptors);

  $grpc.ResponseFuture<$0.GetMeResponse> getMe($0.GetMeRequest request,
      {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$getMe, request, options: options);
  }

  $grpc.ResponseFuture<$0.SendChatbotMessageResponse> sendChatbotMessage(
      $0.SendChatbotMessageRequest request,
      {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$sendChatbotMessage, request, options: options);
  }

  $grpc.ResponseFuture<$0.GetChatbotConversationResponse>
      getChatbotConversation($0.GetChatbotConversationRequest request,
          {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$getChatbotConversation, request,
        options: options);
  }

  $grpc.ResponseFuture<$0.RecordChatbotFeedbackResponse> recordChatbotFeedback(
      $0.RecordChatbotFeedbackRequest request,
      {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$recordChatbotFeedback, request, options: options);
  }

  $grpc.ResponseFuture<$0.GetRecommendationProfileStatusResponse>
      getRecommendationProfileStatus(
          $0.GetRecommendationProfileStatusRequest request,
          {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$getRecommendationProfileStatus, request,
        options: options);
  }

  $grpc.ResponseFuture<$0.GetBeverageRecommendationsResponse>
      getBeverageRecommendations($0.GetBeverageRecommendationsRequest request,
          {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$getBeverageRecommendations, request,
        options: options);
  }

  $grpc.ResponseFuture<$0.GetVenueRecommendationsResponse>
      getVenueRecommendations($0.GetVenueRecommendationsRequest request,
          {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$getVenueRecommendations, request,
        options: options);
  }

  $grpc.ResponseFuture<$0.RecordRecommendationEventResponse>
      recordRecommendationEvent($0.RecordRecommendationEventRequest request,
          {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$recordRecommendationEvent, request,
        options: options);
  }
}

@$pb.GrpcServiceName('ontheblock.appgateway.v1.AppGatewayService')
abstract class AppGatewayServiceBase extends $grpc.Service {
  $core.String get $name => 'ontheblock.appgateway.v1.AppGatewayService';

  AppGatewayServiceBase() {
    $addMethod($grpc.ServiceMethod<$0.GetMeRequest, $0.GetMeResponse>(
        'GetMe',
        getMe_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $0.GetMeRequest.fromBuffer(value),
        ($0.GetMeResponse value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$0.SendChatbotMessageRequest,
            $0.SendChatbotMessageResponse>(
        'SendChatbotMessage',
        sendChatbotMessage_Pre,
        false,
        false,
        ($core.List<$core.int> value) =>
            $0.SendChatbotMessageRequest.fromBuffer(value),
        ($0.SendChatbotMessageResponse value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$0.GetChatbotConversationRequest,
            $0.GetChatbotConversationResponse>(
        'GetChatbotConversation',
        getChatbotConversation_Pre,
        false,
        false,
        ($core.List<$core.int> value) =>
            $0.GetChatbotConversationRequest.fromBuffer(value),
        ($0.GetChatbotConversationResponse value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$0.RecordChatbotFeedbackRequest,
            $0.RecordChatbotFeedbackResponse>(
        'RecordChatbotFeedback',
        recordChatbotFeedback_Pre,
        false,
        false,
        ($core.List<$core.int> value) =>
            $0.RecordChatbotFeedbackRequest.fromBuffer(value),
        ($0.RecordChatbotFeedbackResponse value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$0.GetRecommendationProfileStatusRequest,
            $0.GetRecommendationProfileStatusResponse>(
        'GetRecommendationProfileStatus',
        getRecommendationProfileStatus_Pre,
        false,
        false,
        ($core.List<$core.int> value) =>
            $0.GetRecommendationProfileStatusRequest.fromBuffer(value),
        ($0.GetRecommendationProfileStatusResponse value) =>
            value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$0.GetBeverageRecommendationsRequest,
            $0.GetBeverageRecommendationsResponse>(
        'GetBeverageRecommendations',
        getBeverageRecommendations_Pre,
        false,
        false,
        ($core.List<$core.int> value) =>
            $0.GetBeverageRecommendationsRequest.fromBuffer(value),
        ($0.GetBeverageRecommendationsResponse value) =>
            value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$0.GetVenueRecommendationsRequest,
            $0.GetVenueRecommendationsResponse>(
        'GetVenueRecommendations',
        getVenueRecommendations_Pre,
        false,
        false,
        ($core.List<$core.int> value) =>
            $0.GetVenueRecommendationsRequest.fromBuffer(value),
        ($0.GetVenueRecommendationsResponse value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$0.RecordRecommendationEventRequest,
            $0.RecordRecommendationEventResponse>(
        'RecordRecommendationEvent',
        recordRecommendationEvent_Pre,
        false,
        false,
        ($core.List<$core.int> value) =>
            $0.RecordRecommendationEventRequest.fromBuffer(value),
        ($0.RecordRecommendationEventResponse value) => value.writeToBuffer()));
  }

  $async.Future<$0.GetMeResponse> getMe_Pre(
      $grpc.ServiceCall call, $async.Future<$0.GetMeRequest> request) async {
    return getMe(call, await request);
  }

  $async.Future<$0.SendChatbotMessageResponse> sendChatbotMessage_Pre(
      $grpc.ServiceCall call,
      $async.Future<$0.SendChatbotMessageRequest> request) async {
    return sendChatbotMessage(call, await request);
  }

  $async.Future<$0.GetChatbotConversationResponse> getChatbotConversation_Pre(
      $grpc.ServiceCall call,
      $async.Future<$0.GetChatbotConversationRequest> request) async {
    return getChatbotConversation(call, await request);
  }

  $async.Future<$0.RecordChatbotFeedbackResponse> recordChatbotFeedback_Pre(
      $grpc.ServiceCall call,
      $async.Future<$0.RecordChatbotFeedbackRequest> request) async {
    return recordChatbotFeedback(call, await request);
  }

  $async.Future<$0.GetRecommendationProfileStatusResponse>
      getRecommendationProfileStatus_Pre(
          $grpc.ServiceCall call,
          $async.Future<$0.GetRecommendationProfileStatusRequest>
              request) async {
    return getRecommendationProfileStatus(call, await request);
  }

  $async.Future<$0.GetBeverageRecommendationsResponse>
      getBeverageRecommendations_Pre($grpc.ServiceCall call,
          $async.Future<$0.GetBeverageRecommendationsRequest> request) async {
    return getBeverageRecommendations(call, await request);
  }

  $async.Future<$0.GetVenueRecommendationsResponse> getVenueRecommendations_Pre(
      $grpc.ServiceCall call,
      $async.Future<$0.GetVenueRecommendationsRequest> request) async {
    return getVenueRecommendations(call, await request);
  }

  $async.Future<$0.RecordRecommendationEventResponse>
      recordRecommendationEvent_Pre($grpc.ServiceCall call,
          $async.Future<$0.RecordRecommendationEventRequest> request) async {
    return recordRecommendationEvent(call, await request);
  }

  $async.Future<$0.GetMeResponse> getMe(
      $grpc.ServiceCall call, $0.GetMeRequest request);
  $async.Future<$0.SendChatbotMessageResponse> sendChatbotMessage(
      $grpc.ServiceCall call, $0.SendChatbotMessageRequest request);
  $async.Future<$0.GetChatbotConversationResponse> getChatbotConversation(
      $grpc.ServiceCall call, $0.GetChatbotConversationRequest request);
  $async.Future<$0.RecordChatbotFeedbackResponse> recordChatbotFeedback(
      $grpc.ServiceCall call, $0.RecordChatbotFeedbackRequest request);
  $async.Future<$0.GetRecommendationProfileStatusResponse>
      getRecommendationProfileStatus($grpc.ServiceCall call,
          $0.GetRecommendationProfileStatusRequest request);
  $async.Future<$0.GetBeverageRecommendationsResponse>
      getBeverageRecommendations(
          $grpc.ServiceCall call, $0.GetBeverageRecommendationsRequest request);
  $async.Future<$0.GetVenueRecommendationsResponse> getVenueRecommendations(
      $grpc.ServiceCall call, $0.GetVenueRecommendationsRequest request);
  $async.Future<$0.RecordRecommendationEventResponse> recordRecommendationEvent(
      $grpc.ServiceCall call, $0.RecordRecommendationEventRequest request);
}
