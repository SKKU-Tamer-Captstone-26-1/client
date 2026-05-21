//
//  Generated code. Do not modify.
//  source: survey.proto
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

import 'survey.pb.dart' as $0;

export 'survey.pb.dart';

@$pb.GrpcServiceName('ontheblock.survey.v1.SurveyService')
class SurveyServiceClient extends $grpc.Client {
  static final _$getSurveyQuestions = $grpc.ClientMethod<$0.GetSurveyQuestionsRequest, $0.GetSurveyQuestionsResponse>(
      '/ontheblock.survey.v1.SurveyService/GetSurveyQuestions',
      ($0.GetSurveyQuestionsRequest value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $0.GetSurveyQuestionsResponse.fromBuffer(value));

  SurveyServiceClient($grpc.ClientChannel channel,
      {$grpc.CallOptions? options,
      $core.Iterable<$grpc.ClientInterceptor>? interceptors})
      : super(channel, options: options, interceptors: interceptors);

  $grpc.ResponseFuture<$0.GetSurveyQuestionsResponse> getSurveyQuestions($0.GetSurveyQuestionsRequest request, {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$getSurveyQuestions, request, options: options);
  }
}
