import 'package:flutter/material.dart';

@immutable
class MapMenuItem {
  const MapMenuItem({
    required this.name,
    required this.desc,
    required this.priceKrw,
  });

  factory MapMenuItem.fromJson(Map<String, dynamic> json) {
    return MapMenuItem(
      name: json['name'] as String? ?? '',
      desc: json['desc'] as String? ?? '',
      priceKrw: (json['price_krw'] as num?)?.toInt() ?? 0,
    );
  }

  final String name;
  final String desc;
  final int priceKrw;

  String get formattedPrice {
    if (priceKrw <= 0) return '';
    final formatted = priceKrw.toString().replaceAllMapped(
      RegExp(r'(\d{1,3})(?=(\d{3})+(?!\d))'),
      (m) => '${m[1]},',
    );
    return '₩$formatted';
  }
}
