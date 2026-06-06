import 'package:flutter/material.dart';

import 'map_inventory_item.dart';
import 'map_menu_item.dart';

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
    required this.imageUrls,
    required this.tags,
    this.isOpenNow,
    this.openHours = '',
    this.reviewCount,
    this.inventory = const [],
    this.menu = const [],
  });

  factory MapPlace.fromApiMarker(Map<String, dynamic> json) {
    final layerCode = json['layerCode'] as String? ?? 'other';
    final ratingRaw = json['rating'];

    final rawUrls = json['imageUrls'];
    final imageUrls = rawUrls is List
        ? rawUrls.whereType<String>().toList()
        : <String>[];

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
      imageUrls: imageUrls,
      tags: const [],
      isOpenNow: json['isOpen'] as bool?,
      openHours: json['hours'] as String? ?? '',
      reviewCount: (json['reviewCount'] as num?)?.toInt(),
      inventory: (json['inventory'] as List<dynamic>?)
              ?.whereType<Map<String, dynamic>>()
              .map(MapInventoryItem.fromJson)
              .toList() ??
          const [],
      menu: (json['menu'] as List<dynamic>?)
              ?.whereType<Map<String, dynamic>>()
              .map(MapMenuItem.fromJson)
              .toList() ??
          const [],
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
  final List<String> imageUrls;
  final List<String> tags;
  final bool? isOpenNow;
  final String openHours;
  final int? reviewCount;
  final List<MapInventoryItem> inventory;
  final List<MapMenuItem> menu;

  String get imageUrl => imageUrls.isNotEmpty ? imageUrls.first : '';
}
