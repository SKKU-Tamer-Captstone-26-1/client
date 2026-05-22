import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:kakao_maps_flutter/kakao_maps_flutter.dart';

import 'core/theme/app_theme.dart';
import 'core/theme/app_icons.dart';
import 'core/config/app_config.dart';
import 'features/auth/presentation/login_screen.dart';
import 'features/auth/providers/auth_provider.dart';
import 'features/auth/providers/auth_repository_provider.dart';
import 'features/board/models/board_models.dart';
import 'features/board/presentation/board_screen.dart';
import 'features/chat/data/chat_push_service.dart';
import 'features/chat/data/chat_remote_data_source.dart';
import 'features/chat/data/chat_repository.dart';
import 'features/chat/models/groupchat_models.dart';
import 'features/chat/presentation/groupchat_list_screen.dart';
import 'features/chat/presentation/groupchat_room_screen.dart';
import 'features/collection/presentation/collection_screen.dart';
import 'features/home/presentation/home_screen.dart';
import 'features/map/presentation/map_screen.dart';
import 'features/location/presentation/location_screen.dart';
import 'features/preference_survey/presentation/survey_intro_screen.dart';
import 'features/preference_survey/presentation/survey_screen.dart';
import 'features/profile/profile_setup_screen.dart';
import 'features/profile/user_page_screen.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  assertSecureConfig();
  const kakaoMapApiKey = String.fromEnvironment('KAKAO_MAP_API_KEY');
  if (kakaoMapApiKey.isNotEmpty) {
    await KakaoMapsFlutter.init(kakaoMapApiKey);
  }

  runApp(const ProviderScope(child: OnTheBlockApp()));
}

class OnTheBlockApp extends ConsumerStatefulWidget {
  const OnTheBlockApp({super.key, this.chatRepository, this.chatPushService});

  final ChatRepository? chatRepository;
  final ChatPushService? chatPushService;

  @override
  ConsumerState<OnTheBlockApp> createState() => _OnTheBlockAppState();
}

class _OnTheBlockAppState extends ConsumerState<OnTheBlockApp> {
  static const _fallbackChatUserId = String.fromEnvironment(
    'CHAT_USER_ID',
    defaultValue: '11111111-1111-1111-1111-111111111111',
  );

  static const _emptyRoom = GroupchatRoomSummary(
    roomId: '',
    title: '',
    memberSummary: '-/-',
    location: '',
    lastMessage: '',
    timeLabel: '',
    tags: <String>[],
    avatarUrls: <String>[],
  );

  ThemeMode _themeMode = ThemeMode.light;
  _AppStage _stage = _AppStage.login;
  _AppStage _previousStage = _AppStage.home;
  GroupchatRoomSummary _selectedGroupchatRoom = _emptyRoom;
  ChatRepository? _chatRepository;
  ChatPushService? _chatPushService;
  final Set<String> _locallyHiddenRoomIds = <String>{};
  String? _pendingChatPushRoomId;
  int _chatUnreadCount = 0;

  Map<AppBottomNavItem, int> get _bottomNavBadgeCounts {
    return _chatUnreadCount > 0
        ? <AppBottomNavItem, int>{AppBottomNavItem.chat: _chatUnreadCount}
        : const <AppBottomNavItem, int>{};
  }

  String get _currentChatUserId =>
      ref.read(authProvider).userId ?? _fallbackChatUserId;

  String get _currentAuthToken => ref.read(authProvider).accessToken ?? '';

  @override
  void initState() {
    super.initState();
    _chatRepository =
        widget.chatRepository ?? GrpcChatRepository(GrpcChatRemoteDataSource());
    _chatPushService = widget.chatPushService ?? FirebaseChatPushService();
    unawaited(_printDevErrorLogPathAtStartup());
  }

  @override
  void dispose() {
    final pushService = _chatPushService;
    if (pushService != null) {
      unawaited(pushService.dispose());
    }
    final repo = _chatRepository;
    if (repo != null) {
      unawaited(repo.dispose());
    }
    super.dispose();
  }

  void _toggleThemeMode() {
    setState(() {
      _themeMode = _themeMode == ThemeMode.light
          ? ThemeMode.dark
          : ThemeMode.light;
    });
  }

