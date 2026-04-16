import 'package:flutter/material.dart';

@immutable
class HomeHero {
  const HomeHero({
    required this.badge,
    required this.title,
    required this.taste,
    required this.smell,
    required this.imageUrl,
  });

  final String badge;
  final String title;
  final String taste;
  final String smell;
  final String imageUrl;
}

@immutable
class LocalEstablishment {
  const LocalEstablishment({
    required this.name,
    required this.distance,
    required this.category,
    required this.rating,
    required this.closingTime,
    required this.imageUrl,
  });

  final String name;
  final String distance;
  final String category;
  final String rating;
  final String closingTime;
  final String imageUrl;
}

@immutable
class OutdoorVault {
  const OutdoorVault({
    required this.name,
    required this.location,
    required this.status,
    required this.actionLabel,
    required this.isPrimaryAction,
    required this.imageUrl,
  });

  final String name;
  final String location;
  final String status;
  final String actionLabel;
  final bool isPrimaryAction;
  final String imageUrl;
}

@immutable
class NeighborhoodPost {
  const NeighborhoodPost({
    required this.author,
    required this.meta,
    required this.body,
    required this.tags,
    required this.avatarUrl,
  });

  final String author;
  final String meta;
  final String body;
  final List<String> tags;
  final String avatarUrl;
}
