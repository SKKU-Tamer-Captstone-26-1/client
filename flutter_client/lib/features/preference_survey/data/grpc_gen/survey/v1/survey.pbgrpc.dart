// This is a generated file - do not edit.
//
// Generated from survey/v1/survey.proto.

// @dart = 3.3

// ignore_for_file: annotate_overrides, camel_case_types, comment_references
// ignore_for_file: constant_identifier_names
// ignore_for_file: curly_braces_in_flow_control_structures
// ignore_for_file: deprecated_member_use_from_same_package, library_prefixes
// ignore_for_file: non_constant_identifier_names, prefer_relative_imports

import 'dart:async' as $async;
import 'dart:core' as $core;

import 'package:grpc/service_api.dart' as $grpc;
import 'package:protobuf/protobuf.dart' as $pb;

import 'survey.pb.dart' as $0;

export 'survey.pb.dart';

/// SurveyService stores user survey responses and serves them to other services.
/// survey-service exposes this over gRPC (port 9093) for internal calls.
@$pb.GrpcServiceName('ontheblock.survey.v1.SurveyService')
class SurveyServiceClient extends $grpc.Client {
  /// The hostname for this service.
  static const $core.String defaultHost = '';

  /// OAuth scopes needed for the client.
  static const $core.List<$core.String> oauthScopes = [
    '',
  ];

  SurveyServiceClient(super.channel, {super.options, super.interceptors});

  /// GetSurveyResult returns a single survey result by survey_id.
  /// Called by recommendation-service to build the user's taste profile.
  $grpc.ResponseFuture<$0.GetSurveyResultResponse> getSurveyResult(
    $0.GetSurveyResultRequest request, {
    $grpc.CallOptions? options,
  }) {
    return $createUnaryCall(_$getSurveyResult, request, options: options);
  }

  /// GetSurveyResultByUser returns the latest survey result for a user.
  /// Convenience RPC so callers don't need to track active survey_id separately.
  $grpc.ResponseFuture<$0.GetSurveyResultResponse> getSurveyResultByUser(
    $0.GetSurveyResultByUserRequest request, {
    $grpc.CallOptions? options,
  }) {
    return $createUnaryCall(_$getSurveyResultByUser, request, options: options);
  }

  /// GetSurveyQuestions returns the full question and answer-option catalog.
  /// Called by the client on survey start to render questions dynamically.
  $grpc.ResponseFuture<$0.GetSurveyQuestionsResponse> getSurveyQuestions(
    $0.GetSurveyQuestionsRequest request, {
    $grpc.CallOptions? options,
  }) {
    return $createUnaryCall(_$getSurveyQuestions, request, options: options);
  }

  /// SubmitSurvey saves the user's completed survey answers.
  /// Called by the client when the user finishes the survey flow.
  $grpc.ResponseFuture<$0.SubmitSurveyResponse> submitSurvey(
    $0.SubmitSurveyRequest request, {
    $grpc.CallOptions? options,
  }) {
    return $createUnaryCall(_$submitSurvey, request, options: options);
  }

  // method descriptors

  static final _$getSurveyResult =
      $grpc.ClientMethod<$0.GetSurveyResultRequest, $0.GetSurveyResultResponse>(
          '/ontheblock.survey.v1.SurveyService/GetSurveyResult',
          ($0.GetSurveyResultRequest value) => value.writeToBuffer(),
          $0.GetSurveyResultResponse.fromBuffer);
  static final _$getSurveyResultByUser = $grpc.ClientMethod<
          $0.GetSurveyResultByUserRequest, $0.GetSurveyResultResponse>(
      '/ontheblock.survey.v1.SurveyService/GetSurveyResultByUser',
      ($0.GetSurveyResultByUserRequest value) => value.writeToBuffer(),
      $0.GetSurveyResultResponse.fromBuffer);
  static final _$getSurveyQuestions = $grpc.ClientMethod<
          $0.GetSurveyQuestionsRequest, $0.GetSurveyQuestionsResponse>(
      '/ontheblock.survey.v1.SurveyService/GetSurveyQuestions',
      ($0.GetSurveyQuestionsRequest value) => value.writeToBuffer(),
      $0.GetSurveyQuestionsResponse.fromBuffer);
  static final _$submitSurvey =
      $grpc.ClientMethod<$0.SubmitSurveyRequest, $0.SubmitSurveyResponse>(
          '/ontheblock.survey.v1.SurveyService/SubmitSurvey',
          ($0.SubmitSurveyRequest value) => value.writeToBuffer(),
          $0.SubmitSurveyResponse.fromBuffer);
}

