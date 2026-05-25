//
//  Generated code. Do not modify.
//  source: auth.proto
//
// @dart = 2.12

// ignore_for_file: annotate_overrides, camel_case_types, comment_references
// ignore_for_file: constant_identifier_names, library_prefixes
// ignore_for_file: non_constant_identifier_names, prefer_final_fields
// ignore_for_file: unnecessary_import, unnecessary_this, unused_import

import 'dart:core' as $core;

import 'package:protobuf/protobuf.dart' as $pb;

import '../../google/protobuf/timestamp.pb.dart' as $1;
import 'auth.pbenum.dart';

export 'auth.pbenum.dart';

class GoogleLoginRequest extends $pb.GeneratedMessage {
  factory GoogleLoginRequest({
    $core.String? idToken,
  }) {
    final $result = create();
    if (idToken != null) {
      $result.idToken = idToken;
    }
    return $result;
  }
  GoogleLoginRequest._() : super();
  factory GoogleLoginRequest.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory GoogleLoginRequest.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'GoogleLoginRequest', package: const $pb.PackageName(_omitMessageNames ? '' : 'ontheblock.auth.v1'), createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'idToken')
    ..hasRequiredFields = false
  ;

  @$core.Deprecated('Using this can add significant overhead to your binary. Use [GeneratedMessageGenericExtensions.deepCopy] instead. Will be removed in next major version')
  GoogleLoginRequest clone() => GoogleLoginRequest()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. Use [GeneratedMessageGenericExtensions.rebuild] instead. Will be removed in next major version')
  GoogleLoginRequest copyWith(void Function(GoogleLoginRequest) updates) => super.copyWith((message) => updates(message as GoogleLoginRequest)) as GoogleLoginRequest;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static GoogleLoginRequest create() => GoogleLoginRequest._();
  GoogleLoginRequest createEmptyInstance() => create();
  static $pb.PbList<GoogleLoginRequest> createRepeated() => $pb.PbList<GoogleLoginRequest>();
  @$core.pragma('dart2js:noInline')
  static GoogleLoginRequest getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<GoogleLoginRequest>(create);
  static GoogleLoginRequest? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get idToken => $_getSZ(0);
  @$pb.TagNumber(1)
  set idToken($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasIdToken() => $_has(0);
  @$pb.TagNumber(1)
  void clearIdToken() => clearField(1);
}

