import 'package:flutter/material.dart';

@immutable
class BoardPost {
  const BoardPost({
    required this.boardId,
    required this.category,
    required this.title,
    required this.body,
    required this.author,
    required this.boardOwnerUserId,
    required this.timeAgo,
    required this.commentCount,
    required this.favoriteCount,
    required this.isLiked,
    required this.authorAvatarUrl,
    this.imageUrls = const [],
    this.location,
  });

  final String boardId;
  final String boardOwnerUserId;
  final String category;
  final String title;
  final String body;
  final String author;
  final String timeAgo;
  final int commentCount;
  final int favoriteCount;
  final bool isLiked;
  final String authorAvatarUrl;
  final List<String> imageUrls;
  String? get imageUrl => imageUrls.isNotEmpty ? imageUrls.first : null;
  final String? location;
}

@immutable
class BoardComment {
  const BoardComment({
    required this.commentId,
    required this.postId,
    this.parentCommentId = '',
    required this.authorId,
    required this.authorNickname,
    required this.authorProfileImageUrl,
    required this.content,
    required this.likeCount,
    required this.isLiked,
    required this.isDeleted,
    required this.timeAgo,
    this.replies = const [],
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
  final String timeAgo;
  final List<BoardComment> replies;
}
