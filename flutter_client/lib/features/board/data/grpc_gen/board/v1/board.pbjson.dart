//
//  Generated code. Do not modify.
//  source: board/v1/board.proto
//
// @dart = 2.12

// ignore_for_file: annotate_overrides, camel_case_types, comment_references
// ignore_for_file: constant_identifier_names, library_prefixes
// ignore_for_file: non_constant_identifier_names, prefer_final_fields
// ignore_for_file: unnecessary_import, unnecessary_this, unused_import

import 'dart:convert' as $convert;
import 'dart:core' as $core;
import 'dart:typed_data' as $typed_data;

@$core.Deprecated('Use boardTypeDescriptor instead')
const BoardType$json = {
  '1': 'BoardType',
  '2': [
    {'1': 'BOARD_TYPE_UNSPECIFIED', '2': 0},
    {'1': 'BOARD_TYPE_FREE', '2': 1},
    {'1': 'BOARD_TYPE_FLASH_MEETUP', '2': 2},
    {'1': 'BOARD_TYPE_INFO', '2': 3},
  ],
};

/// Descriptor for `BoardType`. Decode as a `google.protobuf.EnumDescriptorProto`.
final $typed_data.Uint8List boardTypeDescriptor = $convert.base64Decode(
    'CglCb2FyZFR5cGUSGgoWQk9BUkRfVFlQRV9VTlNQRUNJRklFRBAAEhMKD0JPQVJEX1RZUEVfRl'
    'JFRRABEhsKF0JPQVJEX1RZUEVfRkxBU0hfTUVFVFVQEAISEwoPQk9BUkRfVFlQRV9JTkZPEAM=');

@$core.Deprecated('Use reportReasonDescriptor instead')
const ReportReason$json = {
  '1': 'ReportReason',
  '2': [
    {'1': 'REPORT_REASON_UNSPECIFIED', '2': 0},
    {'1': 'REPORT_REASON_SPAM', '2': 1},
    {'1': 'REPORT_REASON_INAPPROPRIATE', '2': 2},
    {'1': 'REPORT_REASON_MISINFORMATION', '2': 3},
    {'1': 'REPORT_REASON_OTHER', '2': 4},
  ],
};

/// Descriptor for `ReportReason`. Decode as a `google.protobuf.EnumDescriptorProto`.
final $typed_data.Uint8List reportReasonDescriptor = $convert.base64Decode(
    'CgxSZXBvcnRSZWFzb24SHQoZUkVQT1JUX1JFQVNPTl9VTlNQRUNJRklFRBAAEhYKElJFUE9SVF'
    '9SRUFTT05fU1BBTRABEh8KG1JFUE9SVF9SRUFTT05fSU5BUFBST1BSSUFURRACEiAKHFJFUE9S'
    'VF9SRUFTT05fTUlTSU5GT1JNQVRJT04QAxIXChNSRVBPUlRfUkVBU09OX09USEVSEAQ=');

@$core.Deprecated('Use locationDescriptor instead')
const Location$json = {
  '1': 'Location',
  '2': [
    {'1': 'name', '3': 1, '4': 1, '5': 9, '10': 'name'},
    {'1': 'latitude', '3': 2, '4': 1, '5': 1, '10': 'latitude'},
    {'1': 'longitude', '3': 3, '4': 1, '5': 1, '10': 'longitude'},
    {'1': 'address', '3': 4, '4': 1, '5': 9, '10': 'address'},
  ],
};

/// Descriptor for `Location`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List locationDescriptor = $convert.base64Decode(
    'CghMb2NhdGlvbhISCgRuYW1lGAEgASgJUgRuYW1lEhoKCGxhdGl0dWRlGAIgASgBUghsYXRpdH'
    'VkZRIcCglsb25naXR1ZGUYAyABKAFSCWxvbmdpdHVkZRIYCgdhZGRyZXNzGAQgASgJUgdhZGRy'
    'ZXNz');

