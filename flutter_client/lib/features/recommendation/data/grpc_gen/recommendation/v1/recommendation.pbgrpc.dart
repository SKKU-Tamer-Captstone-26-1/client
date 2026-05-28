//
//  Generated code. Do not modify.
//  source: recommendation/v1/recommendation.proto
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

import 'recommendation.pb.dart' as $0;

export 'recommendation.pb.dart';

@$pb.GrpcServiceName('ontheblock.recommendation.v1.RecommendationService')
class RecommendationServiceClient extends $grpc.Client {
  static final _$getProfileStatus = $grpc.ClientMethod<$0.GetProfileStatusRequest, $0.GetProfileStatusResponse>(
      '/ontheblock.recommendation.v1.RecommendationService/GetProfileStatus',
      ($0.GetProfileStatusRequest value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $0.GetProfileStatusResponse.fromBuffer(value));
  static final _$getBeverageRecommendations = $grpc.ClientMethod<$0.GetBeverageRecommendationsRequest, $0.GetBeverageRecommendationsResponse>(
      '/ontheblock.recommendation.v1.RecommendationService/GetBeverageRecommendations',
      ($0.GetBeverageRecommendationsRequest value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $0.GetBeverageRecommendationsResponse.fromBuffer(value));
  static final _$getVenueRecommendations = $grpc.ClientMethod<$0.GetVenueRecommendationsRequest, $0.GetVenueRecommendationsResponse>(
      '/ontheblock.recommendation.v1.RecommendationService/GetVenueRecommendations',
      ($0.GetVenueRecommendationsRequest value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $0.GetVenueRecommendationsResponse.fromBuffer(value));
  static final _$recordRecommendationEvent = $grpc.ClientMethod<$0.RecordRecommendationEventRequest, $0.RecordRecommendationEventResponse>(
      '/ontheblock.recommendation.v1.RecommendationService/RecordRecommendationEvent',
      ($0.RecordRecommendationEventRequest value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $0.RecordRecommendationEventResponse.fromBuffer(value));

  RecommendationServiceClient($grpc.ClientChannel channel,
      {$grpc.CallOptions? options,
      $core.Iterable<$grpc.ClientInterceptor>? interceptors})
      : super(channel, options: options,
        interceptors: interceptors);

  $grpc.ResponseFuture<$0.GetProfileStatusResponse> getProfileStatus($0.GetProfileStatusRequest request, {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$getProfileStatus, request, options: options);
  }

  $grpc.ResponseFuture<$0.GetBeverageRecommendationsResponse> getBeverageRecommendations($0.GetBeverageRecommendationsRequest request, {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$getBeverageRecommendations, request, options: options);
  }

  $grpc.ResponseFuture<$0.GetVenueRecommendationsResponse> getVenueRecommendations($0.GetVenueRecommendationsRequest request, {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$getVenueRecommendations, request, options: options);
  }

  $grpc.ResponseFuture<$0.RecordRecommendationEventResponse> recordRecommendationEvent($0.RecordRecommendationEventRequest request, {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$recordRecommendationEvent, request, options: options);
  }
}

@$pb.GrpcServiceName('ontheblock.recommendation.v1.RecommendationService')
abstract class RecommendationServiceBase extends $grpc.Service {
  $core.String get $name => 'ontheblock.recommendation.v1.RecommendationService';

  RecommendationServiceBase() {
    $addMethod($grpc.ServiceMethod<$0.GetProfileStatusRequest, $0.GetProfileStatusResponse>(
        'GetProfileStatus',
        getProfileStatus_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $0.GetProfileStatusRequest.fromBuffer(value),
        ($0.GetProfileStatusResponse value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$0.GetBeverageRecommendationsRequest, $0.GetBeverageRecommendationsResponse>(
        'GetBeverageRecommendations',
        getBeverageRecommendations_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $0.GetBeverageRecommendationsRequest.fromBuffer(value),
        ($0.GetBeverageRecommendationsResponse value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$0.GetVenueRecommendationsRequest, $0.GetVenueRecommendationsResponse>(
        'GetVenueRecommendations',
        getVenueRecommendations_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $0.GetVenueRecommendationsRequest.fromBuffer(value),
        ($0.GetVenueRecommendationsResponse value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$0.RecordRecommendationEventRequest, $0.RecordRecommendationEventResponse>(
        'RecordRecommendationEvent',
        recordRecommendationEvent_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $0.RecordRecommendationEventRequest.fromBuffer(value),
        ($0.RecordRecommendationEventResponse value) => value.writeToBuffer()));
  }

  $async.Future<$0.GetProfileStatusResponse> getProfileStatus_Pre($grpc.ServiceCall call, $async.Future<$0.GetProfileStatusRequest> request) async {
    return getProfileStatus(call, await request);
  }

  $async.Future<$0.GetBeverageRecommendationsResponse> getBeverageRecommendations_Pre($grpc.ServiceCall call, $async.Future<$0.GetBeverageRecommendationsRequest> request) async {
    return getBeverageRecommendations(call, await request);
  }

  $async.Future<$0.GetVenueRecommendationsResponse> getVenueRecommendations_Pre($grpc.ServiceCall call, $async.Future<$0.GetVenueRecommendationsRequest> request) async {
    return getVenueRecommendations(call, await request);
  }

  $async.Future<$0.RecordRecommendationEventResponse> recordRecommendationEvent_Pre($grpc.ServiceCall call, $async.Future<$0.RecordRecommendationEventRequest> request) async {
    return recordRecommendationEvent(call, await request);
  }

  $async.Future<$0.GetProfileStatusResponse> getProfileStatus($grpc.ServiceCall call, $0.GetProfileStatusRequest request);
  $async.Future<$0.GetBeverageRecommendationsResponse> getBeverageRecommendations($grpc.ServiceCall call, $0.GetBeverageRecommendationsRequest request);
  $async.Future<$0.GetVenueRecommendationsResponse> getVenueRecommendations($grpc.ServiceCall call, $0.GetVenueRecommendationsRequest request);
  $async.Future<$0.RecordRecommendationEventResponse> recordRecommendationEvent($grpc.ServiceCall call, $0.RecordRecommendationEventRequest request);
}
