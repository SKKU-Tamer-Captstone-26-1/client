//
//  Generated code. Do not modify.
//  source: board/v1/board.proto
//
// @dart = 2.12

// ignore_for_file: annotate_overrides, camel_case_types, comment_references
// ignore_for_file: constant_identifier_names, library_prefixes
// ignore_for_file: non_constant_identifier_names, prefer_final_fields
// ignore_for_file: unnecessary_import, unnecessary_this, unused_import

import 'dart:core' as $core;

import 'package:protobuf/protobuf.dart' as $pb;

import '../../common/v1/common.pb.dart' as $2;
import '../../google/protobuf/timestamp.pb.dart' as $1;
import 'board.pbenum.dart';

export 'board.pbenum.dart';

/// Location is used primarily for BOARD_TYPE_FLASH_MEETUP.
/// Fields are intentionally loose; to be refined as the meetup feature matures.
class Location extends $pb.GeneratedMessage {
  factory Location({
    $core.String? name,
    $core.double? latitude,
    $core.double? longitude,
    $core.String? address,
  }) {
    final $result = create();
    if (name != null) {
      $result.name = name;
    }
    if (latitude != null) {
      $result.latitude = latitude;
    }
    if (longitude != null) {
      $result.longitude = longitude;
    }
    if (address != null) {
      $result.address = address;
    }
    return $result;
  }
  Location._() : super();
  factory Location.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory Location.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'Location', package: const $pb.PackageName(_omitMessageNames ? '' : 'ontheblock.board.v1'), createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'name')
    ..a<$core.double>(2, _omitFieldNames ? '' : 'latitude', $pb.PbFieldType.OD)
    ..a<$core.double>(3, _omitFieldNames ? '' : 'longitude', $pb.PbFieldType.OD)
    ..aOS(4, _omitFieldNames ? '' : 'address')
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  Location clone() => Location()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  Location copyWith(void Function(Location) updates) => super.copyWith((message) => updates(message as Location)) as Location;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static Location create() => Location._();
  Location createEmptyInstance() => create();
  static $pb.PbList<Location> createRepeated() => $pb.PbList<Location>();
  @$core.pragma('dart2js:noInline')
  static Location getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<Location>(create);
  static Location? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get name => $_getSZ(0);
  @$pb.TagNumber(1)
  set name($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasName() => $_has(0);
  @$pb.TagNumber(1)
  void clearName() => clearField(1);

  @$pb.TagNumber(2)
  $core.double get latitude => $_getN(1);
  @$pb.TagNumber(2)
  set latitude($core.double v) { $_setDouble(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasLatitude() => $_has(1);
  @$pb.TagNumber(2)
  void clearLatitude() => clearField(2);

  @$pb.TagNumber(3)
  $core.double get longitude => $_getN(2);
  @$pb.TagNumber(3)
  set longitude($core.double v) { $_setDouble(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasLongitude() => $_has(2);
  @$pb.TagNumber(3)
  void clearLongitude() => clearField(3);

  @$pb.TagNumber(4)
  $core.String get address => $_getSZ(3);
  @$pb.TagNumber(4)
  set address($core.String v) { $_setString(3, v); }
  @$pb.TagNumber(4)
  $core.bool hasAddress() => $_has(3);
  @$pb.TagNumber(4)
  void clearAddress() => clearField(4);
}

class PostResponse extends $pb.GeneratedMessage {
  factory PostResponse({
    $core.String? postId,
    BoardType? boardType,
    $core.String? authorId,
    $core.String? authorNickname,
    $core.String? authorProfileImageUrl,
    $core.String? title,
    $core.String? content,
    $core.Iterable<$core.String>? imageUrls,
    $core.int? likeCount,
    $core.int? viewCount,
    $core.int? commentCount,
    $core.bool? isNotice,
    $core.bool? isLiked,
    Location? location,
    $1.Timestamp? createdAt,
    $1.Timestamp? updatedAt,
  }) {
    final $result = create();
    if (postId != null) {
      $result.postId = postId;
    }
    if (boardType != null) {
      $result.boardType = boardType;
    }
    if (authorId != null) {
      $result.authorId = authorId;
    }
    if (authorNickname != null) {
      $result.authorNickname = authorNickname;
    }
    if (authorProfileImageUrl != null) {
      $result.authorProfileImageUrl = authorProfileImageUrl;
    }
    if (title != null) {
      $result.title = title;
    }
    if (content != null) {
      $result.content = content;
    }
    if (imageUrls != null) {
      $result.imageUrls.addAll(imageUrls);
    }
    if (likeCount != null) {
      $result.likeCount = likeCount;
    }
    if (viewCount != null) {
      $result.viewCount = viewCount;
    }
    if (commentCount != null) {
      $result.commentCount = commentCount;
    }
    if (isNotice != null) {
      $result.isNotice = isNotice;
    }
    if (isLiked != null) {
      $result.isLiked = isLiked;
    }
    if (location != null) {
      $result.location = location;
    }
    if (createdAt != null) {
      $result.createdAt = createdAt;
    }
    if (updatedAt != null) {
      $result.updatedAt = updatedAt;
    }
    return $result;
  }
  PostResponse._() : super();
  factory PostResponse.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory PostResponse.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'PostResponse', package: const $pb.PackageName(_omitMessageNames ? '' : 'ontheblock.board.v1'), createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'postId')
    ..e<BoardType>(2, _omitFieldNames ? '' : 'boardType', $pb.PbFieldType.OE, defaultOrMaker: BoardType.BOARD_TYPE_UNSPECIFIED, valueOf: BoardType.valueOf, enumValues: BoardType.values)
    ..aOS(3, _omitFieldNames ? '' : 'authorId')
    ..aOS(4, _omitFieldNames ? '' : 'authorNickname')
    ..aOS(5, _omitFieldNames ? '' : 'authorProfileImageUrl')
    ..aOS(6, _omitFieldNames ? '' : 'title')
    ..aOS(7, _omitFieldNames ? '' : 'content')
    ..pPS(8, _omitFieldNames ? '' : 'imageUrls')
    ..a<$core.int>(9, _omitFieldNames ? '' : 'likeCount', $pb.PbFieldType.O3)
    ..a<$core.int>(10, _omitFieldNames ? '' : 'viewCount', $pb.PbFieldType.O3)
    ..a<$core.int>(11, _omitFieldNames ? '' : 'commentCount', $pb.PbFieldType.O3)
    ..aOB(12, _omitFieldNames ? '' : 'isNotice')
    ..aOB(13, _omitFieldNames ? '' : 'isLiked')
    ..aOM<Location>(14, _omitFieldNames ? '' : 'location', subBuilder: Location.create)
    ..aOM<$1.Timestamp>(15, _omitFieldNames ? '' : 'createdAt', subBuilder: $1.Timestamp.create)
    ..aOM<$1.Timestamp>(16, _omitFieldNames ? '' : 'updatedAt', subBuilder: $1.Timestamp.create)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  PostResponse clone() => PostResponse()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  PostResponse copyWith(void Function(PostResponse) updates) => super.copyWith((message) => updates(message as PostResponse)) as PostResponse;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static PostResponse create() => PostResponse._();
  PostResponse createEmptyInstance() => create();
  static $pb.PbList<PostResponse> createRepeated() => $pb.PbList<PostResponse>();
  @$core.pragma('dart2js:noInline')
  static PostResponse getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<PostResponse>(create);
  static PostResponse? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get postId => $_getSZ(0);
  @$pb.TagNumber(1)
  set postId($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasPostId() => $_has(0);
  @$pb.TagNumber(1)
  void clearPostId() => clearField(1);

  @$pb.TagNumber(2)
  BoardType get boardType => $_getN(1);
  @$pb.TagNumber(2)
  set boardType(BoardType v) { setField(2, v); }
  @$pb.TagNumber(2)
  $core.bool hasBoardType() => $_has(1);
  @$pb.TagNumber(2)
  void clearBoardType() => clearField(2);

  @$pb.TagNumber(3)
  $core.String get authorId => $_getSZ(2);
  @$pb.TagNumber(3)
  set authorId($core.String v) { $_setString(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasAuthorId() => $_has(2);
  @$pb.TagNumber(3)
  void clearAuthorId() => clearField(3);

  @$pb.TagNumber(4)
  $core.String get authorNickname => $_getSZ(3);
  @$pb.TagNumber(4)
  set authorNickname($core.String v) { $_setString(3, v); }
  @$pb.TagNumber(4)
  $core.bool hasAuthorNickname() => $_has(3);
  @$pb.TagNumber(4)
  void clearAuthorNickname() => clearField(4);

  @$pb.TagNumber(5)
  $core.String get authorProfileImageUrl => $_getSZ(4);
  @$pb.TagNumber(5)
  set authorProfileImageUrl($core.String v) { $_setString(4, v); }
  @$pb.TagNumber(5)
  $core.bool hasAuthorProfileImageUrl() => $_has(4);
  @$pb.TagNumber(5)
  void clearAuthorProfileImageUrl() => clearField(5);

  @$pb.TagNumber(6)
  $core.String get title => $_getSZ(5);
  @$pb.TagNumber(6)
  set title($core.String v) { $_setString(5, v); }
  @$pb.TagNumber(6)
  $core.bool hasTitle() => $_has(5);
  @$pb.TagNumber(6)
  void clearTitle() => clearField(6);

  @$pb.TagNumber(7)
  $core.String get content => $_getSZ(6);
  @$pb.TagNumber(7)
  set content($core.String v) { $_setString(6, v); }
  @$pb.TagNumber(7)
  $core.bool hasContent() => $_has(6);
  @$pb.TagNumber(7)
  void clearContent() => clearField(7);

  @$pb.TagNumber(8)
  $core.List<$core.String> get imageUrls => $_getList(7);

  @$pb.TagNumber(9)
  $core.int get likeCount => $_getIZ(8);
  @$pb.TagNumber(9)
  set likeCount($core.int v) { $_setSignedInt32(8, v); }
  @$pb.TagNumber(9)
  $core.bool hasLikeCount() => $_has(8);
  @$pb.TagNumber(9)
  void clearLikeCount() => clearField(9);

  @$pb.TagNumber(10)
  $core.int get viewCount => $_getIZ(9);
  @$pb.TagNumber(10)
  set viewCount($core.int v) { $_setSignedInt32(9, v); }
  @$pb.TagNumber(10)
  $core.bool hasViewCount() => $_has(9);
  @$pb.TagNumber(10)
  void clearViewCount() => clearField(10);

  @$pb.TagNumber(11)
  $core.int get commentCount => $_getIZ(10);
  @$pb.TagNumber(11)
  set commentCount($core.int v) { $_setSignedInt32(10, v); }
  @$pb.TagNumber(11)
  $core.bool hasCommentCount() => $_has(10);
  @$pb.TagNumber(11)
  void clearCommentCount() => clearField(11);

  @$pb.TagNumber(12)
  $core.bool get isNotice => $_getBF(11);
  @$pb.TagNumber(12)
  set isNotice($core.bool v) { $_setBool(11, v); }
  @$pb.TagNumber(12)
  $core.bool hasIsNotice() => $_has(11);
  @$pb.TagNumber(12)
  void clearIsNotice() => clearField(12);

  @$pb.TagNumber(13)
  $core.bool get isLiked => $_getBF(12);
  @$pb.TagNumber(13)
  set isLiked($core.bool v) { $_setBool(12, v); }
  @$pb.TagNumber(13)
  $core.bool hasIsLiked() => $_has(12);
  @$pb.TagNumber(13)
  void clearIsLiked() => clearField(13);

  @$pb.TagNumber(14)
  Location get location => $_getN(13);
  @$pb.TagNumber(14)
  set location(Location v) { setField(14, v); }
  @$pb.TagNumber(14)
  $core.bool hasLocation() => $_has(13);
  @$pb.TagNumber(14)
  void clearLocation() => clearField(14);
  @$pb.TagNumber(14)
  Location ensureLocation() => $_ensure(13);

  @$pb.TagNumber(15)
  $1.Timestamp get createdAt => $_getN(14);
  @$pb.TagNumber(15)
  set createdAt($1.Timestamp v) { setField(15, v); }
  @$pb.TagNumber(15)
  $core.bool hasCreatedAt() => $_has(14);
  @$pb.TagNumber(15)
  void clearCreatedAt() => clearField(15);
  @$pb.TagNumber(15)
  $1.Timestamp ensureCreatedAt() => $_ensure(14);

  @$pb.TagNumber(16)
  $1.Timestamp get updatedAt => $_getN(15);
  @$pb.TagNumber(16)
  set updatedAt($1.Timestamp v) { setField(16, v); }
  @$pb.TagNumber(16)
  $core.bool hasUpdatedAt() => $_has(15);
  @$pb.TagNumber(16)
  void clearUpdatedAt() => clearField(16);
  @$pb.TagNumber(16)
  $1.Timestamp ensureUpdatedAt() => $_ensure(15);
}

/// CommentResponse is recursive: top-level comments carry their replies inline.
/// Soft-deleted comments retain their position in the tree; content is cleared.
class CommentResponse extends $pb.GeneratedMessage {
  factory CommentResponse({
    $core.String? commentId,
    $core.String? postId,
    $core.String? parentCommentId,
    $core.String? authorId,
    $core.String? authorNickname,
    $core.String? authorProfileImageUrl,
    $core.String? content,
    $core.int? likeCount,
    $core.bool? isLiked,
    $core.bool? isDeleted,
    $core.Iterable<CommentResponse>? replies,
    $1.Timestamp? createdAt,
    $1.Timestamp? updatedAt,
  }) {
    final $result = create();
    if (commentId != null) {
      $result.commentId = commentId;
    }
    if (postId != null) {
      $result.postId = postId;
    }
    if (parentCommentId != null) {
      $result.parentCommentId = parentCommentId;
    }
    if (authorId != null) {
      $result.authorId = authorId;
    }
    if (authorNickname != null) {
      $result.authorNickname = authorNickname;
    }
    if (authorProfileImageUrl != null) {
      $result.authorProfileImageUrl = authorProfileImageUrl;
    }
    if (content != null) {
      $result.content = content;
    }
    if (likeCount != null) {
      $result.likeCount = likeCount;
    }
    if (isLiked != null) {
      $result.isLiked = isLiked;
    }
    if (isDeleted != null) {
      $result.isDeleted = isDeleted;
    }
    if (replies != null) {
      $result.replies.addAll(replies);
    }
    if (createdAt != null) {
      $result.createdAt = createdAt;
    }
    if (updatedAt != null) {
      $result.updatedAt = updatedAt;
    }
    return $result;
  }
  CommentResponse._() : super();
  factory CommentResponse.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory CommentResponse.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'CommentResponse', package: const $pb.PackageName(_omitMessageNames ? '' : 'ontheblock.board.v1'), createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'commentId')
    ..aOS(2, _omitFieldNames ? '' : 'postId')
    ..aOS(3, _omitFieldNames ? '' : 'parentCommentId')
    ..aOS(4, _omitFieldNames ? '' : 'authorId')
    ..aOS(5, _omitFieldNames ? '' : 'authorNickname')
    ..aOS(6, _omitFieldNames ? '' : 'authorProfileImageUrl')
    ..aOS(7, _omitFieldNames ? '' : 'content')
    ..a<$core.int>(8, _omitFieldNames ? '' : 'likeCount', $pb.PbFieldType.O3)
    ..aOB(9, _omitFieldNames ? '' : 'isLiked')
    ..aOB(10, _omitFieldNames ? '' : 'isDeleted')
    ..pc<CommentResponse>(11, _omitFieldNames ? '' : 'replies', $pb.PbFieldType.PM, subBuilder: CommentResponse.create)
    ..aOM<$1.Timestamp>(12, _omitFieldNames ? '' : 'createdAt', subBuilder: $1.Timestamp.create)
    ..aOM<$1.Timestamp>(13, _omitFieldNames ? '' : 'updatedAt', subBuilder: $1.Timestamp.create)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  CommentResponse clone() => CommentResponse()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  CommentResponse copyWith(void Function(CommentResponse) updates) => super.copyWith((message) => updates(message as CommentResponse)) as CommentResponse;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static CommentResponse create() => CommentResponse._();
  CommentResponse createEmptyInstance() => create();
  static $pb.PbList<CommentResponse> createRepeated() => $pb.PbList<CommentResponse>();
  @$core.pragma('dart2js:noInline')
  static CommentResponse getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<CommentResponse>(create);
  static CommentResponse? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get commentId => $_getSZ(0);
  @$pb.TagNumber(1)
  set commentId($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasCommentId() => $_has(0);
  @$pb.TagNumber(1)
  void clearCommentId() => clearField(1);

  @$pb.TagNumber(2)
  $core.String get postId => $_getSZ(1);
  @$pb.TagNumber(2)
  set postId($core.String v) { $_setString(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasPostId() => $_has(1);
  @$pb.TagNumber(2)
  void clearPostId() => clearField(2);

  @$pb.TagNumber(3)
  $core.String get parentCommentId => $_getSZ(2);
  @$pb.TagNumber(3)
  set parentCommentId($core.String v) { $_setString(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasParentCommentId() => $_has(2);
  @$pb.TagNumber(3)
  void clearParentCommentId() => clearField(3);

  @$pb.TagNumber(4)
  $core.String get authorId => $_getSZ(3);
  @$pb.TagNumber(4)
  set authorId($core.String v) { $_setString(3, v); }
  @$pb.TagNumber(4)
  $core.bool hasAuthorId() => $_has(3);
  @$pb.TagNumber(4)
  void clearAuthorId() => clearField(4);

  @$pb.TagNumber(5)
  $core.String get authorNickname => $_getSZ(4);
  @$pb.TagNumber(5)
  set authorNickname($core.String v) { $_setString(4, v); }
  @$pb.TagNumber(5)
  $core.bool hasAuthorNickname() => $_has(4);
  @$pb.TagNumber(5)
  void clearAuthorNickname() => clearField(5);

  @$pb.TagNumber(6)
  $core.String get authorProfileImageUrl => $_getSZ(5);
  @$pb.TagNumber(6)
  set authorProfileImageUrl($core.String v) { $_setString(5, v); }
  @$pb.TagNumber(6)
  $core.bool hasAuthorProfileImageUrl() => $_has(5);
  @$pb.TagNumber(6)
  void clearAuthorProfileImageUrl() => clearField(6);

  @$pb.TagNumber(7)
  $core.String get content => $_getSZ(6);
  @$pb.TagNumber(7)
  set content($core.String v) { $_setString(6, v); }
  @$pb.TagNumber(7)
  $core.bool hasContent() => $_has(6);
  @$pb.TagNumber(7)
  void clearContent() => clearField(7);

  @$pb.TagNumber(8)
  $core.int get likeCount => $_getIZ(7);
  @$pb.TagNumber(8)
  set likeCount($core.int v) { $_setSignedInt32(7, v); }
  @$pb.TagNumber(8)
  $core.bool hasLikeCount() => $_has(7);
  @$pb.TagNumber(8)
  void clearLikeCount() => clearField(8);

  @$pb.TagNumber(9)
  $core.bool get isLiked => $_getBF(8);
  @$pb.TagNumber(9)
  set isLiked($core.bool v) { $_setBool(8, v); }
  @$pb.TagNumber(9)
  $core.bool hasIsLiked() => $_has(8);
  @$pb.TagNumber(9)
  void clearIsLiked() => clearField(9);

  @$pb.TagNumber(10)
  $core.bool get isDeleted => $_getBF(9);
  @$pb.TagNumber(10)
  set isDeleted($core.bool v) { $_setBool(9, v); }
  @$pb.TagNumber(10)
  $core.bool hasIsDeleted() => $_has(9);
  @$pb.TagNumber(10)
  void clearIsDeleted() => clearField(10);

  @$pb.TagNumber(11)
  $core.List<CommentResponse> get replies => $_getList(10);

  @$pb.TagNumber(12)
  $1.Timestamp get createdAt => $_getN(11);
  @$pb.TagNumber(12)
  set createdAt($1.Timestamp v) { setField(12, v); }
  @$pb.TagNumber(12)
  $core.bool hasCreatedAt() => $_has(11);
  @$pb.TagNumber(12)
  void clearCreatedAt() => clearField(12);
  @$pb.TagNumber(12)
  $1.Timestamp ensureCreatedAt() => $_ensure(11);

  @$pb.TagNumber(13)
  $1.Timestamp get updatedAt => $_getN(12);
  @$pb.TagNumber(13)
  set updatedAt($1.Timestamp v) { setField(13, v); }
  @$pb.TagNumber(13)
  $core.bool hasUpdatedAt() => $_has(12);
  @$pb.TagNumber(13)
  void clearUpdatedAt() => clearField(13);
  @$pb.TagNumber(13)
  $1.Timestamp ensureUpdatedAt() => $_ensure(12);
}

class CreatePostRequest extends $pb.GeneratedMessage {
  factory CreatePostRequest({
    $core.String? userId,
    BoardType? boardType,
    $core.String? title,
    $core.String? content,
    $core.Iterable<$core.String>? imageUrls,
    Location? location,
  }) {
    final $result = create();
    if (userId != null) {
      $result.userId = userId;
    }
    if (boardType != null) {
      $result.boardType = boardType;
    }
    if (title != null) {
      $result.title = title;
    }
    if (content != null) {
      $result.content = content;
    }
    if (imageUrls != null) {
      $result.imageUrls.addAll(imageUrls);
    }
    if (location != null) {
      $result.location = location;
    }
    return $result;
  }
  CreatePostRequest._() : super();
  factory CreatePostRequest.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory CreatePostRequest.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'CreatePostRequest', package: const $pb.PackageName(_omitMessageNames ? '' : 'ontheblock.board.v1'), createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'userId')
    ..e<BoardType>(2, _omitFieldNames ? '' : 'boardType', $pb.PbFieldType.OE, defaultOrMaker: BoardType.BOARD_TYPE_UNSPECIFIED, valueOf: BoardType.valueOf, enumValues: BoardType.values)
    ..aOS(3, _omitFieldNames ? '' : 'title')
    ..aOS(4, _omitFieldNames ? '' : 'content')
    ..pPS(5, _omitFieldNames ? '' : 'imageUrls')
    ..aOM<Location>(6, _omitFieldNames ? '' : 'location', subBuilder: Location.create)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  CreatePostRequest clone() => CreatePostRequest()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  CreatePostRequest copyWith(void Function(CreatePostRequest) updates) => super.copyWith((message) => updates(message as CreatePostRequest)) as CreatePostRequest;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static CreatePostRequest create() => CreatePostRequest._();
  CreatePostRequest createEmptyInstance() => create();
  static $pb.PbList<CreatePostRequest> createRepeated() => $pb.PbList<CreatePostRequest>();
  @$core.pragma('dart2js:noInline')
  static CreatePostRequest getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<CreatePostRequest>(create);
  static CreatePostRequest? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get userId => $_getSZ(0);
  @$pb.TagNumber(1)
  set userId($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasUserId() => $_has(0);
  @$pb.TagNumber(1)
  void clearUserId() => clearField(1);

  @$pb.TagNumber(2)
  BoardType get boardType => $_getN(1);
  @$pb.TagNumber(2)
  set boardType(BoardType v) { setField(2, v); }
  @$pb.TagNumber(2)
  $core.bool hasBoardType() => $_has(1);
  @$pb.TagNumber(2)
  void clearBoardType() => clearField(2);

  @$pb.TagNumber(3)
  $core.String get title => $_getSZ(2);
  @$pb.TagNumber(3)
  set title($core.String v) { $_setString(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasTitle() => $_has(2);
  @$pb.TagNumber(3)
  void clearTitle() => clearField(3);

  @$pb.TagNumber(4)
  $core.String get content => $_getSZ(3);
  @$pb.TagNumber(4)
  set content($core.String v) { $_setString(3, v); }
  @$pb.TagNumber(4)
  $core.bool hasContent() => $_has(3);
  @$pb.TagNumber(4)
  void clearContent() => clearField(4);

  @$pb.TagNumber(5)
  $core.List<$core.String> get imageUrls => $_getList(4);

  @$pb.TagNumber(6)
  Location get location => $_getN(5);
  @$pb.TagNumber(6)
  set location(Location v) { setField(6, v); }
  @$pb.TagNumber(6)
  $core.bool hasLocation() => $_has(5);
  @$pb.TagNumber(6)
  void clearLocation() => clearField(6);
  @$pb.TagNumber(6)
  Location ensureLocation() => $_ensure(5);
}

class CreatePostResponse extends $pb.GeneratedMessage {
  factory CreatePostResponse({
    PostResponse? post,
  }) {
    final $result = create();
    if (post != null) {
      $result.post = post;
    }
    return $result;
  }
  CreatePostResponse._() : super();
  factory CreatePostResponse.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory CreatePostResponse.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'CreatePostResponse', package: const $pb.PackageName(_omitMessageNames ? '' : 'ontheblock.board.v1'), createEmptyInstance: create)
    ..aOM<PostResponse>(1, _omitFieldNames ? '' : 'post', subBuilder: PostResponse.create)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  CreatePostResponse clone() => CreatePostResponse()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  CreatePostResponse copyWith(void Function(CreatePostResponse) updates) => super.copyWith((message) => updates(message as CreatePostResponse)) as CreatePostResponse;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static CreatePostResponse create() => CreatePostResponse._();
  CreatePostResponse createEmptyInstance() => create();
  static $pb.PbList<CreatePostResponse> createRepeated() => $pb.PbList<CreatePostResponse>();
  @$core.pragma('dart2js:noInline')
  static CreatePostResponse getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<CreatePostResponse>(create);
  static CreatePostResponse? _defaultInstance;

  @$pb.TagNumber(1)
  PostResponse get post => $_getN(0);
  @$pb.TagNumber(1)
  set post(PostResponse v) { setField(1, v); }
  @$pb.TagNumber(1)
  $core.bool hasPost() => $_has(0);
  @$pb.TagNumber(1)
  void clearPost() => clearField(1);
  @$pb.TagNumber(1)
  PostResponse ensurePost() => $_ensure(0);
}

class GetPostRequest extends $pb.GeneratedMessage {
  factory GetPostRequest({
    $core.String? postId,
    $core.String? userId,
  }) {
    final $result = create();
    if (postId != null) {
      $result.postId = postId;
    }
    if (userId != null) {
      $result.userId = userId;
    }
    return $result;
  }
  GetPostRequest._() : super();
  factory GetPostRequest.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory GetPostRequest.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'GetPostRequest', package: const $pb.PackageName(_omitMessageNames ? '' : 'ontheblock.board.v1'), createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'postId')
    ..aOS(2, _omitFieldNames ? '' : 'userId')
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  GetPostRequest clone() => GetPostRequest()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  GetPostRequest copyWith(void Function(GetPostRequest) updates) => super.copyWith((message) => updates(message as GetPostRequest)) as GetPostRequest;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static GetPostRequest create() => GetPostRequest._();
  GetPostRequest createEmptyInstance() => create();
  static $pb.PbList<GetPostRequest> createRepeated() => $pb.PbList<GetPostRequest>();
  @$core.pragma('dart2js:noInline')
  static GetPostRequest getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<GetPostRequest>(create);
  static GetPostRequest? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get postId => $_getSZ(0);
  @$pb.TagNumber(1)
  set postId($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasPostId() => $_has(0);
  @$pb.TagNumber(1)
  void clearPostId() => clearField(1);

  @$pb.TagNumber(2)
  $core.String get userId => $_getSZ(1);
  @$pb.TagNumber(2)
  set userId($core.String v) { $_setString(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasUserId() => $_has(1);
  @$pb.TagNumber(2)
  void clearUserId() => clearField(2);
}

class GetPostResponse extends $pb.GeneratedMessage {
  factory GetPostResponse({
    PostResponse? post,
  }) {
    final $result = create();
    if (post != null) {
      $result.post = post;
    }
    return $result;
  }
  GetPostResponse._() : super();
  factory GetPostResponse.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory GetPostResponse.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'GetPostResponse', package: const $pb.PackageName(_omitMessageNames ? '' : 'ontheblock.board.v1'), createEmptyInstance: create)
    ..aOM<PostResponse>(1, _omitFieldNames ? '' : 'post', subBuilder: PostResponse.create)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  GetPostResponse clone() => GetPostResponse()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  GetPostResponse copyWith(void Function(GetPostResponse) updates) => super.copyWith((message) => updates(message as GetPostResponse)) as GetPostResponse;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static GetPostResponse create() => GetPostResponse._();
  GetPostResponse createEmptyInstance() => create();
  static $pb.PbList<GetPostResponse> createRepeated() => $pb.PbList<GetPostResponse>();
  @$core.pragma('dart2js:noInline')
  static GetPostResponse getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<GetPostResponse>(create);
  static GetPostResponse? _defaultInstance;

  @$pb.TagNumber(1)
  PostResponse get post => $_getN(0);
  @$pb.TagNumber(1)
  set post(PostResponse v) { setField(1, v); }
  @$pb.TagNumber(1)
  $core.bool hasPost() => $_has(0);
  @$pb.TagNumber(1)
  void clearPost() => clearField(1);
  @$pb.TagNumber(1)
  PostResponse ensurePost() => $_ensure(0);
}

/// Scalar fields use optional: absent = no change.
/// For repeated/message fields, use the accompanying update_* flag:
///   update_images=true  -> replace image_urls entirely (empty list clears all)
///   update_location=true -> replace location entirely (null location clears it)
class UpdatePostRequest extends $pb.GeneratedMessage {
  factory UpdatePostRequest({
    $core.String? postId,
    $core.String? userId,
    $core.String? title,
    $core.String? content,
    $core.bool? updateImages,
    $core.Iterable<$core.String>? imageUrls,
    $core.bool? updateLocation,
    Location? location,
  }) {
    final $result = create();
    if (postId != null) {
      $result.postId = postId;
    }
    if (userId != null) {
      $result.userId = userId;
    }
    if (title != null) {
      $result.title = title;
    }
    if (content != null) {
      $result.content = content;
    }
    if (updateImages != null) {
      $result.updateImages = updateImages;
    }
    if (imageUrls != null) {
      $result.imageUrls.addAll(imageUrls);
    }
    if (updateLocation != null) {
      $result.updateLocation = updateLocation;
    }
    if (location != null) {
      $result.location = location;
    }
    return $result;
  }
  UpdatePostRequest._() : super();
  factory UpdatePostRequest.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory UpdatePostRequest.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'UpdatePostRequest', package: const $pb.PackageName(_omitMessageNames ? '' : 'ontheblock.board.v1'), createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'postId')
    ..aOS(2, _omitFieldNames ? '' : 'userId')
    ..aOS(3, _omitFieldNames ? '' : 'title')
    ..aOS(4, _omitFieldNames ? '' : 'content')
    ..aOB(5, _omitFieldNames ? '' : 'updateImages')
    ..pPS(6, _omitFieldNames ? '' : 'imageUrls')
    ..aOB(7, _omitFieldNames ? '' : 'updateLocation')
    ..aOM<Location>(8, _omitFieldNames ? '' : 'location', subBuilder: Location.create)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  UpdatePostRequest clone() => UpdatePostRequest()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  UpdatePostRequest copyWith(void Function(UpdatePostRequest) updates) => super.copyWith((message) => updates(message as UpdatePostRequest)) as UpdatePostRequest;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static UpdatePostRequest create() => UpdatePostRequest._();
  UpdatePostRequest createEmptyInstance() => create();
  static $pb.PbList<UpdatePostRequest> createRepeated() => $pb.PbList<UpdatePostRequest>();
  @$core.pragma('dart2js:noInline')
  static UpdatePostRequest getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<UpdatePostRequest>(create);
  static UpdatePostRequest? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get postId => $_getSZ(0);
  @$pb.TagNumber(1)
  set postId($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasPostId() => $_has(0);
  @$pb.TagNumber(1)
  void clearPostId() => clearField(1);

  @$pb.TagNumber(2)
  $core.String get userId => $_getSZ(1);
  @$pb.TagNumber(2)
  set userId($core.String v) { $_setString(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasUserId() => $_has(1);
  @$pb.TagNumber(2)
  void clearUserId() => clearField(2);

  @$pb.TagNumber(3)
  $core.String get title => $_getSZ(2);
  @$pb.TagNumber(3)
  set title($core.String v) { $_setString(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasTitle() => $_has(2);
  @$pb.TagNumber(3)
  void clearTitle() => clearField(3);

  @$pb.TagNumber(4)
  $core.String get content => $_getSZ(3);
  @$pb.TagNumber(4)
  set content($core.String v) { $_setString(3, v); }
  @$pb.TagNumber(4)
  $core.bool hasContent() => $_has(3);
  @$pb.TagNumber(4)
  void clearContent() => clearField(4);

  @$pb.TagNumber(5)
  $core.bool get updateImages => $_getBF(4);
  @$pb.TagNumber(5)
  set updateImages($core.bool v) { $_setBool(4, v); }
  @$pb.TagNumber(5)
  $core.bool hasUpdateImages() => $_has(4);
  @$pb.TagNumber(5)
  void clearUpdateImages() => clearField(5);

  @$pb.TagNumber(6)
  $core.List<$core.String> get imageUrls => $_getList(5);

  @$pb.TagNumber(7)
  $core.bool get updateLocation => $_getBF(6);
  @$pb.TagNumber(7)
  set updateLocation($core.bool v) { $_setBool(6, v); }
  @$pb.TagNumber(7)
  $core.bool hasUpdateLocation() => $_has(6);
  @$pb.TagNumber(7)
  void clearUpdateLocation() => clearField(7);

  @$pb.TagNumber(8)
  Location get location => $_getN(7);
  @$pb.TagNumber(8)
  set location(Location v) { setField(8, v); }
  @$pb.TagNumber(8)
  $core.bool hasLocation() => $_has(7);
  @$pb.TagNumber(8)
  void clearLocation() => clearField(8);
  @$pb.TagNumber(8)
  Location ensureLocation() => $_ensure(7);
}

class UpdatePostResponse extends $pb.GeneratedMessage {
  factory UpdatePostResponse({
    PostResponse? post,
  }) {
    final $result = create();
    if (post != null) {
      $result.post = post;
    }
    return $result;
  }
  UpdatePostResponse._() : super();
  factory UpdatePostResponse.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory UpdatePostResponse.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'UpdatePostResponse', package: const $pb.PackageName(_omitMessageNames ? '' : 'ontheblock.board.v1'), createEmptyInstance: create)
    ..aOM<PostResponse>(1, _omitFieldNames ? '' : 'post', subBuilder: PostResponse.create)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  UpdatePostResponse clone() => UpdatePostResponse()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  UpdatePostResponse copyWith(void Function(UpdatePostResponse) updates) => super.copyWith((message) => updates(message as UpdatePostResponse)) as UpdatePostResponse;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static UpdatePostResponse create() => UpdatePostResponse._();
  UpdatePostResponse createEmptyInstance() => create();
  static $pb.PbList<UpdatePostResponse> createRepeated() => $pb.PbList<UpdatePostResponse>();
  @$core.pragma('dart2js:noInline')
  static UpdatePostResponse getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<UpdatePostResponse>(create);
  static UpdatePostResponse? _defaultInstance;

  @$pb.TagNumber(1)
  PostResponse get post => $_getN(0);
  @$pb.TagNumber(1)
  set post(PostResponse v) { setField(1, v); }
  @$pb.TagNumber(1)
  $core.bool hasPost() => $_has(0);
  @$pb.TagNumber(1)
  void clearPost() => clearField(1);
  @$pb.TagNumber(1)
  PostResponse ensurePost() => $_ensure(0);
}

class DeletePostRequest extends $pb.GeneratedMessage {
  factory DeletePostRequest({
    $core.String? postId,
    $core.String? userId,
  }) {
    final $result = create();
    if (postId != null) {
      $result.postId = postId;
    }
    if (userId != null) {
      $result.userId = userId;
    }
    return $result;
  }
  DeletePostRequest._() : super();
  factory DeletePostRequest.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory DeletePostRequest.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'DeletePostRequest', package: const $pb.PackageName(_omitMessageNames ? '' : 'ontheblock.board.v1'), createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'postId')
    ..aOS(2, _omitFieldNames ? '' : 'userId')
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  DeletePostRequest clone() => DeletePostRequest()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  DeletePostRequest copyWith(void Function(DeletePostRequest) updates) => super.copyWith((message) => updates(message as DeletePostRequest)) as DeletePostRequest;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static DeletePostRequest create() => DeletePostRequest._();
  DeletePostRequest createEmptyInstance() => create();
  static $pb.PbList<DeletePostRequest> createRepeated() => $pb.PbList<DeletePostRequest>();
  @$core.pragma('dart2js:noInline')
  static DeletePostRequest getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<DeletePostRequest>(create);
  static DeletePostRequest? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get postId => $_getSZ(0);
  @$pb.TagNumber(1)
  set postId($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasPostId() => $_has(0);
  @$pb.TagNumber(1)
  void clearPostId() => clearField(1);

  @$pb.TagNumber(2)
  $core.String get userId => $_getSZ(1);
  @$pb.TagNumber(2)
  set userId($core.String v) { $_setString(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasUserId() => $_has(1);
  @$pb.TagNumber(2)
  void clearUserId() => clearField(2);
}

class DeletePostResponse extends $pb.GeneratedMessage {
  factory DeletePostResponse() => create();
  DeletePostResponse._() : super();
  factory DeletePostResponse.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory DeletePostResponse.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'DeletePostResponse', package: const $pb.PackageName(_omitMessageNames ? '' : 'ontheblock.board.v1'), createEmptyInstance: create)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  DeletePostResponse clone() => DeletePostResponse()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  DeletePostResponse copyWith(void Function(DeletePostResponse) updates) => super.copyWith((message) => updates(message as DeletePostResponse)) as DeletePostResponse;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static DeletePostResponse create() => DeletePostResponse._();
  DeletePostResponse createEmptyInstance() => create();
  static $pb.PbList<DeletePostResponse> createRepeated() => $pb.PbList<DeletePostResponse>();
  @$core.pragma('dart2js:noInline')
  static DeletePostResponse getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<DeletePostResponse>(create);
  static DeletePostResponse? _defaultInstance;
}

class ListPostsRequest extends $pb.GeneratedMessage {
  factory ListPostsRequest({
    BoardType? boardType,
    $core.String? query,
    $core.String? userId,
    $2.PaginationRequest? pagination,
  }) {
    final $result = create();
    if (boardType != null) {
      $result.boardType = boardType;
    }
    if (query != null) {
      $result.query = query;
    }
    if (userId != null) {
      $result.userId = userId;
    }
    if (pagination != null) {
      $result.pagination = pagination;
    }
    return $result;
  }
  ListPostsRequest._() : super();
  factory ListPostsRequest.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory ListPostsRequest.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'ListPostsRequest', package: const $pb.PackageName(_omitMessageNames ? '' : 'ontheblock.board.v1'), createEmptyInstance: create)
    ..e<BoardType>(1, _omitFieldNames ? '' : 'boardType', $pb.PbFieldType.OE, defaultOrMaker: BoardType.BOARD_TYPE_UNSPECIFIED, valueOf: BoardType.valueOf, enumValues: BoardType.values)
    ..aOS(2, _omitFieldNames ? '' : 'query')
    ..aOS(3, _omitFieldNames ? '' : 'userId')
    ..aOM<$2.PaginationRequest>(4, _omitFieldNames ? '' : 'pagination', subBuilder: $2.PaginationRequest.create)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  ListPostsRequest clone() => ListPostsRequest()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  ListPostsRequest copyWith(void Function(ListPostsRequest) updates) => super.copyWith((message) => updates(message as ListPostsRequest)) as ListPostsRequest;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static ListPostsRequest create() => ListPostsRequest._();
  ListPostsRequest createEmptyInstance() => create();
  static $pb.PbList<ListPostsRequest> createRepeated() => $pb.PbList<ListPostsRequest>();
  @$core.pragma('dart2js:noInline')
  static ListPostsRequest getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<ListPostsRequest>(create);
  static ListPostsRequest? _defaultInstance;

  @$pb.TagNumber(1)
  BoardType get boardType => $_getN(0);
  @$pb.TagNumber(1)
  set boardType(BoardType v) { setField(1, v); }
  @$pb.TagNumber(1)
  $core.bool hasBoardType() => $_has(0);
  @$pb.TagNumber(1)
  void clearBoardType() => clearField(1);

  @$pb.TagNumber(2)
  $core.String get query => $_getSZ(1);
  @$pb.TagNumber(2)
  set query($core.String v) { $_setString(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasQuery() => $_has(1);
  @$pb.TagNumber(2)
  void clearQuery() => clearField(2);

  @$pb.TagNumber(3)
  $core.String get userId => $_getSZ(2);
  @$pb.TagNumber(3)
  set userId($core.String v) { $_setString(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasUserId() => $_has(2);
  @$pb.TagNumber(3)
  void clearUserId() => clearField(3);

  @$pb.TagNumber(4)
  $2.PaginationRequest get pagination => $_getN(3);
  @$pb.TagNumber(4)
  set pagination($2.PaginationRequest v) { setField(4, v); }
  @$pb.TagNumber(4)
  $core.bool hasPagination() => $_has(3);
  @$pb.TagNumber(4)
  void clearPagination() => clearField(4);
  @$pb.TagNumber(4)
  $2.PaginationRequest ensurePagination() => $_ensure(3);
}

class ListPostsResponse extends $pb.GeneratedMessage {
  factory ListPostsResponse({
    $core.Iterable<PostResponse>? posts,
    $2.PaginationResponse? pagination,
  }) {
    final $result = create();
    if (posts != null) {
      $result.posts.addAll(posts);
    }
    if (pagination != null) {
      $result.pagination = pagination;
    }
    return $result;
  }
  ListPostsResponse._() : super();
  factory ListPostsResponse.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory ListPostsResponse.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'ListPostsResponse', package: const $pb.PackageName(_omitMessageNames ? '' : 'ontheblock.board.v1'), createEmptyInstance: create)
    ..pc<PostResponse>(1, _omitFieldNames ? '' : 'posts', $pb.PbFieldType.PM, subBuilder: PostResponse.create)
    ..aOM<$2.PaginationResponse>(2, _omitFieldNames ? '' : 'pagination', subBuilder: $2.PaginationResponse.create)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  ListPostsResponse clone() => ListPostsResponse()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  ListPostsResponse copyWith(void Function(ListPostsResponse) updates) => super.copyWith((message) => updates(message as ListPostsResponse)) as ListPostsResponse;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static ListPostsResponse create() => ListPostsResponse._();
  ListPostsResponse createEmptyInstance() => create();
  static $pb.PbList<ListPostsResponse> createRepeated() => $pb.PbList<ListPostsResponse>();
  @$core.pragma('dart2js:noInline')
  static ListPostsResponse getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<ListPostsResponse>(create);
  static ListPostsResponse? _defaultInstance;

  @$pb.TagNumber(1)
  $core.List<PostResponse> get posts => $_getList(0);

  @$pb.TagNumber(2)
  $2.PaginationResponse get pagination => $_getN(1);
  @$pb.TagNumber(2)
  set pagination($2.PaginationResponse v) { setField(2, v); }
  @$pb.TagNumber(2)
  $core.bool hasPagination() => $_has(1);
  @$pb.TagNumber(2)
  void clearPagination() => clearField(2);
  @$pb.TagNumber(2)
  $2.PaginationResponse ensurePagination() => $_ensure(1);
}

class LikePostRequest extends $pb.GeneratedMessage {
  factory LikePostRequest({
    $core.String? postId,
    $core.String? userId,
  }) {
    final $result = create();
    if (postId != null) {
      $result.postId = postId;
    }
    if (userId != null) {
      $result.userId = userId;
    }
    return $result;
  }
  LikePostRequest._() : super();
  factory LikePostRequest.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory LikePostRequest.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'LikePostRequest', package: const $pb.PackageName(_omitMessageNames ? '' : 'ontheblock.board.v1'), createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'postId')
    ..aOS(2, _omitFieldNames ? '' : 'userId')
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  LikePostRequest clone() => LikePostRequest()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  LikePostRequest copyWith(void Function(LikePostRequest) updates) => super.copyWith((message) => updates(message as LikePostRequest)) as LikePostRequest;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static LikePostRequest create() => LikePostRequest._();
  LikePostRequest createEmptyInstance() => create();
  static $pb.PbList<LikePostRequest> createRepeated() => $pb.PbList<LikePostRequest>();
  @$core.pragma('dart2js:noInline')
  static LikePostRequest getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<LikePostRequest>(create);
  static LikePostRequest? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get postId => $_getSZ(0);
  @$pb.TagNumber(1)
  set postId($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasPostId() => $_has(0);
  @$pb.TagNumber(1)
  void clearPostId() => clearField(1);

  @$pb.TagNumber(2)
  $core.String get userId => $_getSZ(1);
  @$pb.TagNumber(2)
  set userId($core.String v) { $_setString(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasUserId() => $_has(1);
  @$pb.TagNumber(2)
  void clearUserId() => clearField(2);
}

class LikePostResponse extends $pb.GeneratedMessage {
  factory LikePostResponse({
    $core.bool? liked,
    $core.int? likeCount,
  }) {
    final $result = create();
    if (liked != null) {
      $result.liked = liked;
    }
    if (likeCount != null) {
      $result.likeCount = likeCount;
    }
    return $result;
  }
  LikePostResponse._() : super();
  factory LikePostResponse.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory LikePostResponse.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'LikePostResponse', package: const $pb.PackageName(_omitMessageNames ? '' : 'ontheblock.board.v1'), createEmptyInstance: create)
    ..aOB(1, _omitFieldNames ? '' : 'liked')
    ..a<$core.int>(2, _omitFieldNames ? '' : 'likeCount', $pb.PbFieldType.O3)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  LikePostResponse clone() => LikePostResponse()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  LikePostResponse copyWith(void Function(LikePostResponse) updates) => super.copyWith((message) => updates(message as LikePostResponse)) as LikePostResponse;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static LikePostResponse create() => LikePostResponse._();
  LikePostResponse createEmptyInstance() => create();
  static $pb.PbList<LikePostResponse> createRepeated() => $pb.PbList<LikePostResponse>();
  @$core.pragma('dart2js:noInline')
  static LikePostResponse getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<LikePostResponse>(create);
  static LikePostResponse? _defaultInstance;

  @$pb.TagNumber(1)
  $core.bool get liked => $_getBF(0);
  @$pb.TagNumber(1)
  set liked($core.bool v) { $_setBool(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasLiked() => $_has(0);
  @$pb.TagNumber(1)
  void clearLiked() => clearField(1);

  @$pb.TagNumber(2)
  $core.int get likeCount => $_getIZ(1);
  @$pb.TagNumber(2)
  set likeCount($core.int v) { $_setSignedInt32(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasLikeCount() => $_has(1);
  @$pb.TagNumber(2)
  void clearLikeCount() => clearField(2);
}

class PinPostRequest extends $pb.GeneratedMessage {
  factory PinPostRequest({
    $core.String? postId,
    $core.String? userId,
    $core.bool? pin,
  }) {
    final $result = create();
    if (postId != null) {
      $result.postId = postId;
    }
    if (userId != null) {
      $result.userId = userId;
    }
    if (pin != null) {
      $result.pin = pin;
    }
    return $result;
  }
  PinPostRequest._() : super();
  factory PinPostRequest.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory PinPostRequest.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'PinPostRequest', package: const $pb.PackageName(_omitMessageNames ? '' : 'ontheblock.board.v1'), createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'postId')
    ..aOS(2, _omitFieldNames ? '' : 'userId')
    ..aOB(3, _omitFieldNames ? '' : 'pin')
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  PinPostRequest clone() => PinPostRequest()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  PinPostRequest copyWith(void Function(PinPostRequest) updates) => super.copyWith((message) => updates(message as PinPostRequest)) as PinPostRequest;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static PinPostRequest create() => PinPostRequest._();
  PinPostRequest createEmptyInstance() => create();
  static $pb.PbList<PinPostRequest> createRepeated() => $pb.PbList<PinPostRequest>();
  @$core.pragma('dart2js:noInline')
  static PinPostRequest getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<PinPostRequest>(create);
  static PinPostRequest? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get postId => $_getSZ(0);
  @$pb.TagNumber(1)
  set postId($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasPostId() => $_has(0);
  @$pb.TagNumber(1)
  void clearPostId() => clearField(1);

  @$pb.TagNumber(2)
  $core.String get userId => $_getSZ(1);
  @$pb.TagNumber(2)
  set userId($core.String v) { $_setString(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasUserId() => $_has(1);
  @$pb.TagNumber(2)
  void clearUserId() => clearField(2);

  @$pb.TagNumber(3)
  $core.bool get pin => $_getBF(2);
  @$pb.TagNumber(3)
  set pin($core.bool v) { $_setBool(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasPin() => $_has(2);
  @$pb.TagNumber(3)
  void clearPin() => clearField(3);
}

class PinPostResponse extends $pb.GeneratedMessage {
  factory PinPostResponse({
    $core.bool? isNotice,
  }) {
    final $result = create();
    if (isNotice != null) {
      $result.isNotice = isNotice;
    }
    return $result;
  }
  PinPostResponse._() : super();
  factory PinPostResponse.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory PinPostResponse.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'PinPostResponse', package: const $pb.PackageName(_omitMessageNames ? '' : 'ontheblock.board.v1'), createEmptyInstance: create)
    ..aOB(1, _omitFieldNames ? '' : 'isNotice')
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  PinPostResponse clone() => PinPostResponse()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  PinPostResponse copyWith(void Function(PinPostResponse) updates) => super.copyWith((message) => updates(message as PinPostResponse)) as PinPostResponse;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static PinPostResponse create() => PinPostResponse._();
  PinPostResponse createEmptyInstance() => create();
  static $pb.PbList<PinPostResponse> createRepeated() => $pb.PbList<PinPostResponse>();
  @$core.pragma('dart2js:noInline')
  static PinPostResponse getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<PinPostResponse>(create);
  static PinPostResponse? _defaultInstance;

  @$pb.TagNumber(1)
  $core.bool get isNotice => $_getBF(0);
  @$pb.TagNumber(1)
  set isNotice($core.bool v) { $_setBool(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasIsNotice() => $_has(0);
  @$pb.TagNumber(1)
  void clearIsNotice() => clearField(1);
}

class CreateCommentRequest extends $pb.GeneratedMessage {
  factory CreateCommentRequest({
    $core.String? postId,
    $core.String? userId,
    $core.String? parentCommentId,
    $core.String? content,
  }) {
    final $result = create();
    if (postId != null) {
      $result.postId = postId;
    }
    if (userId != null) {
      $result.userId = userId;
    }
    if (parentCommentId != null) {
      $result.parentCommentId = parentCommentId;
    }
    if (content != null) {
      $result.content = content;
    }
    return $result;
  }
  CreateCommentRequest._() : super();
  factory CreateCommentRequest.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory CreateCommentRequest.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'CreateCommentRequest', package: const $pb.PackageName(_omitMessageNames ? '' : 'ontheblock.board.v1'), createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'postId')
    ..aOS(2, _omitFieldNames ? '' : 'userId')
    ..aOS(3, _omitFieldNames ? '' : 'parentCommentId')
    ..aOS(4, _omitFieldNames ? '' : 'content')
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  CreateCommentRequest clone() => CreateCommentRequest()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  CreateCommentRequest copyWith(void Function(CreateCommentRequest) updates) => super.copyWith((message) => updates(message as CreateCommentRequest)) as CreateCommentRequest;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static CreateCommentRequest create() => CreateCommentRequest._();
  CreateCommentRequest createEmptyInstance() => create();
  static $pb.PbList<CreateCommentRequest> createRepeated() => $pb.PbList<CreateCommentRequest>();
  @$core.pragma('dart2js:noInline')
  static CreateCommentRequest getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<CreateCommentRequest>(create);
  static CreateCommentRequest? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get postId => $_getSZ(0);
  @$pb.TagNumber(1)
  set postId($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasPostId() => $_has(0);
  @$pb.TagNumber(1)
  void clearPostId() => clearField(1);

  @$pb.TagNumber(2)
  $core.String get userId => $_getSZ(1);
  @$pb.TagNumber(2)
  set userId($core.String v) { $_setString(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasUserId() => $_has(1);
  @$pb.TagNumber(2)
  void clearUserId() => clearField(2);

  @$pb.TagNumber(3)
  $core.String get parentCommentId => $_getSZ(2);
  @$pb.TagNumber(3)
  set parentCommentId($core.String v) { $_setString(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasParentCommentId() => $_has(2);
  @$pb.TagNumber(3)
  void clearParentCommentId() => clearField(3);

  @$pb.TagNumber(4)
  $core.String get content => $_getSZ(3);
  @$pb.TagNumber(4)
  set content($core.String v) { $_setString(3, v); }
  @$pb.TagNumber(4)
  $core.bool hasContent() => $_has(3);
  @$pb.TagNumber(4)
  void clearContent() => clearField(4);
}

class CreateCommentResponse extends $pb.GeneratedMessage {
  factory CreateCommentResponse({
    CommentResponse? comment,
  }) {
    final $result = create();
    if (comment != null) {
      $result.comment = comment;
    }
    return $result;
  }
  CreateCommentResponse._() : super();
  factory CreateCommentResponse.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory CreateCommentResponse.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'CreateCommentResponse', package: const $pb.PackageName(_omitMessageNames ? '' : 'ontheblock.board.v1'), createEmptyInstance: create)
    ..aOM<CommentResponse>(1, _omitFieldNames ? '' : 'comment', subBuilder: CommentResponse.create)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  CreateCommentResponse clone() => CreateCommentResponse()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  CreateCommentResponse copyWith(void Function(CreateCommentResponse) updates) => super.copyWith((message) => updates(message as CreateCommentResponse)) as CreateCommentResponse;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static CreateCommentResponse create() => CreateCommentResponse._();
  CreateCommentResponse createEmptyInstance() => create();
  static $pb.PbList<CreateCommentResponse> createRepeated() => $pb.PbList<CreateCommentResponse>();
  @$core.pragma('dart2js:noInline')
  static CreateCommentResponse getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<CreateCommentResponse>(create);
  static CreateCommentResponse? _defaultInstance;

  @$pb.TagNumber(1)
  CommentResponse get comment => $_getN(0);
  @$pb.TagNumber(1)
  set comment(CommentResponse v) { setField(1, v); }
  @$pb.TagNumber(1)
  $core.bool hasComment() => $_has(0);
  @$pb.TagNumber(1)
  void clearComment() => clearField(1);
  @$pb.TagNumber(1)
  CommentResponse ensureComment() => $_ensure(0);
}

class UpdateCommentRequest extends $pb.GeneratedMessage {
  factory UpdateCommentRequest({
    $core.String? commentId,
    $core.String? userId,
    $core.String? content,
  }) {
    final $result = create();
    if (commentId != null) {
      $result.commentId = commentId;
    }
    if (userId != null) {
      $result.userId = userId;
    }
    if (content != null) {
      $result.content = content;
    }
    return $result;
  }
  UpdateCommentRequest._() : super();
  factory UpdateCommentRequest.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory UpdateCommentRequest.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'UpdateCommentRequest', package: const $pb.PackageName(_omitMessageNames ? '' : 'ontheblock.board.v1'), createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'commentId')
    ..aOS(2, _omitFieldNames ? '' : 'userId')
    ..aOS(3, _omitFieldNames ? '' : 'content')
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  UpdateCommentRequest clone() => UpdateCommentRequest()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  UpdateCommentRequest copyWith(void Function(UpdateCommentRequest) updates) => super.copyWith((message) => updates(message as UpdateCommentRequest)) as UpdateCommentRequest;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static UpdateCommentRequest create() => UpdateCommentRequest._();
  UpdateCommentRequest createEmptyInstance() => create();
  static $pb.PbList<UpdateCommentRequest> createRepeated() => $pb.PbList<UpdateCommentRequest>();
  @$core.pragma('dart2js:noInline')
  static UpdateCommentRequest getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<UpdateCommentRequest>(create);
  static UpdateCommentRequest? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get commentId => $_getSZ(0);
  @$pb.TagNumber(1)
  set commentId($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasCommentId() => $_has(0);
  @$pb.TagNumber(1)
  void clearCommentId() => clearField(1);

  @$pb.TagNumber(2)
  $core.String get userId => $_getSZ(1);
  @$pb.TagNumber(2)
  set userId($core.String v) { $_setString(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasUserId() => $_has(1);
  @$pb.TagNumber(2)
  void clearUserId() => clearField(2);

  @$pb.TagNumber(3)
  $core.String get content => $_getSZ(2);
  @$pb.TagNumber(3)
  set content($core.String v) { $_setString(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasContent() => $_has(2);
  @$pb.TagNumber(3)
  void clearContent() => clearField(3);
}

class UpdateCommentResponse extends $pb.GeneratedMessage {
  factory UpdateCommentResponse({
    CommentResponse? comment,
  }) {
    final $result = create();
    if (comment != null) {
      $result.comment = comment;
    }
    return $result;
  }
  UpdateCommentResponse._() : super();
  factory UpdateCommentResponse.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory UpdateCommentResponse.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'UpdateCommentResponse', package: const $pb.PackageName(_omitMessageNames ? '' : 'ontheblock.board.v1'), createEmptyInstance: create)
    ..aOM<CommentResponse>(1, _omitFieldNames ? '' : 'comment', subBuilder: CommentResponse.create)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  UpdateCommentResponse clone() => UpdateCommentResponse()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  UpdateCommentResponse copyWith(void Function(UpdateCommentResponse) updates) => super.copyWith((message) => updates(message as UpdateCommentResponse)) as UpdateCommentResponse;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static UpdateCommentResponse create() => UpdateCommentResponse._();
  UpdateCommentResponse createEmptyInstance() => create();
  static $pb.PbList<UpdateCommentResponse> createRepeated() => $pb.PbList<UpdateCommentResponse>();
  @$core.pragma('dart2js:noInline')
  static UpdateCommentResponse getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<UpdateCommentResponse>(create);
  static UpdateCommentResponse? _defaultInstance;

  @$pb.TagNumber(1)
  CommentResponse get comment => $_getN(0);
  @$pb.TagNumber(1)
  set comment(CommentResponse v) { setField(1, v); }
  @$pb.TagNumber(1)
  $core.bool hasComment() => $_has(0);
  @$pb.TagNumber(1)
  void clearComment() => clearField(1);
  @$pb.TagNumber(1)
  CommentResponse ensureComment() => $_ensure(0);
}

class DeleteCommentRequest extends $pb.GeneratedMessage {
  factory DeleteCommentRequest({
    $core.String? commentId,
    $core.String? userId,
  }) {
    final $result = create();
    if (commentId != null) {
      $result.commentId = commentId;
    }
    if (userId != null) {
      $result.userId = userId;
    }
    return $result;
  }
  DeleteCommentRequest._() : super();
  factory DeleteCommentRequest.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory DeleteCommentRequest.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'DeleteCommentRequest', package: const $pb.PackageName(_omitMessageNames ? '' : 'ontheblock.board.v1'), createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'commentId')
    ..aOS(2, _omitFieldNames ? '' : 'userId')
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  DeleteCommentRequest clone() => DeleteCommentRequest()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  DeleteCommentRequest copyWith(void Function(DeleteCommentRequest) updates) => super.copyWith((message) => updates(message as DeleteCommentRequest)) as DeleteCommentRequest;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static DeleteCommentRequest create() => DeleteCommentRequest._();
  DeleteCommentRequest createEmptyInstance() => create();
  static $pb.PbList<DeleteCommentRequest> createRepeated() => $pb.PbList<DeleteCommentRequest>();
  @$core.pragma('dart2js:noInline')
  static DeleteCommentRequest getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<DeleteCommentRequest>(create);
  static DeleteCommentRequest? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get commentId => $_getSZ(0);
  @$pb.TagNumber(1)
  set commentId($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasCommentId() => $_has(0);
  @$pb.TagNumber(1)
  void clearCommentId() => clearField(1);

  @$pb.TagNumber(2)
  $core.String get userId => $_getSZ(1);
  @$pb.TagNumber(2)
  set userId($core.String v) { $_setString(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasUserId() => $_has(1);
  @$pb.TagNumber(2)
  void clearUserId() => clearField(2);
}

class DeleteCommentResponse extends $pb.GeneratedMessage {
  factory DeleteCommentResponse() => create();
  DeleteCommentResponse._() : super();
  factory DeleteCommentResponse.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory DeleteCommentResponse.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'DeleteCommentResponse', package: const $pb.PackageName(_omitMessageNames ? '' : 'ontheblock.board.v1'), createEmptyInstance: create)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  DeleteCommentResponse clone() => DeleteCommentResponse()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  DeleteCommentResponse copyWith(void Function(DeleteCommentResponse) updates) => super.copyWith((message) => updates(message as DeleteCommentResponse)) as DeleteCommentResponse;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static DeleteCommentResponse create() => DeleteCommentResponse._();
  DeleteCommentResponse createEmptyInstance() => create();
  static $pb.PbList<DeleteCommentResponse> createRepeated() => $pb.PbList<DeleteCommentResponse>();
  @$core.pragma('dart2js:noInline')
  static DeleteCommentResponse getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<DeleteCommentResponse>(create);
  static DeleteCommentResponse? _defaultInstance;
}

class ListCommentsRequest extends $pb.GeneratedMessage {
  factory ListCommentsRequest({
    $core.String? postId,
    $core.String? userId,
    $2.PaginationRequest? pagination,
  }) {
    final $result = create();
    if (postId != null) {
      $result.postId = postId;
    }
    if (userId != null) {
      $result.userId = userId;
    }
    if (pagination != null) {
      $result.pagination = pagination;
    }
    return $result;
  }
  ListCommentsRequest._() : super();
  factory ListCommentsRequest.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory ListCommentsRequest.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'ListCommentsRequest', package: const $pb.PackageName(_omitMessageNames ? '' : 'ontheblock.board.v1'), createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'postId')
    ..aOS(2, _omitFieldNames ? '' : 'userId')
    ..aOM<$2.PaginationRequest>(3, _omitFieldNames ? '' : 'pagination', subBuilder: $2.PaginationRequest.create)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  ListCommentsRequest clone() => ListCommentsRequest()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  ListCommentsRequest copyWith(void Function(ListCommentsRequest) updates) => super.copyWith((message) => updates(message as ListCommentsRequest)) as ListCommentsRequest;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static ListCommentsRequest create() => ListCommentsRequest._();
  ListCommentsRequest createEmptyInstance() => create();
  static $pb.PbList<ListCommentsRequest> createRepeated() => $pb.PbList<ListCommentsRequest>();
  @$core.pragma('dart2js:noInline')
  static ListCommentsRequest getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<ListCommentsRequest>(create);
  static ListCommentsRequest? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get postId => $_getSZ(0);
  @$pb.TagNumber(1)
  set postId($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasPostId() => $_has(0);
  @$pb.TagNumber(1)
  void clearPostId() => clearField(1);

  @$pb.TagNumber(2)
  $core.String get userId => $_getSZ(1);
  @$pb.TagNumber(2)
  set userId($core.String v) { $_setString(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasUserId() => $_has(1);
  @$pb.TagNumber(2)
  void clearUserId() => clearField(2);

  @$pb.TagNumber(3)
  $2.PaginationRequest get pagination => $_getN(2);
  @$pb.TagNumber(3)
  set pagination($2.PaginationRequest v) { setField(3, v); }
  @$pb.TagNumber(3)
  $core.bool hasPagination() => $_has(2);
  @$pb.TagNumber(3)
  void clearPagination() => clearField(3);
  @$pb.TagNumber(3)
  $2.PaginationRequest ensurePagination() => $_ensure(2);
}

class ListCommentsResponse extends $pb.GeneratedMessage {
  factory ListCommentsResponse({
    $core.Iterable<CommentResponse>? comments,
    $2.PaginationResponse? pagination,
  }) {
    final $result = create();
    if (comments != null) {
      $result.comments.addAll(comments);
    }
    if (pagination != null) {
      $result.pagination = pagination;
    }
    return $result;
  }
  ListCommentsResponse._() : super();
  factory ListCommentsResponse.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory ListCommentsResponse.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'ListCommentsResponse', package: const $pb.PackageName(_omitMessageNames ? '' : 'ontheblock.board.v1'), createEmptyInstance: create)
    ..pc<CommentResponse>(1, _omitFieldNames ? '' : 'comments', $pb.PbFieldType.PM, subBuilder: CommentResponse.create)
    ..aOM<$2.PaginationResponse>(2, _omitFieldNames ? '' : 'pagination', subBuilder: $2.PaginationResponse.create)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  ListCommentsResponse clone() => ListCommentsResponse()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  ListCommentsResponse copyWith(void Function(ListCommentsResponse) updates) => super.copyWith((message) => updates(message as ListCommentsResponse)) as ListCommentsResponse;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static ListCommentsResponse create() => ListCommentsResponse._();
  ListCommentsResponse createEmptyInstance() => create();
  static $pb.PbList<ListCommentsResponse> createRepeated() => $pb.PbList<ListCommentsResponse>();
  @$core.pragma('dart2js:noInline')
  static ListCommentsResponse getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<ListCommentsResponse>(create);
  static ListCommentsResponse? _defaultInstance;

  @$pb.TagNumber(1)
  $core.List<CommentResponse> get comments => $_getList(0);

  @$pb.TagNumber(2)
  $2.PaginationResponse get pagination => $_getN(1);
  @$pb.TagNumber(2)
  set pagination($2.PaginationResponse v) { setField(2, v); }
  @$pb.TagNumber(2)
  $core.bool hasPagination() => $_has(1);
  @$pb.TagNumber(2)
  void clearPagination() => clearField(2);
  @$pb.TagNumber(2)
  $2.PaginationResponse ensurePagination() => $_ensure(1);
}

class LikeCommentRequest extends $pb.GeneratedMessage {
  factory LikeCommentRequest({
    $core.String? commentId,
    $core.String? userId,
  }) {
    final $result = create();
    if (commentId != null) {
      $result.commentId = commentId;
    }
    if (userId != null) {
      $result.userId = userId;
    }
    return $result;
  }
  LikeCommentRequest._() : super();
  factory LikeCommentRequest.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory LikeCommentRequest.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'LikeCommentRequest', package: const $pb.PackageName(_omitMessageNames ? '' : 'ontheblock.board.v1'), createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'commentId')
    ..aOS(2, _omitFieldNames ? '' : 'userId')
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  LikeCommentRequest clone() => LikeCommentRequest()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  LikeCommentRequest copyWith(void Function(LikeCommentRequest) updates) => super.copyWith((message) => updates(message as LikeCommentRequest)) as LikeCommentRequest;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static LikeCommentRequest create() => LikeCommentRequest._();
  LikeCommentRequest createEmptyInstance() => create();
  static $pb.PbList<LikeCommentRequest> createRepeated() => $pb.PbList<LikeCommentRequest>();
  @$core.pragma('dart2js:noInline')
  static LikeCommentRequest getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<LikeCommentRequest>(create);
  static LikeCommentRequest? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get commentId => $_getSZ(0);
  @$pb.TagNumber(1)
  set commentId($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasCommentId() => $_has(0);
  @$pb.TagNumber(1)
  void clearCommentId() => clearField(1);

  @$pb.TagNumber(2)
  $core.String get userId => $_getSZ(1);
  @$pb.TagNumber(2)
  set userId($core.String v) { $_setString(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasUserId() => $_has(1);
  @$pb.TagNumber(2)
  void clearUserId() => clearField(2);
}

class LikeCommentResponse extends $pb.GeneratedMessage {
  factory LikeCommentResponse({
    $core.bool? liked,
    $core.int? likeCount,
  }) {
    final $result = create();
    if (liked != null) {
      $result.liked = liked;
    }
    if (likeCount != null) {
      $result.likeCount = likeCount;
    }
    return $result;
  }
  LikeCommentResponse._() : super();
  factory LikeCommentResponse.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory LikeCommentResponse.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'LikeCommentResponse', package: const $pb.PackageName(_omitMessageNames ? '' : 'ontheblock.board.v1'), createEmptyInstance: create)
    ..aOB(1, _omitFieldNames ? '' : 'liked')
    ..a<$core.int>(2, _omitFieldNames ? '' : 'likeCount', $pb.PbFieldType.O3)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  LikeCommentResponse clone() => LikeCommentResponse()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  LikeCommentResponse copyWith(void Function(LikeCommentResponse) updates) => super.copyWith((message) => updates(message as LikeCommentResponse)) as LikeCommentResponse;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static LikeCommentResponse create() => LikeCommentResponse._();
  LikeCommentResponse createEmptyInstance() => create();
  static $pb.PbList<LikeCommentResponse> createRepeated() => $pb.PbList<LikeCommentResponse>();
  @$core.pragma('dart2js:noInline')
  static LikeCommentResponse getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<LikeCommentResponse>(create);
  static LikeCommentResponse? _defaultInstance;

  @$pb.TagNumber(1)
  $core.bool get liked => $_getBF(0);
  @$pb.TagNumber(1)
  set liked($core.bool v) { $_setBool(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasLiked() => $_has(0);
  @$pb.TagNumber(1)
  void clearLiked() => clearField(1);

  @$pb.TagNumber(2)
  $core.int get likeCount => $_getIZ(1);
  @$pb.TagNumber(2)
  set likeCount($core.int v) { $_setSignedInt32(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasLikeCount() => $_has(1);
  @$pb.TagNumber(2)
  void clearLikeCount() => clearField(2);
}

class ReportPostRequest extends $pb.GeneratedMessage {
  factory ReportPostRequest({
    $core.String? postId,
    $core.String? reporterId,
    ReportReason? reason,
    $core.String? detail,
  }) {
    final $result = create();
    if (postId != null) {
      $result.postId = postId;
    }
    if (reporterId != null) {
      $result.reporterId = reporterId;
    }
    if (reason != null) {
      $result.reason = reason;
    }
    if (detail != null) {
      $result.detail = detail;
    }
    return $result;
  }
  ReportPostRequest._() : super();
  factory ReportPostRequest.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory ReportPostRequest.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'ReportPostRequest', package: const $pb.PackageName(_omitMessageNames ? '' : 'ontheblock.board.v1'), createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'postId')
    ..aOS(2, _omitFieldNames ? '' : 'reporterId')
    ..e<ReportReason>(3, _omitFieldNames ? '' : 'reason', $pb.PbFieldType.OE, defaultOrMaker: ReportReason.REPORT_REASON_UNSPECIFIED, valueOf: ReportReason.valueOf, enumValues: ReportReason.values)
    ..aOS(4, _omitFieldNames ? '' : 'detail')
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  ReportPostRequest clone() => ReportPostRequest()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  ReportPostRequest copyWith(void Function(ReportPostRequest) updates) => super.copyWith((message) => updates(message as ReportPostRequest)) as ReportPostRequest;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static ReportPostRequest create() => ReportPostRequest._();
  ReportPostRequest createEmptyInstance() => create();
  static $pb.PbList<ReportPostRequest> createRepeated() => $pb.PbList<ReportPostRequest>();
  @$core.pragma('dart2js:noInline')
  static ReportPostRequest getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<ReportPostRequest>(create);
  static ReportPostRequest? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get postId => $_getSZ(0);
  @$pb.TagNumber(1)
  set postId($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasPostId() => $_has(0);
  @$pb.TagNumber(1)
  void clearPostId() => clearField(1);

  @$pb.TagNumber(2)
  $core.String get reporterId => $_getSZ(1);
  @$pb.TagNumber(2)
  set reporterId($core.String v) { $_setString(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasReporterId() => $_has(1);
  @$pb.TagNumber(2)
  void clearReporterId() => clearField(2);

  @$pb.TagNumber(3)
  ReportReason get reason => $_getN(2);
  @$pb.TagNumber(3)
  set reason(ReportReason v) { setField(3, v); }
  @$pb.TagNumber(3)
  $core.bool hasReason() => $_has(2);
  @$pb.TagNumber(3)
  void clearReason() => clearField(3);

  @$pb.TagNumber(4)
  $core.String get detail => $_getSZ(3);
  @$pb.TagNumber(4)
  set detail($core.String v) { $_setString(3, v); }
  @$pb.TagNumber(4)
  $core.bool hasDetail() => $_has(3);
  @$pb.TagNumber(4)
  void clearDetail() => clearField(4);
}

class ReportPostResponse extends $pb.GeneratedMessage {
  factory ReportPostResponse() => create();
  ReportPostResponse._() : super();
  factory ReportPostResponse.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory ReportPostResponse.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'ReportPostResponse', package: const $pb.PackageName(_omitMessageNames ? '' : 'ontheblock.board.v1'), createEmptyInstance: create)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  ReportPostResponse clone() => ReportPostResponse()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  ReportPostResponse copyWith(void Function(ReportPostResponse) updates) => super.copyWith((message) => updates(message as ReportPostResponse)) as ReportPostResponse;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static ReportPostResponse create() => ReportPostResponse._();
  ReportPostResponse createEmptyInstance() => create();
  static $pb.PbList<ReportPostResponse> createRepeated() => $pb.PbList<ReportPostResponse>();
  @$core.pragma('dart2js:noInline')
  static ReportPostResponse getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<ReportPostResponse>(create);
  static ReportPostResponse? _defaultInstance;
}

class ReportCommentRequest extends $pb.GeneratedMessage {
  factory ReportCommentRequest({
    $core.String? commentId,
    $core.String? reporterId,
    ReportReason? reason,
    $core.String? detail,
  }) {
    final $result = create();
    if (commentId != null) {
      $result.commentId = commentId;
    }
    if (reporterId != null) {
      $result.reporterId = reporterId;
    }
    if (reason != null) {
      $result.reason = reason;
    }
    if (detail != null) {
      $result.detail = detail;
    }
    return $result;
  }
  ReportCommentRequest._() : super();
  factory ReportCommentRequest.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory ReportCommentRequest.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'ReportCommentRequest', package: const $pb.PackageName(_omitMessageNames ? '' : 'ontheblock.board.v1'), createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'commentId')
    ..aOS(2, _omitFieldNames ? '' : 'reporterId')
    ..e<ReportReason>(3, _omitFieldNames ? '' : 'reason', $pb.PbFieldType.OE, defaultOrMaker: ReportReason.REPORT_REASON_UNSPECIFIED, valueOf: ReportReason.valueOf, enumValues: ReportReason.values)
    ..aOS(4, _omitFieldNames ? '' : 'detail')
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  ReportCommentRequest clone() => ReportCommentRequest()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  ReportCommentRequest copyWith(void Function(ReportCommentRequest) updates) => super.copyWith((message) => updates(message as ReportCommentRequest)) as ReportCommentRequest;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static ReportCommentRequest create() => ReportCommentRequest._();
  ReportCommentRequest createEmptyInstance() => create();
  static $pb.PbList<ReportCommentRequest> createRepeated() => $pb.PbList<ReportCommentRequest>();
  @$core.pragma('dart2js:noInline')
  static ReportCommentRequest getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<ReportCommentRequest>(create);
  static ReportCommentRequest? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get commentId => $_getSZ(0);
  @$pb.TagNumber(1)
  set commentId($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasCommentId() => $_has(0);
  @$pb.TagNumber(1)
  void clearCommentId() => clearField(1);

  @$pb.TagNumber(2)
  $core.String get reporterId => $_getSZ(1);
  @$pb.TagNumber(2)
  set reporterId($core.String v) { $_setString(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasReporterId() => $_has(1);
  @$pb.TagNumber(2)
  void clearReporterId() => clearField(2);

  @$pb.TagNumber(3)
  ReportReason get reason => $_getN(2);
  @$pb.TagNumber(3)
  set reason(ReportReason v) { setField(3, v); }
  @$pb.TagNumber(3)
  $core.bool hasReason() => $_has(2);
  @$pb.TagNumber(3)
  void clearReason() => clearField(3);

  @$pb.TagNumber(4)
  $core.String get detail => $_getSZ(3);
  @$pb.TagNumber(4)
  set detail($core.String v) { $_setString(3, v); }
  @$pb.TagNumber(4)
  $core.bool hasDetail() => $_has(3);
  @$pb.TagNumber(4)
  void clearDetail() => clearField(4);
}

class ReportCommentResponse extends $pb.GeneratedMessage {
  factory ReportCommentResponse() => create();
  ReportCommentResponse._() : super();
  factory ReportCommentResponse.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory ReportCommentResponse.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'ReportCommentResponse', package: const $pb.PackageName(_omitMessageNames ? '' : 'ontheblock.board.v1'), createEmptyInstance: create)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  ReportCommentResponse clone() => ReportCommentResponse()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  ReportCommentResponse copyWith(void Function(ReportCommentResponse) updates) => super.copyWith((message) => updates(message as ReportCommentResponse)) as ReportCommentResponse;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static ReportCommentResponse create() => ReportCommentResponse._();
  ReportCommentResponse createEmptyInstance() => create();
  static $pb.PbList<ReportCommentResponse> createRepeated() => $pb.PbList<ReportCommentResponse>();
  @$core.pragma('dart2js:noInline')
  static ReportCommentResponse getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<ReportCommentResponse>(create);
  static ReportCommentResponse? _defaultInstance;
}


const _omitFieldNames = $core.bool.fromEnvironment('protobuf.omit_field_names');
const _omitMessageNames = $core.bool.fromEnvironment('protobuf.omit_message_names');
