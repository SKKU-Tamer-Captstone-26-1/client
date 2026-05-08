class AuthUser {
  const AuthUser({
    required this.userId,
    required this.email,
    this.nickname,
    this.profileImageUrl,
    this.neighborhood,
    this.alcoholScore = 5,
    this.points = 0,
    this.surveyData,
    this.surveyCompleted = false,
  });

  final String userId;
  final String email;
  final String? nickname;
  final String? profileImageUrl;
  final String? neighborhood;
  final int alcoholScore;
  final int points;
  final String? surveyData;
  final bool surveyCompleted;
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