@$core.Deprecated('Use postResponseDescriptor instead')
const PostResponse$json = {
  '1': 'PostResponse',
  '2': [
    {'1': 'post_id', '3': 1, '4': 1, '5': 9, '10': 'postId'},
    {'1': 'board_type', '3': 2, '4': 1, '5': 14, '6': '.ontheblock.board.v1.BoardType', '10': 'boardType'},
    {'1': 'author_id', '3': 3, '4': 1, '5': 9, '10': 'authorId'},
    {'1': 'author_nickname', '3': 4, '4': 1, '5': 9, '10': 'authorNickname'},
    {'1': 'author_profile_image_url', '3': 5, '4': 1, '5': 9, '10': 'authorProfileImageUrl'},
    {'1': 'title', '3': 6, '4': 1, '5': 9, '10': 'title'},
    {'1': 'content', '3': 7, '4': 1, '5': 9, '10': 'content'},
    {'1': 'image_urls', '3': 8, '4': 3, '5': 9, '10': 'imageUrls'},
    {'1': 'like_count', '3': 9, '4': 1, '5': 5, '10': 'likeCount'},
    {'1': 'view_count', '3': 10, '4': 1, '5': 5, '10': 'viewCount'},
    {'1': 'comment_count', '3': 11, '4': 1, '5': 5, '10': 'commentCount'},
    {'1': 'is_notice', '3': 12, '4': 1, '5': 8, '10': 'isNotice'},
    {'1': 'is_liked', '3': 13, '4': 1, '5': 8, '10': 'isLiked'},
    {'1': 'location', '3': 14, '4': 1, '5': 11, '6': '.ontheblock.board.v1.Location', '10': 'location'},
    {'1': 'created_at', '3': 15, '4': 1, '5': 11, '6': '.google.protobuf.Timestamp', '10': 'createdAt'},
    {'1': 'updated_at', '3': 16, '4': 1, '5': 11, '6': '.google.protobuf.Timestamp', '10': 'updatedAt'},
  ],
};

/// Descriptor for `PostResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List postResponseDescriptor = $convert.base64Decode(
    'CgxQb3N0UmVzcG9uc2USFwoHcG9zdF9pZBgBIAEoCVIGcG9zdElkEj0KCmJvYXJkX3R5cGUYAi'
    'ABKA4yHi5vbnRoZWJsb2NrLmJvYXJkLnYxLkJvYXJkVHlwZVIJYm9hcmRUeXBlEhsKCWF1dGhv'
    'cl9pZBgDIAEoCVIIYXV0aG9ySWQSJwoPYXV0aG9yX25pY2tuYW1lGAQgASgJUg5hdXRob3JOaW'
    'NrbmFtZRI3ChhhdXRob3JfcHJvZmlsZV9pbWFnZV91cmwYBSABKAlSFWF1dGhvclByb2ZpbGVJ'
    'bWFnZVVybBIUCgV0aXRsZRgGIAEoCVIFdGl0bGUSGAoHY29udGVudBgHIAEoCVIHY29udGVudB'
    'IdCgppbWFnZV91cmxzGAggAygJUglpbWFnZVVybHMSHQoKbGlrZV9jb3VudBgJIAEoBVIJbGlr'
    'ZUNvdW50Eh0KCnZpZXdfY291bnQYCiABKAVSCXZpZXdDb3VudBIjCg1jb21tZW50X2NvdW50GA'
    'sgASgFUgxjb21tZW50Q291bnQSGwoJaXNfbm90aWNlGAwgASgIUghpc05vdGljZRIZCghpc19s'
    'aWtlZBgNIAEoCFIHaXNMaWtlZBI5Cghsb2NhdGlvbhgOIAEoCzIdLm9udGhlYmxvY2suYm9hcm'
    'QudjEuTG9jYXRpb25SCGxvY2F0aW9uEjkKCmNyZWF0ZWRfYXQYDyABKAsyGi5nb29nbGUucHJv'
    'dG9idWYuVGltZXN0YW1wUgljcmVhdGVkQXQSOQoKdXBkYXRlZF9hdBgQIAEoCzIaLmdvb2dsZS'
    '5wcm90b2J1Zi5UaW1lc3RhbXBSCXVwZGF0ZWRBdA==');

@$core.Deprecated('Use commentResponseDescriptor instead')
const CommentResponse$json = {
  '1': 'CommentResponse',
  '2': [
    {'1': 'comment_id', '3': 1, '4': 1, '5': 9, '10': 'commentId'},
    {'1': 'post_id', '3': 2, '4': 1, '5': 9, '10': 'postId'},
    {'1': 'parent_comment_id', '3': 3, '4': 1, '5': 9, '10': 'parentCommentId'},
    {'1': 'author_id', '3': 4, '4': 1, '5': 9, '10': 'authorId'},
    {'1': 'author_nickname', '3': 5, '4': 1, '5': 9, '10': 'authorNickname'},
    {'1': 'author_profile_image_url', '3': 6, '4': 1, '5': 9, '10': 'authorProfileImageUrl'},
    {'1': 'content', '3': 7, '4': 1, '5': 9, '10': 'content'},
    {'1': 'like_count', '3': 8, '4': 1, '5': 5, '10': 'likeCount'},
    {'1': 'is_liked', '3': 9, '4': 1, '5': 8, '10': 'isLiked'},
    {'1': 'is_deleted', '3': 10, '4': 1, '5': 8, '10': 'isDeleted'},
    {'1': 'replies', '3': 11, '4': 3, '5': 11, '6': '.ontheblock.board.v1.CommentResponse', '10': 'replies'},
    {'1': 'created_at', '3': 12, '4': 1, '5': 11, '6': '.google.protobuf.Timestamp', '10': 'createdAt'},
    {'1': 'updated_at', '3': 13, '4': 1, '5': 11, '6': '.google.protobuf.Timestamp', '10': 'updatedAt'},
  ],
};

