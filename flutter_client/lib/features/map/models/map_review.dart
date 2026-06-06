import 'package:flutter/material.dart';

@immutable
class MapReview {
  const MapReview({
    required this.authorId,
    required this.author,
    required this.isAnonymous,
    required this.rating,
    required this.body,
    required this.dateLabel,
  });

  factory MapReview.fromJson(Map<String, dynamic> json) {
    return MapReview(
      authorId: json['author_id'] as String? ?? '',
      author: json['author'] as String? ?? 'Anonymous',
      isAnonymous: json['is_anonymous'] as bool? ?? false,
      rating: (json['rating'] as num?)?.toInt() ?? 0,
      body: json['body'] as String? ?? '',
      dateLabel: json['date_label'] as String? ?? '',
    );
  }

  final String authorId;
  final String author;
  final bool isAnonymous;
  final int rating;
  final String body;
  final String dateLabel;
}
