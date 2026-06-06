import 'package:flutter/material.dart';

@immutable
class MapReview {
  const MapReview({
    required this.reviewId,
    required this.authorId,
    required this.author,
    required this.isAnonymous,
    required this.rating,
    required this.body,
    required this.dateLabel,
    this.profileImageUrl,
  });

  factory MapReview.fromJson(Map<String, dynamic> json) {
    return MapReview(
      reviewId: json['review_id'] as String? ?? '',
      authorId: json['author_id'] as String? ?? '',
      author: json['author'] as String? ?? 'Anonymous',
      isAnonymous: json['is_anonymous'] as bool? ?? false,
      rating: (json['rating'] as num?)?.toInt() ?? 0,
      body: json['body'] as String? ?? '',
      dateLabel: json['date_label'] as String? ?? '',
      profileImageUrl: json['profile_image_url'] as String?,
    );
  }

  final String reviewId;
  final String authorId;
  final String author;
  final bool isAnonymous;
  final int rating;
  final String body;
  final String dateLabel;
  final String? profileImageUrl;
}
