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

  factory MapPlace.fromApiMarker(Map<String, dynamic> json) {
    return MapPlace(
      id: json['id'] as String,
      name: json['label'] as String? ?? '',
      category: _layerLabel(json['layerCode'] as String? ?? ''),
      address: '',
      distanceLabel: '',
      rating: '',
      status: '',
      latitude: (json['latitude'] as num).toDouble(),
      longitude: (json['longitude'] as num).toDouble(),
      imageUrl: '',
      tags: const [],
    );
  }

  static String _layerLabel(String code) {
    return switch (code) {
      'bar' => 'Bar',
      'pub' => 'Pub',
      'liquor_shop' => 'Liquor Shop',
      'outdoor_spot' => 'Outdoor Spot',
      'restaurant' => 'Restaurant',
      'convenience_store' => 'Convenience Store',
      _ => code,
    };
  }

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