/// Descriptor for `CommentResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List commentResponseDescriptor = $convert.base64Decode(
    'Cg9Db21tZW50UmVzcG9uc2USHQoKY29tbWVudF9pZBgBIAEoCVIJY29tbWVudElkEhcKB3Bvc3'
    'RfaWQYAiABKAlSBnBvc3RJZBIqChFwYXJlbnRfY29tbWVudF9pZBgDIAEoCVIPcGFyZW50Q29t'
    'bWVudElkEhsKCWF1dGhvcl9pZBgEIAEoCVIIYXV0aG9ySWQSJwoPYXV0aG9yX25pY2tuYW1lGA'
    'UgASgJUg5hdXRob3JOaWNrbmFtZRI3ChhhdXRob3JfcHJvZmlsZV9pbWFnZV91cmwYBiABKAlS'
    'FWF1dGhvclByb2ZpbGVJbWFnZVVybBIYCgdjb250ZW50GAcgASgJUgdjb250ZW50Eh0KCmxpa2'
    'VfY291bnQYCCABKAVSCWxpa2VDb3VudBIZCghpc19saWtlZBgJIAEoCFIHaXNMaWtlZBIdCgpp'
    'c19kZWxldGVkGAogASgIUglpc0RlbGV0ZWQSPgoHcmVwbGllcxgLIAMoCzIkLm9udGhlYmxvY2'
    'suYm9hcmQudjEuQ29tbWVudFJlc3BvbnNlUgdyZXBsaWVzEjkKCmNyZWF0ZWRfYXQYDCABKAsy'
    'Gi5nb29nbGUucHJvdG9idWYuVGltZXN0YW1wUgljcmVhdGVkQXQSOQoKdXBkYXRlZF9hdBgNIA'
    'EoCzIaLmdvb2dsZS5wcm90b2J1Zi5UaW1lc3RhbXBSCXVwZGF0ZWRBdA==');

@$core.Deprecated('Use createPostRequestDescriptor instead')
const CreatePostRequest$json = {
  '1': 'CreatePostRequest',
  '2': [
    {'1': 'user_id', '3': 1, '4': 1, '5': 9, '10': 'userId'},
    {'1': 'board_type', '3': 2, '4': 1, '5': 14, '6': '.ontheblock.board.v1.BoardType', '10': 'boardType'},
    {'1': 'title', '3': 3, '4': 1, '5': 9, '10': 'title'},
    {'1': 'content', '3': 4, '4': 1, '5': 9, '10': 'content'},
    {'1': 'image_urls', '3': 5, '4': 3, '5': 9, '10': 'imageUrls'},
    {'1': 'location', '3': 6, '4': 1, '5': 11, '6': '.ontheblock.board.v1.Location', '10': 'location'},
  ],
};

/// Descriptor for `CreatePostRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List createPostRequestDescriptor = $convert.base64Decode(
    'ChFDcmVhdGVQb3N0UmVxdWVzdBIXCgd1c2VyX2lkGAEgASgJUgZ1c2VySWQSPQoKYm9hcmRfdH'
    'lwZRgCIAEoDjIeLm9udGhlYmxvY2suYm9hcmQudjEuQm9hcmRUeXBlUglib2FyZFR5cGUSFAoF'
    'dGl0bGUYAyABKAlSBXRpdGxlEhgKB2NvbnRlbnQYBCABKAlSB2NvbnRlbnQSHQoKaW1hZ2VfdX'
    'JscxgFIAMoCVIJaW1hZ2VVcmxzEjkKCGxvY2F0aW9uGAYgASgLMh0ub250aGVibG9jay5ib2Fy'
    'ZC52MS5Mb2NhdGlvblIIbG9jYXRpb24=');

@$core.Deprecated('Use createPostResponseDescriptor instead')
const CreatePostResponse$json = {
  '1': 'CreatePostResponse',
  '2': [
    {'1': 'post', '3': 1, '4': 1, '5': 11, '6': '.ontheblock.board.v1.PostResponse', '10': 'post'},
  ],
};

