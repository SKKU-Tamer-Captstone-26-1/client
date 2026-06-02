//
//  Generated code. Do not modify.
//  source: auth/v1/auth.proto
//
// @dart = 2.12

// ignore_for_file: annotate_overrides, camel_case_types, comment_references
// ignore_for_file: constant_identifier_names, library_prefixes
// ignore_for_file: non_constant_identifier_names, prefer_final_fields
// ignore_for_file: unnecessary_import, unnecessary_this, unused_import

import 'dart:convert' as $convert;
import 'dart:core' as $core;
import 'dart:typed_data' as $typed_data;

@$core.Deprecated('Use roleDescriptor instead')
const Role$json = {
  '1': 'Role',
  '2': [
    {'1': 'ROLE_UNSPECIFIED', '2': 0},
    {'1': 'ROLE_NORMAL', '2': 1},
    {'1': 'ROLE_ADMIN', '2': 2},
    {'1': 'ROLE_BAR', '2': 3},
    {'1': 'ROLE_REQUE', '2': 4},
  ],
};

/// Descriptor for `Role`. Decode as a `google.protobuf.EnumDescriptorProto`.
final $typed_data.Uint8List roleDescriptor = $convert.base64Decode(
    'CgRSb2xlEhQKEFJPTEVfVU5TUEVDSUZJRUQQABIPCgtST0xFX05PUk1BTBABEg4KClJPTEVfQU'
    'RNSU4QAhIMCghST0xFX0JBUhADEg4KClJPTEVfUkVRVUUQBA==');

@$core.Deprecated('Use providerDescriptor instead')
const Provider$json = {
  '1': 'Provider',
  '2': [
    {'1': 'PROVIDER_UNSPECIFIED', '2': 0},
    {'1': 'PROVIDER_GOOGLE', '2': 1},
  ],
};

/// Descriptor for `Provider`. Decode as a `google.protobuf.EnumDescriptorProto`.
final $typed_data.Uint8List providerDescriptor = $convert.base64Decode(
    'CghQcm92aWRlchIYChRQUk9WSURFUl9VTlNQRUNJRklFRBAAEhMKD1BST1ZJREVSX0dPT0dMRR'
    'AB');

@$core.Deprecated('Use googleLoginRequestDescriptor instead')
const GoogleLoginRequest$json = {
  '1': 'GoogleLoginRequest',
  '2': [
    {'1': 'id_token', '3': 1, '4': 1, '5': 9, '10': 'idToken'},
  ],
};

/// Descriptor for `GoogleLoginRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List googleLoginRequestDescriptor = $convert.base64Decode(
    'ChJHb29nbGVMb2dpblJlcXVlc3QSGQoIaWRfdG9rZW4YASABKAlSB2lkVG9rZW4=');

@$core.Deprecated('Use googleLoginResponseDescriptor instead')
const GoogleLoginResponse$json = {
  '1': 'GoogleLoginResponse',
  '2': [
    {'1': 'access_token', '3': 1, '4': 1, '5': 9, '10': 'accessToken'},
    {'1': 'refresh_token', '3': 2, '4': 1, '5': 9, '10': 'refreshToken'},
    {'1': 'access_token_expires_at', '3': 3, '4': 1, '5': 11, '6': '.google.protobuf.Timestamp', '10': 'accessTokenExpiresAt'},
    {'1': 'refresh_token_expires_at', '3': 4, '4': 1, '5': 11, '6': '.google.protobuf.Timestamp', '10': 'refreshTokenExpiresAt'},
    {'1': 'user', '3': 5, '4': 1, '5': 11, '6': '.ontheblock.auth.v1.UserResponse', '10': 'user'},
    {'1': 'is_new_user', '3': 6, '4': 1, '5': 8, '10': 'isNewUser'},
  ],
};

/// Descriptor for `GoogleLoginResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List googleLoginResponseDescriptor = $convert.base64Decode(
    'ChNHb29nbGVMb2dpblJlc3BvbnNlEiEKDGFjY2Vzc190b2tlbhgBIAEoCVILYWNjZXNzVG9rZW'
    '4SIwoNcmVmcmVzaF90b2tlbhgCIAEoCVIMcmVmcmVzaFRva2VuElEKF2FjY2Vzc190b2tlbl9l'
    'eHBpcmVzX2F0GAMgASgLMhouZ29vZ2xlLnByb3RvYnVmLlRpbWVzdGFtcFIUYWNjZXNzVG9rZW'
    '5FeHBpcmVzQXQSUwoYcmVmcmVzaF90b2tlbl9leHBpcmVzX2F0GAQgASgLMhouZ29vZ2xlLnBy'
    'b3RvYnVmLlRpbWVzdGFtcFIVcmVmcmVzaFRva2VuRXhwaXJlc0F0EjQKBHVzZXIYBSABKAsyIC'
    '5vbnRoZWJsb2NrLmF1dGgudjEuVXNlclJlc3BvbnNlUgR1c2VyEh4KC2lzX25ld191c2VyGAYg'
    'ASgIUglpc05ld1VzZXI=');

