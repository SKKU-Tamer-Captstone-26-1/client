class AuthUser {
  const AuthUser({
    required this.userId,
    required this.email,
    this.nickname,
    this.profileImageUrl,
    this.neighborhood,
    this.surveyCompleted = false,
    this.surveyId,
    this.alcoholScore = 0,
    this.points = 0,
  });

  final String userId;
  final String email;
  final String? nickname;
  final String? profileImageUrl;
  final String? neighborhood;
  final bool surveyCompleted;
  final String? surveyId;
  final int alcoholScore;
  final int points;

  AuthUser copyWith({
    String? userId,
    String? email,
    String? nickname,
    String? profileImageUrl,
    String? neighborhood,
    bool? surveyCompleted,
    String? surveyId,
    int? alcoholScore,
    int? points,
  }) {
    return AuthUser(
      userId: userId ?? this.userId,
      email: email ?? this.email,
      nickname: nickname ?? this.nickname,
      profileImageUrl: profileImageUrl ?? this.profileImageUrl,
      neighborhood: neighborhood ?? this.neighborhood,
      surveyCompleted: surveyCompleted ?? this.surveyCompleted,
      surveyId: surveyId ?? this.surveyId,
      alcoholScore: alcoholScore ?? this.alcoholScore,
      points: points ?? this.points,
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
