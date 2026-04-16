import 'package:flutter/material.dart';

abstract final class AppIcons {
  static const topAppBarBrand = Icons.liquor;
  static const topAppBarSearch = Icons.search;
  static const topAppBarNotifications = Icons.notifications;
  static const topAppBarProfile = Icons.account_circle;

  static const home = Icons.home;
  static const map = Icons.map;
  static const board = Icons.forum;
  static const chat = Icons.chat_bubble;
  static const bucketCheck = Icons.inventory_2;
}

enum AppBottomNavItem {
  home(label: 'Home', icon: AppIcons.home),
  map(label: 'Map', icon: AppIcons.map),
  board(label: 'Board', icon: AppIcons.board),
  chat(label: 'Chat', icon: AppIcons.chat),
  collection(label: 'Collection', icon: AppIcons.bucketCheck);

  const AppBottomNavItem({required this.label, required this.icon});

  final String label;
  final IconData icon;
}