/// Descriptor for `CreatePostResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List createPostResponseDescriptor = $convert.base64Decode(
    'ChJDcmVhdGVQb3N0UmVzcG9uc2USNQoEcG9zdBgBIAEoCzIhLm9udGhlYmxvY2suYm9hcmQudj'
    'EuUG9zdFJlc3BvbnNlUgRwb3N0');

@$core.Deprecated('Use getPostRequestDescriptor instead')
const GetPostRequest$json = {
  '1': 'GetPostRequest',
  '2': [
    {'1': 'post_id', '3': 1, '4': 1, '5': 9, '10': 'postId'},
    {'1': 'user_id', '3': 2, '4': 1, '5': 9, '10': 'userId'},
  ],
};

/// Descriptor for `GetPostRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List getPostRequestDescriptor = $convert.base64Decode(
    'Cg5HZXRQb3N0UmVxdWVzdBIXCgdwb3N0X2lkGAEgASgJUgZwb3N0SWQSFwoHdXNlcl9pZBgCIA'
    'EoCVIGdXNlcklk');

@$core.Deprecated('Use getPostResponseDescriptor instead')
const GetPostResponse$json = {
  '1': 'GetPostResponse',
  '2': [
    {'1': 'post', '3': 1, '4': 1, '5': 11, '6': '.ontheblock.board.v1.PostResponse', '10': 'post'},
  ],
};

/// Descriptor for `GetPostResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List getPostResponseDescriptor = $convert.base64Decode(
    'Cg9HZXRQb3N0UmVzcG9uc2USNQoEcG9zdBgBIAEoCzIhLm9udGhlYmxvY2suYm9hcmQudjEuUG'
    '9zdFJlc3BvbnNlUgRwb3N0');

@$core.Deprecated('Use updatePostRequestDescriptor instead')
const UpdatePostRequest$json = {
  '1': 'UpdatePostRequest',
  '2': [
    {'1': 'post_id', '3': 1, '4': 1, '5': 9, '10': 'postId'},
    {'1': 'user_id', '3': 2, '4': 1, '5': 9, '10': 'userId'},
    {'1': 'title', '3': 3, '4': 1, '5': 9, '9': 0, '10': 'title', '17': true},
    {'1': 'content', '3': 4, '4': 1, '5': 9, '9': 1, '10': 'content', '17': true},
    {'1': 'update_images', '3': 5, '4': 1, '5': 8, '10': 'updateImages'},
    {'1': 'image_urls', '3': 6, '4': 3, '5': 9, '10': 'imageUrls'},
    {'1': 'update_location', '3': 7, '4': 1, '5': 8, '10': 'updateLocation'},
    {'1': 'location', '3': 8, '4': 1, '5': 11, '6': '.ontheblock.board.v1.Location', '10': 'location'},
  ],
  '8': [
    {'1': '_title'},
    {'1': '_content'},
  ],
};

/// Descriptor for `UpdatePostRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List updatePostRequestDescriptor = $convert.base64Decode(
    'ChFVcGRhdGVQb3N0UmVxdWVzdBIXCgdwb3N0X2lkGAEgASgJUgZwb3N0SWQSFwoHdXNlcl9pZB'
    'gCIAEoCVIGdXNlcklkEhkKBXRpdGxlGAMgASgJSABSBXRpdGxliAEBEh0KB2NvbnRlbnQYBCAB'
    'KAlIAVIHY29udGVudIgBARIjCg11cGRhdGVfaW1hZ2VzGAUgASgIUgx1cGRhdGVJbWFnZXMSHQ'
    'oKaW1hZ2VfdXJscxgGIAMoCVIJaW1hZ2VVcmxzEicKD3VwZGF0ZV9sb2NhdGlvbhgHIAEoCFIO'
    'dXBkYXRlTG9jYXRpb24SOQoIbG9jYXRpb24YCCABKAsyHS5vbnRoZWJsb2NrLmJvYXJkLnYxLk'
    'xvY2F0aW9uUghsb2NhdGlvbkIICgZfdGl0bGVCCgoIX2NvbnRlbnQ=');

@$core.Deprecated('Use updatePostResponseDescriptor instead')
const UpdatePostResponse$json = {
  '1': 'UpdatePostResponse',
  '2': [
    {'1': 'post', '3': 1, '4': 1, '5': 11, '6': '.ontheblock.board.v1.PostResponse', '10': 'post'},
  ],
};

