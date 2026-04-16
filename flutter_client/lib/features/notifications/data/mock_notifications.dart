import 'package:flutter/material.dart';

import '../models/notification_models.dart';

const mockNotifications = [
  AppNotification(
    title: 'New post in your board',
    body: 'BottleHunter posted a rare bourbon drop in TradeBoard.',
    timeLabel: '15m ago',
    icon: Icons.forum,
    targetType: AppNotificationTargetType.boardPost,
    targetId: 'mock_board_post_nearby_drop',
    isUnread: true,
  ),
  AppNotification(
    title: 'Rare bourbon drop nearby',
    body: 'The Oak & Barrel posted a limited bottle alert.',
    timeLabel: '32m ago',
    icon: Icons.local_bar,
    targetType: AppNotificationTargetType.storeDrop,
    targetId: 'mock_store_drop_oak_barrel',
    isUnread: true,
  ),
  AppNotification(
    title: 'New reply on your board post',
    body: 'PeatSeeker92 shared an Islay recommendation.',
    timeLabel: '1h ago',
    icon: Icons.forum,
    targetType: AppNotificationTargetType.boardPost,
    targetId: 'mock_board_post_question',
    isUnread: true,
  ),
  AppNotification(
    title: 'Collection reminder',
    body: 'A saved wishlist bottle is still available.',
    timeLabel: '3h ago',
    icon: Icons.inventory_2,
    targetType: AppNotificationTargetType.collectionItem,
    targetId: 'mock_collection_item_bourbon',
  ),
  AppNotification(
    title: 'Westside Bourbon Enthusiasts',
    body: 'Marcus shared a new message in your group chat.',
    timeLabel: 'Today',
    icon: Icons.chat_bubble,
    targetType: AppNotificationTargetType.chatRoom,
    targetId: 'mock_chat_room_westside_bourbon',
  ),
];