class UserResponse extends $pb.GeneratedMessage {
  factory UserResponse({
    $core.String? userId,
    $core.String? email,
    $core.String? nickname,
    $core.String? profileImageUrl,
    Role? role,
    $1.Timestamp? createdAt,
    $core.String? neighborhood,
    $core.int? alcoholScore,
    $core.int? points,
    $core.String? surveyId,
    $core.bool? onboardingCompleted,
  }) {
    final $result = create();
    if (userId != null) $result.userId = userId;
    if (email != null) $result.email = email;
    if (nickname != null) $result.nickname = nickname;
    if (profileImageUrl != null) $result.profileImageUrl = profileImageUrl;
    if (role != null) $result.role = role;
    if (createdAt != null) $result.createdAt = createdAt;
    if (neighborhood != null) $result.neighborhood = neighborhood;
    if (alcoholScore != null) $result.alcoholScore = alcoholScore;
    if (points != null) $result.points = points;
    if (surveyId != null) $result.surveyId = surveyId;
    if (onboardingCompleted != null) $result.onboardingCompleted = onboardingCompleted;
    return $result;
  }
  UserResponse._() : super();
  factory UserResponse.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory UserResponse.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'UserResponse', package: const $pb.PackageName(_omitMessageNames ? '' : 'ontheblock.auth.v1'), createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'userId')
    ..aOS(2, _omitFieldNames ? '' : 'email')
    ..aOS(3, _omitFieldNames ? '' : 'nickname')
    ..aOS(4, _omitFieldNames ? '' : 'profileImageUrl')
    ..e<Role>(5, _omitFieldNames ? '' : 'role', $pb.PbFieldType.OE, defaultOrMaker: Role.ROLE_UNSPECIFIED, valueOf: Role.valueOf, enumValues: Role.values)
    ..aOM<$1.Timestamp>(6, _omitFieldNames ? '' : 'createdAt', subBuilder: $1.Timestamp.create)
    ..aOS(7, _omitFieldNames ? '' : 'neighborhood')
    ..a<$core.int>(8, _omitFieldNames ? '' : 'alcoholScore', $pb.PbFieldType.O3)
    ..a<$core.int>(9, _omitFieldNames ? '' : 'points', $pb.PbFieldType.O3)
    ..aOS(11, _omitFieldNames ? '' : 'surveyId')
    ..aOB(12, _omitFieldNames ? '' : 'onboardingCompleted')
    ..hasRequiredFields = false
  ;

  @$core.Deprecated('Using this can add significant overhead to your binary. Use [GeneratedMessageGenericExtensions.deepCopy] instead. Will be removed in next major version')
  UserResponse clone() => UserResponse()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. Use [GeneratedMessageGenericExtensions.rebuild] instead. Will be removed in next major version')
  UserResponse copyWith(void Function(UserResponse) updates) => super.copyWith((message) => updates(message as UserResponse)) as UserResponse;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static UserResponse create() => UserResponse._();
  UserResponse createEmptyInstance() => create();
  static $pb.PbList<UserResponse> createRepeated() => $pb.PbList<UserResponse>();
  @$core.pragma('dart2js:noInline')
  static UserResponse getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<UserResponse>(create);
  static UserResponse? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get userId => $_getSZ(0);
  @$pb.TagNumber(1)
  set userId($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasUserId() => $_has(0);
  @$pb.TagNumber(1)
  void clearUserId() => clearField(1);

  @$pb.TagNumber(2)
  $core.String get email => $_getSZ(1);
  @$pb.TagNumber(2)
  set email($core.String v) { $_setString(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasEmail() => $_has(1);
  @$pb.TagNumber(2)
  void clearEmail() => clearField(2);

  @$pb.TagNumber(3)
  $core.String get nickname => $_getSZ(2);
  @$pb.TagNumber(3)
  set nickname($core.String v) { $_setString(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasNickname() => $_has(2);
  @$pb.TagNumber(3)
  void clearNickname() => clearField(3);

  @$pb.TagNumber(4)
  $core.String get profileImageUrl => $_getSZ(3);
  @$pb.TagNumber(4)
  set profileImageUrl($core.String v) { $_setString(3, v); }
  @$pb.TagNumber(4)
  $core.bool hasProfileImageUrl() => $_has(3);
  @$pb.TagNumber(4)
  void clearProfileImageUrl() => clearField(4);

  @$pb.TagNumber(5)
  Role get role => $_getN(4);
  @$pb.TagNumber(5)
  set role(Role v) { setField(5, v); }
  @$pb.TagNumber(5)
  $core.bool hasRole() => $_has(4);
  @$pb.TagNumber(5)
  void clearRole() => clearField(5);

  @$pb.TagNumber(6)
  $1.Timestamp get createdAt => $_getN(5);
  @$pb.TagNumber(6)
  set createdAt($1.Timestamp v) { setField(6, v); }
  @$pb.TagNumber(6)
  $core.bool hasCreatedAt() => $_has(5);
  @$pb.TagNumber(6)
  void clearCreatedAt() => clearField(6);
  @$pb.TagNumber(6)
  $1.Timestamp ensureCreatedAt() => $_ensure(5);

  @$pb.TagNumber(7)
  $core.String get neighborhood => $_getSZ(6);
  @$pb.TagNumber(7)
  set neighborhood($core.String v) { $_setString(6, v); }
  @$pb.TagNumber(7)
  $core.bool hasNeighborhood() => $_has(6);
  @$pb.TagNumber(7)
  void clearNeighborhood() => clearField(7);

  @$pb.TagNumber(8)
  $core.int get alcoholScore => $_getIZ(7);
  @$pb.TagNumber(8)
  set alcoholScore($core.int v) { $_setSignedInt32(7, v); }
  @$pb.TagNumber(8)
  $core.bool hasAlcoholScore() => $_has(7);
  @$pb.TagNumber(8)
  void clearAlcoholScore() => clearField(8);

  @$pb.TagNumber(9)
  $core.int get points => $_getIZ(8);
  @$pb.TagNumber(9)
  set points($core.int v) { $_setSignedInt32(8, v); }
  @$pb.TagNumber(9)
  $core.bool hasPoints() => $_has(8);
  @$pb.TagNumber(9)
  void clearPoints() => clearField(9);

  @$pb.TagNumber(11)
  $core.String get surveyId => $_getSZ(9);
  @$pb.TagNumber(11)
  set surveyId($core.String v) { $_setString(9, v); }
  @$pb.TagNumber(11)
  $core.bool hasSurveyId() => $_has(9);
  @$pb.TagNumber(11)
  void clearSurveyId() => clearField(11);

  @$pb.TagNumber(12)
  $core.bool get onboardingCompleted => $_getBF(10);
  @$pb.TagNumber(12)
  set onboardingCompleted($core.bool v) { $_setBool(10, v); }
  @$pb.TagNumber(12)
  $core.bool hasOnboardingCompleted() => $_has(10);
  @$pb.TagNumber(12)
  void clearOnboardingCompleted() => clearField(12);
}

class GoogleLoginResponse extends $pb.GeneratedMessage {
  factory GoogleLoginResponse({
    $core.String? accessToken,
    $core.String? refreshToken,
    $1.Timestamp? accessTokenExpiresAt,
    $1.Timestamp? refreshTokenExpiresAt,
    UserResponse? user,
    $core.bool? isNewUser,
  }) {
    final $result = create();
    if (accessToken != null) $result.accessToken = accessToken;
    if (refreshToken != null) $result.refreshToken = refreshToken;
    if (accessTokenExpiresAt != null) $result.accessTokenExpiresAt = accessTokenExpiresAt;
    if (refreshTokenExpiresAt != null) $result.refreshTokenExpiresAt = refreshTokenExpiresAt;
    if (user != null) $result.user = user;
    if (isNewUser != null) $result.isNewUser = isNewUser;
    return $result;
  }
  GoogleLoginResponse._() : super();
  factory GoogleLoginResponse.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory GoogleLoginResponse.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'GoogleLoginResponse', package: const $pb.PackageName(_omitMessageNames ? '' : 'ontheblock.auth.v1'), createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'accessToken')
    ..aOS(2, _omitFieldNames ? '' : 'refreshToken')
    ..aOM<$1.Timestamp>(3, _omitFieldNames ? '' : 'accessTokenExpiresAt', subBuilder: $1.Timestamp.create)
    ..aOM<$1.Timestamp>(4, _omitFieldNames ? '' : 'refreshTokenExpiresAt', subBuilder: $1.Timestamp.create)
    ..aOM<UserResponse>(5, _omitFieldNames ? '' : 'user', subBuilder: UserResponse.create)
    ..aOB(6, _omitFieldNames ? '' : 'isNewUser')
    ..hasRequiredFields = false
  ;

  @$core.Deprecated('Using this can add significant overhead to your binary. Use [GeneratedMessageGenericExtensions.deepCopy] instead. Will be removed in next major version')
  GoogleLoginResponse clone() => GoogleLoginResponse()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. Use [GeneratedMessageGenericExtensions.rebuild] instead. Will be removed in next major version')
  GoogleLoginResponse copyWith(void Function(GoogleLoginResponse) updates) => super.copyWith((message) => updates(message as GoogleLoginResponse)) as GoogleLoginResponse;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static GoogleLoginResponse create() => GoogleLoginResponse._();
  GoogleLoginResponse createEmptyInstance() => create();
  static $pb.PbList<GoogleLoginResponse> createRepeated() => $pb.PbList<GoogleLoginResponse>();
  @$core.pragma('dart2js:noInline')
  static GoogleLoginResponse getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<GoogleLoginResponse>(create);
  static GoogleLoginResponse? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get accessToken => $_getSZ(0);
  @$pb.TagNumber(1)
  set accessToken($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasAccessToken() => $_has(0);
  @$pb.TagNumber(1)
  void clearAccessToken() => clearField(1);

  @$pb.TagNumber(2)
  $core.String get refreshToken => $_getSZ(1);
  @$pb.TagNumber(2)
  set refreshToken($core.String v) { $_setString(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasRefreshToken() => $_has(1);
  @$pb.TagNumber(2)
  void clearRefreshToken() => clearField(2);

  @$pb.TagNumber(3)
  $1.Timestamp get accessTokenExpiresAt => $_getN(2);
  @$pb.TagNumber(3)
  set accessTokenExpiresAt($1.Timestamp v) { setField(3, v); }
  @$pb.TagNumber(3)
  $core.bool hasAccessTokenExpiresAt() => $_has(2);
  @$pb.TagNumber(3)
  void clearAccessTokenExpiresAt() => clearField(3);
  @$pb.TagNumber(3)
  $1.Timestamp ensureAccessTokenExpiresAt() => $_ensure(2);

  @$pb.TagNumber(4)
  $1.Timestamp get refreshTokenExpiresAt => $_getN(3);
  @$pb.TagNumber(4)
  set refreshTokenExpiresAt($1.Timestamp v) { setField(4, v); }
  @$pb.TagNumber(4)
  $core.bool hasRefreshTokenExpiresAt() => $_has(3);
  @$pb.TagNumber(4)
  void clearRefreshTokenExpiresAt() => clearField(4);
  @$pb.TagNumber(4)
  $1.Timestamp ensureRefreshTokenExpiresAt() => $_ensure(3);

  @$pb.TagNumber(5)
  UserResponse get user => $_getN(4);
  @$pb.TagNumber(5)
  set user(UserResponse v) { setField(5, v); }
  @$pb.TagNumber(5)
  $core.bool hasUser() => $_has(4);
  @$pb.TagNumber(5)
  void clearUser() => clearField(5);
  @$pb.TagNumber(5)
  UserResponse ensureUser() => $_ensure(4);

  @$pb.TagNumber(6)
  $core.bool get isNewUser => $_getBF(5);
  @$pb.TagNumber(6)
  set isNewUser($core.bool v) { $_setBool(5, v); }
  @$pb.TagNumber(6)
  $core.bool hasIsNewUser() => $_has(5);
  @$pb.TagNumber(6)
  void clearIsNewUser() => clearField(6);
}

class RefreshTokenRequest extends $pb.GeneratedMessage {
  factory RefreshTokenRequest({$core.String? refreshToken}) {
    final $result = create();
    if (refreshToken != null) $result.refreshToken = refreshToken;
    return $result;
  }
  RefreshTokenRequest._() : super();
  factory RefreshTokenRequest.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory RefreshTokenRequest.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'RefreshTokenRequest', package: const $pb.PackageName(_omitMessageNames ? '' : 'ontheblock.auth.v1'), createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'refreshToken')
    ..hasRequiredFields = false
  ;

  @$core.Deprecated('Using this can add significant overhead to your binary. Use [GeneratedMessageGenericExtensions.deepCopy] instead. Will be removed in next major version')
  RefreshTokenRequest clone() => RefreshTokenRequest()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. Use [GeneratedMessageGenericExtensions.rebuild] instead. Will be removed in next major version')
  RefreshTokenRequest copyWith(void Function(RefreshTokenRequest) updates) => super.copyWith((message) => updates(message as RefreshTokenRequest)) as RefreshTokenRequest;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static RefreshTokenRequest create() => RefreshTokenRequest._();
  RefreshTokenRequest createEmptyInstance() => create();
  static $pb.PbList<RefreshTokenRequest> createRepeated() => $pb.PbList<RefreshTokenRequest>();
  @$core.pragma('dart2js:noInline')
  static RefreshTokenRequest getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<RefreshTokenRequest>(create);
  static RefreshTokenRequest? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get refreshToken => $_getSZ(0);
  @$pb.TagNumber(1)
  set refreshToken($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasRefreshToken() => $_has(0);
  @$pb.TagNumber(1)
  void clearRefreshToken() => clearField(1);
}

class RefreshTokenResponse extends $pb.GeneratedMessage {
  factory RefreshTokenResponse({
    $core.String? accessToken,
    $core.String? refreshToken,
    $1.Timestamp? accessTokenExpiresAt,
    $1.Timestamp? refreshTokenExpiresAt,
    UserResponse? user,
  }) {
    final $result = create();
    if (accessToken != null) $result.accessToken = accessToken;
    if (refreshToken != null) $result.refreshToken = refreshToken;
    if (accessTokenExpiresAt != null) $result.accessTokenExpiresAt = accessTokenExpiresAt;
    if (refreshTokenExpiresAt != null) $result.refreshTokenExpiresAt = refreshTokenExpiresAt;
    if (user != null) $result.user = user;
    return $result;
  }
  RefreshTokenResponse._() : super();
  factory RefreshTokenResponse.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory RefreshTokenResponse.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'RefreshTokenResponse', package: const $pb.PackageName(_omitMessageNames ? '' : 'ontheblock.auth.v1'), createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'accessToken')
    ..aOS(2, _omitFieldNames ? '' : 'refreshToken')
    ..aOM<$1.Timestamp>(3, _omitFieldNames ? '' : 'accessTokenExpiresAt', subBuilder: $1.Timestamp.create)
    ..aOM<$1.Timestamp>(4, _omitFieldNames ? '' : 'refreshTokenExpiresAt', subBuilder: $1.Timestamp.create)
    ..aOM<UserResponse>(5, _omitFieldNames ? '' : 'user', subBuilder: UserResponse.create)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated('Using this can add significant overhead to your binary. Use [GeneratedMessageGenericExtensions.deepCopy] instead. Will be removed in next major version')
  RefreshTokenResponse clone() => RefreshTokenResponse()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. Use [GeneratedMessageGenericExtensions.rebuild] instead. Will be removed in next major version')
  RefreshTokenResponse copyWith(void Function(RefreshTokenResponse) updates) => super.copyWith((message) => updates(message as RefreshTokenResponse)) as RefreshTokenResponse;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static RefreshTokenResponse create() => RefreshTokenResponse._();
  RefreshTokenResponse createEmptyInstance() => create();
  static $pb.PbList<RefreshTokenResponse> createRepeated() => $pb.PbList<RefreshTokenResponse>();
  @$core.pragma('dart2js:noInline')
  static RefreshTokenResponse getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<RefreshTokenResponse>(create);
  static RefreshTokenResponse? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get accessToken => $_getSZ(0);
  @$pb.TagNumber(1)
  set accessToken($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasAccessToken() => $_has(0);
  @$pb.TagNumber(1)
  void clearAccessToken() => clearField(1);

  @$pb.TagNumber(2)
  $core.String get refreshToken => $_getSZ(1);
  @$pb.TagNumber(2)
  set refreshToken($core.String v) { $_setString(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasRefreshToken() => $_has(1);
  @$pb.TagNumber(2)
  void clearRefreshToken() => clearField(2);

  @$pb.TagNumber(3)
  $1.Timestamp get accessTokenExpiresAt => $_getN(2);
  @$pb.TagNumber(3)
  set accessTokenExpiresAt($1.Timestamp v) { setField(3, v); }
  @$pb.TagNumber(3)
  $core.bool hasAccessTokenExpiresAt() => $_has(2);
  @$pb.TagNumber(3)
  void clearAccessTokenExpiresAt() => clearField(3);
  @$pb.TagNumber(3)
  $1.Timestamp ensureAccessTokenExpiresAt() => $_ensure(2);

  @$pb.TagNumber(4)
  $1.Timestamp get refreshTokenExpiresAt => $_getN(3);
  @$pb.TagNumber(4)
  set refreshTokenExpiresAt($1.Timestamp v) { setField(4, v); }
  @$pb.TagNumber(4)
  $core.bool hasRefreshTokenExpiresAt() => $_has(3);
  @$pb.TagNumber(4)
  void clearRefreshTokenExpiresAt() => clearField(4);
  @$pb.TagNumber(4)
  $1.Timestamp ensureRefreshTokenExpiresAt() => $_ensure(3);

  @$pb.TagNumber(5)
  UserResponse get user => $_getN(4);
  @$pb.TagNumber(5)
  set user(UserResponse v) { setField(5, v); }
  @$pb.TagNumber(5)
  $core.bool hasUser() => $_has(4);
  @$pb.TagNumber(5)
  void clearUser() => clearField(5);
  @$pb.TagNumber(5)
  UserResponse ensureUser() => $_ensure(4);
}

class LogoutRequest extends $pb.GeneratedMessage {
  factory LogoutRequest({$core.String? userId}) {
    final $result = create();
    if (userId != null) $result.userId = userId;
    return $result;
  }
  LogoutRequest._() : super();
  factory LogoutRequest.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory LogoutRequest.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'LogoutRequest', package: const $pb.PackageName(_omitMessageNames ? '' : 'ontheblock.auth.v1'), createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'userId')
    ..hasRequiredFields = false
  ;

  @$core.Deprecated('Using this can add significant overhead to your binary. Use [GeneratedMessageGenericExtensions.deepCopy] instead. Will be removed in next major version')
  LogoutRequest clone() => LogoutRequest()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. Use [GeneratedMessageGenericExtensions.rebuild] instead. Will be removed in next major version')
  LogoutRequest copyWith(void Function(LogoutRequest) updates) => super.copyWith((message) => updates(message as LogoutRequest)) as LogoutRequest;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static LogoutRequest create() => LogoutRequest._();
  LogoutRequest createEmptyInstance() => create();
  static $pb.PbList<LogoutRequest> createRepeated() => $pb.PbList<LogoutRequest>();
  @$core.pragma('dart2js:noInline')
  static LogoutRequest getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<LogoutRequest>(create);
  static LogoutRequest? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get userId => $_getSZ(0);
  @$pb.TagNumber(1)
  set userId($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasUserId() => $_has(0);
  @$pb.TagNumber(1)
  void clearUserId() => clearField(1);
}

class LogoutResponse extends $pb.GeneratedMessage {
  factory LogoutResponse() => create();
  LogoutResponse._() : super();
  factory LogoutResponse.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory LogoutResponse.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'LogoutResponse', package: const $pb.PackageName(_omitMessageNames ? '' : 'ontheblock.auth.v1'), createEmptyInstance: create)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated('Using this can add significant overhead to your binary. Use [GeneratedMessageGenericExtensions.deepCopy] instead. Will be removed in next major version')
  LogoutResponse clone() => LogoutResponse()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. Use [GeneratedMessageGenericExtensions.rebuild] instead. Will be removed in next major version')
  LogoutResponse copyWith(void Function(LogoutResponse) updates) => super.copyWith((message) => updates(message as LogoutResponse)) as LogoutResponse;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static LogoutResponse create() => LogoutResponse._();
  LogoutResponse createEmptyInstance() => create();
  static $pb.PbList<LogoutResponse> createRepeated() => $pb.PbList<LogoutResponse>();
  @$core.pragma('dart2js:noInline')
  static LogoutResponse getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<LogoutResponse>(create);
  static LogoutResponse? _defaultInstance;
}

class UpdateSurveyDataRequest extends $pb.GeneratedMessage {
  factory UpdateSurveyDataRequest({
    $core.String? userId,
    $core.String? surveyId,
  }) {
    final $result = create();
    if (userId != null) $result.userId = userId;
    if (surveyId != null) $result.surveyId = surveyId;
    return $result;
  }
  UpdateSurveyDataRequest._() : super();
  factory UpdateSurveyDataRequest.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory UpdateSurveyDataRequest.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'UpdateSurveyDataRequest', package: const $pb.PackageName(_omitMessageNames ? '' : 'ontheblock.auth.v1'), createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'userId')
    ..aOS(3, _omitFieldNames ? '' : 'surveyId')
    ..hasRequiredFields = false
  ;

  @$core.Deprecated('Using this can add significant overhead to your binary. Use [GeneratedMessageGenericExtensions.deepCopy] instead. Will be removed in next major version')
  UpdateSurveyDataRequest clone() => UpdateSurveyDataRequest()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. Use [GeneratedMessageGenericExtensions.rebuild] instead. Will be removed in next major version')
  UpdateSurveyDataRequest copyWith(void Function(UpdateSurveyDataRequest) updates) => super.copyWith((message) => updates(message as UpdateSurveyDataRequest)) as UpdateSurveyDataRequest;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static UpdateSurveyDataRequest create() => UpdateSurveyDataRequest._();
  UpdateSurveyDataRequest createEmptyInstance() => create();
  static $pb.PbList<UpdateSurveyDataRequest> createRepeated() => $pb.PbList<UpdateSurveyDataRequest>();
  @$core.pragma('dart2js:noInline')
  static UpdateSurveyDataRequest getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<UpdateSurveyDataRequest>(create);
  static UpdateSurveyDataRequest? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get userId => $_getSZ(0);
  @$pb.TagNumber(1)
  set userId($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasUserId() => $_has(0);
  @$pb.TagNumber(1)
  void clearUserId() => clearField(1);

  @$pb.TagNumber(3)
  $core.String get surveyId => $_getSZ(1);
  @$pb.TagNumber(3)
  set surveyId($core.String v) { $_setString(1, v); }
  @$pb.TagNumber(3)
  $core.bool hasSurveyId() => $_has(1);
  @$pb.TagNumber(3)
  void clearSurveyId() => clearField(3);
}

class UpdateSurveyDataResponse extends $pb.GeneratedMessage {
  factory UpdateSurveyDataResponse({UserResponse? user}) {
    final $result = create();
    if (user != null) $result.user = user;
    return $result;
  }
  UpdateSurveyDataResponse._() : super();
  factory UpdateSurveyDataResponse.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory UpdateSurveyDataResponse.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'UpdateSurveyDataResponse', package: const $pb.PackageName(_omitMessageNames ? '' : 'ontheblock.auth.v1'), createEmptyInstance: create)
    ..aOM<UserResponse>(1, _omitFieldNames ? '' : 'user', subBuilder: UserResponse.create)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated('Using this can add significant overhead to your binary. Use [GeneratedMessageGenericExtensions.deepCopy] instead. Will be removed in next major version')
  UpdateSurveyDataResponse clone() => UpdateSurveyDataResponse()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. Use [GeneratedMessageGenericExtensions.rebuild] instead. Will be removed in next major version')
  UpdateSurveyDataResponse copyWith(void Function(UpdateSurveyDataResponse) updates) => super.copyWith((message) => updates(message as UpdateSurveyDataResponse)) as UpdateSurveyDataResponse;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static UpdateSurveyDataResponse create() => UpdateSurveyDataResponse._();
  UpdateSurveyDataResponse createEmptyInstance() => create();
  static $pb.PbList<UpdateSurveyDataResponse> createRepeated() => $pb.PbList<UpdateSurveyDataResponse>();
  @$core.pragma('dart2js:noInline')
  static UpdateSurveyDataResponse getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<UpdateSurveyDataResponse>(create);
  static UpdateSurveyDataResponse? _defaultInstance;

  @$pb.TagNumber(1)
  UserResponse get user => $_getN(0);
  @$pb.TagNumber(1)
  set user(UserResponse v) { setField(1, v); }
  @$pb.TagNumber(1)
  $core.bool hasUser() => $_has(0);
  @$pb.TagNumber(1)
  void clearUser() => clearField(1);
  @$pb.TagNumber(1)
  UserResponse ensureUser() => $_ensure(0);
}

class UpdateProfileRequest extends $pb.GeneratedMessage {
  factory UpdateProfileRequest({
    $core.String? userId,
    $core.String? nickname,
    $core.String? profileImageUrl,
  }) {
    final $result = create();
    if (userId != null) $result.userId = userId;
    if (nickname != null) $result.nickname = nickname;
    if (profileImageUrl != null) $result.profileImageUrl = profileImageUrl;
    return $result;
  }
  UpdateProfileRequest._() : super();
  factory UpdateProfileRequest.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory UpdateProfileRequest.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'UpdateProfileRequest', package: const $pb.PackageName(_omitMessageNames ? '' : 'ontheblock.auth.v1'), createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'userId')
    ..aOS(2, _omitFieldNames ? '' : 'nickname')
    ..aOS(3, _omitFieldNames ? '' : 'profileImageUrl')
    ..hasRequiredFields = false
  ;

  @$core.Deprecated('Using this can add significant overhead to your binary. Use [GeneratedMessageGenericExtensions.deepCopy] instead. Will be removed in next major version')
  UpdateProfileRequest clone() => UpdateProfileRequest()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. Use [GeneratedMessageGenericExtensions.rebuild] instead. Will be removed in next major version')
  UpdateProfileRequest copyWith(void Function(UpdateProfileRequest) updates) => super.copyWith((message) => updates(message as UpdateProfileRequest)) as UpdateProfileRequest;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static UpdateProfileRequest create() => UpdateProfileRequest._();
  UpdateProfileRequest createEmptyInstance() => create();
  static $pb.PbList<UpdateProfileRequest> createRepeated() => $pb.PbList<UpdateProfileRequest>();
  @$core.pragma('dart2js:noInline')
  static UpdateProfileRequest getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<UpdateProfileRequest>(create);
  static UpdateProfileRequest? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get userId => $_getSZ(0);
  @$pb.TagNumber(1)
  set userId($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasUserId() => $_has(0);
  @$pb.TagNumber(1)
  void clearUserId() => clearField(1);

  @$pb.TagNumber(2)
  $core.String get nickname => $_getSZ(1);
  @$pb.TagNumber(2)
  set nickname($core.String v) { $_setString(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasNickname() => $_has(1);
  @$pb.TagNumber(2)
  void clearNickname() => clearField(2);

  @$pb.TagNumber(3)
  $core.String get profileImageUrl => $_getSZ(2);
  @$pb.TagNumber(3)
  set profileImageUrl($core.String v) { $_setString(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasProfileImageUrl() => $_has(2);
  @$pb.TagNumber(3)
  void clearProfileImageUrl() => clearField(3);
}

class UpdateProfileResponse extends $pb.GeneratedMessage {
  factory UpdateProfileResponse({UserResponse? user}) {
    final $result = create();
    if (user != null) $result.user = user;
    return $result;
  }
  UpdateProfileResponse._() : super();
  factory UpdateProfileResponse.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory UpdateProfileResponse.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'UpdateProfileResponse', package: const $pb.PackageName(_omitMessageNames ? '' : 'ontheblock.auth.v1'), createEmptyInstance: create)
    ..aOM<UserResponse>(1, _omitFieldNames ? '' : 'user', subBuilder: UserResponse.create)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated('Using this can add significant overhead to your binary. Use [GeneratedMessageGenericExtensions.deepCopy] instead. Will be removed in next major version')
  UpdateProfileResponse clone() => UpdateProfileResponse()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. Use [GeneratedMessageGenericExtensions.rebuild] instead. Will be removed in next major version')
  UpdateProfileResponse copyWith(void Function(UpdateProfileResponse) updates) => super.copyWith((message) => updates(message as UpdateProfileResponse)) as UpdateProfileResponse;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static UpdateProfileResponse create() => UpdateProfileResponse._();
  UpdateProfileResponse createEmptyInstance() => create();
  static $pb.PbList<UpdateProfileResponse> createRepeated() => $pb.PbList<UpdateProfileResponse>();
  @$core.pragma('dart2js:noInline')
  static UpdateProfileResponse getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<UpdateProfileResponse>(create);
  static UpdateProfileResponse? _defaultInstance;

  @$pb.TagNumber(1)
  UserResponse get user => $_getN(0);
  @$pb.TagNumber(1)
  set user(UserResponse v) { setField(1, v); }
  @$pb.TagNumber(1)
  $core.bool hasUser() => $_has(0);
  @$pb.TagNumber(1)
  void clearUser() => clearField(1);
  @$pb.TagNumber(1)
  UserResponse ensureUser() => $_ensure(0);
}

class GenerateProfileUploadUrlRequest extends $pb.GeneratedMessage {
  factory GenerateProfileUploadUrlRequest({$core.String? userId}) {
    final $result = create();
    if (userId != null) $result.userId = userId;
    return $result;
  }
  GenerateProfileUploadUrlRequest._() : super();
  factory GenerateProfileUploadUrlRequest.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory GenerateProfileUploadUrlRequest.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'GenerateProfileUploadUrlRequest', package: const $pb.PackageName(_omitMessageNames ? '' : 'ontheblock.auth.v1'), createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'userId')
    ..hasRequiredFields = false
  ;

  @$core.Deprecated('Using this can add significant overhead to your binary. Use [GeneratedMessageGenericExtensions.deepCopy] instead. Will be removed in next major version')
  GenerateProfileUploadUrlRequest clone() => GenerateProfileUploadUrlRequest()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. Use [GeneratedMessageGenericExtensions.rebuild] instead. Will be removed in next major version')
  GenerateProfileUploadUrlRequest copyWith(void Function(GenerateProfileUploadUrlRequest) updates) => super.copyWith((message) => updates(message as GenerateProfileUploadUrlRequest)) as GenerateProfileUploadUrlRequest;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static GenerateProfileUploadUrlRequest create() => GenerateProfileUploadUrlRequest._();
  GenerateProfileUploadUrlRequest createEmptyInstance() => create();
  static $pb.PbList<GenerateProfileUploadUrlRequest> createRepeated() => $pb.PbList<GenerateProfileUploadUrlRequest>();
  @$core.pragma('dart2js:noInline')
  static GenerateProfileUploadUrlRequest getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<GenerateProfileUploadUrlRequest>(create);
  static GenerateProfileUploadUrlRequest? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get userId => $_getSZ(0);
  @$pb.TagNumber(1)
  set userId($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasUserId() => $_has(0);
  @$pb.TagNumber(1)
  void clearUserId() => clearField(1);
}

class GenerateProfileUploadUrlResponse extends $pb.GeneratedMessage {
  factory GenerateProfileUploadUrlResponse({$core.String? uploadUrl, $core.String? objectUrl}) {
    final $result = create();
    if (uploadUrl != null) $result.uploadUrl = uploadUrl;
    if (objectUrl != null) $result.objectUrl = objectUrl;
    return $result;
  }
  GenerateProfileUploadUrlResponse._() : super();
  factory GenerateProfileUploadUrlResponse.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory GenerateProfileUploadUrlResponse.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'GenerateProfileUploadUrlResponse', package: const $pb.PackageName(_omitMessageNames ? '' : 'ontheblock.auth.v1'), createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'uploadUrl')
    ..aOS(2, _omitFieldNames ? '' : 'objectUrl')
    ..hasRequiredFields = false
  ;

  @$core.Deprecated('Using this can add significant overhead to your binary. Use [GeneratedMessageGenericExtensions.deepCopy] instead. Will be removed in next major version')
  GenerateProfileUploadUrlResponse clone() => GenerateProfileUploadUrlResponse()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. Use [GeneratedMessageGenericExtensions.rebuild] instead. Will be removed in next major version')
  GenerateProfileUploadUrlResponse copyWith(void Function(GenerateProfileUploadUrlResponse) updates) => super.copyWith((message) => updates(message as GenerateProfileUploadUrlResponse)) as GenerateProfileUploadUrlResponse;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static GenerateProfileUploadUrlResponse create() => GenerateProfileUploadUrlResponse._();
  GenerateProfileUploadUrlResponse createEmptyInstance() => create();
  static $pb.PbList<GenerateProfileUploadUrlResponse> createRepeated() => $pb.PbList<GenerateProfileUploadUrlResponse>();
  @$core.pragma('dart2js:noInline')
  static GenerateProfileUploadUrlResponse getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<GenerateProfileUploadUrlResponse>(create);
  static GenerateProfileUploadUrlResponse? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get uploadUrl => $_getSZ(0);
  @$pb.TagNumber(1)
  set uploadUrl($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasUploadUrl() => $_has(0);
  @$pb.TagNumber(1)
  void clearUploadUrl() => clearField(1);

  @$pb.TagNumber(2)
  $core.String get objectUrl => $_getSZ(1);
  @$pb.TagNumber(2)
  set objectUrl($core.String v) { $_setString(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasObjectUrl() => $_has(1);
  @$pb.TagNumber(2)
  void clearObjectUrl() => clearField(2);
}

class UpdateNeighborhoodRequest extends $pb.GeneratedMessage {
  factory UpdateNeighborhoodRequest({
    $core.String? userId,
    $core.String? neighborhood,
  }) {
    final $result = create();
    if (userId != null) $result.userId = userId;
    if (neighborhood != null) $result.neighborhood = neighborhood;
    return $result;
  }
  UpdateNeighborhoodRequest._() : super();
  factory UpdateNeighborhoodRequest.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory UpdateNeighborhoodRequest.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'UpdateNeighborhoodRequest', package: const $pb.PackageName(_omitMessageNames ? '' : 'ontheblock.auth.v1'), createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'userId')
    ..aOS(2, _omitFieldNames ? '' : 'neighborhood')
    ..hasRequiredFields = false
  ;

  @$core.Deprecated('Using this can add significant overhead to your binary. Use [GeneratedMessageGenericExtensions.deepCopy] instead. Will be removed in next major version')
  UpdateNeighborhoodRequest clone() => UpdateNeighborhoodRequest()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. Use [GeneratedMessageGenericExtensions.rebuild] instead. Will be removed in next major version')
  UpdateNeighborhoodRequest copyWith(void Function(UpdateNeighborhoodRequest) updates) => super.copyWith((message) => updates(message as UpdateNeighborhoodRequest)) as UpdateNeighborhoodRequest;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static UpdateNeighborhoodRequest create() => UpdateNeighborhoodRequest._();
  UpdateNeighborhoodRequest createEmptyInstance() => create();
  static $pb.PbList<UpdateNeighborhoodRequest> createRepeated() => $pb.PbList<UpdateNeighborhoodRequest>();
  @$core.pragma('dart2js:noInline')
  static UpdateNeighborhoodRequest getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<UpdateNeighborhoodRequest>(create);
  static UpdateNeighborhoodRequest? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get userId => $_getSZ(0);
  @$pb.TagNumber(1)
  set userId($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasUserId() => $_has(0);
  @$pb.TagNumber(1)
  void clearUserId() => clearField(1);

  @$pb.TagNumber(2)
  $core.String get neighborhood => $_getSZ(1);
  @$pb.TagNumber(2)
  set neighborhood($core.String v) { $_setString(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasNeighborhood() => $_has(1);
  @$pb.TagNumber(2)
  void clearNeighborhood() => clearField(2);
}

class UpdateNeighborhoodResponse extends $pb.GeneratedMessage {
  factory UpdateNeighborhoodResponse({UserResponse? user}) {
    final $result = create();
    if (user != null) $result.user = user;
    return $result;
  }
  UpdateNeighborhoodResponse._() : super();
  factory UpdateNeighborhoodResponse.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory UpdateNeighborhoodResponse.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'UpdateNeighborhoodResponse', package: const $pb.PackageName(_omitMessageNames ? '' : 'ontheblock.auth.v1'), createEmptyInstance: create)
    ..aOM<UserResponse>(1, _omitFieldNames ? '' : 'user', subBuilder: UserResponse.create)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated('Using this can add significant overhead to your binary. Use [GeneratedMessageGenericExtensions.deepCopy] instead. Will be removed in next major version')
  UpdateNeighborhoodResponse clone() => UpdateNeighborhoodResponse()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. Use [GeneratedMessageGenericExtensions.rebuild] instead. Will be removed in next major version')
  UpdateNeighborhoodResponse copyWith(void Function(UpdateNeighborhoodResponse) updates) => super.copyWith((message) => updates(message as UpdateNeighborhoodResponse)) as UpdateNeighborhoodResponse;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static UpdateNeighborhoodResponse create() => UpdateNeighborhoodResponse._();
  UpdateNeighborhoodResponse createEmptyInstance() => create();
  static $pb.PbList<UpdateNeighborhoodResponse> createRepeated() => $pb.PbList<UpdateNeighborhoodResponse>();
  @$core.pragma('dart2js:noInline')
  static UpdateNeighborhoodResponse getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<UpdateNeighborhoodResponse>(create);
  static UpdateNeighborhoodResponse? _defaultInstance;

  @$pb.TagNumber(1)
  UserResponse get user => $_getN(0);
  @$pb.TagNumber(1)
  set user(UserResponse v) { setField(1, v); }
  @$pb.TagNumber(1)
  $core.bool hasUser() => $_has(0);
  @$pb.TagNumber(1)
  void clearUser() => clearField(1);
  @$pb.TagNumber(1)
  UserResponse ensureUser() => $_ensure(0);
}

class CompleteOnboardingRequest extends $pb.GeneratedMessage {
  factory CompleteOnboardingRequest({$core.String? userId}) {
    final $result = create();
    if (userId != null) $result.userId = userId;
    return $result;
  }
  CompleteOnboardingRequest._() : super();
  factory CompleteOnboardingRequest.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory CompleteOnboardingRequest.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'CompleteOnboardingRequest', package: const $pb.PackageName(_omitMessageNames ? '' : 'ontheblock.auth.v1'), createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'userId')
    ..hasRequiredFields = false
  ;

  @$core.Deprecated('Using this can add significant overhead to your binary. Use [GeneratedMessageGenericExtensions.deepCopy] instead. Will be removed in next major version')
  CompleteOnboardingRequest clone() => CompleteOnboardingRequest()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. Use [GeneratedMessageGenericExtensions.rebuild] instead. Will be removed in next major version')
  CompleteOnboardingRequest copyWith(void Function(CompleteOnboardingRequest) updates) => super.copyWith((message) => updates(message as CompleteOnboardingRequest)) as CompleteOnboardingRequest;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static CompleteOnboardingRequest create() => CompleteOnboardingRequest._();
  CompleteOnboardingRequest createEmptyInstance() => create();
  static $pb.PbList<CompleteOnboardingRequest> createRepeated() => $pb.PbList<CompleteOnboardingRequest>();
  @$core.pragma('dart2js:noInline')
  static CompleteOnboardingRequest getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<CompleteOnboardingRequest>(create);
  static CompleteOnboardingRequest? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get userId => $_getSZ(0);
  @$pb.TagNumber(1)
  set userId($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasUserId() => $_has(0);
  @$pb.TagNumber(1)
  void clearUserId() => clearField(1);
}

class CompleteOnboardingResponse extends $pb.GeneratedMessage {
  factory CompleteOnboardingResponse({UserResponse? user}) {
    final $result = create();
    if (user != null) $result.user = user;
    return $result;
  }
  CompleteOnboardingResponse._() : super();
  factory CompleteOnboardingResponse.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory CompleteOnboardingResponse.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'CompleteOnboardingResponse', package: const $pb.PackageName(_omitMessageNames ? '' : 'ontheblock.auth.v1'), createEmptyInstance: create)
    ..aOM<UserResponse>(1, _omitFieldNames ? '' : 'user', subBuilder: UserResponse.create)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated('Using this can add significant overhead to your binary. Use [GeneratedMessageGenericExtensions.deepCopy] instead. Will be removed in next major version')
  CompleteOnboardingResponse clone() => CompleteOnboardingResponse()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. Use [GeneratedMessageGenericExtensions.rebuild] instead. Will be removed in next major version')
  CompleteOnboardingResponse copyWith(void Function(CompleteOnboardingResponse) updates) => super.copyWith((message) => updates(message as CompleteOnboardingResponse)) as CompleteOnboardingResponse;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static CompleteOnboardingResponse create() => CompleteOnboardingResponse._();
  CompleteOnboardingResponse createEmptyInstance() => create();
  static $pb.PbList<CompleteOnboardingResponse> createRepeated() => $pb.PbList<CompleteOnboardingResponse>();
  @$core.pragma('dart2js:noInline')
  static CompleteOnboardingResponse getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<CompleteOnboardingResponse>(create);
  static CompleteOnboardingResponse? _defaultInstance;

  @$pb.TagNumber(1)
  UserResponse get user => $_getN(0);
  @$pb.TagNumber(1)
  set user(UserResponse v) { setField(1, v); }
  @$pb.TagNumber(1)
  $core.bool hasUser() => $_has(0);
  @$pb.TagNumber(1)
  void clearUser() => clearField(1);
  @$pb.TagNumber(1)
  UserResponse ensureUser() => $_ensure(0);
}

const _omitFieldNames = $core.bool.fromEnvironment('protobuf.omit_field_names');
const _omitMessageNames = $core.bool.fromEnvironment('protobuf.omit_message_names');