/// Descriptor for `UpdatePostResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List updatePostResponseDescriptor = $convert.base64Decode(
    'ChJVcGRhdGVQb3N0UmVzcG9uc2USNQoEcG9zdBgBIAEoCzIhLm9udGhlYmxvY2suYm9hcmQudj'
    'EuUG9zdFJlc3BvbnNlUgRwb3N0');

@$core.Deprecated('Use deletePostRequestDescriptor instead')
const DeletePostRequest$json = {
  '1': 'DeletePostRequest',
  '2': [
    {'1': 'post_id', '3': 1, '4': 1, '5': 9, '10': 'postId'},
    {'1': 'user_id', '3': 2, '4': 1, '5': 9, '10': 'userId'},
  ],
};

/// Descriptor for `DeletePostRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List deletePostRequestDescriptor = $convert.base64Decode(
    'ChFEZWxldGVQb3N0UmVxdWVzdBIXCgdwb3N0X2lkGAEgASgJUgZwb3N0SWQSFwoHdXNlcl9pZB'
    'gCIAEoCVIGdXNlcklk');

@$core.Deprecated('Use deletePostResponseDescriptor instead')
const DeletePostResponse$json = {
  '1': 'DeletePostResponse',
};

/// Descriptor for `DeletePostResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List deletePostResponseDescriptor = $convert.base64Decode(
    'ChJEZWxldGVQb3N0UmVzcG9uc2U=');

@$core.Deprecated('Use listPostsRequestDescriptor instead')
const ListPostsRequest$json = {
  '1': 'ListPostsRequest',
  '2': [
    {'1': 'board_type', '3': 1, '4': 1, '5': 14, '6': '.ontheblock.board.v1.BoardType', '10': 'boardType'},
    {'1': 'query', '3': 2, '4': 1, '5': 9, '10': 'query'},
    {'1': 'user_id', '3': 3, '4': 1, '5': 9, '10': 'userId'},
    {'1': 'pagination', '3': 4, '4': 1, '5': 11, '6': '.ontheblock.common.v1.PaginationRequest', '10': 'pagination'},
  ],
};

/// Descriptor for `ListPostsRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List listPostsRequestDescriptor = $convert.base64Decode(
    'ChBMaXN0UG9zdHNSZXF1ZXN0Ej0KCmJvYXJkX3R5cGUYASABKA4yHi5vbnRoZWJsb2NrLmJvYX'
    'JkLnYxLkJvYXJkVHlwZVIJYm9hcmRUeXBlEhQKBXF1ZXJ5GAIgASgJUgVxdWVyeRIXCgd1c2Vy'
    'X2lkGAMgASgJUgZ1c2VySWQSRwoKcGFnaW5hdGlvbhgEIAEoCzInLm9udGhlYmxvY2suY29tbW'
    '9uLnYxLlBhZ2luYXRpb25SZXF1ZXN0UgpwYWdpbmF0aW9u');

@$core.Deprecated('Use listPostsResponseDescriptor instead')
const ListPostsResponse$json = {
  '1': 'ListPostsResponse',
  '2': [
    {'1': 'posts', '3': 1, '4': 3, '5': 11, '6': '.ontheblock.board.v1.PostResponse', '10': 'posts'},
    {'1': 'pagination', '3': 2, '4': 1, '5': 11, '6': '.ontheblock.common.v1.PaginationResponse', '10': 'pagination'},
  ],
};

/// Descriptor for `ListPostsResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List listPostsResponseDescriptor = $convert.base64Decode(
    'ChFMaXN0UG9zdHNSZXNwb25zZRI3CgVwb3N0cxgBIAMoCzIhLm9udGhlYmxvY2suYm9hcmQudj'
    'EuUG9zdFJlc3BvbnNlUgVwb3N0cxJICgpwYWdpbmF0aW9uGAIgASgLMigub250aGVibG9jay5j'
    'b21tb24udjEuUGFnaW5hdGlvblJlc3BvbnNlUgpwYWdpbmF0aW9u');

@$core.Deprecated('Use likePostRequestDescriptor instead')
const LikePostRequest$json = {
  '1': 'LikePostRequest',
  '2': [
    {'1': 'post_id', '3': 1, '4': 1, '5': 9, '10': 'postId'},
    {'1': 'user_id', '3': 2, '4': 1, '5': 9, '10': 'userId'},
  ],
};

/// Descriptor for `LikePostRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List likePostRequestDescriptor = $convert.base64Decode(
    'Cg9MaWtlUG9zdFJlcXVlc3QSFwoHcG9zdF9pZBgBIAEoCVIGcG9zdElkEhcKB3VzZXJfaWQYAi'
    'ABKAlSBnVzZXJJZA==');

