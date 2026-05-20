import 'dart:async';
import 'dart:io';
import 'dart:math';

import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'chat_repository.dart';
import 'grpc_gen/chat/v1/chat.pb.dart';

class ChatPushMessage {
  const ChatPushMessage({required this.roomId, this.messageId = ''});

  final String roomId;
  final String messageId;

  static ChatPushMessage? fromData(Map<String, dynamic> data) {
    if (data['type'] != 'chat_message') {
      return null;
    }
    final roomId = data['room_id']?.toString().trim() ?? '';
    if (roomId.isEmpty) {
      return null;
    }
    return ChatPushMessage(
      roomId: roomId,
      messageId: data['message_id']?.toString() ?? '',
    );
  }
}

abstract class ChatPushService {
  Future<void> start({
    required String authToken,
    required ChatRepository chatRepository,
    required Future<void> Function(ChatPushMessage message)
    onForegroundChatMessage,
    required Future<void> Function(ChatPushMessage message) onOpenedChatMessage,
  });

  Future<void> unregister({
    required String authToken,
    required ChatRepository chatRepository,
  });

  Future<void> dispose();
}

class FirebaseChatPushService implements ChatPushService {
  static const _deviceIdKey = 'chat.push.device_id';

  StreamSubscription<String>? _tokenRefreshSubscription;
  StreamSubscription<RemoteMessage>? _foregroundMessageSubscription;
  StreamSubscription<RemoteMessage>? _openedMessageSubscription;
  ChatRepository? _chatRepository;
  String _authToken = '';

  @override
  Future<void> start({
    required String authToken,
    required ChatRepository chatRepository,
    required Future<void> Function(ChatPushMessage message)
    onForegroundChatMessage,
    required Future<void> Function(ChatPushMessage message) onOpenedChatMessage,
  }) async {
    final tokenForAuth = authToken.trim();
    if (tokenForAuth.isEmpty) {
      return;
    }

    final platform = _currentPlatform;
    if (platform == null) {
      return;
    }

    await _cancelSubscriptions();
    _authToken = tokenForAuth;
    _chatRepository = chatRepository;

    await _ensureFirebaseInitialized();
    await FirebaseMessaging.instance.requestPermission(
      alert: true,
      badge: true,
      sound: true,
    );

    final deviceId = await _loadDeviceId(createIfMissing: true);
    if (deviceId == null) {
      return;
    }
    final fcmToken = await FirebaseMessaging.instance.getToken();
    if (fcmToken != null && fcmToken.trim().isNotEmpty) {
      await _registerToken(
        deviceId: deviceId,
        token: fcmToken,
        platform: platform,
      );
    }

    _tokenRefreshSubscription = FirebaseMessaging.instance.onTokenRefresh
        .listen((token) {
          unawaited(
            _registerToken(
              deviceId: deviceId,
              token: token,
              platform: platform,
            ),
          );
        });
    _foregroundMessageSubscription = FirebaseMessaging.onMessage.listen((
      message,
    ) {
      final chatMessage = ChatPushMessage.fromData(message.data);
      if (chatMessage != null) {
        unawaited(onForegroundChatMessage(chatMessage));
      }
    });
    _openedMessageSubscription = FirebaseMessaging.onMessageOpenedApp.listen((
      message,
    ) {
      final chatMessage = ChatPushMessage.fromData(message.data);
      if (chatMessage != null) {
        unawaited(onOpenedChatMessage(chatMessage));
      }
    });

    final initialMessage = await FirebaseMessaging.instance.getInitialMessage();
    final initialChatMessage = initialMessage == null
        ? null
        : ChatPushMessage.fromData(initialMessage.data);
    if (initialChatMessage != null) {
      await onOpenedChatMessage(initialChatMessage);
    }
  }

  @override
  Future<void> unregister({
    required String authToken,
    required ChatRepository chatRepository,
  }) async {
    await _cancelSubscriptions();
    _authToken = '';
    _chatRepository = null;
    final tokenForAuth = authToken.trim();
    if (tokenForAuth.isEmpty) {
      return;
    }

    final deviceId = await _loadDeviceId(createIfMissing: false);
    if (deviceId == null || deviceId.isEmpty) {
      return;
    }

    await chatRepository.unregisterDeviceToken(
      deviceId: deviceId,
      authToken: tokenForAuth,
    );
  }

  @override
  Future<void> dispose() async {
    await _cancelSubscriptions();
    _authToken = '';
    _chatRepository = null;
  }

  Future<void> _registerToken({
    required String deviceId,
    required String token,
    required DevicePlatform platform,
  }) async {
    final repo = _chatRepository;
    final tokenForAuth = _authToken.trim();
    final normalizedToken = token.trim();
    if (repo == null || tokenForAuth.isEmpty || normalizedToken.isEmpty) {
      return;
    }

    await repo.registerDeviceToken(
      deviceId: deviceId,
      token: normalizedToken,
      platform: platform,
      authToken: tokenForAuth,
    );
  }

  Future<String?> _loadDeviceId({required bool createIfMissing}) async {
    final prefs = await SharedPreferences.getInstance();
    final existing = prefs.getString(_deviceIdKey);
    if (existing != null && existing.isNotEmpty) {
      return existing;
    }
    if (!createIfMissing) {
      return null;
    }

    final id = _generateDeviceId();
    await prefs.setString(_deviceIdKey, id);
    return id;
  }

  Future<void> _cancelSubscriptions() async {
    await _tokenRefreshSubscription?.cancel();
    await _foregroundMessageSubscription?.cancel();
    await _openedMessageSubscription?.cancel();
    _tokenRefreshSubscription = null;
    _foregroundMessageSubscription = null;
    _openedMessageSubscription = null;
  }

  Future<void> _ensureFirebaseInitialized() async {
    if (Firebase.apps.isEmpty) {
      await Firebase.initializeApp();
    }
  }

  DevicePlatform? get _currentPlatform {
    if (Platform.isIOS) {
      return DevicePlatform.DEVICE_PLATFORM_IOS;
    }
    if (Platform.isAndroid) {
      return DevicePlatform.DEVICE_PLATFORM_ANDROID;
    }
    return null;
  }

  String _generateDeviceId() {
    final random = Random.secure();
    return List<int>.generate(
      16,
      (_) => random.nextInt(256),
    ).map((byte) => byte.toRadixString(16).padLeft(2, '0')).join();
  }
}