@$core.Deprecated('Use credentialLoginRequestDescriptor instead')
const CredentialLoginRequest$json = {
  '1': 'CredentialLoginRequest',
  '2': [
    {'1': 'username', '3': 1, '4': 1, '5': 9, '10': 'username'},
    {'1': 'password', '3': 2, '4': 1, '5': 9, '10': 'password'},
  ],
};

/// Descriptor for `CredentialLoginRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List credentialLoginRequestDescriptor = $convert.base64Decode(
    'ChZDcmVkZW50aWFsTG9naW5SZXF1ZXN0EhoKCHVzZXJuYW1lGAEgASgJUgh1c2VybmFtZRIaCg'
    'hwYXNzd29yZBgCIAEoCVIIcGFzc3dvcmQ=');

@$core.Deprecated('Use credentialLoginResponseDescriptor instead')
const CredentialLoginResponse$json = {
  '1': 'CredentialLoginResponse',
  '2': [
    {'1': 'access_token', '3': 1, '4': 1, '5': 9, '10': 'accessToken'},
    {'1': 'refresh_token', '3': 2, '4': 1, '5': 9, '10': 'refreshToken'},
    {'1': 'access_token_expires_at', '3': 3, '4': 1, '5': 11, '6': '.google.protobuf.Timestamp', '10': 'accessTokenExpiresAt'},
    {'1': 'refresh_token_expires_at', '3': 4, '4': 1, '5': 11, '6': '.google.protobuf.Timestamp', '10': 'refreshTokenExpiresAt'},
    {'1': 'user', '3': 5, '4': 1, '5': 11, '6': '.ontheblock.auth.v1.UserResponse', '10': 'user'},
  ],
};

/// Descriptor for `CredentialLoginResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List credentialLoginResponseDescriptor = $convert.base64Decode(
    'ChdDcmVkZW50aWFsTG9naW5SZXNwb25zZRIhCgxhY2Nlc3NfdG9rZW4YASABKAlSC2FjY2Vzc1'
    'Rva2VuEiMKDXJlZnJlc2hfdG9rZW4YAiABKAlSDHJlZnJlc2hUb2tlbhJRChdhY2Nlc3NfdG9r'
    'ZW5fZXhwaXJlc19hdBgDIAEoCzIaLmdvb2dsZS5wcm90b2J1Zi5UaW1lc3RhbXBSFGFjY2Vzc1'
    'Rva2VuRXhwaXJlc0F0ElMKGHJlZnJlc2hfdG9rZW5fZXhwaXJlc19hdBgEIAEoCzIaLmdvb2ds'
    'ZS5wcm90b2J1Zi5UaW1lc3RhbXBSFXJlZnJlc2hUb2tlbkV4cGlyZXNBdBI0CgR1c2VyGAUgAS'
    'gLMiAub250aGVibG9jay5hdXRoLnYxLlVzZXJSZXNwb25zZVIEdXNlcg==');

@$core.Deprecated('Use adminCreateUserRequestDescriptor instead')
const AdminCreateUserRequest$json = {
  '1': 'AdminCreateUserRequest',
  '2': [
    {'1': 'username', '3': 1, '4': 1, '5': 9, '10': 'username'},
    {'1': 'password', '3': 2, '4': 1, '5': 9, '10': 'password'},
    {'1': 'role', '3': 3, '4': 1, '5': 14, '6': '.ontheblock.auth.v1.Role', '10': 'role'},
  ],
};

/// Descriptor for `AdminCreateUserRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List adminCreateUserRequestDescriptor = $convert.base64Decode(
    'ChZBZG1pbkNyZWF0ZVVzZXJSZXF1ZXN0EhoKCHVzZXJuYW1lGAEgASgJUgh1c2VybmFtZRIaCg'
    'hwYXNzd29yZBgCIAEoCVIIcGFzc3dvcmQSLAoEcm9sZRgDIAEoDjIYLm9udGhlYmxvY2suYXV0'
    'aC52MS5Sb2xlUgRyb2xl');

@$core.Deprecated('Use adminCreateUserResponseDescriptor instead')
const AdminCreateUserResponse$json = {
  '1': 'AdminCreateUserResponse',
  '2': [
    {'1': 'user', '3': 1, '4': 1, '5': 11, '6': '.ontheblock.auth.v1.UserResponse', '10': 'user'},
  ],
};

/// Descriptor for `AdminCreateUserResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List adminCreateUserResponseDescriptor = $convert.base64Decode(
    'ChdBZG1pbkNyZWF0ZVVzZXJSZXNwb25zZRI0CgR1c2VyGAEgASgLMiAub250aGVibG9jay5hdX'
    'RoLnYxLlVzZXJSZXNwb25zZVIEdXNlcg==');

@$core.Deprecated('Use adminUpdateUserRequestDescriptor instead')
const AdminUpdateUserRequest$json = {
  '1': 'AdminUpdateUserRequest',
  '2': [
    {'1': 'user_id', '3': 1, '4': 1, '5': 9, '10': 'userId'},
    {'1': 'new_password', '3': 2, '4': 1, '5': 9, '9': 0, '10': 'newPassword', '17': true},
    {'1': 'new_username', '3': 3, '4': 1, '5': 9, '9': 1, '10': 'newUsername', '17': true},
    {'1': 'new_role', '3': 4, '4': 1, '5': 14, '6': '.ontheblock.auth.v1.Role', '9': 2, '10': 'newRole', '17': true},
  ],
  '8': [
    {'1': '_new_password'},
    {'1': '_new_username'},
    {'1': '_new_role'},
  ],
};

