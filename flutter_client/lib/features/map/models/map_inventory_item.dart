import 'package:flutter/material.dart';

@immutable
class MapInventoryItem {
  const MapInventoryItem({
    required this.beverageId,
    required this.nameKo,
    required this.nameEn,
    required this.priceKrw,
    this.imageUrl = '',
  });

  factory MapInventoryItem.fromJson(Map<String, dynamic> json) {
    return MapInventoryItem(
      beverageId: json['beverage_id'] as String? ?? '',
      nameKo: json['name_ko'] as String? ?? '',
      nameEn: json['name_en'] as String? ?? '',
      priceKrw: (json['price_krw'] as num?)?.toInt() ?? 0,
      imageUrl: json['image_url'] as String? ?? '',
    );
  }

  final String beverageId;
  final String nameKo;
  final String nameEn;
  final int priceKrw;
  final String imageUrl;

  String get displayName => nameKo.isNotEmpty ? nameKo : nameEn;

  String get formattedPrice {
    if (priceKrw <= 0) return '';
    final formatted = priceKrw.toString().replaceAllMapped(
      RegExp(r'(\d{1,3})(?=(\d{3})+(?!\d))'),
      (m) => '${m[1]},',
    );
    return '₩$formatted';
  }
}
