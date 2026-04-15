import 'package:flutter/material.dart';

import 'core/theme/app_theme.dart';
import 'features/auth/presentation/login_screen.dart';
import 'features/preference_survey/data/placeholder_preference_survey.dart';
import 'features/preference_survey/presentation/preference_survey_screen.dart';
import 'features/preference_survey/presentation/survey_intro_screen.dart';

void main() {
  runApp(const OnTheBlockApp());
}

class OnTheBlockApp extends StatefulWidget {
  const OnTheBlockApp({super.key});

  @override
  State<OnTheBlockApp> createState() => _OnTheBlockAppState();
}

class _OnTheBlockAppState extends State<OnTheBlockApp> {
  ThemeMode _themeMode = ThemeMode.light;
  _AppStage _stage = _AppStage.login;

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
            _stage = _AppStage.survey;
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
        onSkip: () {},
        onCompleted: () {},
      ),
    };
  }
}

enum _AppStage { login, surveyIntro, survey }
