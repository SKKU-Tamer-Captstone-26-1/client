import 'package:flutter/material.dart';

@immutable
class MapPlace {
  const MapPlace({
    required this.id,
    required this.name,
    required this.category,
    required this.address,
    required this.distanceLabel,
    required this.rating,
    required this.status,
    required this.latitude,
    required this.longitude,
    required this.imageUrl,
    required this.tags,
  });

  final String id;
  final String name;
  final String category;
  final String address;
  final String distanceLabel;
  final String rating;
  final String status;
  final double latitude;
  final double longitude;
  final String imageUrl;
  final List<String> tags;
}
