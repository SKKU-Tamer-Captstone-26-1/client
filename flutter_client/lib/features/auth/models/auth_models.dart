class AuthUser {
  const AuthUser({
    required this.userId,
    required this.email,
    this.nickname,
    this.profileImageUrl,
    this.neighborhood,
    this.surveyId,
    this.alcoholScore = 0,
    this.points = 0,
    this.onboardingCompleted = false,
  });

  final String userId;
  final String email;
  final String? nickname;
  final String? profileImageUrl;
  final String? neighborhood;
  final String? surveyId;
  final int alcoholScore;
  final int points;
  final bool onboardingCompleted;

  AuthUser copyWith({
    String? userId,
    String? email,
    String? nickname,
    String? profileImageUrl,
    String? neighborhood,
    String? surveyId,
    int? alcoholScore,
    int? points,
    bool? onboardingCompleted,
  }) {
    return AuthUser(
      userId: userId ?? this.userId,
      email: email ?? this.email,
      nickname: nickname ?? this.nickname,
      profileImageUrl: profileImageUrl ?? this.profileImageUrl,
      neighborhood: neighborhood ?? this.neighborhood,
      surveyId: surveyId ?? this.surveyId,
      alcoholScore: alcoholScore ?? this.alcoholScore,
      points: points ?? this.points,
      onboardingCompleted: onboardingCompleted ?? this.onboardingCompleted,
    );
  }
}

class AuthSession {
  const AuthSession({
    required this.accessToken,
    required this.refreshToken,
    required this.user,
    required this.isNewUser,
  });

  final String accessToken;
  final String refreshToken;
  final AuthUser user;
  final bool isNewUser;
}