  Future<void> _handleGoogleSignIn() async {
    final session = await ref.read(authRepositoryProvider).googleLogin();
    if (!mounted) return;
    ref
        .read(authProvider.notifier)
        .setSession(
          accessToken: session.accessToken,
          refreshToken: session.refreshToken,
          userId: session.user.userId,
          user: session.user,
          isNewUser: session.isNewUser,
        );
    setState(() {
      if (session.isNewUser) {
        _stage = _AppStage.profileSetup;
      } else if (!session.user.onboardingCompleted) {
        _stage = kBypassSurvey ? _AppStage.locationSetup : _AppStage.surveyIntro;
      } else {
        _stage = _AppStage.home;
      }
    });
    unawaited(_startChatPush(session.accessToken));
    unawaited(_refreshChatUnreadCount());
    _openPendingChatPushIfReady();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'ON THE BLOCK',
      debugShowCheckedModeBanner: false,
      theme: AppTheme.light,
      darkTheme: AppTheme.dark,
      themeMode: _themeMode,
      home: _buildStage(),
    );
  }

  Widget _buildStage() {
    return switch (_stage) {
      _AppStage.profileSetup => ProfileSetupScreen(
        defaultNickname: ref.read(authProvider).user?.nickname ?? '',
        defaultProfileImageUrl:
            ref.read(authProvider).user?.profileImageUrl ?? '',
        userId: ref.read(authProvider).userId ?? '',
        onComplete: () {
          if (kBypassSurvey) {
            ref.read(authProvider.notifier).markSurveyCompleted(surveyId: ref.read(authProvider).user?.surveyId ?? '');
          }
          setState(() {
            _stage = kBypassSurvey ? _AppStage.locationSetup : _AppStage.surveyIntro;
          });
        },
      ),
      _AppStage.login => LoginScreen(
        isDarkMode: _themeMode == ThemeMode.dark,
        onThemeToggle: _toggleThemeMode,
        onGoogleSignIn: _handleGoogleSignIn,
      ),
      _AppStage.surveyIntro => SurveyIntroScreen(
        onStartSurvey: () {
          setState(() {
            _stage = _AppStage.survey;
          });
        },
        onSkip: () {
          setState(() {
            _stage = _AppStage.locationSetup;
          });
        },
      ),
      _AppStage.survey => SurveyScreen(
        onBack: () {
          setState(() {
            _stage = _AppStage.surveyIntro;
          });
        },
        onCompleted: () {
          setState(() {
            _stage = _AppStage.locationSetup;
          });
        },
      ),
      _AppStage.locationSetup => LocationScreen(
        onSave: (neighborhood) => unawaited(_saveNeighborhoodAndFinish(neighborhood)),
        onSkip: () => unawaited(_finishOnboarding()),
      ),
      _AppStage.home => HomeScreen(
        onBottomNavSelected: _selectBottomNavItem,
        onProfileSelected: _goToProfile,
        bottomNavBadgeCounts: _bottomNavBadgeCounts,
      ),
      _AppStage.map => MapScreen(
        onBottomNavSelected: _selectBottomNavItem,
        onProfileSelected: _goToProfile,
        bottomNavBadgeCounts: _bottomNavBadgeCounts,
      ),
      _AppStage.board => BoardScreen(
        onBottomNavSelected: _selectBottomNavItem,
        onProfileSelected: _goToProfile,
        onBoardChatRequested: _openBoardChat,
        bottomNavBadgeCounts: _bottomNavBadgeCounts,
      ),
      _AppStage.chat => GroupchatListScreen(
        chatRepository: _chatRepository,
        currentUserId: _currentChatUserId,
        authToken: _currentAuthToken,
        excludedRoomIds: _locallyHiddenRoomIds,
        bottomNavBadgeCounts: _bottomNavBadgeCounts,
        onUnreadCountChanged: _setChatUnreadCount,
        onBottomNavSelected: _selectBottomNavItem,
        onProfileSelected: _goToProfile,
        onRoomSelected: (room) {
          setState(() {
            _locallyHiddenRoomIds.remove(room.roomId);
            _selectedGroupchatRoom = room;
            _stage = _AppStage.groupchatRoom;
          });
        },
      ),
      _AppStage.groupchatRoom => GroupchatRoomScreen(
        room: _selectedGroupchatRoom,
        chatRepository: _chatRepository,
        currentUserId: _currentChatUserId,
        authToken: _currentAuthToken,
        onBack: () {
          setState(() {
            _stage = _AppStage.chat;
          });
        },
        onRoomDeactivated: (roomId) {
          setState(() {
            _locallyHiddenRoomIds.add(roomId);
          });
        },
      ),
      _AppStage.collection => CollectionScreen(
        onBottomNavSelected: _selectBottomNavItem,
        onProfileSelected: _goToProfile,
        bottomNavBadgeCounts: _bottomNavBadgeCounts,
      ),
      _AppStage.profile => UserPageScreen(
        bottomNavBadgeCounts: _bottomNavBadgeCounts,
        onRetakeSurvey: () {
          setState(() {
            _stage = _AppStage.surveyIntro;
          });
        },
        onLogout: () => unawaited(_handleLogout()),
        onBack: () {
          setState(() {
            _stage = _previousStage;
          });
        },
      ),
    };
  }

  void _selectBottomNavItem(AppBottomNavItem item) {
    setState(() {
      _stage = switch (item) {
        AppBottomNavItem.home => _AppStage.home,
        AppBottomNavItem.map => _AppStage.map,
        AppBottomNavItem.board => _AppStage.board,
        AppBottomNavItem.chat => _AppStage.chat,
        AppBottomNavItem.collection => _AppStage.collection,
      };
    });
  }

  void _goToProfile() {
    setState(() {
      _previousStage = _stage;
      _stage = _AppStage.profile;
    });
  }

  void _setChatUnreadCount(int count) {
    if (_chatUnreadCount == count) {
      return;
    }
    setState(() {
      _chatUnreadCount = count;
    });
  }

  Future<void> _refreshChatUnreadCount() async {
    final repo = _chatRepository;
    final userId = _currentChatUserId;
    final authToken = _currentAuthToken;
    if (repo == null || userId.isEmpty) {
      return;
    }

    try {
      final page = await repo.listMyRooms(
        userId: userId,
        authToken: authToken,
        pageSize: 20,
      );
      if (!mounted) {
        return;
      }
      _setChatUnreadCount(
        page.rooms.fold<int>(0, (sum, room) => sum + room.unreadCount),
      );
    } catch (_) {
      // Keep the existing badge state if chat unread refresh fails.
    }
  }

  Future<void> _startChatPush(String authToken) async {
    final repo = _chatRepository;
    final pushService = _chatPushService;
    if (repo == null || pushService == null || authToken.trim().isEmpty) {
      return;
    }

    try {
      await pushService.start(
        authToken: authToken,
        chatRepository: repo,
        onForegroundChatMessage: _handleForegroundChatPush,
        onOpenedChatMessage: _handleOpenedChatPush,
      );
    } catch (error) {
      if (kDebugMode) {
        debugPrint('CHAT_PUSH_START_FAILED: $error');
      }
    }
  }

  Future<void> _unregisterChatPush(String authToken) async {
    final repo = _chatRepository;
    final pushService = _chatPushService;
    if (repo == null || pushService == null || authToken.trim().isEmpty) {
      return;
    }

    try {
      await pushService.unregister(authToken: authToken, chatRepository: repo);
    } catch (error) {
      if (kDebugMode) {
        debugPrint('CHAT_PUSH_UNREGISTER_FAILED: $error');
      }
    }
  }

  Future<void> _handleForegroundChatPush(ChatPushMessage message) async {
    if (message.roomId.isEmpty) {
      return;
    }

    if (_stage == _AppStage.groupchatRoom &&
        _selectedGroupchatRoom.roomId == message.roomId) {
      await _markChatRoomRead(message.roomId);
    }
    await _refreshChatUnreadCount();
  }

  Future<void> _handleOpenedChatPush(ChatPushMessage message) async {
    final roomId = message.roomId.trim();
    if (roomId.isEmpty) {
      return;
    }

    if (!_canOpenChatPushNow) {
      _pendingChatPushRoomId = roomId;
      return;
    }

    await _openChatRoomById(roomId, markRead: true);
  }

  bool get _canOpenChatPushNow {
    final auth = ref.read(authProvider);
    if (!auth.isAuthenticated) {
      return false;
    }
    return switch (_stage) {
      _AppStage.login ||
      _AppStage.profileSetup ||
      _AppStage.surveyIntro ||
      _AppStage.survey ||
      _AppStage.locationSetup => false,
      _ => true,
    };
  }

  void _openPendingChatPushIfReady() {
    final roomId = _pendingChatPushRoomId;
    if (roomId == null || !_canOpenChatPushNow) {
      return;
    }
    _pendingChatPushRoomId = null;
    unawaited(_openChatRoomById(roomId, markRead: true));
  }

  Future<void> _openChatRoomById(
    String roomId, {
    required bool markRead,
  }) async {
    final normalizedRoomId = roomId.trim();
    if (normalizedRoomId.isEmpty) {
      return;
    }

    if (_stage == _AppStage.groupchatRoom &&
        _selectedGroupchatRoom.roomId == normalizedRoomId) {
      if (markRead) {
        await _markChatRoomRead(normalizedRoomId);
      }
      await _refreshChatUnreadCount();
      return;
    }

    final room = await _findChatRoomById(normalizedRoomId);
    if (markRead) {
      await _markChatRoomRead(normalizedRoomId);
    }
    if (!mounted) {
      return;
    }

    setState(() {
      _locallyHiddenRoomIds.remove(normalizedRoomId);
      _selectedGroupchatRoom = (room ?? _fallbackChatRoom(normalizedRoomId))
          .copyWith(unreadCount: 0);
      _stage = _AppStage.groupchatRoom;
    });
    await _refreshChatUnreadCount();
  }

  Future<void> _openBoardChat(BoardPost post) async {
    final repo = _chatRepository;
    final authToken = _currentAuthToken;
    final boardId = post.boardId.trim();
    if (repo == null || authToken.trim().isEmpty || boardId.isEmpty) {
      throw StateError('Missing chat repository, auth token, or board id.');
    }

    final room = await repo.getOrCreateBoardChatRoom(
      boardId: boardId,
      title: post.title,
      boardOwnerUserId: post.boardOwnerUserId,
      authToken: authToken,
    );
    if (!mounted) {
      return;
    }

    setState(() {
      _locallyHiddenRoomIds.remove(room.roomId);
      _selectedGroupchatRoom = room.copyWith(unreadCount: 0);
      _stage = _AppStage.groupchatRoom;
    });
    await _markChatRoomRead(room.roomId);
    await _refreshChatUnreadCount();
  }

  Future<GroupchatRoomSummary?> _findChatRoomById(String roomId) async {
    final repo = _chatRepository;
    final userId = _currentChatUserId;
    final authToken = _currentAuthToken;
    if (repo == null || userId.isEmpty) {
      return null;
    }

    try {
      final page = await repo.listMyRooms(
        userId: userId,
        authToken: authToken,
        pageSize: 50,
      );
      if (mounted) {
        _setChatUnreadCount(
          page.rooms.fold<int>(0, (sum, room) => sum + room.unreadCount),
        );
      }
      for (final room in page.rooms) {
        if (room.roomId == roomId) {
          return room;
        }
      }
    } catch (_) {
      // Open with a minimal room shell if the room list refresh fails.
    }
    return null;
  }

  Future<void> _markChatRoomRead(String roomId) async {
    final repo = _chatRepository;
    final authToken = ref.read(authProvider).accessToken ?? '';
    if (repo == null || roomId.isEmpty || authToken.trim().isEmpty) {
      return;
    }

    try {
      await repo.markChatRoomRead(roomId: roomId, authToken: authToken);
    } catch (_) {
      // Keep notification navigation usable if read-state sync fails.
    }
  }

  GroupchatRoomSummary _fallbackChatRoom(String roomId) {
    return GroupchatRoomSummary(
      roomId: roomId,
      title: 'Chat',
      memberSummary: '-/-',
      location: '',
      lastMessage: '',
      timeLabel: '',
      tags: const <String>[],
      avatarUrls: const <String>[],
    );
  }

  Future<void> _saveNeighborhoodAndFinish(String neighborhood) async {
    final userId = ref.read(authProvider).userId;
    if (userId != null) {
      try {
        final user = await ref.read(authRepositoryProvider).updateNeighborhood(userId, neighborhood);
        if (mounted) ref.read(authProvider.notifier).updateUser(user);
      } catch (_) {
        // Non-fatal: proceed to complete onboarding even if neighborhood save fails.
      }
    }
    await _finishOnboarding();
  }

  Future<void> _finishOnboarding() async {
    final userId = ref.read(authProvider).userId;
    if (userId != null) {
      try {
        await ref.read(authRepositoryProvider).completeOnboarding(userId);
        if (mounted) ref.read(authProvider.notifier).markOnboardingCompleted();
      } catch (_) {
        // Non-fatal: allow user into the app even if the flag fails to persist.
      }
    }
    if (!mounted) return;
    setState(() {
      _stage = _AppStage.home;
    });
    _openPendingChatPushIfReady();
  }

  Future<void> _handleLogout() async {
    final auth = ref.read(authProvider);
    final authToken = auth.accessToken;
    final userId = auth.userId;

    if (authToken != null) {
      await _unregisterChatPush(authToken);
    }
    if (userId != null) {
      try {
        await ref.read(authRepositoryProvider).logout(userId);
      } catch (error) {
        if (kDebugMode) {
          debugPrint('AUTH_LOGOUT_FAILED: $error');
        }
      }
    }
    if (!mounted) {
      return;
    }

    ref.read(authProvider.notifier).clear();
    setState(() {
      _stage = _AppStage.login;
      _previousStage = _AppStage.home;
      _selectedGroupchatRoom = _emptyRoom;
      _locallyHiddenRoomIds.clear();
      _chatUnreadCount = 0;
      _pendingChatPushRoomId = null;
    });
  }

  Future<void> _printDevErrorLogPathAtStartup() async {
    if (!kDebugMode) {
      return;
    }
    debugPrint('DEV_ERROR_JSONL_ENABLED');
  }
}

enum _AppStage {
  login,
  profileSetup,
  surveyIntro,
  survey,
  locationSetup,
  home,
  map,
  board,
  chat,
  groupchatRoom,
  collection,
  profile,
}
