import 'package:flutter/material.dart';

@immutable
class MapPlace {
  const MapPlace({
    required this.id,
    required this.name,
    required this.category,
    required this.layerCode,
    required this.address,
    required this.distanceLabel,
    required this.rating,
    required this.status,
    required this.latitude,
    required this.longitude,
    required this.imageUrl,
    required this.tags,
    this.isOpenNow,
    this.openHours = '',
    this.reviewCount,
  });

  factory MapPlace.fromApiMarker(Map<String, dynamic> json) {
    final layerCode = json['layerCode'] as String? ?? 'other';
    final ratingRaw = json['rating'];
    return MapPlace(
      id: json['id'] as String,
      name: json['label'] as String? ?? '',
      category: _layerLabel(layerCode),
      layerCode: layerCode,
      address: json['address'] as String? ?? '',
      distanceLabel: '',
      rating: ratingRaw != null ? ratingRaw.toString() : '',
      status: '',
      latitude: (json['latitude'] as num).toDouble(),
      longitude: (json['longitude'] as num).toDouble(),
      imageUrl: json['imageUrl'] as String? ?? '',
      tags: const [],
      isOpenNow: json['isOpen'] as bool?,
      openHours: json['hours'] as String? ?? '',
      reviewCount: (json['reviewCount'] as num?)?.toInt(),
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
  final String layerCode;
  final String address;
  final String distanceLabel;
  final String rating;
  final String status;
  final double latitude;
  final double longitude;
  final String imageUrl;
  final List<String> tags;
  final bool? isOpenNow;
  final String openHours;
  final int? reviewCount;
}
