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
    required this.authorAvatarUrl,
    this.imageUrl,
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
  final String authorAvatarUrl;
  final String? imageUrl;
  final String? location;
}
