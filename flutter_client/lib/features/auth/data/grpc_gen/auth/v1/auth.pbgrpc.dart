//
//  Generated code. Do not modify.
//  source: auth/v1/auth.proto
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
  static final _$credentialLogin = $grpc.ClientMethod<$0.CredentialLoginRequest, $0.CredentialLoginResponse>(
      '/ontheblock.auth.v1.AuthService/CredentialLogin',
      ($0.CredentialLoginRequest value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $0.CredentialLoginResponse.fromBuffer(value));
  static final _$adminCreateUser = $grpc.ClientMethod<$0.AdminCreateUserRequest, $0.AdminCreateUserResponse>(
      '/ontheblock.auth.v1.AuthService/AdminCreateUser',
      ($0.AdminCreateUserRequest value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $0.AdminCreateUserResponse.fromBuffer(value));
  static final _$adminUpdateUser = $grpc.ClientMethod<$0.AdminUpdateUserRequest, $0.AdminUpdateUserResponse>(
      '/ontheblock.auth.v1.AuthService/AdminUpdateUser',
      ($0.AdminUpdateUserRequest value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $0.AdminUpdateUserResponse.fromBuffer(value));
  static final _$adminDeleteUser = $grpc.ClientMethod<$0.AdminDeleteUserRequest, $0.AdminDeleteUserResponse>(
      '/ontheblock.auth.v1.AuthService/AdminDeleteUser',
      ($0.AdminDeleteUserRequest value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $0.AdminDeleteUserResponse.fromBuffer(value));
  static final _$adminListUsers = $grpc.ClientMethod<$0.AdminListUsersRequest, $0.AdminListUsersResponse>(
      '/ontheblock.auth.v1.AuthService/AdminListUsers',
      ($0.AdminListUsersRequest value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $0.AdminListUsersResponse.fromBuffer(value));
  static final _$adminGetUser = $grpc.ClientMethod<$0.AdminGetUserRequest, $0.AdminGetUserResponse>(
      '/ontheblock.auth.v1.AuthService/AdminGetUser',
      ($0.AdminGetUserRequest value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $0.AdminGetUserResponse.fromBuffer(value));
  static final _$refreshToken = $grpc.ClientMethod<$0.RefreshTokenRequest, $0.RefreshTokenResponse>(
      '/ontheblock.auth.v1.AuthService/RefreshToken',
      ($0.RefreshTokenRequest value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $0.RefreshTokenResponse.fromBuffer(value));
  static final _$getMe = $grpc.ClientMethod<$0.GetMeRequest, $0.GetMeResponse>(
      '/ontheblock.auth.v1.AuthService/GetMe',
      ($0.GetMeRequest value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $0.GetMeResponse.fromBuffer(value));
  static final _$getUser = $grpc.ClientMethod<$0.GetUserRequest, $0.GetUserResponse>(
      '/ontheblock.auth.v1.AuthService/GetUser',
      ($0.GetUserRequest value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $0.GetUserResponse.fromBuffer(value));
  static final _$logout = $grpc.ClientMethod<$0.LogoutRequest, $0.LogoutResponse>(
      '/ontheblock.auth.v1.AuthService/Logout',
      ($0.LogoutRequest value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $0.LogoutResponse.fromBuffer(value));
  static final _$validateToken = $grpc.ClientMethod<$0.ValidateTokenRequest, $0.ValidateTokenResponse>(
      '/ontheblock.auth.v1.AuthService/ValidateToken',
      ($0.ValidateTokenRequest value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $0.ValidateTokenResponse.fromBuffer(value));
  static final _$updateSurveyData = $grpc.ClientMethod<$0.UpdateSurveyDataRequest, $0.UpdateSurveyDataResponse>(
      '/ontheblock.auth.v1.AuthService/UpdateSurveyData',
      ($0.UpdateSurveyDataRequest value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $0.UpdateSurveyDataResponse.fromBuffer(value));
  static final _$updateProfile = $grpc.ClientMethod<$0.UpdateProfileRequest, $0.UpdateProfileResponse>(
      '/ontheblock.auth.v1.AuthService/UpdateProfile',
      ($0.UpdateProfileRequest value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $0.UpdateProfileResponse.fromBuffer(value));
  static final _$generateProfileUploadUrl = $grpc.ClientMethod<$0.GenerateProfileUploadUrlRequest, $0.GenerateProfileUploadUrlResponse>(
      '/ontheblock.auth.v1.AuthService/GenerateProfileUploadUrl',
      ($0.GenerateProfileUploadUrlRequest value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $0.GenerateProfileUploadUrlResponse.fromBuffer(value));
  static final _$updateNeighborhood = $grpc.ClientMethod<$0.UpdateNeighborhoodRequest, $0.UpdateNeighborhoodResponse>(
      '/ontheblock.auth.v1.AuthService/UpdateNeighborhood',
      ($0.UpdateNeighborhoodRequest value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $0.UpdateNeighborhoodResponse.fromBuffer(value));
  static final _$completeOnboarding = $grpc.ClientMethod<$0.CompleteOnboardingRequest, $0.CompleteOnboardingResponse>(
      '/ontheblock.auth.v1.AuthService/CompleteOnboarding',
      ($0.CompleteOnboardingRequest value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $0.CompleteOnboardingResponse.fromBuffer(value));
  static final _$rotateKeys = $grpc.ClientMethod<$0.RotateKeysRequest, $0.RotateKeysResponse>(
      '/ontheblock.auth.v1.AuthService/RotateKeys',
      ($0.RotateKeysRequest value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $0.RotateKeysResponse.fromBuffer(value));
  static final _$getPublicKeys = $grpc.ClientMethod<$0.GetPublicKeysRequest, $0.GetPublicKeysResponse>(
      '/ontheblock.auth.v1.AuthService/GetPublicKeys',
      ($0.GetPublicKeysRequest value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $0.GetPublicKeysResponse.fromBuffer(value));
  static final _$issueDebugToken = $grpc.ClientMethod<$0.IssueDebugTokenRequest, $0.IssueDebugTokenResponse>(
      '/ontheblock.auth.v1.AuthService/IssueDebugToken',
      ($0.IssueDebugTokenRequest value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $0.IssueDebugTokenResponse.fromBuffer(value));

  AuthServiceClient($grpc.ClientChannel channel,
      {$grpc.CallOptions? options,
      $core.Iterable<$grpc.ClientInterceptor>? interceptors})
      : super(channel, options: options,
        interceptors: interceptors);

  $grpc.ResponseFuture<$0.GoogleLoginResponse> googleLogin($0.GoogleLoginRequest request, {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$googleLogin, request, options: options);
  }

  $grpc.ResponseFuture<$0.CredentialLoginResponse> credentialLogin($0.CredentialLoginRequest request, {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$credentialLogin, request, options: options);
  }

  $grpc.ResponseFuture<$0.AdminCreateUserResponse> adminCreateUser($0.AdminCreateUserRequest request, {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$adminCreateUser, request, options: options);
  }

  $grpc.ResponseFuture<$0.AdminUpdateUserResponse> adminUpdateUser($0.AdminUpdateUserRequest request, {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$adminUpdateUser, request, options: options);
  }

  $grpc.ResponseFuture<$0.AdminDeleteUserResponse> adminDeleteUser($0.AdminDeleteUserRequest request, {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$adminDeleteUser, request, options: options);
  }

  $grpc.ResponseFuture<$0.AdminListUsersResponse> adminListUsers($0.AdminListUsersRequest request, {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$adminListUsers, request, options: options);
  }

  $grpc.ResponseFuture<$0.AdminGetUserResponse> adminGetUser($0.AdminGetUserRequest request, {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$adminGetUser, request, options: options);
  }

  $grpc.ResponseFuture<$0.RefreshTokenResponse> refreshToken($0.RefreshTokenRequest request, {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$refreshToken, request, options: options);
  }

  $grpc.ResponseFuture<$0.GetMeResponse> getMe($0.GetMeRequest request, {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$getMe, request, options: options);
  }

  $grpc.ResponseFuture<$0.GetUserResponse> getUser($0.GetUserRequest request, {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$getUser, request, options: options);
  }

  $grpc.ResponseFuture<$0.LogoutResponse> logout($0.LogoutRequest request, {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$logout, request, options: options);
  }

  $grpc.ResponseFuture<$0.ValidateTokenResponse> validateToken($0.ValidateTokenRequest request, {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$validateToken, request, options: options);
  }

  $grpc.ResponseFuture<$0.UpdateSurveyDataResponse> updateSurveyData($0.UpdateSurveyDataRequest request, {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$updateSurveyData, request, options: options);
  }

  $grpc.ResponseFuture<$0.UpdateProfileResponse> updateProfile($0.UpdateProfileRequest request, {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$updateProfile, request, options: options);
  }

  $grpc.ResponseFuture<$0.GenerateProfileUploadUrlResponse> generateProfileUploadUrl($0.GenerateProfileUploadUrlRequest request, {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$generateProfileUploadUrl, request, options: options);
  }

  $grpc.ResponseFuture<$0.UpdateNeighborhoodResponse> updateNeighborhood($0.UpdateNeighborhoodRequest request, {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$updateNeighborhood, request, options: options);
  }

  $grpc.ResponseFuture<$0.CompleteOnboardingResponse> completeOnboarding($0.CompleteOnboardingRequest request, {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$completeOnboarding, request, options: options);
  }

  $grpc.ResponseFuture<$0.RotateKeysResponse> rotateKeys($0.RotateKeysRequest request, {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$rotateKeys, request, options: options);
  }

  $grpc.ResponseFuture<$0.GetPublicKeysResponse> getPublicKeys($0.GetPublicKeysRequest request, {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$getPublicKeys, request, options: options);
  }

  $grpc.ResponseFuture<$0.IssueDebugTokenResponse> issueDebugToken($0.IssueDebugTokenRequest request, {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$issueDebugToken, request, options: options);
  }
}

@$pb.GrpcServiceName('ontheblock.auth.v1.AuthService')
abstract class AuthServiceBase extends $grpc.Service {
  $core.String get $name => 'ontheblock.auth.v1.AuthService';

  AuthServiceBase() {
    $addMethod($grpc.ServiceMethod<$0.GoogleLoginRequest, $0.GoogleLoginResponse>(
        'GoogleLogin',
        googleLogin_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $0.GoogleLoginRequest.fromBuffer(value),
        ($0.GoogleLoginResponse value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$0.CredentialLoginRequest, $0.CredentialLoginResponse>(
        'CredentialLogin',
        credentialLogin_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $0.CredentialLoginRequest.fromBuffer(value),
        ($0.CredentialLoginResponse value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$0.AdminCreateUserRequest, $0.AdminCreateUserResponse>(
        'AdminCreateUser',
        adminCreateUser_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $0.AdminCreateUserRequest.fromBuffer(value),
        ($0.AdminCreateUserResponse value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$0.AdminUpdateUserRequest, $0.AdminUpdateUserResponse>(
        'AdminUpdateUser',
        adminUpdateUser_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $0.AdminUpdateUserRequest.fromBuffer(value),
        ($0.AdminUpdateUserResponse value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$0.AdminDeleteUserRequest, $0.AdminDeleteUserResponse>(
        'AdminDeleteUser',
        adminDeleteUser_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $0.AdminDeleteUserRequest.fromBuffer(value),
        ($0.AdminDeleteUserResponse value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$0.AdminListUsersRequest, $0.AdminListUsersResponse>(
        'AdminListUsers',
        adminListUsers_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $0.AdminListUsersRequest.fromBuffer(value),
        ($0.AdminListUsersResponse value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$0.AdminGetUserRequest, $0.AdminGetUserResponse>(
        'AdminGetUser',
        adminGetUser_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $0.AdminGetUserRequest.fromBuffer(value),
        ($0.AdminGetUserResponse value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$0.RefreshTokenRequest, $0.RefreshTokenResponse>(
        'RefreshToken',
        refreshToken_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $0.RefreshTokenRequest.fromBuffer(value),
        ($0.RefreshTokenResponse value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$0.GetMeRequest, $0.GetMeResponse>(
        'GetMe',
        getMe_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $0.GetMeRequest.fromBuffer(value),
        ($0.GetMeResponse value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$0.GetUserRequest, $0.GetUserResponse>(
        'GetUser',
        getUser_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $0.GetUserRequest.fromBuffer(value),
        ($0.GetUserResponse value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$0.LogoutRequest, $0.LogoutResponse>(
        'Logout',
        logout_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $0.LogoutRequest.fromBuffer(value),
        ($0.LogoutResponse value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$0.ValidateTokenRequest, $0.ValidateTokenResponse>(
        'ValidateToken',
        validateToken_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $0.ValidateTokenRequest.fromBuffer(value),
        ($0.ValidateTokenResponse value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$0.UpdateSurveyDataRequest, $0.UpdateSurveyDataResponse>(
        'UpdateSurveyData',
        updateSurveyData_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $0.UpdateSurveyDataRequest.fromBuffer(value),
        ($0.UpdateSurveyDataResponse value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$0.UpdateProfileRequest, $0.UpdateProfileResponse>(
        'UpdateProfile',
        updateProfile_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $0.UpdateProfileRequest.fromBuffer(value),
        ($0.UpdateProfileResponse value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$0.GenerateProfileUploadUrlRequest, $0.GenerateProfileUploadUrlResponse>(
        'GenerateProfileUploadUrl',
        generateProfileUploadUrl_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $0.GenerateProfileUploadUrlRequest.fromBuffer(value),
        ($0.GenerateProfileUploadUrlResponse value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$0.UpdateNeighborhoodRequest, $0.UpdateNeighborhoodResponse>(
        'UpdateNeighborhood',
        updateNeighborhood_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $0.UpdateNeighborhoodRequest.fromBuffer(value),
        ($0.UpdateNeighborhoodResponse value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$0.CompleteOnboardingRequest, $0.CompleteOnboardingResponse>(
        'CompleteOnboarding',
        completeOnboarding_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $0.CompleteOnboardingRequest.fromBuffer(value),
        ($0.CompleteOnboardingResponse value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$0.RotateKeysRequest, $0.RotateKeysResponse>(
        'RotateKeys',
        rotateKeys_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $0.RotateKeysRequest.fromBuffer(value),
        ($0.RotateKeysResponse value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$0.GetPublicKeysRequest, $0.GetPublicKeysResponse>(
        'GetPublicKeys',
        getPublicKeys_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $0.GetPublicKeysRequest.fromBuffer(value),
        ($0.GetPublicKeysResponse value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$0.IssueDebugTokenRequest, $0.IssueDebugTokenResponse>(
        'IssueDebugToken',
        issueDebugToken_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $0.IssueDebugTokenRequest.fromBuffer(value),
        ($0.IssueDebugTokenResponse value) => value.writeToBuffer()));
  }

  $async.Future<$0.GoogleLoginResponse> googleLogin_Pre($grpc.ServiceCall call, $async.Future<$0.GoogleLoginRequest> request) async {
    return googleLogin(call, await request);
  }

  $async.Future<$0.CredentialLoginResponse> credentialLogin_Pre($grpc.ServiceCall call, $async.Future<$0.CredentialLoginRequest> request) async {
    return credentialLogin(call, await request);
  }

  $async.Future<$0.AdminCreateUserResponse> adminCreateUser_Pre($grpc.ServiceCall call, $async.Future<$0.AdminCreateUserRequest> request) async {
    return adminCreateUser(call, await request);
  }

  $async.Future<$0.AdminUpdateUserResponse> adminUpdateUser_Pre($grpc.ServiceCall call, $async.Future<$0.AdminUpdateUserRequest> request) async {
    return adminUpdateUser(call, await request);
  }

  $async.Future<$0.AdminDeleteUserResponse> adminDeleteUser_Pre($grpc.ServiceCall call, $async.Future<$0.AdminDeleteUserRequest> request) async {
    return adminDeleteUser(call, await request);
  }

  $async.Future<$0.AdminListUsersResponse> adminListUsers_Pre($grpc.ServiceCall call, $async.Future<$0.AdminListUsersRequest> request) async {
    return adminListUsers(call, await request);
  }

  $async.Future<$0.AdminGetUserResponse> adminGetUser_Pre($grpc.ServiceCall call, $async.Future<$0.AdminGetUserRequest> request) async {
    return adminGetUser(call, await request);
  }

  $async.Future<$0.RefreshTokenResponse> refreshToken_Pre($grpc.ServiceCall call, $async.Future<$0.RefreshTokenRequest> request) async {
    return refreshToken(call, await request);
  }

  $async.Future<$0.GetMeResponse> getMe_Pre($grpc.ServiceCall call, $async.Future<$0.GetMeRequest> request) async {
    return getMe(call, await request);
  }

  $async.Future<$0.GetUserResponse> getUser_Pre($grpc.ServiceCall call, $async.Future<$0.GetUserRequest> request) async {
    return getUser(call, await request);
  }

  $async.Future<$0.LogoutResponse> logout_Pre($grpc.ServiceCall call, $async.Future<$0.LogoutRequest> request) async {
    return logout(call, await request);
  }

  $async.Future<$0.ValidateTokenResponse> validateToken_Pre($grpc.ServiceCall call, $async.Future<$0.ValidateTokenRequest> request) async {
    return validateToken(call, await request);
  }

  $async.Future<$0.UpdateSurveyDataResponse> updateSurveyData_Pre($grpc.ServiceCall call, $async.Future<$0.UpdateSurveyDataRequest> request) async {
    return updateSurveyData(call, await request);
  }

  $async.Future<$0.UpdateProfileResponse> updateProfile_Pre($grpc.ServiceCall call, $async.Future<$0.UpdateProfileRequest> request) async {
    return updateProfile(call, await request);
  }

  $async.Future<$0.GenerateProfileUploadUrlResponse> generateProfileUploadUrl_Pre($grpc.ServiceCall call, $async.Future<$0.GenerateProfileUploadUrlRequest> request) async {
    return generateProfileUploadUrl(call, await request);
  }

  $async.Future<$0.UpdateNeighborhoodResponse> updateNeighborhood_Pre($grpc.ServiceCall call, $async.Future<$0.UpdateNeighborhoodRequest> request) async {
    return updateNeighborhood(call, await request);
  }

  $async.Future<$0.CompleteOnboardingResponse> completeOnboarding_Pre($grpc.ServiceCall call, $async.Future<$0.CompleteOnboardingRequest> request) async {
    return completeOnboarding(call, await request);
  }

  $async.Future<$0.RotateKeysResponse> rotateKeys_Pre($grpc.ServiceCall call, $async.Future<$0.RotateKeysRequest> request) async {
    return rotateKeys(call, await request);
  }

  $async.Future<$0.GetPublicKeysResponse> getPublicKeys_Pre($grpc.ServiceCall call, $async.Future<$0.GetPublicKeysRequest> request) async {
    return getPublicKeys(call, await request);
  }

  $async.Future<$0.IssueDebugTokenResponse> issueDebugToken_Pre($grpc.ServiceCall call, $async.Future<$0.IssueDebugTokenRequest> request) async {
    return issueDebugToken(call, await request);
  }

  $async.Future<$0.GoogleLoginResponse> googleLogin($grpc.ServiceCall call, $0.GoogleLoginRequest request);
  $async.Future<$0.CredentialLoginResponse> credentialLogin($grpc.ServiceCall call, $0.CredentialLoginRequest request);
  $async.Future<$0.AdminCreateUserResponse> adminCreateUser($grpc.ServiceCall call, $0.AdminCreateUserRequest request);
  $async.Future<$0.AdminUpdateUserResponse> adminUpdateUser($grpc.ServiceCall call, $0.AdminUpdateUserRequest request);
  $async.Future<$0.AdminDeleteUserResponse> adminDeleteUser($grpc.ServiceCall call, $0.AdminDeleteUserRequest request);
  $async.Future<$0.AdminListUsersResponse> adminListUsers($grpc.ServiceCall call, $0.AdminListUsersRequest request);
  $async.Future<$0.AdminGetUserResponse> adminGetUser($grpc.ServiceCall call, $0.AdminGetUserRequest request);
  $async.Future<$0.RefreshTokenResponse> refreshToken($grpc.ServiceCall call, $0.RefreshTokenRequest request);
  $async.Future<$0.GetMeResponse> getMe($grpc.ServiceCall call, $0.GetMeRequest request);
  $async.Future<$0.GetUserResponse> getUser($grpc.ServiceCall call, $0.GetUserRequest request);
  $async.Future<$0.LogoutResponse> logout($grpc.ServiceCall call, $0.LogoutRequest request);
  $async.Future<$0.ValidateTokenResponse> validateToken($grpc.ServiceCall call, $0.ValidateTokenRequest request);
  $async.Future<$0.UpdateSurveyDataResponse> updateSurveyData($grpc.ServiceCall call, $0.UpdateSurveyDataRequest request);
  $async.Future<$0.UpdateProfileResponse> updateProfile($grpc.ServiceCall call, $0.UpdateProfileRequest request);
  $async.Future<$0.GenerateProfileUploadUrlResponse> generateProfileUploadUrl($grpc.ServiceCall call, $0.GenerateProfileUploadUrlRequest request);
  $async.Future<$0.UpdateNeighborhoodResponse> updateNeighborhood($grpc.ServiceCall call, $0.UpdateNeighborhoodRequest request);
  $async.Future<$0.CompleteOnboardingResponse> completeOnboarding($grpc.ServiceCall call, $0.CompleteOnboardingRequest request);
  $async.Future<$0.RotateKeysResponse> rotateKeys($grpc.ServiceCall call, $0.RotateKeysRequest request);
  $async.Future<$0.GetPublicKeysResponse> getPublicKeys($grpc.ServiceCall call, $0.GetPublicKeysRequest request);
  $async.Future<$0.IssueDebugTokenResponse> issueDebugToken($grpc.ServiceCall call, $0.IssueDebugTokenRequest request);
}