@$core.Deprecated('Use likePostResponseDescriptor instead')
const LikePostResponse$json = {
  '1': 'LikePostResponse',
  '2': [
    {'1': 'liked', '3': 1, '4': 1, '5': 8, '10': 'liked'},
    {'1': 'like_count', '3': 2, '4': 1, '5': 5, '10': 'likeCount'},
  ],
};

/// Descriptor for `LikePostResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List likePostResponseDescriptor = $convert.base64Decode(
    'ChBMaWtlUG9zdFJlc3BvbnNlEhQKBWxpa2VkGAEgASgIUgVsaWtlZBIdCgpsaWtlX2NvdW50GA'
    'IgASgFUglsaWtlQ291bnQ=');

@$core.Deprecated('Use pinPostRequestDescriptor instead')
const PinPostRequest$json = {
  '1': 'PinPostRequest',
  '2': [
    {'1': 'post_id', '3': 1, '4': 1, '5': 9, '10': 'postId'},
    {'1': 'user_id', '3': 2, '4': 1, '5': 9, '10': 'userId'},
    {'1': 'pin', '3': 3, '4': 1, '5': 8, '10': 'pin'},
  ],
};

/// Descriptor for `PinPostRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List pinPostRequestDescriptor = $convert.base64Decode(
    'Cg5QaW5Qb3N0UmVxdWVzdBIXCgdwb3N0X2lkGAEgASgJUgZwb3N0SWQSFwoHdXNlcl9pZBgCIA'
    'EoCVIGdXNlcklkEhAKA3BpbhgDIAEoCFIDcGlu');

@$core.Deprecated('Use pinPostResponseDescriptor instead')
const PinPostResponse$json = {
  '1': 'PinPostResponse',
  '2': [
    {'1': 'is_notice', '3': 1, '4': 1, '5': 8, '10': 'isNotice'},
  ],
};

/// Descriptor for `PinPostResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List pinPostResponseDescriptor = $convert.base64Decode(
    'Cg9QaW5Qb3N0UmVzcG9uc2USGwoJaXNfbm90aWNlGAEgASgIUghpc05vdGljZQ==');

@$core.Deprecated('Use createCommentRequestDescriptor instead')
const CreateCommentRequest$json = {
  '1': 'CreateCommentRequest',
  '2': [
    {'1': 'post_id', '3': 1, '4': 1, '5': 9, '10': 'postId'},
    {'1': 'user_id', '3': 2, '4': 1, '5': 9, '10': 'userId'},
    {'1': 'parent_comment_id', '3': 3, '4': 1, '5': 9, '10': 'parentCommentId'},
    {'1': 'content', '3': 4, '4': 1, '5': 9, '10': 'content'},
  ],
};

/// Descriptor for `CreateCommentRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List createCommentRequestDescriptor = $convert.base64Decode(
    'ChRDcmVhdGVDb21tZW50UmVxdWVzdBIXCgdwb3N0X2lkGAEgASgJUgZwb3N0SWQSFwoHdXNlcl'
    '9pZBgCIAEoCVIGdXNlcklkEioKEXBhcmVudF9jb21tZW50X2lkGAMgASgJUg9wYXJlbnRDb21t'
    'ZW50SWQSGAoHY29udGVudBgEIAEoCVIHY29udGVudA==');

@$core.Deprecated('Use createCommentResponseDescriptor instead')
const CreateCommentResponse$json = {
  '1': 'CreateCommentResponse',
  '2': [
    {'1': 'comment', '3': 1, '4': 1, '5': 11, '6': '.ontheblock.board.v1.CommentResponse', '10': 'comment'},
  ],
};

/// Descriptor for `CreateCommentResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List createCommentResponseDescriptor = $convert.base64Decode(
    'ChVDcmVhdGVDb21tZW50UmVzcG9uc2USPgoHY29tbWVudBgBIAEoCzIkLm9udGhlYmxvY2suYm'
    '9hcmQudjEuQ29tbWVudFJlc3BvbnNlUgdjb21tZW50');

@$core.Deprecated('Use updateCommentRequestDescriptor instead')
const UpdateCommentRequest$json = {
  '1': 'UpdateCommentRequest',
  '2': [
    {'1': 'comment_id', '3': 1, '4': 1, '5': 9, '10': 'commentId'},
    {'1': 'user_id', '3': 2, '4': 1, '5': 9, '10': 'userId'},
    {'1': 'content', '3': 3, '4': 1, '5': 9, '10': 'content'},
  ],
};

