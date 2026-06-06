import 'package:flutter/material.dart';

@immutable
class MapMenuItem {
  const MapMenuItem({
    required this.name,
    required this.desc,
    required this.priceKrw,
    this.imageUrl = '',
  });

  factory MapMenuItem.fromJson(Map<String, dynamic> json) {
    return MapMenuItem(
      name: json['name'] as String? ?? '',
      desc: json['desc'] as String? ?? '',
      priceKrw: (json['price_krw'] as num?)?.toInt() ?? 0,
      imageUrl: json['image_url'] as String? ?? '',
    );
  }

  final String name;
  final String desc;
  final int priceKrw;
  final String imageUrl;

  String get formattedPrice {
    if (priceKrw <= 0) return '';
    final formatted = priceKrw.toString().replaceAllMapped(
      RegExp(r'(\d{1,3})(?=(\d{3})+(?!\d))'),
      (m) => '${m[1]},',
    );
    return '₩$formatted';
  }
}