/// Descriptor for `AdminUpdateUserRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List adminUpdateUserRequestDescriptor = $convert.base64Decode(
    'ChZBZG1pblVwZGF0ZVVzZXJSZXF1ZXN0EhcKB3VzZXJfaWQYASABKAlSBnVzZXJJZBImCgxuZX'
    'dfcGFzc3dvcmQYAiABKAlIAFILbmV3UGFzc3dvcmSIAQESJgoMbmV3X3VzZXJuYW1lGAMgASgJ'
    'SAFSC25ld1VzZXJuYW1liAEBEjgKCG5ld19yb2xlGAQgASgOMhgub250aGVibG9jay5hdXRoLn'
    'YxLlJvbGVIAlIHbmV3Um9sZYgBAUIPCg1fbmV3X3Bhc3N3b3JkQg8KDV9uZXdfdXNlcm5hbWVC'
    'CwoJX25ld19yb2xl');

@$core.Deprecated('Use adminUpdateUserResponseDescriptor instead')
const AdminUpdateUserResponse$json = {
  '1': 'AdminUpdateUserResponse',
  '2': [
    {'1': 'user', '3': 1, '4': 1, '5': 11, '6': '.ontheblock.auth.v1.UserResponse', '10': 'user'},
  ],
};

/// Descriptor for `AdminUpdateUserResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List adminUpdateUserResponseDescriptor = $convert.base64Decode(
    'ChdBZG1pblVwZGF0ZVVzZXJSZXNwb25zZRI0CgR1c2VyGAEgASgLMiAub250aGVibG9jay5hdX'
    'RoLnYxLlVzZXJSZXNwb25zZVIEdXNlcg==');

@$core.Deprecated('Use adminDeleteUserRequestDescriptor instead')
const AdminDeleteUserRequest$json = {
  '1': 'AdminDeleteUserRequest',
  '2': [
    {'1': 'user_id', '3': 1, '4': 1, '5': 9, '10': 'userId'},
  ],
};

/// Descriptor for `AdminDeleteUserRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List adminDeleteUserRequestDescriptor = $convert.base64Decode(
    'ChZBZG1pbkRlbGV0ZVVzZXJSZXF1ZXN0EhcKB3VzZXJfaWQYASABKAlSBnVzZXJJZA==');

@$core.Deprecated('Use adminDeleteUserResponseDescriptor instead')
const AdminDeleteUserResponse$json = {
  '1': 'AdminDeleteUserResponse',
};

/// Descriptor for `AdminDeleteUserResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List adminDeleteUserResponseDescriptor = $convert.base64Decode(
    'ChdBZG1pbkRlbGV0ZVVzZXJSZXNwb25zZQ==');

@$core.Deprecated('Use adminListUsersRequestDescriptor instead')
const AdminListUsersRequest$json = {
  '1': 'AdminListUsersRequest',
  '2': [
    {'1': 'role_filter', '3': 1, '4': 1, '5': 14, '6': '.ontheblock.auth.v1.Role', '10': 'roleFilter'},
    {'1': 'page_size', '3': 2, '4': 1, '5': 5, '10': 'pageSize'},
    {'1': 'page_token', '3': 3, '4': 1, '5': 9, '10': 'pageToken'},
  ],
};

/// Descriptor for `AdminListUsersRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List adminListUsersRequestDescriptor = $convert.base64Decode(
    'ChVBZG1pbkxpc3RVc2Vyc1JlcXVlc3QSOQoLcm9sZV9maWx0ZXIYASABKA4yGC5vbnRoZWJsb2'
    'NrLmF1dGgudjEuUm9sZVIKcm9sZUZpbHRlchIbCglwYWdlX3NpemUYAiABKAVSCHBhZ2VTaXpl'
    'Eh0KCnBhZ2VfdG9rZW4YAyABKAlSCXBhZ2VUb2tlbg==');

@$core.Deprecated('Use adminListUsersResponseDescriptor instead')
const AdminListUsersResponse$json = {
  '1': 'AdminListUsersResponse',
  '2': [
    {'1': 'users', '3': 1, '4': 3, '5': 11, '6': '.ontheblock.auth.v1.UserResponse', '10': 'users'},
    {'1': 'next_page_token', '3': 2, '4': 1, '5': 9, '10': 'nextPageToken'},
  ],
};

/// Descriptor for `AdminListUsersResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List adminListUsersResponseDescriptor = $convert.base64Decode(
    'ChZBZG1pbkxpc3RVc2Vyc1Jlc3BvbnNlEjYKBXVzZXJzGAEgAygLMiAub250aGVibG9jay5hdX'
    'RoLnYxLlVzZXJSZXNwb25zZVIFdXNlcnMSJgoPbmV4dF9wYWdlX3Rva2VuGAIgASgJUg1uZXh0'
    'UGFnZVRva2Vu');

@$core.Deprecated('Use adminGetUserRequestDescriptor instead')
const AdminGetUserRequest$json = {
  '1': 'AdminGetUserRequest',
  '2': [
    {'1': 'user_id', '3': 1, '4': 1, '5': 9, '10': 'userId'},
  ],
};

