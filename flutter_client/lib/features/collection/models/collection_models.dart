import 'package:flutter/material.dart';

@immutable
class CollectionProduct {
  const CollectionProduct({
    required this.name,
    required this.shopName,
    required this.imageUrl,
    required this.priceLabel,
    required this.note,
    required this.recommendedStoreOptions,
  });

  final String name;
  final String shopName;
  final String imageUrl;
  final String priceLabel;
  final String note;
  final List<RecommendedStoreOption> recommendedStoreOptions;
}

@immutable
class RecommendedStoreOption {
  const RecommendedStoreOption({
    required this.imageUrl,
    required this.storeName,
    required this.distanceLabel,
    required this.priceLabel,
  });

  final String imageUrl;
  final String storeName;
  final String distanceLabel;
  final String priceLabel;
}

@immutable
class CartShopGroup {
  const CartShopGroup({required this.shopName, required this.items});

  final String shopName;
  final List<CartItem> items;
}

@immutable
class CartItem {
  const CartItem({
    required this.name,
    required this.imageUrl,
    required this.quantity,
    required this.priceLabel,
  });

  final String name;
  final String imageUrl;
  final int quantity;
  final String priceLabel;
}