/// Descriptor for `UpdateCommentRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List updateCommentRequestDescriptor = $convert.base64Decode(
    'ChRVcGRhdGVDb21tZW50UmVxdWVzdBIdCgpjb21tZW50X2lkGAEgASgJUgljb21tZW50SWQSFw'
    'oHdXNlcl9pZBgCIAEoCVIGdXNlcklkEhgKB2NvbnRlbnQYAyABKAlSB2NvbnRlbnQ=');

@$core.Deprecated('Use updateCommentResponseDescriptor instead')
const UpdateCommentResponse$json = {
  '1': 'UpdateCommentResponse',
  '2': [
    {'1': 'comment', '3': 1, '4': 1, '5': 11, '6': '.ontheblock.board.v1.CommentResponse', '10': 'comment'},
  ],
};

/// Descriptor for `UpdateCommentResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List updateCommentResponseDescriptor = $convert.base64Decode(
    'ChVVcGRhdGVDb21tZW50UmVzcG9uc2USPgoHY29tbWVudBgBIAEoCzIkLm9udGhlYmxvY2suYm'
    '9hcmQudjEuQ29tbWVudFJlc3BvbnNlUgdjb21tZW50');

@$core.Deprecated('Use deleteCommentRequestDescriptor instead')
const DeleteCommentRequest$json = {
  '1': 'DeleteCommentRequest',
  '2': [
    {'1': 'comment_id', '3': 1, '4': 1, '5': 9, '10': 'commentId'},
    {'1': 'user_id', '3': 2, '4': 1, '5': 9, '10': 'userId'},
  ],
};

/// Descriptor for `DeleteCommentRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List deleteCommentRequestDescriptor = $convert.base64Decode(
    'ChREZWxldGVDb21tZW50UmVxdWVzdBIdCgpjb21tZW50X2lkGAEgASgJUgljb21tZW50SWQSFw'
    'oHdXNlcl9pZBgCIAEoCVIGdXNlcklk');

@$core.Deprecated('Use deleteCommentResponseDescriptor instead')
const DeleteCommentResponse$json = {
  '1': 'DeleteCommentResponse',
};

/// Descriptor for `DeleteCommentResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List deleteCommentResponseDescriptor = $convert.base64Decode(
    'ChVEZWxldGVDb21tZW50UmVzcG9uc2U=');

@$core.Deprecated('Use listCommentsRequestDescriptor instead')
const ListCommentsRequest$json = {
  '1': 'ListCommentsRequest',
  '2': [
    {'1': 'post_id', '3': 1, '4': 1, '5': 9, '10': 'postId'},
    {'1': 'user_id', '3': 2, '4': 1, '5': 9, '10': 'userId'},
    {'1': 'pagination', '3': 3, '4': 1, '5': 11, '6': '.ontheblock.common.v1.PaginationRequest', '10': 'pagination'},
  ],
};

/// Descriptor for `ListCommentsRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List listCommentsRequestDescriptor = $convert.base64Decode(
    'ChNMaXN0Q29tbWVudHNSZXF1ZXN0EhcKB3Bvc3RfaWQYASABKAlSBnBvc3RJZBIXCgd1c2VyX2'
    'lkGAIgASgJUgZ1c2VySWQSRwoKcGFnaW5hdGlvbhgDIAEoCzInLm9udGhlYmxvY2suY29tbW9u'
    'LnYxLlBhZ2luYXRpb25SZXF1ZXN0UgpwYWdpbmF0aW9u');

@$core.Deprecated('Use listCommentsResponseDescriptor instead')
const ListCommentsResponse$json = {
  '1': 'ListCommentsResponse',
  '2': [
    {'1': 'comments', '3': 1, '4': 3, '5': 11, '6': '.ontheblock.board.v1.CommentResponse', '10': 'comments'},
    {'1': 'pagination', '3': 2, '4': 1, '5': 11, '6': '.ontheblock.common.v1.PaginationResponse', '10': 'pagination'},
  ],
};

/// Descriptor for `ListCommentsResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List listCommentsResponseDescriptor = $convert.base64Decode(
    'ChRMaXN0Q29tbWVudHNSZXNwb25zZRJACghjb21tZW50cxgBIAMoCzIkLm9udGhlYmxvY2suYm'
    '9hcmQudjEuQ29tbWVudFJlc3BvbnNlUghjb21tZW50cxJICgpwYWdpbmF0aW9uGAIgASgLMigu'
    'b250aGVibG9jay5jb21tb24udjEuUGFnaW5hdGlvblJlc3BvbnNlUgpwYWdpbmF0aW9u');