/// Descriptor for `AdminGetUserRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List adminGetUserRequestDescriptor = $convert.base64Decode(
    'ChNBZG1pbkdldFVzZXJSZXF1ZXN0EhcKB3VzZXJfaWQYASABKAlSBnVzZXJJZA==');

@$core.Deprecated('Use adminGetUserResponseDescriptor instead')
const AdminGetUserResponse$json = {
  '1': 'AdminGetUserResponse',
  '2': [
    {'1': 'user', '3': 1, '4': 1, '5': 11, '6': '.ontheblock.auth.v1.UserResponse', '10': 'user'},
  ],
};

/// Descriptor for `AdminGetUserResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List adminGetUserResponseDescriptor = $convert.base64Decode(
    'ChRBZG1pbkdldFVzZXJSZXNwb25zZRI0CgR1c2VyGAEgASgLMiAub250aGVibG9jay5hdXRoLn'
    'YxLlVzZXJSZXNwb25zZVIEdXNlcg==');

@$core.Deprecated('Use refreshTokenRequestDescriptor instead')
const RefreshTokenRequest$json = {
  '1': 'RefreshTokenRequest',
  '2': [
    {'1': 'refresh_token', '3': 1, '4': 1, '5': 9, '10': 'refreshToken'},
  ],
};

/// Descriptor for `RefreshTokenRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List refreshTokenRequestDescriptor = $convert.base64Decode(
    'ChNSZWZyZXNoVG9rZW5SZXF1ZXN0EiMKDXJlZnJlc2hfdG9rZW4YASABKAlSDHJlZnJlc2hUb2'
    'tlbg==');

@$core.Deprecated('Use refreshTokenResponseDescriptor instead')
const RefreshTokenResponse$json = {
  '1': 'RefreshTokenResponse',
  '2': [
    {'1': 'access_token', '3': 1, '4': 1, '5': 9, '10': 'accessToken'},
    {'1': 'refresh_token', '3': 2, '4': 1, '5': 9, '10': 'refreshToken'},
    {'1': 'access_token_expires_at', '3': 3, '4': 1, '5': 11, '6': '.google.protobuf.Timestamp', '10': 'accessTokenExpiresAt'},
    {'1': 'refresh_token_expires_at', '3': 4, '4': 1, '5': 11, '6': '.google.protobuf.Timestamp', '10': 'refreshTokenExpiresAt'},
    {'1': 'user', '3': 5, '4': 1, '5': 11, '6': '.ontheblock.auth.v1.UserResponse', '10': 'user'},
  ],
};

/// Descriptor for `RefreshTokenResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List refreshTokenResponseDescriptor = $convert.base64Decode(
    'ChRSZWZyZXNoVG9rZW5SZXNwb25zZRIhCgxhY2Nlc3NfdG9rZW4YASABKAlSC2FjY2Vzc1Rva2'
    'VuEiMKDXJlZnJlc2hfdG9rZW4YAiABKAlSDHJlZnJlc2hUb2tlbhJRChdhY2Nlc3NfdG9rZW5f'
    'ZXhwaXJlc19hdBgDIAEoCzIaLmdvb2dsZS5wcm90b2J1Zi5UaW1lc3RhbXBSFGFjY2Vzc1Rva2'
    'VuRXhwaXJlc0F0ElMKGHJlZnJlc2hfdG9rZW5fZXhwaXJlc19hdBgEIAEoCzIaLmdvb2dsZS5w'
    'cm90b2J1Zi5UaW1lc3RhbXBSFXJlZnJlc2hUb2tlbkV4cGlyZXNBdBI0CgR1c2VyGAUgASgLMi'
    'Aub250aGVibG9jay5hdXRoLnYxLlVzZXJSZXNwb25zZVIEdXNlcg==');

@$core.Deprecated('Use getMeRequestDescriptor instead')
const GetMeRequest$json = {
  '1': 'GetMeRequest',
  '2': [
    {'1': 'user_id', '3': 1, '4': 1, '5': 9, '10': 'userId'},
  ],
};

/// Descriptor for `GetMeRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List getMeRequestDescriptor = $convert.base64Decode(
    'CgxHZXRNZVJlcXVlc3QSFwoHdXNlcl9pZBgBIAEoCVIGdXNlcklk');

@$core.Deprecated('Use getMeResponseDescriptor instead')
const GetMeResponse$json = {
  '1': 'GetMeResponse',
  '2': [
    {'1': 'user', '3': 1, '4': 1, '5': 11, '6': '.ontheblock.auth.v1.UserResponse', '10': 'user'},
  ],
};

/// Descriptor for `GetMeResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List getMeResponseDescriptor = $convert.base64Decode(
    'Cg1HZXRNZVJlc3BvbnNlEjQKBHVzZXIYASABKAsyIC5vbnRoZWJsb2NrLmF1dGgudjEuVXNlcl'
    'Jlc3BvbnNlUgR1c2Vy');

@$core.Deprecated('Use getUserRequestDescriptor instead')
const GetUserRequest$json = {
  '1': 'GetUserRequest',
  '2': [
    {'1': 'user_id', '3': 1, '4': 1, '5': 9, '10': 'userId'},
  ],
};

