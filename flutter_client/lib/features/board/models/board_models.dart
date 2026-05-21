import 'package:flutter/material.dart';

@immutable
class BoardPost {
  const BoardPost({
    required this.postId,
    required this.boardType,
    required this.authorId,
    required this.authorNickname,
    required this.authorProfileImageUrl,
    required this.title,
    required this.content,
    required this.imageUrls,
    required this.likeCount,
    required this.viewCount,
    required this.commentCount,
    required this.isNotice,
    required this.isLiked,
    required this.createdAt,
    required this.updatedAt,
    this.location,
    // UI-only helpers (derived or kept for mock compatibility)
    this.category,
    this.timeAgo,
    this.author,
    this.authorAvatarUrl,
    this.imageUrl,
    this.favoriteCount,
    this.body,
  });

  final String postId;
  final String boardType;
  final String authorId;
  final String authorNickname;
  final String authorProfileImageUrl;
  final String title;
  final String content;
  final List<String> imageUrls;
  final int likeCount;
  final int viewCount;
  final int commentCount;
  final bool isNotice;
  final bool isLiked;
  final DateTime createdAt;
  final DateTime updatedAt;
  final BoardLocation? location;

  // Legacy UI-only fields kept for mock/display compatibility
  final String? category;
  final String? timeAgo;
  final String? author;
  final String? authorAvatarUrl;
  final String? imageUrl;
  final int? favoriteCount;
  final String? body;

  factory BoardPost.fromJson(Map<String, dynamic> json) {
    return BoardPost(
      postId: json['post_id'] as String? ?? '',
      boardType: json['board_type'] as String? ?? '',
      authorId: json['author_id'] as String? ?? '',
      authorNickname: json['author_nickname'] as String? ?? '',
      authorProfileImageUrl: json['author_profile_image_url'] as String? ?? '',
      title: json['title'] as String? ?? '',
      content: json['content'] as String? ?? '',
      imageUrls:
          (json['image_urls'] as List<dynamic>?)
              ?.map((e) => e as String)
              .toList() ??
          [],
      likeCount: json['like_count'] as int? ?? 0,
      viewCount: json['view_count'] as int? ?? 0,
      commentCount: json['comment_count'] as int? ?? 0,
      isNotice: json['is_notice'] as bool? ?? false,
      isLiked: json['is_liked'] as bool? ?? false,
      createdAt: json['created_at'] != null
          ? DateTime.parse(json['created_at'] as String)
          : DateTime.now(),
      updatedAt: json['updated_at'] != null
          ? DateTime.parse(json['updated_at'] as String)
          : DateTime.now(),
      location: json['location'] != null
          ? BoardLocation.fromJson(json['location'] as Map<String, dynamic>)
          : null,
    );
  }
}

@immutable
class BoardLocation {
  const BoardLocation({
    required this.name,
    required this.address,
    required this.latitude,
    required this.longitude,
  });

  final String name;
  final String address;
  final double latitude;
  final double longitude;

  factory BoardLocation.fromJson(Map<String, dynamic> json) {
    return BoardLocation(
      name: json['name'] as String? ?? '',
      address: json['address'] as String? ?? '',
      latitude: (json['latitude'] as num?)?.toDouble() ?? 0,
      longitude: (json['longitude'] as num?)?.toDouble() ?? 0,
    );
  }
}

@immutable
class BoardComment {
  const BoardComment({
    required this.commentId,
    required this.postId,
    required this.parentCommentId,
    required this.authorId,
    required this.authorNickname,
    required this.authorProfileImageUrl,
    required this.content,
    required this.likeCount,
    required this.isLiked,
    required this.isDeleted,
    required this.replies,
    required this.createdAt,
    required this.updatedAt,
  });

  final String commentId;
  final String postId;
  final String parentCommentId;
  final String authorId;
  final String authorNickname;
  final String authorProfileImageUrl;
  final String content;
  final int likeCount;
  final bool isLiked;
  final bool isDeleted;
  final List<BoardComment> replies;
  final DateTime createdAt;
  final DateTime updatedAt;

  factory BoardComment.fromJson(Map<String, dynamic> json) {
    return BoardComment(
      commentId: json['comment_id'] as String? ?? '',
      postId: json['post_id'] as String? ?? '',
      parentCommentId: json['parent_comment_id'] as String? ?? '',
      authorId: json['author_id'] as String? ?? '',
      authorNickname: json['author_nickname'] as String? ?? '',
      authorProfileImageUrl: json['author_profile_image_url'] as String? ?? '',
      content: json['content'] as String? ?? '',
      likeCount: json['like_count'] as int? ?? 0,
      isLiked: json['is_liked'] as bool? ?? false,
      isDeleted: json['is_deleted'] as bool? ?? false,
      replies:
          (json['replies'] as List<dynamic>?)
              ?.map((e) => BoardComment.fromJson(e as Map<String, dynamic>))
              .toList() ??
          [],
      createdAt: json['created_at'] != null
          ? DateTime.parse(json['created_at'] as String)
          : DateTime.now(),
      updatedAt: json['updated_at'] != null
          ? DateTime.parse(json['updated_at'] as String)
          : DateTime.now(),
    );
  }
}

@immutable
class BoardPagination {
  const BoardPagination({
    required this.totalCount,
    required this.page,
    required this.pageSize,
    required this.hasNext,
  });

  final int totalCount;
  final int page;
  final int pageSize;
  final bool hasNext;

  factory BoardPagination.fromJson(Map<String, dynamic> json) {
    return BoardPagination(
      totalCount: json['total_count'] as int? ?? 0,
      page: json['page'] as int? ?? 1,
      pageSize: json['page_size'] as int? ?? 20,
      hasNext: json['has_next'] as bool? ?? false,
    );
  }
}

@immutable
class BoardPostPage {
  const BoardPostPage({required this.posts, required this.pagination});

  final List<BoardPost> posts;
  final BoardPagination pagination;
}

@immutable
class BoardCommentPage {
  const BoardCommentPage({required this.comments, required this.pagination});

  final List<BoardComment> comments;
  final BoardPagination pagination;
}