@$core.Deprecated('Use likeCommentRequestDescriptor instead')
const LikeCommentRequest$json = {
  '1': 'LikeCommentRequest',
  '2': [
    {'1': 'comment_id', '3': 1, '4': 1, '5': 9, '10': 'commentId'},
    {'1': 'user_id', '3': 2, '4': 1, '5': 9, '10': 'userId'},
  ],
};

/// Descriptor for `LikeCommentRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List likeCommentRequestDescriptor = $convert.base64Decode(
    'ChJMaWtlQ29tbWVudFJlcXVlc3QSHQoKY29tbWVudF9pZBgBIAEoCVIJY29tbWVudElkEhcKB3'
    'VzZXJfaWQYAiABKAlSBnVzZXJJZA==');

@$core.Deprecated('Use likeCommentResponseDescriptor instead')
const LikeCommentResponse$json = {
  '1': 'LikeCommentResponse',
  '2': [
    {'1': 'liked', '3': 1, '4': 1, '5': 8, '10': 'liked'},
    {'1': 'like_count', '3': 2, '4': 1, '5': 5, '10': 'likeCount'},
  ],
};

/// Descriptor for `LikeCommentResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List likeCommentResponseDescriptor = $convert.base64Decode(
    'ChNMaWtlQ29tbWVudFJlc3BvbnNlEhQKBWxpa2VkGAEgASgIUgVsaWtlZBIdCgpsaWtlX2NvdW'
    '50GAIgASgFUglsaWtlQ291bnQ=');

@$core.Deprecated('Use reportPostRequestDescriptor instead')
const ReportPostRequest$json = {
  '1': 'ReportPostRequest',
  '2': [
    {'1': 'post_id', '3': 1, '4': 1, '5': 9, '10': 'postId'},
    {'1': 'reporter_id', '3': 2, '4': 1, '5': 9, '10': 'reporterId'},
    {'1': 'reason', '3': 3, '4': 1, '5': 14, '6': '.ontheblock.board.v1.ReportReason', '10': 'reason'},
    {'1': 'detail', '3': 4, '4': 1, '5': 9, '10': 'detail'},
  ],
};

/// Descriptor for `ReportPostRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List reportPostRequestDescriptor = $convert.base64Decode(
    'ChFSZXBvcnRQb3N0UmVxdWVzdBIXCgdwb3N0X2lkGAEgASgJUgZwb3N0SWQSHwoLcmVwb3J0ZX'
    'JfaWQYAiABKAlSCnJlcG9ydGVySWQSOQoGcmVhc29uGAMgASgOMiEub250aGVibG9jay5ib2Fy'
    'ZC52MS5SZXBvcnRSZWFzb25SBnJlYXNvbhIWCgZkZXRhaWwYBCABKAlSBmRldGFpbA==');

@$core.Deprecated('Use reportPostResponseDescriptor instead')
const ReportPostResponse$json = {
  '1': 'ReportPostResponse',
};

/// Descriptor for `ReportPostResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List reportPostResponseDescriptor = $convert.base64Decode(
    'ChJSZXBvcnRQb3N0UmVzcG9uc2U=');

@$core.Deprecated('Use reportCommentRequestDescriptor instead')
const ReportCommentRequest$json = {
  '1': 'ReportCommentRequest',
  '2': [
    {'1': 'comment_id', '3': 1, '4': 1, '5': 9, '10': 'commentId'},
    {'1': 'reporter_id', '3': 2, '4': 1, '5': 9, '10': 'reporterId'},
    {'1': 'reason', '3': 3, '4': 1, '5': 14, '6': '.ontheblock.board.v1.ReportReason', '10': 'reason'},
    {'1': 'detail', '3': 4, '4': 1, '5': 9, '10': 'detail'},
  ],
};

/// Descriptor for `ReportCommentRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List reportCommentRequestDescriptor = $convert.base64Decode(
    'ChRSZXBvcnRDb21tZW50UmVxdWVzdBIdCgpjb21tZW50X2lkGAEgASgJUgljb21tZW50SWQSHw'
    'oLcmVwb3J0ZXJfaWQYAiABKAlSCnJlcG9ydGVySWQSOQoGcmVhc29uGAMgASgOMiEub250aGVi'
    'bG9jay5ib2FyZC52MS5SZXBvcnRSZWFzb25SBnJlYXNvbhIWCgZkZXRhaWwYBCABKAlSBmRldG'
    'FpbA==');

@$core.Deprecated('Use reportCommentResponseDescriptor instead')
const ReportCommentResponse$json = {
  '1': 'ReportCommentResponse',
};

/// Descriptor for `ReportCommentResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List reportCommentResponseDescriptor = $convert.base64Decode(
    'ChVSZXBvcnRDb21tZW50UmVzcG9uc2U=');