/// Descriptor for `GetUserRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List getUserRequestDescriptor = $convert.base64Decode(
    'Cg5HZXRVc2VyUmVxdWVzdBIXCgd1c2VyX2lkGAEgASgJUgZ1c2VySWQ=');

@$core.Deprecated('Use getUserResponseDescriptor instead')
const GetUserResponse$json = {
  '1': 'GetUserResponse',
  '2': [
    {'1': 'user_id', '3': 1, '4': 1, '5': 9, '10': 'userId'},
    {'1': 'nickname', '3': 2, '4': 1, '5': 9, '10': 'nickname'},
    {'1': 'profile_image_url', '3': 3, '4': 1, '5': 9, '10': 'profileImageUrl'},
    {'1': 'alcohol_score', '3': 4, '4': 1, '5': 5, '10': 'alcoholScore'},
  ],
};

/// Descriptor for `GetUserResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List getUserResponseDescriptor = $convert.base64Decode(
    'Cg9HZXRVc2VyUmVzcG9uc2USFwoHdXNlcl9pZBgBIAEoCVIGdXNlcklkEhoKCG5pY2tuYW1lGA'
    'IgASgJUghuaWNrbmFtZRIqChFwcm9maWxlX2ltYWdlX3VybBgDIAEoCVIPcHJvZmlsZUltYWdl'
    'VXJsEiMKDWFsY29ob2xfc2NvcmUYBCABKAVSDGFsY29ob2xTY29yZQ==');

@$core.Deprecated('Use logoutRequestDescriptor instead')
const LogoutRequest$json = {
  '1': 'LogoutRequest',
  '2': [
    {'1': 'user_id', '3': 1, '4': 1, '5': 9, '10': 'userId'},
  ],
};

/// Descriptor for `LogoutRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List logoutRequestDescriptor = $convert.base64Decode(
    'Cg1Mb2dvdXRSZXF1ZXN0EhcKB3VzZXJfaWQYASABKAlSBnVzZXJJZA==');

@$core.Deprecated('Use logoutResponseDescriptor instead')
const LogoutResponse$json = {
  '1': 'LogoutResponse',
};

/// Descriptor for `LogoutResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List logoutResponseDescriptor = $convert.base64Decode(
    'Cg5Mb2dvdXRSZXNwb25zZQ==');

@$core.Deprecated('Use validateTokenRequestDescriptor instead')
const ValidateTokenRequest$json = {
  '1': 'ValidateTokenRequest',
  '2': [
    {'1': 'access_token', '3': 1, '4': 1, '5': 9, '10': 'accessToken'},
  ],
};

/// Descriptor for `ValidateTokenRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List validateTokenRequestDescriptor = $convert.base64Decode(
    'ChRWYWxpZGF0ZVRva2VuUmVxdWVzdBIhCgxhY2Nlc3NfdG9rZW4YASABKAlSC2FjY2Vzc1Rva2'
    'Vu');

@$core.Deprecated('Use validateTokenResponseDescriptor instead')
const ValidateTokenResponse$json = {
  '1': 'ValidateTokenResponse',
  '2': [
    {'1': 'valid', '3': 1, '4': 1, '5': 8, '10': 'valid'},
    {'1': 'user_id', '3': 2, '4': 1, '5': 9, '10': 'userId'},
    {'1': 'email', '3': 3, '4': 1, '5': 9, '10': 'email'},
    {'1': 'role', '3': 4, '4': 1, '5': 14, '6': '.ontheblock.auth.v1.Role', '10': 'role'},
    {'1': 'expires_at', '3': 5, '4': 1, '5': 11, '6': '.google.protobuf.Timestamp', '10': 'expiresAt'},
    {'1': 'reason', '3': 6, '4': 1, '5': 9, '10': 'reason'},
    {'1': 'nickname', '3': 7, '4': 1, '5': 9, '10': 'nickname'},
  ],
};

/// Descriptor for `ValidateTokenResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List validateTokenResponseDescriptor = $convert.base64Decode(
    'ChVWYWxpZGF0ZVRva2VuUmVzcG9uc2USFAoFdmFsaWQYASABKAhSBXZhbGlkEhcKB3VzZXJfaW'
    'QYAiABKAlSBnVzZXJJZBIUCgVlbWFpbBgDIAEoCVIFZW1haWwSLAoEcm9sZRgEIAEoDjIYLm9u'
    'dGhlYmxvY2suYXV0aC52MS5Sb2xlUgRyb2xlEjkKCmV4cGlyZXNfYXQYBSABKAsyGi5nb29nbG'
    'UucHJvdG9idWYuVGltZXN0YW1wUglleHBpcmVzQXQSFgoGcmVhc29uGAYgASgJUgZyZWFzb24S'
    'GgoIbmlja25hbWUYByABKAlSCG5pY2tuYW1l');

@$core.Deprecated('Use updateSurveyDataRequestDescriptor instead')
const UpdateSurveyDataRequest$json = {
  '1': 'UpdateSurveyDataRequest',
  '2': [
    {'1': 'user_id', '3': 1, '4': 1, '5': 9, '10': 'userId'},
    {'1': 'survey_id', '3': 3, '4': 1, '5': 9, '10': 'surveyId'},
  ],
  '9': [
    {'1': 2, '2': 3},
  ],
};

