import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../preference_survey/providers/survey_api_client.dart';
import '../../../core/config/app_config.dart';
import '../models/auth_models.dart';

class AuthState {
  final String? accessToken;
  final String? refreshToken;
  final String? userId;
  final AuthUser? user;
  final bool isNewUser;

  const AuthState({
    this.accessToken,
    this.refreshToken,
    this.userId,
    this.user,
    this.isNewUser = false,
  });

  bool get isAuthenticated => accessToken != null && userId != null;
}

class AuthNotifier extends StateNotifier<AuthState> {
  AuthNotifier() : super(const AuthState());

  void setSession({
    required String accessToken,
    required String refreshToken,
    required String userId,
    required AuthUser user,
    required bool isNewUser,
  }) {
    state = AuthState(
      accessToken: accessToken,
      refreshToken: refreshToken,
      userId: userId,
      user: user,
      isNewUser: isNewUser,
    );
  }

  void updateUser(AuthUser user) {
    state = AuthState(
      accessToken: state.accessToken,
      refreshToken: state.refreshToken,
      userId: state.userId,
      user: user,
      isNewUser: false,
    );
  }

  void markSurveyCompleted({required String surveyId}) {
    final user = state.user;
    if (user == null) return;
    updateUser(user.copyWith(surveyId: surveyId));
  }

  void markOnboardingCompleted() {
    final user = state.user;
    if (user == null) return;
    updateUser(user.copyWith(onboardingCompleted: true));
  }

  void refreshSession({
    required String accessToken,
    required String refreshToken,
    required AuthUser user,
  }) {
    state = AuthState(
      accessToken: accessToken,
      refreshToken: refreshToken,
      userId: user.userId,
      user: user,
      isNewUser: false,
    );
  }

  void clear() {
    state = const AuthState();
  }
}

final authProvider = StateNotifierProvider<AuthNotifier, AuthState>(
  (ref) => AuthNotifier(),
);

final surveyApiClientProvider = Provider<SurveyApiClient?>((ref) {
  final auth = ref.watch(authProvider);
  if (!auth.isAuthenticated) return null;
  return SurveyApiClient(baseUrl: kSurveyBaseUrl, authToken: auth.accessToken!);
});
