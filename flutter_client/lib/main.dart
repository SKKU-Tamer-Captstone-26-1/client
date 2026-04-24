import 'package:flutter/material.dart';
import 'package:kakao_maps_flutter/kakao_maps_flutter.dart';

import 'core/theme/app_theme.dart';
import 'core/theme/app_icons.dart';
import 'features/auth/presentation/login_screen.dart';
import 'features/board/presentation/board_screen.dart';
import 'features/chat/data/chat_remote_data_source.dart';
import 'features/chat/data/chat_repository.dart';
import 'features/chat/presentation/groupchat_list_screen.dart';
import 'features/chat/presentation/groupchat_room_screen.dart';
import 'features/chat/data/mock_groupchat_data.dart';
import 'features/chat/models/groupchat_models.dart';
import 'features/collection/presentation/collection_screen.dart';
import 'features/home/presentation/home_screen.dart';
import 'features/map/presentation/map_screen.dart';
import 'features/preference_survey/data/placeholder_preference_survey.dart';
import 'features/preference_survey/presentation/preference_survey_screen.dart';
import 'features/preference_survey/presentation/survey_intro_screen.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  const kakaoMapApiKey = String.fromEnvironment('KAKAO_MAP_API_KEY');
  if (kakaoMapApiKey.isNotEmpty) {
    await KakaoMapsFlutter.init(kakaoMapApiKey);
  }

  runApp(const OnTheBlockApp());
}

class OnTheBlockApp extends StatefulWidget {
  const OnTheBlockApp({super.key});

  @override
  State<OnTheBlockApp> createState() => _OnTheBlockAppState();
}

class _OnTheBlockAppState extends State<OnTheBlockApp> {
  static const _demoUserId = '11111111-1111-1111-1111-111111111111';

  ThemeMode _themeMode = ThemeMode.light;
  _AppStage _stage = _AppStage.login;
  GroupchatRoomSummary _selectedGroupchatRoom = mockGroupchatRooms.first;
  late final GrpcChatRemoteDataSource _chatRemoteDataSource;
  late final GrpcChatRepository _chatRepository;

  @override
  void initState() {
    super.initState();
    _chatRemoteDataSource = GrpcChatRemoteDataSource();
    _chatRepository = GrpcChatRepository(_chatRemoteDataSource);
  }

  @override
  void dispose() {
    _chatRepository.dispose();
    super.dispose();
  }

  void _toggleThemeMode() {
    setState(() {
      _themeMode = _themeMode == ThemeMode.light
          ? ThemeMode.dark
          : ThemeMode.light;
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
      _AppStage.login => LoginScreen(
        isDarkMode: _themeMode == ThemeMode.dark,
        onThemeToggle: _toggleThemeMode,
        onGoogleSignIn: () {
          setState(() {
            _stage = _AppStage.surveyIntro;
          });
        },
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
      _AppStage.survey => PreferenceSurveyScreen(
        steps: placeholderPreferenceSurveySteps,
        onBackToIntro: () {
          setState(() {
            _stage = _AppStage.surveyIntro;
          });
        },
        onSkip: () {
          setState(() {
            _stage = _AppStage.home;
          });
        },
        onCompleted: () {
          setState(() {
            _stage = _AppStage.home;
          });
        },
      ),
      _AppStage.home => HomeScreen(onBottomNavSelected: _selectBottomNavItem),
      _AppStage.map => MapScreen(onBottomNavSelected: _selectBottomNavItem),
      _AppStage.board => BoardScreen(onBottomNavSelected: _selectBottomNavItem),
      _AppStage.chat => GroupchatListScreen(
        chatRepository: _chatRepository,
        currentUserId: _demoUserId,
        onBottomNavSelected: _selectBottomNavItem,
        onRoomSelected: (room) {
          setState(() {
            _selectedGroupchatRoom = room;
            _stage = _AppStage.groupchatRoom;
          });
        },
      ),
      _AppStage.groupchatRoom => GroupchatRoomScreen(
        room: _selectedGroupchatRoom,
        chatRepository: _chatRepository,
        currentUserId: _demoUserId,
        onBack: () {
          setState(() {
            _stage = _AppStage.chat;
          });
        },
        onBottomNavSelected: _selectBottomNavItem,
      ),
      _AppStage.collection => CollectionScreen(
        onBottomNavSelected: _selectBottomNavItem,
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
}

enum _AppStage {
  login,
  surveyIntro,
  survey,
  home,
  map,
  board,
  chat,
  groupchatRoom,
  collection,
}
