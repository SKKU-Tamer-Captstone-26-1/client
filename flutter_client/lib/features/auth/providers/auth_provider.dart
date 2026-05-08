import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../preference_survey/providers/survey_api_client.dart';
import '../../../core/config/app_config.dart';

class AuthState {
  final String? accessToken;
  final String? refreshToken;
  final String? userId;

  const AuthState({this.accessToken, this.refreshToken, this.userId});

  bool get isAuthenticated => accessToken != null && userId != null;
}

class AuthNotifier extends StateNotifier<AuthState> {
  AuthNotifier() : super(const AuthState());

  void setSession({
    required String accessToken,
    required String refreshToken,
    required String userId,
  }) {
    state = AuthState(
      accessToken: accessToken,
      refreshToken: refreshToken,
      userId: userId,
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
  return SurveyApiClient(
    baseUrl: kSurveyBaseUrl,
    authToken: auth.accessToken!,
  );
});
