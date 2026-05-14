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
import 'features/board/presentation/board_screen.dart';
import 'features/chat/data/chat_remote_data_source.dart';
import 'features/chat/data/chat_repository.dart';
import 'features/chat/presentation/groupchat_list_screen.dart';
import 'features/chat/presentation/groupchat_room_screen.dart';
import 'features/chat/models/groupchat_models.dart';
import 'features/collection/presentation/collection_screen.dart';
import 'features/home/presentation/home_screen.dart';
import 'features/map/presentation/map_screen.dart';
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
  const OnTheBlockApp({super.key, this.chatRepository});

  final ChatRepository? chatRepository;

  @override
  ConsumerState<OnTheBlockApp> createState() => _OnTheBlockAppState();
}

class _OnTheBlockAppState extends ConsumerState<OnTheBlockApp> {
  static const _currentUserId = String.fromEnvironment(
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
  final Set<String> _locallyHiddenRoomIds = <String>{};

  @override
  void initState() {
    super.initState();
    _chatRepository =
        widget.chatRepository ?? GrpcChatRepository(GrpcChatRemoteDataSource());
    unawaited(_printDevErrorLogPathAtStartup());
  }

  @override
  void dispose() {
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
      } else if (!session.user.surveyCompleted && !kBypassSurvey) {
        _stage = _AppStage.surveyIntro;
      } else {
        if (kBypassSurvey) {
          ref.read(authProvider.notifier).markSurveyCompleted();
        }
        _stage = _AppStage.home;
      }
    });
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
            ref.read(authProvider.notifier).markSurveyCompleted();
          }
          setState(() {
            _stage = kBypassSurvey ? _AppStage.home : _AppStage.surveyIntro;
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
            _stage = _AppStage.home;
          });
        },
      ),
      _AppStage.survey => SurveyScreen(
        onCompleted: () {
          setState(() {
            _stage = _AppStage.home;
          });
        },
      ),
      _AppStage.home => HomeScreen(
        onBottomNavSelected: _selectBottomNavItem,
        onProfileSelected: _goToProfile,
      ),
      _AppStage.map => MapScreen(
        onBottomNavSelected: _selectBottomNavItem,
        onProfileSelected: _goToProfile,
      ),
      _AppStage.board => BoardScreen(
        onBottomNavSelected: _selectBottomNavItem,
        onProfileSelected: _goToProfile,
      ),
      _AppStage.chat => GroupchatListScreen(
        chatRepository: _chatRepository,
        currentUserId: _currentUserId,
        excludedRoomIds: _locallyHiddenRoomIds,
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
        currentUserId: _currentUserId,
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
      ),
      _AppStage.profile => UserPageScreen(
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
  home,
  map,
  board,
  chat,
  groupchatRoom,
  collection,
  profile,
}