@$pb.GrpcServiceName('ontheblock.survey.v1.SurveyService')
abstract class SurveyServiceBase extends $grpc.Service {
  $core.String get $name => 'ontheblock.survey.v1.SurveyService';

  SurveyServiceBase() {
    $addMethod($grpc.ServiceMethod<$0.GetSurveyResultRequest,
            $0.GetSurveyResultResponse>(
        'GetSurveyResult',
        getSurveyResult_Pre,
        false,
        false,
        ($core.List<$core.int> value) =>
            $0.GetSurveyResultRequest.fromBuffer(value),
        ($0.GetSurveyResultResponse value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$0.GetSurveyResultByUserRequest,
            $0.GetSurveyResultResponse>(
        'GetSurveyResultByUser',
        getSurveyResultByUser_Pre,
        false,
        false,
        ($core.List<$core.int> value) =>
            $0.GetSurveyResultByUserRequest.fromBuffer(value),
        ($0.GetSurveyResultResponse value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$0.GetSurveyQuestionsRequest,
            $0.GetSurveyQuestionsResponse>(
        'GetSurveyQuestions',
        getSurveyQuestions_Pre,
        false,
        false,
        ($core.List<$core.int> value) =>
            $0.GetSurveyQuestionsRequest.fromBuffer(value),
        ($0.GetSurveyQuestionsResponse value) => value.writeToBuffer()));
    $addMethod(
        $grpc.ServiceMethod<$0.SubmitSurveyRequest, $0.SubmitSurveyResponse>(
            'SubmitSurvey',
            submitSurvey_Pre,
            false,
            false,
            ($core.List<$core.int> value) =>
                $0.SubmitSurveyRequest.fromBuffer(value),
            ($0.SubmitSurveyResponse value) => value.writeToBuffer()));
  }

  $async.Future<$0.GetSurveyResultResponse> getSurveyResult_Pre(
      $grpc.ServiceCall $call,
      $async.Future<$0.GetSurveyResultRequest> $request) async {
    return getSurveyResult($call, await $request);
  }

  $async.Future<$0.GetSurveyResultResponse> getSurveyResult(
      $grpc.ServiceCall call, $0.GetSurveyResultRequest request);

  $async.Future<$0.GetSurveyResultResponse> getSurveyResultByUser_Pre(
      $grpc.ServiceCall $call,
      $async.Future<$0.GetSurveyResultByUserRequest> $request) async {
    return getSurveyResultByUser($call, await $request);
  }

  $async.Future<$0.GetSurveyResultResponse> getSurveyResultByUser(
      $grpc.ServiceCall call, $0.GetSurveyResultByUserRequest request);

  $async.Future<$0.GetSurveyQuestionsResponse> getSurveyQuestions_Pre(
      $grpc.ServiceCall $call,
      $async.Future<$0.GetSurveyQuestionsRequest> $request) async {
    return getSurveyQuestions($call, await $request);
  }

  $async.Future<$0.GetSurveyQuestionsResponse> getSurveyQuestions(
      $grpc.ServiceCall call, $0.GetSurveyQuestionsRequest request);

  $async.Future<$0.SubmitSurveyResponse> submitSurvey_Pre(
      $grpc.ServiceCall $call,
      $async.Future<$0.SubmitSurveyRequest> $request) async {
    return submitSurvey($call, await $request);
  }

  $async.Future<$0.SubmitSurveyResponse> submitSurvey(
      $grpc.ServiceCall call, $0.SubmitSurveyRequest request);
}