/// Descriptor for `UpdateSurveyDataRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List updateSurveyDataRequestDescriptor = $convert.base64Decode(
    'ChdVcGRhdGVTdXJ2ZXlEYXRhUmVxdWVzdBIXCgd1c2VyX2lkGAEgASgJUgZ1c2VySWQSGwoJc3'
    'VydmV5X2lkGAMgASgJUghzdXJ2ZXlJZEoECAIQAw==');

@$core.Deprecated('Use updateSurveyDataResponseDescriptor instead')
const UpdateSurveyDataResponse$json = {
  '1': 'UpdateSurveyDataResponse',
  '2': [
    {'1': 'user', '3': 1, '4': 1, '5': 11, '6': '.ontheblock.auth.v1.UserResponse', '10': 'user'},
  ],
};

/// Descriptor for `UpdateSurveyDataResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List updateSurveyDataResponseDescriptor = $convert.base64Decode(
    'ChhVcGRhdGVTdXJ2ZXlEYXRhUmVzcG9uc2USNAoEdXNlchgBIAEoCzIgLm9udGhlYmxvY2suYX'
    'V0aC52MS5Vc2VyUmVzcG9uc2VSBHVzZXI=');

@$core.Deprecated('Use updateProfileRequestDescriptor instead')
const UpdateProfileRequest$json = {
  '1': 'UpdateProfileRequest',
  '2': [
    {'1': 'user_id', '3': 1, '4': 1, '5': 9, '10': 'userId'},
    {'1': 'nickname', '3': 2, '4': 1, '5': 9, '10': 'nickname'},
    {'1': 'profile_image_url', '3': 3, '4': 1, '5': 9, '10': 'profileImageUrl'},
  ],
};

/// Descriptor for `UpdateProfileRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List updateProfileRequestDescriptor = $convert.base64Decode(
    'ChRVcGRhdGVQcm9maWxlUmVxdWVzdBIXCgd1c2VyX2lkGAEgASgJUgZ1c2VySWQSGgoIbmlja2'
    '5hbWUYAiABKAlSCG5pY2tuYW1lEioKEXByb2ZpbGVfaW1hZ2VfdXJsGAMgASgJUg9wcm9maWxl'
    'SW1hZ2VVcmw=');

@$core.Deprecated('Use updateProfileResponseDescriptor instead')
const UpdateProfileResponse$json = {
  '1': 'UpdateProfileResponse',
  '2': [
    {'1': 'user', '3': 1, '4': 1, '5': 11, '6': '.ontheblock.auth.v1.UserResponse', '10': 'user'},
  ],
};

/// Descriptor for `UpdateProfileResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List updateProfileResponseDescriptor = $convert.base64Decode(
    'ChVVcGRhdGVQcm9maWxlUmVzcG9uc2USNAoEdXNlchgBIAEoCzIgLm9udGhlYmxvY2suYXV0aC'
    '52MS5Vc2VyUmVzcG9uc2VSBHVzZXI=');

@$core.Deprecated('Use generateProfileUploadUrlRequestDescriptor instead')
const GenerateProfileUploadUrlRequest$json = {
  '1': 'GenerateProfileUploadUrlRequest',
  '2': [
    {'1': 'user_id', '3': 1, '4': 1, '5': 9, '10': 'userId'},
  ],
};

/// Descriptor for `GenerateProfileUploadUrlRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List generateProfileUploadUrlRequestDescriptor = $convert.base64Decode(
    'Ch9HZW5lcmF0ZVByb2ZpbGVVcGxvYWRVcmxSZXF1ZXN0EhcKB3VzZXJfaWQYASABKAlSBnVzZX'
    'JJZA==');

@$core.Deprecated('Use generateProfileUploadUrlResponseDescriptor instead')
const GenerateProfileUploadUrlResponse$json = {
  '1': 'GenerateProfileUploadUrlResponse',
  '2': [
    {'1': 'upload_url', '3': 1, '4': 1, '5': 9, '10': 'uploadUrl'},
    {'1': 'object_url', '3': 2, '4': 1, '5': 9, '10': 'objectUrl'},
  ],
};

/// Descriptor for `GenerateProfileUploadUrlResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List generateProfileUploadUrlResponseDescriptor = $convert.base64Decode(
    'CiBHZW5lcmF0ZVByb2ZpbGVVcGxvYWRVcmxSZXNwb25zZRIdCgp1cGxvYWRfdXJsGAEgASgJUg'
    'l1cGxvYWRVcmwSHQoKb2JqZWN0X3VybBgCIAEoCVIJb2JqZWN0VXJs');

@$core.Deprecated('Use updateNeighborhoodRequestDescriptor instead')
const UpdateNeighborhoodRequest$json = {
  '1': 'UpdateNeighborhoodRequest',
  '2': [
    {'1': 'user_id', '3': 1, '4': 1, '5': 9, '10': 'userId'},
    {'1': 'neighborhood', '3': 2, '4': 1, '5': 9, '10': 'neighborhood'},
  ],
};

