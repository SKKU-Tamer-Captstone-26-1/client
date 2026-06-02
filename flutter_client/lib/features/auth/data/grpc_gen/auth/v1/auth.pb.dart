//
//  Generated code. Do not modify.
//  source: auth/v1/auth.proto
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

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  GoogleLoginRequest clone() => GoogleLoginRequest()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
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
    if (accessToken != null) {
      $result.accessToken = accessToken;
    }
    if (refreshToken != null) {
      $result.refreshToken = refreshToken;
    }
    if (accessTokenExpiresAt != null) {
      $result.accessTokenExpiresAt = accessTokenExpiresAt;
    }
    if (refreshTokenExpiresAt != null) {
      $result.refreshTokenExpiresAt = refreshTokenExpiresAt;
    }
    if (user != null) {
      $result.user = user;
    }
    if (isNewUser != null) {
      $result.isNewUser = isNewUser;
    }
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

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  GoogleLoginResponse clone() => GoogleLoginResponse()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
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

class CredentialLoginRequest extends $pb.GeneratedMessage {
  factory CredentialLoginRequest({
    $core.String? username,
    $core.String? password,
  }) {
    final $result = create();
    if (username != null) {
      $result.username = username;
    }
    if (password != null) {
      $result.password = password;
    }
    return $result;
  }
  CredentialLoginRequest._() : super();
  factory CredentialLoginRequest.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory CredentialLoginRequest.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'CredentialLoginRequest', package: const $pb.PackageName(_omitMessageNames ? '' : 'ontheblock.auth.v1'), createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'username')
    ..aOS(2, _omitFieldNames ? '' : 'password')
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  CredentialLoginRequest clone() => CredentialLoginRequest()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  CredentialLoginRequest copyWith(void Function(CredentialLoginRequest) updates) => super.copyWith((message) => updates(message as CredentialLoginRequest)) as CredentialLoginRequest;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static CredentialLoginRequest create() => CredentialLoginRequest._();
  CredentialLoginRequest createEmptyInstance() => create();
  static $pb.PbList<CredentialLoginRequest> createRepeated() => $pb.PbList<CredentialLoginRequest>();
  @$core.pragma('dart2js:noInline')
  static CredentialLoginRequest getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<CredentialLoginRequest>(create);
  static CredentialLoginRequest? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get username => $_getSZ(0);
  @$pb.TagNumber(1)
  set username($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasUsername() => $_has(0);
  @$pb.TagNumber(1)
  void clearUsername() => clearField(1);

  @$pb.TagNumber(2)
  $core.String get password => $_getSZ(1);
  @$pb.TagNumber(2)
  set password($core.String v) { $_setString(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasPassword() => $_has(1);
  @$pb.TagNumber(2)
  void clearPassword() => clearField(2);
}

class CredentialLoginResponse extends $pb.GeneratedMessage {
  factory CredentialLoginResponse({
    $core.String? accessToken,
    $core.String? refreshToken,
    $1.Timestamp? accessTokenExpiresAt,
    $1.Timestamp? refreshTokenExpiresAt,
    UserResponse? user,
  }) {
    final $result = create();
    if (accessToken != null) {
      $result.accessToken = accessToken;
    }
    if (refreshToken != null) {
      $result.refreshToken = refreshToken;
    }
    if (accessTokenExpiresAt != null) {
      $result.accessTokenExpiresAt = accessTokenExpiresAt;
    }
    if (refreshTokenExpiresAt != null) {
      $result.refreshTokenExpiresAt = refreshTokenExpiresAt;
    }
    if (user != null) {
      $result.user = user;
    }
    return $result;
  }
  CredentialLoginResponse._() : super();
  factory CredentialLoginResponse.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory CredentialLoginResponse.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'CredentialLoginResponse', package: const $pb.PackageName(_omitMessageNames ? '' : 'ontheblock.auth.v1'), createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'accessToken')
    ..aOS(2, _omitFieldNames ? '' : 'refreshToken')
    ..aOM<$1.Timestamp>(3, _omitFieldNames ? '' : 'accessTokenExpiresAt', subBuilder: $1.Timestamp.create)
    ..aOM<$1.Timestamp>(4, _omitFieldNames ? '' : 'refreshTokenExpiresAt', subBuilder: $1.Timestamp.create)
    ..aOM<UserResponse>(5, _omitFieldNames ? '' : 'user', subBuilder: UserResponse.create)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  CredentialLoginResponse clone() => CredentialLoginResponse()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  CredentialLoginResponse copyWith(void Function(CredentialLoginResponse) updates) => super.copyWith((message) => updates(message as CredentialLoginResponse)) as CredentialLoginResponse;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static CredentialLoginResponse create() => CredentialLoginResponse._();
  CredentialLoginResponse createEmptyInstance() => create();
  static $pb.PbList<CredentialLoginResponse> createRepeated() => $pb.PbList<CredentialLoginResponse>();
  @$core.pragma('dart2js:noInline')
  static CredentialLoginResponse getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<CredentialLoginResponse>(create);
  static CredentialLoginResponse? _defaultInstance;

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

class AdminCreateUserRequest extends $pb.GeneratedMessage {
  factory AdminCreateUserRequest({
    $core.String? username,
    $core.String? password,
    Role? role,
  }) {
    final $result = create();
    if (username != null) {
      $result.username = username;
    }
    if (password != null) {
      $result.password = password;
    }
    if (role != null) {
      $result.role = role;
    }
    return $result;
  }
  AdminCreateUserRequest._() : super();
  factory AdminCreateUserRequest.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory AdminCreateUserRequest.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'AdminCreateUserRequest', package: const $pb.PackageName(_omitMessageNames ? '' : 'ontheblock.auth.v1'), createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'username')
    ..aOS(2, _omitFieldNames ? '' : 'password')
    ..e<Role>(3, _omitFieldNames ? '' : 'role', $pb.PbFieldType.OE, defaultOrMaker: Role.ROLE_UNSPECIFIED, valueOf: Role.valueOf, enumValues: Role.values)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  AdminCreateUserRequest clone() => AdminCreateUserRequest()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  AdminCreateUserRequest copyWith(void Function(AdminCreateUserRequest) updates) => super.copyWith((message) => updates(message as AdminCreateUserRequest)) as AdminCreateUserRequest;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static AdminCreateUserRequest create() => AdminCreateUserRequest._();
  AdminCreateUserRequest createEmptyInstance() => create();
  static $pb.PbList<AdminCreateUserRequest> createRepeated() => $pb.PbList<AdminCreateUserRequest>();
  @$core.pragma('dart2js:noInline')
  static AdminCreateUserRequest getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<AdminCreateUserRequest>(create);
  static AdminCreateUserRequest? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get username => $_getSZ(0);
  @$pb.TagNumber(1)
  set username($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasUsername() => $_has(0);
  @$pb.TagNumber(1)
  void clearUsername() => clearField(1);

  @$pb.TagNumber(2)
  $core.String get password => $_getSZ(1);
  @$pb.TagNumber(2)
  set password($core.String v) { $_setString(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasPassword() => $_has(1);
  @$pb.TagNumber(2)
  void clearPassword() => clearField(2);

  @$pb.TagNumber(3)
  Role get role => $_getN(2);
  @$pb.TagNumber(3)
  set role(Role v) { setField(3, v); }
  @$pb.TagNumber(3)
  $core.bool hasRole() => $_has(2);
  @$pb.TagNumber(3)
  void clearRole() => clearField(3);
}

class AdminCreateUserResponse extends $pb.GeneratedMessage {
  factory AdminCreateUserResponse({
    UserResponse? user,
  }) {
    final $result = create();
    if (user != null) {
      $result.user = user;
    }
    return $result;
  }
  AdminCreateUserResponse._() : super();
  factory AdminCreateUserResponse.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory AdminCreateUserResponse.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'AdminCreateUserResponse', package: const $pb.PackageName(_omitMessageNames ? '' : 'ontheblock.auth.v1'), createEmptyInstance: create)
    ..aOM<UserResponse>(1, _omitFieldNames ? '' : 'user', subBuilder: UserResponse.create)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  AdminCreateUserResponse clone() => AdminCreateUserResponse()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  AdminCreateUserResponse copyWith(void Function(AdminCreateUserResponse) updates) => super.copyWith((message) => updates(message as AdminCreateUserResponse)) as AdminCreateUserResponse;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static AdminCreateUserResponse create() => AdminCreateUserResponse._();
  AdminCreateUserResponse createEmptyInstance() => create();
  static $pb.PbList<AdminCreateUserResponse> createRepeated() => $pb.PbList<AdminCreateUserResponse>();
  @$core.pragma('dart2js:noInline')
  static AdminCreateUserResponse getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<AdminCreateUserResponse>(create);
  static AdminCreateUserResponse? _defaultInstance;

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

class AdminUpdateUserRequest extends $pb.GeneratedMessage {
  factory AdminUpdateUserRequest({
    $core.String? userId,
    $core.String? newPassword,
    $core.String? newUsername,
    Role? newRole,
  }) {
    final $result = create();
    if (userId != null) {
      $result.userId = userId;
    }
    if (newPassword != null) {
      $result.newPassword = newPassword;
    }
    if (newUsername != null) {
      $result.newUsername = newUsername;
    }
    if (newRole != null) {
      $result.newRole = newRole;
    }
    return $result;
  }
  AdminUpdateUserRequest._() : super();
  factory AdminUpdateUserRequest.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory AdminUpdateUserRequest.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'AdminUpdateUserRequest', package: const $pb.PackageName(_omitMessageNames ? '' : 'ontheblock.auth.v1'), createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'userId')
    ..aOS(2, _omitFieldNames ? '' : 'newPassword')
    ..aOS(3, _omitFieldNames ? '' : 'newUsername')
    ..e<Role>(4, _omitFieldNames ? '' : 'newRole', $pb.PbFieldType.OE, defaultOrMaker: Role.ROLE_UNSPECIFIED, valueOf: Role.valueOf, enumValues: Role.values)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  AdminUpdateUserRequest clone() => AdminUpdateUserRequest()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  AdminUpdateUserRequest copyWith(void Function(AdminUpdateUserRequest) updates) => super.copyWith((message) => updates(message as AdminUpdateUserRequest)) as AdminUpdateUserRequest;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static AdminUpdateUserRequest create() => AdminUpdateUserRequest._();
  AdminUpdateUserRequest createEmptyInstance() => create();
  static $pb.PbList<AdminUpdateUserRequest> createRepeated() => $pb.PbList<AdminUpdateUserRequest>();
  @$core.pragma('dart2js:noInline')
  static AdminUpdateUserRequest getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<AdminUpdateUserRequest>(create);
  static AdminUpdateUserRequest? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get userId => $_getSZ(0);
  @$pb.TagNumber(1)
  set userId($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasUserId() => $_has(0);
  @$pb.TagNumber(1)
  void clearUserId() => clearField(1);

  @$pb.TagNumber(2)
  $core.String get newPassword => $_getSZ(1);
  @$pb.TagNumber(2)
  set newPassword($core.String v) { $_setString(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasNewPassword() => $_has(1);
  @$pb.TagNumber(2)
  void clearNewPassword() => clearField(2);

  @$pb.TagNumber(3)
  $core.String get newUsername => $_getSZ(2);
  @$pb.TagNumber(3)
  set newUsername($core.String v) { $_setString(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasNewUsername() => $_has(2);
  @$pb.TagNumber(3)
  void clearNewUsername() => clearField(3);

  @$pb.TagNumber(4)
  Role get newRole => $_getN(3);
  @$pb.TagNumber(4)
  set newRole(Role v) { setField(4, v); }
  @$pb.TagNumber(4)
  $core.bool hasNewRole() => $_has(3);
  @$pb.TagNumber(4)
  void clearNewRole() => clearField(4);
}

class AdminUpdateUserResponse extends $pb.GeneratedMessage {
  factory AdminUpdateUserResponse({
    UserResponse? user,
  }) {
    final $result = create();
    if (user != null) {
      $result.user = user;
    }
    return $result;
  }
  AdminUpdateUserResponse._() : super();
  factory AdminUpdateUserResponse.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory AdminUpdateUserResponse.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'AdminUpdateUserResponse', package: const $pb.PackageName(_omitMessageNames ? '' : 'ontheblock.auth.v1'), createEmptyInstance: create)
    ..aOM<UserResponse>(1, _omitFieldNames ? '' : 'user', subBuilder: UserResponse.create)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  AdminUpdateUserResponse clone() => AdminUpdateUserResponse()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  AdminUpdateUserResponse copyWith(void Function(AdminUpdateUserResponse) updates) => super.copyWith((message) => updates(message as AdminUpdateUserResponse)) as AdminUpdateUserResponse;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static AdminUpdateUserResponse create() => AdminUpdateUserResponse._();
  AdminUpdateUserResponse createEmptyInstance() => create();
  static $pb.PbList<AdminUpdateUserResponse> createRepeated() => $pb.PbList<AdminUpdateUserResponse>();
  @$core.pragma('dart2js:noInline')
  static AdminUpdateUserResponse getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<AdminUpdateUserResponse>(create);
  static AdminUpdateUserResponse? _defaultInstance;

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

class AdminDeleteUserRequest extends $pb.GeneratedMessage {
  factory AdminDeleteUserRequest({
    $core.String? userId,
  }) {
    final $result = create();
    if (userId != null) {
      $result.userId = userId;
    }
    return $result;
  }
  AdminDeleteUserRequest._() : super();
  factory AdminDeleteUserRequest.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory AdminDeleteUserRequest.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'AdminDeleteUserRequest', package: const $pb.PackageName(_omitMessageNames ? '' : 'ontheblock.auth.v1'), createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'userId')
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  AdminDeleteUserRequest clone() => AdminDeleteUserRequest()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  AdminDeleteUserRequest copyWith(void Function(AdminDeleteUserRequest) updates) => super.copyWith((message) => updates(message as AdminDeleteUserRequest)) as AdminDeleteUserRequest;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static AdminDeleteUserRequest create() => AdminDeleteUserRequest._();
  AdminDeleteUserRequest createEmptyInstance() => create();
  static $pb.PbList<AdminDeleteUserRequest> createRepeated() => $pb.PbList<AdminDeleteUserRequest>();
  @$core.pragma('dart2js:noInline')
  static AdminDeleteUserRequest getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<AdminDeleteUserRequest>(create);
  static AdminDeleteUserRequest? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get userId => $_getSZ(0);
  @$pb.TagNumber(1)
  set userId($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasUserId() => $_has(0);
  @$pb.TagNumber(1)
  void clearUserId() => clearField(1);
}

class AdminDeleteUserResponse extends $pb.GeneratedMessage {
  factory AdminDeleteUserResponse() => create();
  AdminDeleteUserResponse._() : super();
  factory AdminDeleteUserResponse.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory AdminDeleteUserResponse.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'AdminDeleteUserResponse', package: const $pb.PackageName(_omitMessageNames ? '' : 'ontheblock.auth.v1'), createEmptyInstance: create)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  AdminDeleteUserResponse clone() => AdminDeleteUserResponse()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  AdminDeleteUserResponse copyWith(void Function(AdminDeleteUserResponse) updates) => super.copyWith((message) => updates(message as AdminDeleteUserResponse)) as AdminDeleteUserResponse;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static AdminDeleteUserResponse create() => AdminDeleteUserResponse._();
  AdminDeleteUserResponse createEmptyInstance() => create();
  static $pb.PbList<AdminDeleteUserResponse> createRepeated() => $pb.PbList<AdminDeleteUserResponse>();
  @$core.pragma('dart2js:noInline')
  static AdminDeleteUserResponse getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<AdminDeleteUserResponse>(create);
  static AdminDeleteUserResponse? _defaultInstance;
}

class AdminListUsersRequest extends $pb.GeneratedMessage {
  factory AdminListUsersRequest({
    Role? roleFilter,
    $core.int? pageSize,
    $core.String? pageToken,
  }) {
    final $result = create();
    if (roleFilter != null) {
      $result.roleFilter = roleFilter;
    }
    if (pageSize != null) {
      $result.pageSize = pageSize;
    }
    if (pageToken != null) {
      $result.pageToken = pageToken;
    }
    return $result;
  }
  AdminListUsersRequest._() : super();
  factory AdminListUsersRequest.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory AdminListUsersRequest.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'AdminListUsersRequest', package: const $pb.PackageName(_omitMessageNames ? '' : 'ontheblock.auth.v1'), createEmptyInstance: create)
    ..e<Role>(1, _omitFieldNames ? '' : 'roleFilter', $pb.PbFieldType.OE, defaultOrMaker: Role.ROLE_UNSPECIFIED, valueOf: Role.valueOf, enumValues: Role.values)
    ..a<$core.int>(2, _omitFieldNames ? '' : 'pageSize', $pb.PbFieldType.O3)
    ..aOS(3, _omitFieldNames ? '' : 'pageToken')
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  AdminListUsersRequest clone() => AdminListUsersRequest()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  AdminListUsersRequest copyWith(void Function(AdminListUsersRequest) updates) => super.copyWith((message) => updates(message as AdminListUsersRequest)) as AdminListUsersRequest;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static AdminListUsersRequest create() => AdminListUsersRequest._();
  AdminListUsersRequest createEmptyInstance() => create();
  static $pb.PbList<AdminListUsersRequest> createRepeated() => $pb.PbList<AdminListUsersRequest>();
  @$core.pragma('dart2js:noInline')
  static AdminListUsersRequest getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<AdminListUsersRequest>(create);
  static AdminListUsersRequest? _defaultInstance;

  @$pb.TagNumber(1)
  Role get roleFilter => $_getN(0);
  @$pb.TagNumber(1)
  set roleFilter(Role v) { setField(1, v); }
  @$pb.TagNumber(1)
  $core.bool hasRoleFilter() => $_has(0);
  @$pb.TagNumber(1)
  void clearRoleFilter() => clearField(1);

  @$pb.TagNumber(2)
  $core.int get pageSize => $_getIZ(1);
  @$pb.TagNumber(2)
  set pageSize($core.int v) { $_setSignedInt32(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasPageSize() => $_has(1);
  @$pb.TagNumber(2)
  void clearPageSize() => clearField(2);

  @$pb.TagNumber(3)
  $core.String get pageToken => $_getSZ(2);
  @$pb.TagNumber(3)
  set pageToken($core.String v) { $_setString(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasPageToken() => $_has(2);
  @$pb.TagNumber(3)
  void clearPageToken() => clearField(3);
}

class AdminListUsersResponse extends $pb.GeneratedMessage {
  factory AdminListUsersResponse({
    $core.Iterable<UserResponse>? users,
    $core.String? nextPageToken,
  }) {
    final $result = create();
    if (users != null) {
      $result.users.addAll(users);
    }
    if (nextPageToken != null) {
      $result.nextPageToken = nextPageToken;
    }
    return $result;
  }
  AdminListUsersResponse._() : super();
  factory AdminListUsersResponse.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory AdminListUsersResponse.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'AdminListUsersResponse', package: const $pb.PackageName(_omitMessageNames ? '' : 'ontheblock.auth.v1'), createEmptyInstance: create)
    ..pc<UserResponse>(1, _omitFieldNames ? '' : 'users', $pb.PbFieldType.PM, subBuilder: UserResponse.create)
    ..aOS(2, _omitFieldNames ? '' : 'nextPageToken')
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  AdminListUsersResponse clone() => AdminListUsersResponse()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  AdminListUsersResponse copyWith(void Function(AdminListUsersResponse) updates) => super.copyWith((message) => updates(message as AdminListUsersResponse)) as AdminListUsersResponse;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static AdminListUsersResponse create() => AdminListUsersResponse._();
  AdminListUsersResponse createEmptyInstance() => create();
  static $pb.PbList<AdminListUsersResponse> createRepeated() => $pb.PbList<AdminListUsersResponse>();
  @$core.pragma('dart2js:noInline')
  static AdminListUsersResponse getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<AdminListUsersResponse>(create);
  static AdminListUsersResponse? _defaultInstance;

  @$pb.TagNumber(1)
  $core.List<UserResponse> get users => $_getList(0);

  @$pb.TagNumber(2)
  $core.String get nextPageToken => $_getSZ(1);
  @$pb.TagNumber(2)
  set nextPageToken($core.String v) { $_setString(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasNextPageToken() => $_has(1);
  @$pb.TagNumber(2)
  void clearNextPageToken() => clearField(2);
}

class AdminGetUserRequest extends $pb.GeneratedMessage {
  factory AdminGetUserRequest({
    $core.String? userId,
  }) {
    final $result = create();
    if (userId != null) {
      $result.userId = userId;
    }
    return $result;
  }
  AdminGetUserRequest._() : super();
  factory AdminGetUserRequest.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory AdminGetUserRequest.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'AdminGetUserRequest', package: const $pb.PackageName(_omitMessageNames ? '' : 'ontheblock.auth.v1'), createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'userId')
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  AdminGetUserRequest clone() => AdminGetUserRequest()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  AdminGetUserRequest copyWith(void Function(AdminGetUserRequest) updates) => super.copyWith((message) => updates(message as AdminGetUserRequest)) as AdminGetUserRequest;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static AdminGetUserRequest create() => AdminGetUserRequest._();
  AdminGetUserRequest createEmptyInstance() => create();
  static $pb.PbList<AdminGetUserRequest> createRepeated() => $pb.PbList<AdminGetUserRequest>();
  @$core.pragma('dart2js:noInline')
  static AdminGetUserRequest getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<AdminGetUserRequest>(create);
  static AdminGetUserRequest? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get userId => $_getSZ(0);
  @$pb.TagNumber(1)
  set userId($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasUserId() => $_has(0);
  @$pb.TagNumber(1)
  void clearUserId() => clearField(1);
}

class AdminGetUserResponse extends $pb.GeneratedMessage {
  factory AdminGetUserResponse({
    UserResponse? user,
  }) {
    final $result = create();
    if (user != null) {
      $result.user = user;
    }
    return $result;
  }
  AdminGetUserResponse._() : super();
  factory AdminGetUserResponse.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory AdminGetUserResponse.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'AdminGetUserResponse', package: const $pb.PackageName(_omitMessageNames ? '' : 'ontheblock.auth.v1'), createEmptyInstance: create)
    ..aOM<UserResponse>(1, _omitFieldNames ? '' : 'user', subBuilder: UserResponse.create)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  AdminGetUserResponse clone() => AdminGetUserResponse()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  AdminGetUserResponse copyWith(void Function(AdminGetUserResponse) updates) => super.copyWith((message) => updates(message as AdminGetUserResponse)) as AdminGetUserResponse;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static AdminGetUserResponse create() => AdminGetUserResponse._();
  AdminGetUserResponse createEmptyInstance() => create();
  static $pb.PbList<AdminGetUserResponse> createRepeated() => $pb.PbList<AdminGetUserResponse>();
  @$core.pragma('dart2js:noInline')
  static AdminGetUserResponse getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<AdminGetUserResponse>(create);
  static AdminGetUserResponse? _defaultInstance;

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

class RefreshTokenRequest extends $pb.GeneratedMessage {
  factory RefreshTokenRequest({
    $core.String? refreshToken,
  }) {
    final $result = create();
    if (refreshToken != null) {
      $result.refreshToken = refreshToken;
    }
    return $result;
  }
  RefreshTokenRequest._() : super();
  factory RefreshTokenRequest.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory RefreshTokenRequest.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'RefreshTokenRequest', package: const $pb.PackageName(_omitMessageNames ? '' : 'ontheblock.auth.v1'), createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'refreshToken')
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  RefreshTokenRequest clone() => RefreshTokenRequest()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
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
    if (accessToken != null) {
      $result.accessToken = accessToken;
    }
    if (refreshToken != null) {
      $result.refreshToken = refreshToken;
    }
    if (accessTokenExpiresAt != null) {
      $result.accessTokenExpiresAt = accessTokenExpiresAt;
    }
    if (refreshTokenExpiresAt != null) {
      $result.refreshTokenExpiresAt = refreshTokenExpiresAt;
    }
    if (user != null) {
      $result.user = user;
    }
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

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  RefreshTokenResponse clone() => RefreshTokenResponse()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
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

class GetMeRequest extends $pb.GeneratedMessage {
  factory GetMeRequest({
    $core.String? userId,
  }) {
    final $result = create();
    if (userId != null) {
      $result.userId = userId;
    }
    return $result;
  }
  GetMeRequest._() : super();
  factory GetMeRequest.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory GetMeRequest.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'GetMeRequest', package: const $pb.PackageName(_omitMessageNames ? '' : 'ontheblock.auth.v1'), createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'userId')
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  GetMeRequest clone() => GetMeRequest()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  GetMeRequest copyWith(void Function(GetMeRequest) updates) => super.copyWith((message) => updates(message as GetMeRequest)) as GetMeRequest;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static GetMeRequest create() => GetMeRequest._();
  GetMeRequest createEmptyInstance() => create();
  static $pb.PbList<GetMeRequest> createRepeated() => $pb.PbList<GetMeRequest>();
  @$core.pragma('dart2js:noInline')
  static GetMeRequest getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<GetMeRequest>(create);
  static GetMeRequest? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get userId => $_getSZ(0);
  @$pb.TagNumber(1)
  set userId($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasUserId() => $_has(0);
  @$pb.TagNumber(1)
  void clearUserId() => clearField(1);
}

class GetMeResponse extends $pb.GeneratedMessage {
  factory GetMeResponse({
    UserResponse? user,
  }) {
    final $result = create();
    if (user != null) {
      $result.user = user;
    }
    return $result;
  }
  GetMeResponse._() : super();
  factory GetMeResponse.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory GetMeResponse.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'GetMeResponse', package: const $pb.PackageName(_omitMessageNames ? '' : 'ontheblock.auth.v1'), createEmptyInstance: create)
    ..aOM<UserResponse>(1, _omitFieldNames ? '' : 'user', subBuilder: UserResponse.create)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  GetMeResponse clone() => GetMeResponse()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  GetMeResponse copyWith(void Function(GetMeResponse) updates) => super.copyWith((message) => updates(message as GetMeResponse)) as GetMeResponse;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static GetMeResponse create() => GetMeResponse._();
  GetMeResponse createEmptyInstance() => create();
  static $pb.PbList<GetMeResponse> createRepeated() => $pb.PbList<GetMeResponse>();
  @$core.pragma('dart2js:noInline')
  static GetMeResponse getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<GetMeResponse>(create);
  static GetMeResponse? _defaultInstance;

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

class GetUserRequest extends $pb.GeneratedMessage {
  factory GetUserRequest({
    $core.String? userId,
  }) {
    final $result = create();
    if (userId != null) {
      $result.userId = userId;
    }
    return $result;
  }
  GetUserRequest._() : super();
  factory GetUserRequest.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory GetUserRequest.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'GetUserRequest', package: const $pb.PackageName(_omitMessageNames ? '' : 'ontheblock.auth.v1'), createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'userId')
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  GetUserRequest clone() => GetUserRequest()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  GetUserRequest copyWith(void Function(GetUserRequest) updates) => super.copyWith((message) => updates(message as GetUserRequest)) as GetUserRequest;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static GetUserRequest create() => GetUserRequest._();
  GetUserRequest createEmptyInstance() => create();
  static $pb.PbList<GetUserRequest> createRepeated() => $pb.PbList<GetUserRequest>();
  @$core.pragma('dart2js:noInline')
  static GetUserRequest getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<GetUserRequest>(create);
  static GetUserRequest? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get userId => $_getSZ(0);
  @$pb.TagNumber(1)
  set userId($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasUserId() => $_has(0);
  @$pb.TagNumber(1)
  void clearUserId() => clearField(1);
}

class GetUserResponse extends $pb.GeneratedMessage {
  factory GetUserResponse({
    $core.String? userId,
    $core.String? nickname,
    $core.String? profileImageUrl,
    $core.int? alcoholScore,
  }) {
    final $result = create();
    if (userId != null) {
      $result.userId = userId;
    }
    if (nickname != null) {
      $result.nickname = nickname;
    }
    if (profileImageUrl != null) {
      $result.profileImageUrl = profileImageUrl;
    }
    if (alcoholScore != null) {
      $result.alcoholScore = alcoholScore;
    }
    return $result;
  }
  GetUserResponse._() : super();
  factory GetUserResponse.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory GetUserResponse.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'GetUserResponse', package: const $pb.PackageName(_omitMessageNames ? '' : 'ontheblock.auth.v1'), createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'userId')
    ..aOS(2, _omitFieldNames ? '' : 'nickname')
    ..aOS(3, _omitFieldNames ? '' : 'profileImageUrl')
    ..a<$core.int>(4, _omitFieldNames ? '' : 'alcoholScore', $pb.PbFieldType.O3)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  GetUserResponse clone() => GetUserResponse()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  GetUserResponse copyWith(void Function(GetUserResponse) updates) => super.copyWith((message) => updates(message as GetUserResponse)) as GetUserResponse;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static GetUserResponse create() => GetUserResponse._();
  GetUserResponse createEmptyInstance() => create();
  static $pb.PbList<GetUserResponse> createRepeated() => $pb.PbList<GetUserResponse>();
  @$core.pragma('dart2js:noInline')
  static GetUserResponse getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<GetUserResponse>(create);
  static GetUserResponse? _defaultInstance;

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

  @$pb.TagNumber(4)
  $core.int get alcoholScore => $_getIZ(3);
  @$pb.TagNumber(4)
  set alcoholScore($core.int v) { $_setSignedInt32(3, v); }
  @$pb.TagNumber(4)
  $core.bool hasAlcoholScore() => $_has(3);
  @$pb.TagNumber(4)
  void clearAlcoholScore() => clearField(4);
}

class LogoutRequest extends $pb.GeneratedMessage {
  factory LogoutRequest({
    $core.String? userId,
  }) {
    final $result = create();
    if (userId != null) {
      $result.userId = userId;
    }
    return $result;
  }
  LogoutRequest._() : super();
  factory LogoutRequest.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory LogoutRequest.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'LogoutRequest', package: const $pb.PackageName(_omitMessageNames ? '' : 'ontheblock.auth.v1'), createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'userId')
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  LogoutRequest clone() => LogoutRequest()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
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

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  LogoutResponse clone() => LogoutResponse()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
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

class ValidateTokenRequest extends $pb.GeneratedMessage {
  factory ValidateTokenRequest({
    $core.String? accessToken,
  }) {
    final $result = create();
    if (accessToken != null) {
      $result.accessToken = accessToken;
    }
    return $result;
  }
  ValidateTokenRequest._() : super();
  factory ValidateTokenRequest.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory ValidateTokenRequest.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'ValidateTokenRequest', package: const $pb.PackageName(_omitMessageNames ? '' : 'ontheblock.auth.v1'), createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'accessToken')
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  ValidateTokenRequest clone() => ValidateTokenRequest()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  ValidateTokenRequest copyWith(void Function(ValidateTokenRequest) updates) => super.copyWith((message) => updates(message as ValidateTokenRequest)) as ValidateTokenRequest;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static ValidateTokenRequest create() => ValidateTokenRequest._();
  ValidateTokenRequest createEmptyInstance() => create();
  static $pb.PbList<ValidateTokenRequest> createRepeated() => $pb.PbList<ValidateTokenRequest>();
  @$core.pragma('dart2js:noInline')
  static ValidateTokenRequest getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<ValidateTokenRequest>(create);
  static ValidateTokenRequest? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get accessToken => $_getSZ(0);
  @$pb.TagNumber(1)
  set accessToken($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasAccessToken() => $_has(0);
  @$pb.TagNumber(1)
  void clearAccessToken() => clearField(1);
}

class ValidateTokenResponse extends $pb.GeneratedMessage {
  factory ValidateTokenResponse({
    $core.bool? valid,
    $core.String? userId,
    $core.String? email,
    Role? role,
    $1.Timestamp? expiresAt,
    $core.String? reason,
    $core.String? nickname,
  }) {
    final $result = create();
    if (valid != null) {
      $result.valid = valid;
    }
    if (userId != null) {
      $result.userId = userId;
    }
    if (email != null) {
      $result.email = email;
    }
    if (role != null) {
      $result.role = role;
    }
    if (expiresAt != null) {
      $result.expiresAt = expiresAt;
    }
    if (reason != null) {
      $result.reason = reason;
    }
    if (nickname != null) {
      $result.nickname = nickname;
    }
    return $result;
  }
  ValidateTokenResponse._() : super();
  factory ValidateTokenResponse.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory ValidateTokenResponse.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'ValidateTokenResponse', package: const $pb.PackageName(_omitMessageNames ? '' : 'ontheblock.auth.v1'), createEmptyInstance: create)
    ..aOB(1, _omitFieldNames ? '' : 'valid')
    ..aOS(2, _omitFieldNames ? '' : 'userId')
    ..aOS(3, _omitFieldNames ? '' : 'email')
    ..e<Role>(4, _omitFieldNames ? '' : 'role', $pb.PbFieldType.OE, defaultOrMaker: Role.ROLE_UNSPECIFIED, valueOf: Role.valueOf, enumValues: Role.values)
    ..aOM<$1.Timestamp>(5, _omitFieldNames ? '' : 'expiresAt', subBuilder: $1.Timestamp.create)
    ..aOS(6, _omitFieldNames ? '' : 'reason')
    ..aOS(7, _omitFieldNames ? '' : 'nickname')
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  ValidateTokenResponse clone() => ValidateTokenResponse()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  ValidateTokenResponse copyWith(void Function(ValidateTokenResponse) updates) => super.copyWith((message) => updates(message as ValidateTokenResponse)) as ValidateTokenResponse;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static ValidateTokenResponse create() => ValidateTokenResponse._();
  ValidateTokenResponse createEmptyInstance() => create();
  static $pb.PbList<ValidateTokenResponse> createRepeated() => $pb.PbList<ValidateTokenResponse>();
  @$core.pragma('dart2js:noInline')
  static ValidateTokenResponse getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<ValidateTokenResponse>(create);
  static ValidateTokenResponse? _defaultInstance;

  @$pb.TagNumber(1)
  $core.bool get valid => $_getBF(0);
  @$pb.TagNumber(1)
  set valid($core.bool v) { $_setBool(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasValid() => $_has(0);
  @$pb.TagNumber(1)
  void clearValid() => clearField(1);

  @$pb.TagNumber(2)
  $core.String get userId => $_getSZ(1);
  @$pb.TagNumber(2)
  set userId($core.String v) { $_setString(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasUserId() => $_has(1);
  @$pb.TagNumber(2)
  void clearUserId() => clearField(2);

  @$pb.TagNumber(3)
  $core.String get email => $_getSZ(2);
  @$pb.TagNumber(3)
  set email($core.String v) { $_setString(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasEmail() => $_has(2);
  @$pb.TagNumber(3)
  void clearEmail() => clearField(3);

  @$pb.TagNumber(4)
  Role get role => $_getN(3);
  @$pb.TagNumber(4)
  set role(Role v) { setField(4, v); }
  @$pb.TagNumber(4)
  $core.bool hasRole() => $_has(3);
  @$pb.TagNumber(4)
  void clearRole() => clearField(4);

  @$pb.TagNumber(5)
  $1.Timestamp get expiresAt => $_getN(4);
  @$pb.TagNumber(5)
  set expiresAt($1.Timestamp v) { setField(5, v); }
  @$pb.TagNumber(5)
  $core.bool hasExpiresAt() => $_has(4);
  @$pb.TagNumber(5)
  void clearExpiresAt() => clearField(5);
  @$pb.TagNumber(5)
  $1.Timestamp ensureExpiresAt() => $_ensure(4);

  @$pb.TagNumber(6)
  $core.String get reason => $_getSZ(5);
  @$pb.TagNumber(6)
  set reason($core.String v) { $_setString(5, v); }
  @$pb.TagNumber(6)
  $core.bool hasReason() => $_has(5);
  @$pb.TagNumber(6)
  void clearReason() => clearField(6);

  @$pb.TagNumber(7)
  $core.String get nickname => $_getSZ(6);
  @$pb.TagNumber(7)
  set nickname($core.String v) { $_setString(6, v); }
  @$pb.TagNumber(7)
  $core.bool hasNickname() => $_has(6);
  @$pb.TagNumber(7)
  void clearNickname() => clearField(7);
}

class UpdateSurveyDataRequest extends $pb.GeneratedMessage {
  factory UpdateSurveyDataRequest({
    $core.String? userId,
    $core.String? surveyId,
  }) {
    final $result = create();
    if (userId != null) {
      $result.userId = userId;
    }
    if (surveyId != null) {
      $result.surveyId = surveyId;
    }
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

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  UpdateSurveyDataRequest clone() => UpdateSurveyDataRequest()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
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
  factory UpdateSurveyDataResponse({
    UserResponse? user,
  }) {
    final $result = create();
    if (user != null) {
      $result.user = user;
    }
    return $result;
  }
  UpdateSurveyDataResponse._() : super();
  factory UpdateSurveyDataResponse.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory UpdateSurveyDataResponse.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'UpdateSurveyDataResponse', package: const $pb.PackageName(_omitMessageNames ? '' : 'ontheblock.auth.v1'), createEmptyInstance: create)
    ..aOM<UserResponse>(1, _omitFieldNames ? '' : 'user', subBuilder: UserResponse.create)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  UpdateSurveyDataResponse clone() => UpdateSurveyDataResponse()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
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
    if (userId != null) {
      $result.userId = userId;
    }
    if (nickname != null) {
      $result.nickname = nickname;
    }
    if (profileImageUrl != null) {
      $result.profileImageUrl = profileImageUrl;
    }
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

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  UpdateProfileRequest clone() => UpdateProfileRequest()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
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
  factory UpdateProfileResponse({
    UserResponse? user,
  }) {
    final $result = create();
    if (user != null) {
      $result.user = user;
    }
    return $result;
  }
  UpdateProfileResponse._() : super();
  factory UpdateProfileResponse.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory UpdateProfileResponse.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'UpdateProfileResponse', package: const $pb.PackageName(_omitMessageNames ? '' : 'ontheblock.auth.v1'), createEmptyInstance: create)
    ..aOM<UserResponse>(1, _omitFieldNames ? '' : 'user', subBuilder: UserResponse.create)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  UpdateProfileResponse clone() => UpdateProfileResponse()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
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
  factory GenerateProfileUploadUrlRequest({
    $core.String? userId,
  }) {
    final $result = create();
    if (userId != null) {
      $result.userId = userId;
    }
    return $result;
  }
  GenerateProfileUploadUrlRequest._() : super();
  factory GenerateProfileUploadUrlRequest.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory GenerateProfileUploadUrlRequest.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'GenerateProfileUploadUrlRequest', package: const $pb.PackageName(_omitMessageNames ? '' : 'ontheblock.auth.v1'), createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'userId')
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  GenerateProfileUploadUrlRequest clone() => GenerateProfileUploadUrlRequest()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
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
  factory GenerateProfileUploadUrlResponse({
    $core.String? uploadUrl,
    $core.String? objectUrl,
  }) {
    final $result = create();
    if (uploadUrl != null) {
      $result.uploadUrl = uploadUrl;
    }
    if (objectUrl != null) {
      $result.objectUrl = objectUrl;
    }
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

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  GenerateProfileUploadUrlResponse clone() => GenerateProfileUploadUrlResponse()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
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
    if (userId != null) {
      $result.userId = userId;
    }
    if (neighborhood != null) {
      $result.neighborhood = neighborhood;
    }
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

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  UpdateNeighborhoodRequest clone() => UpdateNeighborhoodRequest()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
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
  factory UpdateNeighborhoodResponse({
    UserResponse? user,
  }) {
    final $result = create();
    if (user != null) {
      $result.user = user;
    }
    return $result;
  }
  UpdateNeighborhoodResponse._() : super();
  factory UpdateNeighborhoodResponse.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory UpdateNeighborhoodResponse.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'UpdateNeighborhoodResponse', package: const $pb.PackageName(_omitMessageNames ? '' : 'ontheblock.auth.v1'), createEmptyInstance: create)
    ..aOM<UserResponse>(1, _omitFieldNames ? '' : 'user', subBuilder: UserResponse.create)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  UpdateNeighborhoodResponse clone() => UpdateNeighborhoodResponse()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
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
  factory CompleteOnboardingRequest({
    $core.String? userId,
  }) {
    final $result = create();
    if (userId != null) {
      $result.userId = userId;
    }
    return $result;
  }
  CompleteOnboardingRequest._() : super();
  factory CompleteOnboardingRequest.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory CompleteOnboardingRequest.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'CompleteOnboardingRequest', package: const $pb.PackageName(_omitMessageNames ? '' : 'ontheblock.auth.v1'), createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'userId')
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  CompleteOnboardingRequest clone() => CompleteOnboardingRequest()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
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
  factory CompleteOnboardingResponse({
    UserResponse? user,
  }) {
    final $result = create();
    if (user != null) {
      $result.user = user;
    }
    return $result;
  }
  CompleteOnboardingResponse._() : super();
  factory CompleteOnboardingResponse.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory CompleteOnboardingResponse.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'CompleteOnboardingResponse', package: const $pb.PackageName(_omitMessageNames ? '' : 'ontheblock.auth.v1'), createEmptyInstance: create)
    ..aOM<UserResponse>(1, _omitFieldNames ? '' : 'user', subBuilder: UserResponse.create)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  CompleteOnboardingResponse clone() => CompleteOnboardingResponse()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
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

class RotateKeysRequest extends $pb.GeneratedMessage {
  factory RotateKeysRequest() => create();
  RotateKeysRequest._() : super();
  factory RotateKeysRequest.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory RotateKeysRequest.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'RotateKeysRequest', package: const $pb.PackageName(_omitMessageNames ? '' : 'ontheblock.auth.v1'), createEmptyInstance: create)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  RotateKeysRequest clone() => RotateKeysRequest()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  RotateKeysRequest copyWith(void Function(RotateKeysRequest) updates) => super.copyWith((message) => updates(message as RotateKeysRequest)) as RotateKeysRequest;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static RotateKeysRequest create() => RotateKeysRequest._();
  RotateKeysRequest createEmptyInstance() => create();
  static $pb.PbList<RotateKeysRequest> createRepeated() => $pb.PbList<RotateKeysRequest>();
  @$core.pragma('dart2js:noInline')
  static RotateKeysRequest getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<RotateKeysRequest>(create);
  static RotateKeysRequest? _defaultInstance;
}

class RotateKeysResponse extends $pb.GeneratedMessage {
  factory RotateKeysResponse({
    $core.String? newKid,
    $core.String? publicKeyPem,
  }) {
    final $result = create();
    if (newKid != null) {
      $result.newKid = newKid;
    }
    if (publicKeyPem != null) {
      $result.publicKeyPem = publicKeyPem;
    }
    return $result;
  }
  RotateKeysResponse._() : super();
  factory RotateKeysResponse.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory RotateKeysResponse.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'RotateKeysResponse', package: const $pb.PackageName(_omitMessageNames ? '' : 'ontheblock.auth.v1'), createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'newKid')
    ..aOS(2, _omitFieldNames ? '' : 'publicKeyPem')
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  RotateKeysResponse clone() => RotateKeysResponse()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  RotateKeysResponse copyWith(void Function(RotateKeysResponse) updates) => super.copyWith((message) => updates(message as RotateKeysResponse)) as RotateKeysResponse;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static RotateKeysResponse create() => RotateKeysResponse._();
  RotateKeysResponse createEmptyInstance() => create();
  static $pb.PbList<RotateKeysResponse> createRepeated() => $pb.PbList<RotateKeysResponse>();
  @$core.pragma('dart2js:noInline')
  static RotateKeysResponse getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<RotateKeysResponse>(create);
  static RotateKeysResponse? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get newKid => $_getSZ(0);
  @$pb.TagNumber(1)
  set newKid($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasNewKid() => $_has(0);
  @$pb.TagNumber(1)
  void clearNewKid() => clearField(1);

  @$pb.TagNumber(2)
  $core.String get publicKeyPem => $_getSZ(1);
  @$pb.TagNumber(2)
  set publicKeyPem($core.String v) { $_setString(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasPublicKeyPem() => $_has(1);
  @$pb.TagNumber(2)
  void clearPublicKeyPem() => clearField(2);
}

class GetPublicKeysRequest extends $pb.GeneratedMessage {
  factory GetPublicKeysRequest() => create();
  GetPublicKeysRequest._() : super();
  factory GetPublicKeysRequest.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory GetPublicKeysRequest.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'GetPublicKeysRequest', package: const $pb.PackageName(_omitMessageNames ? '' : 'ontheblock.auth.v1'), createEmptyInstance: create)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  GetPublicKeysRequest clone() => GetPublicKeysRequest()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  GetPublicKeysRequest copyWith(void Function(GetPublicKeysRequest) updates) => super.copyWith((message) => updates(message as GetPublicKeysRequest)) as GetPublicKeysRequest;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static GetPublicKeysRequest create() => GetPublicKeysRequest._();
  GetPublicKeysRequest createEmptyInstance() => create();
  static $pb.PbList<GetPublicKeysRequest> createRepeated() => $pb.PbList<GetPublicKeysRequest>();
  @$core.pragma('dart2js:noInline')
  static GetPublicKeysRequest getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<GetPublicKeysRequest>(create);
  static GetPublicKeysRequest? _defaultInstance;
}

class GetPublicKeysResponse extends $pb.GeneratedMessage {
  factory GetPublicKeysResponse({
    $core.Iterable<PublicKeyEntry>? keys,
  }) {
    final $result = create();
    if (keys != null) {
      $result.keys.addAll(keys);
    }
    return $result;
  }
  GetPublicKeysResponse._() : super();
  factory GetPublicKeysResponse.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory GetPublicKeysResponse.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'GetPublicKeysResponse', package: const $pb.PackageName(_omitMessageNames ? '' : 'ontheblock.auth.v1'), createEmptyInstance: create)
    ..pc<PublicKeyEntry>(1, _omitFieldNames ? '' : 'keys', $pb.PbFieldType.PM, subBuilder: PublicKeyEntry.create)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  GetPublicKeysResponse clone() => GetPublicKeysResponse()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  GetPublicKeysResponse copyWith(void Function(GetPublicKeysResponse) updates) => super.copyWith((message) => updates(message as GetPublicKeysResponse)) as GetPublicKeysResponse;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static GetPublicKeysResponse create() => GetPublicKeysResponse._();
  GetPublicKeysResponse createEmptyInstance() => create();
  static $pb.PbList<GetPublicKeysResponse> createRepeated() => $pb.PbList<GetPublicKeysResponse>();
  @$core.pragma('dart2js:noInline')
  static GetPublicKeysResponse getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<GetPublicKeysResponse>(create);
  static GetPublicKeysResponse? _defaultInstance;

  @$pb.TagNumber(1)
  $core.List<PublicKeyEntry> get keys => $_getList(0);
}

class PublicKeyEntry extends $pb.GeneratedMessage {
  factory PublicKeyEntry({
    $core.String? kid,
    $core.String? publicKeyPem,
    $core.bool? isCurrent,
  }) {
    final $result = create();
    if (kid != null) {
      $result.kid = kid;
    }
    if (publicKeyPem != null) {
      $result.publicKeyPem = publicKeyPem;
    }
    if (isCurrent != null) {
      $result.isCurrent = isCurrent;
    }
    return $result;
  }
  PublicKeyEntry._() : super();
  factory PublicKeyEntry.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory PublicKeyEntry.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'PublicKeyEntry', package: const $pb.PackageName(_omitMessageNames ? '' : 'ontheblock.auth.v1'), createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'kid')
    ..aOS(2, _omitFieldNames ? '' : 'publicKeyPem')
    ..aOB(3, _omitFieldNames ? '' : 'isCurrent')
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  PublicKeyEntry clone() => PublicKeyEntry()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  PublicKeyEntry copyWith(void Function(PublicKeyEntry) updates) => super.copyWith((message) => updates(message as PublicKeyEntry)) as PublicKeyEntry;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static PublicKeyEntry create() => PublicKeyEntry._();
  PublicKeyEntry createEmptyInstance() => create();
  static $pb.PbList<PublicKeyEntry> createRepeated() => $pb.PbList<PublicKeyEntry>();
  @$core.pragma('dart2js:noInline')
  static PublicKeyEntry getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<PublicKeyEntry>(create);
  static PublicKeyEntry? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get kid => $_getSZ(0);
  @$pb.TagNumber(1)
  set kid($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasKid() => $_has(0);
  @$pb.TagNumber(1)
  void clearKid() => clearField(1);

  @$pb.TagNumber(2)
  $core.String get publicKeyPem => $_getSZ(1);
  @$pb.TagNumber(2)
  set publicKeyPem($core.String v) { $_setString(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasPublicKeyPem() => $_has(1);
  @$pb.TagNumber(2)
  void clearPublicKeyPem() => clearField(2);

  @$pb.TagNumber(3)
  $core.bool get isCurrent => $_getBF(2);
  @$pb.TagNumber(3)
  set isCurrent($core.bool v) { $_setBool(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasIsCurrent() => $_has(2);
  @$pb.TagNumber(3)
  void clearIsCurrent() => clearField(3);
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
    if (userId != null) {
      $result.userId = userId;
    }
    if (email != null) {
      $result.email = email;
    }
    if (nickname != null) {
      $result.nickname = nickname;
    }
    if (profileImageUrl != null) {
      $result.profileImageUrl = profileImageUrl;
    }
    if (role != null) {
      $result.role = role;
    }
    if (createdAt != null) {
      $result.createdAt = createdAt;
    }
    if (neighborhood != null) {
      $result.neighborhood = neighborhood;
    }
    if (alcoholScore != null) {
      $result.alcoholScore = alcoholScore;
    }
    if (points != null) {
      $result.points = points;
    }
    if (surveyId != null) {
      $result.surveyId = surveyId;
    }
    if (onboardingCompleted != null) {
      $result.onboardingCompleted = onboardingCompleted;
    }
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

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  UserResponse clone() => UserResponse()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
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

class IssueDebugTokenRequest extends $pb.GeneratedMessage {
  factory IssueDebugTokenRequest({
    $core.String? userId,
  }) {
    final $result = create();
    if (userId != null) {
      $result.userId = userId;
    }
    return $result;
  }
  IssueDebugTokenRequest._() : super();
  factory IssueDebugTokenRequest.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory IssueDebugTokenRequest.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'IssueDebugTokenRequest', package: const $pb.PackageName(_omitMessageNames ? '' : 'ontheblock.auth.v1'), createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'userId')
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  IssueDebugTokenRequest clone() => IssueDebugTokenRequest()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  IssueDebugTokenRequest copyWith(void Function(IssueDebugTokenRequest) updates) => super.copyWith((message) => updates(message as IssueDebugTokenRequest)) as IssueDebugTokenRequest;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static IssueDebugTokenRequest create() => IssueDebugTokenRequest._();
  IssueDebugTokenRequest createEmptyInstance() => create();
  static $pb.PbList<IssueDebugTokenRequest> createRepeated() => $pb.PbList<IssueDebugTokenRequest>();
  @$core.pragma('dart2js:noInline')
  static IssueDebugTokenRequest getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<IssueDebugTokenRequest>(create);
  static IssueDebugTokenRequest? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get userId => $_getSZ(0);
  @$pb.TagNumber(1)
  set userId($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasUserId() => $_has(0);
  @$pb.TagNumber(1)
  void clearUserId() => clearField(1);
}

class IssueDebugTokenResponse extends $pb.GeneratedMessage {
  factory IssueDebugTokenResponse({
    $core.String? accessToken,
    $core.String? userId,
    $1.Timestamp? expiresAt,
  }) {
    final $result = create();
    if (accessToken != null) {
      $result.accessToken = accessToken;
    }
    if (userId != null) {
      $result.userId = userId;
    }
    if (expiresAt != null) {
      $result.expiresAt = expiresAt;
    }
    return $result;
  }
  IssueDebugTokenResponse._() : super();
  factory IssueDebugTokenResponse.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory IssueDebugTokenResponse.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'IssueDebugTokenResponse', package: const $pb.PackageName(_omitMessageNames ? '' : 'ontheblock.auth.v1'), createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'accessToken')
    ..aOS(2, _omitFieldNames ? '' : 'userId')
    ..aOM<$1.Timestamp>(3, _omitFieldNames ? '' : 'expiresAt', subBuilder: $1.Timestamp.create)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  IssueDebugTokenResponse clone() => IssueDebugTokenResponse()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  IssueDebugTokenResponse copyWith(void Function(IssueDebugTokenResponse) updates) => super.copyWith((message) => updates(message as IssueDebugTokenResponse)) as IssueDebugTokenResponse;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static IssueDebugTokenResponse create() => IssueDebugTokenResponse._();
  IssueDebugTokenResponse createEmptyInstance() => create();
  static $pb.PbList<IssueDebugTokenResponse> createRepeated() => $pb.PbList<IssueDebugTokenResponse>();
  @$core.pragma('dart2js:noInline')
  static IssueDebugTokenResponse getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<IssueDebugTokenResponse>(create);
  static IssueDebugTokenResponse? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get accessToken => $_getSZ(0);
  @$pb.TagNumber(1)
  set accessToken($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasAccessToken() => $_has(0);
  @$pb.TagNumber(1)
  void clearAccessToken() => clearField(1);

  @$pb.TagNumber(2)
  $core.String get userId => $_getSZ(1);
  @$pb.TagNumber(2)
  set userId($core.String v) { $_setString(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasUserId() => $_has(1);
  @$pb.TagNumber(2)
  void clearUserId() => clearField(2);

  @$pb.TagNumber(3)
  $1.Timestamp get expiresAt => $_getN(2);
  @$pb.TagNumber(3)
  set expiresAt($1.Timestamp v) { setField(3, v); }
  @$pb.TagNumber(3)
  $core.bool hasExpiresAt() => $_has(2);
  @$pb.TagNumber(3)
  void clearExpiresAt() => clearField(3);
  @$pb.TagNumber(3)
  $1.Timestamp ensureExpiresAt() => $_ensure(2);
}


const _omitFieldNames = $core.bool.fromEnvironment('protobuf.omit_field_names');
const _omitMessageNames = $core.bool.fromEnvironment('protobuf.omit_message_names');
