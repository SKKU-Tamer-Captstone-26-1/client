//
//  Generated code. Do not modify.
//  source: auth.proto
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

import 'auth.pb.dart' as $0;

export 'auth.pb.dart';

@$pb.GrpcServiceName('ontheblock.auth.v1.AuthService')
class AuthServiceClient extends $grpc.Client {
  static final _$googleLogin = $grpc.ClientMethod<$0.GoogleLoginRequest, $0.GoogleLoginResponse>(
      '/ontheblock.auth.v1.AuthService/GoogleLogin',
      ($0.GoogleLoginRequest value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $0.GoogleLoginResponse.fromBuffer(value));
  static final _$refreshToken = $grpc.ClientMethod<$0.RefreshTokenRequest, $0.AuthTokenResponse>(
      '/ontheblock.auth.v1.AuthService/RefreshToken',
      ($0.RefreshTokenRequest value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $0.AuthTokenResponse.fromBuffer(value));
  static final _$logout = $grpc.ClientMethod<$0.LogoutRequest, $0.LogoutResponse>(
      '/ontheblock.auth.v1.AuthService/Logout',
      ($0.LogoutRequest value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $0.LogoutResponse.fromBuffer(value));
  static final _$updateSurveyData = $grpc.ClientMethod<$0.UpdateSurveyDataRequest, $0.UpdateSurveyDataResponse>(
      '/ontheblock.auth.v1.AuthService/UpdateSurveyData',
      ($0.UpdateSurveyDataRequest value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $0.UpdateSurveyDataResponse.fromBuffer(value));
  static final _$updateProfile = $grpc.ClientMethod<$0.UpdateProfileRequest, $0.UpdateProfileResponse>(
      '/ontheblock.auth.v1.AuthService/UpdateProfile',
      ($0.UpdateProfileRequest value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $0.UpdateProfileResponse.fromBuffer(value));

  AuthServiceClient($grpc.ClientChannel channel,
      {$grpc.CallOptions? options,
      $core.Iterable<$grpc.ClientInterceptor>? interceptors})
      : super(channel, options: options, interceptors: interceptors);

  $grpc.ResponseFuture<$0.GoogleLoginResponse> googleLogin($0.GoogleLoginRequest request, {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$googleLogin, request, options: options);
  }

  $grpc.ResponseFuture<$0.AuthTokenResponse> refreshToken($0.RefreshTokenRequest request, {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$refreshToken, request, options: options);
  }

  $grpc.ResponseFuture<$0.LogoutResponse> logout($0.LogoutRequest request, {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$logout, request, options: options);
  }

  $grpc.ResponseFuture<$0.UpdateSurveyDataResponse> updateSurveyData($0.UpdateSurveyDataRequest request, {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$updateSurveyData, request, options: options);
  }

  $grpc.ResponseFuture<$0.UpdateProfileResponse> updateProfile($0.UpdateProfileRequest request, {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$updateProfile, request, options: options);
  }
}