/// Descriptor for `UpdateNeighborhoodRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List updateNeighborhoodRequestDescriptor = $convert.base64Decode(
    'ChlVcGRhdGVOZWlnaGJvcmhvb2RSZXF1ZXN0EhcKB3VzZXJfaWQYASABKAlSBnVzZXJJZBIiCg'
    'xuZWlnaGJvcmhvb2QYAiABKAlSDG5laWdoYm9yaG9vZA==');

@$core.Deprecated('Use updateNeighborhoodResponseDescriptor instead')
const UpdateNeighborhoodResponse$json = {
  '1': 'UpdateNeighborhoodResponse',
  '2': [
    {'1': 'user', '3': 1, '4': 1, '5': 11, '6': '.ontheblock.auth.v1.UserResponse', '10': 'user'},
  ],
};

/// Descriptor for `UpdateNeighborhoodResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List updateNeighborhoodResponseDescriptor = $convert.base64Decode(
    'ChpVcGRhdGVOZWlnaGJvcmhvb2RSZXNwb25zZRI0CgR1c2VyGAEgASgLMiAub250aGVibG9jay'
    '5hdXRoLnYxLlVzZXJSZXNwb25zZVIEdXNlcg==');

@$core.Deprecated('Use completeOnboardingRequestDescriptor instead')
const CompleteOnboardingRequest$json = {
  '1': 'CompleteOnboardingRequest',
  '2': [
    {'1': 'user_id', '3': 1, '4': 1, '5': 9, '10': 'userId'},
  ],
};

/// Descriptor for `CompleteOnboardingRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List completeOnboardingRequestDescriptor = $convert.base64Decode(
    'ChlDb21wbGV0ZU9uYm9hcmRpbmdSZXF1ZXN0EhcKB3VzZXJfaWQYASABKAlSBnVzZXJJZA==');

@$core.Deprecated('Use completeOnboardingResponseDescriptor instead')
const CompleteOnboardingResponse$json = {
  '1': 'CompleteOnboardingResponse',
  '2': [
    {'1': 'user', '3': 1, '4': 1, '5': 11, '6': '.ontheblock.auth.v1.UserResponse', '10': 'user'},
  ],
};

/// Descriptor for `CompleteOnboardingResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List completeOnboardingResponseDescriptor = $convert.base64Decode(
    'ChpDb21wbGV0ZU9uYm9hcmRpbmdSZXNwb25zZRI0CgR1c2VyGAEgASgLMiAub250aGVibG9jay'
    '5hdXRoLnYxLlVzZXJSZXNwb25zZVIEdXNlcg==');

@$core.Deprecated('Use rotateKeysRequestDescriptor instead')
const RotateKeysRequest$json = {
  '1': 'RotateKeysRequest',
};

/// Descriptor for `RotateKeysRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List rotateKeysRequestDescriptor = $convert.base64Decode(
    'ChFSb3RhdGVLZXlzUmVxdWVzdA==');

@$core.Deprecated('Use rotateKeysResponseDescriptor instead')
const RotateKeysResponse$json = {
  '1': 'RotateKeysResponse',
  '2': [
    {'1': 'new_kid', '3': 1, '4': 1, '5': 9, '10': 'newKid'},
    {'1': 'public_key_pem', '3': 2, '4': 1, '5': 9, '10': 'publicKeyPem'},
  ],
};

/// Descriptor for `RotateKeysResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List rotateKeysResponseDescriptor = $convert.base64Decode(
    'ChJSb3RhdGVLZXlzUmVzcG9uc2USFwoHbmV3X2tpZBgBIAEoCVIGbmV3S2lkEiQKDnB1YmxpY1'
    '9rZXlfcGVtGAIgASgJUgxwdWJsaWNLZXlQZW0=');

@$core.Deprecated('Use getPublicKeysRequestDescriptor instead')
const GetPublicKeysRequest$json = {
  '1': 'GetPublicKeysRequest',
};

/// Descriptor for `GetPublicKeysRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List getPublicKeysRequestDescriptor = $convert.base64Decode(
    'ChRHZXRQdWJsaWNLZXlzUmVxdWVzdA==');

@$core.Deprecated('Use getPublicKeysResponseDescriptor instead')
const GetPublicKeysResponse$json = {
  '1': 'GetPublicKeysResponse',
  '2': [
    {'1': 'keys', '3': 1, '4': 3, '5': 11, '6': '.ontheblock.auth.v1.PublicKeyEntry', '10': 'keys'},
  ],
};

/// Descriptor for `GetPublicKeysResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List getPublicKeysResponseDescriptor = $convert.base64Decode(
    'ChVHZXRQdWJsaWNLZXlzUmVzcG9uc2USNgoEa2V5cxgBIAMoCzIiLm9udGhlYmxvY2suYXV0aC'
    '52MS5QdWJsaWNLZXlFbnRyeVIEa2V5cw==');

@$core.Deprecated('Use publicKeyEntryDescriptor instead')
const PublicKeyEntry$json = {
  '1': 'PublicKeyEntry',
  '2': [
    {'1': 'kid', '3': 1, '4': 1, '5': 9, '10': 'kid'},
    {'1': 'public_key_pem', '3': 2, '4': 1, '5': 9, '10': 'publicKeyPem'},
    {'1': 'is_current', '3': 3, '4': 1, '5': 8, '10': 'isCurrent'},
  ],
};

