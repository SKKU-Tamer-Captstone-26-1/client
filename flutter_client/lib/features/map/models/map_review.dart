import 'package:flutter/material.dart';

@immutable
class MapReview {
  const MapReview({
    required this.author,
    required this.rating,
    required this.body,
    required this.dateLabel,
  });

  factory MapReview.fromJson(Map<String, dynamic> json) {
    return MapReview(
      author: json['author'] as String? ?? '익명',
      rating: (json['rating'] as num?)?.toInt() ?? 0,
      body: json['body'] as String? ?? '',
      dateLabel: json['date_label'] as String? ?? '',
    );
  }

  final String author;
  final int rating;
  final String body;
  final String dateLabel;
}