/// Descriptor for `PublicKeyEntry`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List publicKeyEntryDescriptor = $convert.base64Decode(
    'Cg5QdWJsaWNLZXlFbnRyeRIQCgNraWQYASABKAlSA2tpZBIkCg5wdWJsaWNfa2V5X3BlbRgCIA'
    'EoCVIMcHVibGljS2V5UGVtEh0KCmlzX2N1cnJlbnQYAyABKAhSCWlzQ3VycmVudA==');

@$core.Deprecated('Use userResponseDescriptor instead')
const UserResponse$json = {
  '1': 'UserResponse',
  '2': [
    {'1': 'user_id', '3': 1, '4': 1, '5': 9, '10': 'userId'},
    {'1': 'email', '3': 2, '4': 1, '5': 9, '10': 'email'},
    {'1': 'nickname', '3': 3, '4': 1, '5': 9, '10': 'nickname'},
    {'1': 'profile_image_url', '3': 4, '4': 1, '5': 9, '10': 'profileImageUrl'},
    {'1': 'role', '3': 5, '4': 1, '5': 14, '6': '.ontheblock.auth.v1.Role', '10': 'role'},
    {'1': 'created_at', '3': 6, '4': 1, '5': 11, '6': '.google.protobuf.Timestamp', '10': 'createdAt'},
    {'1': 'neighborhood', '3': 7, '4': 1, '5': 9, '10': 'neighborhood'},
    {'1': 'alcohol_score', '3': 8, '4': 1, '5': 5, '10': 'alcoholScore'},
    {'1': 'points', '3': 9, '4': 1, '5': 5, '10': 'points'},
    {'1': 'survey_id', '3': 11, '4': 1, '5': 9, '10': 'surveyId'},
    {'1': 'onboarding_completed', '3': 12, '4': 1, '5': 8, '10': 'onboardingCompleted'},
  ],
  '9': [
    {'1': 10, '2': 11},
  ],
};

/// Descriptor for `UserResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List userResponseDescriptor = $convert.base64Decode(
    'CgxVc2VyUmVzcG9uc2USFwoHdXNlcl9pZBgBIAEoCVIGdXNlcklkEhQKBWVtYWlsGAIgASgJUg'
    'VlbWFpbBIaCghuaWNrbmFtZRgDIAEoCVIIbmlja25hbWUSKgoRcHJvZmlsZV9pbWFnZV91cmwY'
    'BCABKAlSD3Byb2ZpbGVJbWFnZVVybBIsCgRyb2xlGAUgASgOMhgub250aGVibG9jay5hdXRoLn'
    'YxLlJvbGVSBHJvbGUSOQoKY3JlYXRlZF9hdBgGIAEoCzIaLmdvb2dsZS5wcm90b2J1Zi5UaW1l'
    'c3RhbXBSCWNyZWF0ZWRBdBIiCgxuZWlnaGJvcmhvb2QYByABKAlSDG5laWdoYm9yaG9vZBIjCg'
    '1hbGNvaG9sX3Njb3JlGAggASgFUgxhbGNvaG9sU2NvcmUSFgoGcG9pbnRzGAkgASgFUgZwb2lu'
    'dHMSGwoJc3VydmV5X2lkGAsgASgJUghzdXJ2ZXlJZBIxChRvbmJvYXJkaW5nX2NvbXBsZXRlZB'
    'gMIAEoCFITb25ib2FyZGluZ0NvbXBsZXRlZEoECAoQCw==');

@$core.Deprecated('Use issueDebugTokenRequestDescriptor instead')
const IssueDebugTokenRequest$json = {
  '1': 'IssueDebugTokenRequest',
  '2': [
    {'1': 'user_id', '3': 1, '4': 1, '5': 9, '10': 'userId'},
  ],
};

/// Descriptor for `IssueDebugTokenRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List issueDebugTokenRequestDescriptor = $convert.base64Decode(
    'ChZJc3N1ZURlYnVnVG9rZW5SZXF1ZXN0EhcKB3VzZXJfaWQYASABKAlSBnVzZXJJZA==');

@$core.Deprecated('Use issueDebugTokenResponseDescriptor instead')
const IssueDebugTokenResponse$json = {
  '1': 'IssueDebugTokenResponse',
  '2': [
    {'1': 'access_token', '3': 1, '4': 1, '5': 9, '10': 'accessToken'},
    {'1': 'user_id', '3': 2, '4': 1, '5': 9, '10': 'userId'},
    {'1': 'expires_at', '3': 3, '4': 1, '5': 11, '6': '.google.protobuf.Timestamp', '10': 'expiresAt'},
  ],
};

/// Descriptor for `IssueDebugTokenResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List issueDebugTokenResponseDescriptor = $convert.base64Decode(
    'ChdJc3N1ZURlYnVnVG9rZW5SZXNwb25zZRIhCgxhY2Nlc3NfdG9rZW4YASABKAlSC2FjY2Vzc1'
    'Rva2VuEhcKB3VzZXJfaWQYAiABKAlSBnVzZXJJZBI5CgpleHBpcmVzX2F0GAMgASgLMhouZ29v'
    'Z2xlLnByb3RvYnVmLlRpbWVzdGFtcFIJZXhwaXJlc0F0');

