import '../models/auth_models.dart';
import 'auth_remote_data_source.dart';
import 'grpc_gen/auth/v1/auth.pb.dart';

class AuthRepository {
  const AuthRepository(this._dataSource);

  final AuthRemoteDataSource _dataSource;

  Future<AuthSession> googleLogin() async {
    final res = await _dataSource.googleLogin();
    return _sessionFromLoginResponse(res);
  }

  Future<AuthSession> refreshToken(String refreshToken) async {
    final res = await _dataSource.refreshToken(refreshToken);
    return _sessionFromRefreshResponse(res);
  }

  Future<AuthUser> updateProfile(
    String userId,
    String nickname,
    String profileImageUrl,
  ) async {
    final res = await _dataSource.updateProfile(userId, nickname, profileImageUrl);
    return _toAuthUser(res.user);
  }

  Future<({String uploadUrl, String objectUrl})> generateProfileUploadUrl(String userId) async {
    final res = await _dataSource.generateProfileUploadUrl(userId);
    return (uploadUrl: res.uploadUrl, objectUrl: res.objectUrl);
  }

  Future<AuthUser> updateNeighborhood(String userId, String neighborhood) async {
    final res = await _dataSource.updateNeighborhood(userId, neighborhood);
    return _toAuthUser(res.user);
  }

  Future<AuthUser> completeOnboarding(String userId) async {
    final res = await _dataSource.completeOnboarding(userId);
    return _toAuthUser(res.user);
  }

  Future<void> logout(String userId) => _dataSource.logout(userId);

  Future<void> dispose() => _dataSource.dispose();

  static AuthSession _sessionFromLoginResponse(GoogleLoginResponse res) {
    return AuthSession(
      accessToken: res.accessToken,
      refreshToken: res.refreshToken,
      user: _toAuthUser(res.user),
      isNewUser: res.isNewUser,
    );
  }

  static AuthSession _sessionFromRefreshResponse(RefreshTokenResponse res) {
    return AuthSession(
      accessToken: res.accessToken,
      refreshToken: res.refreshToken,
      user: _toAuthUser(res.user),
      isNewUser: false,
    );
  }

  static AuthUser _toAuthUser(UserResponse u) {
    // Workaround: protobuf-3.1.0 returns native int (not Int64) as the default
    // for unset int64 fields, causing an implicit cast error in the typed getter.
    // getField() returns dynamic and avoids the cast.
    final dynamic rawSurveyId = u.getField(11);
    final surveyId = (rawSurveyId != null && rawSurveyId != 0)
        ? rawSurveyId.toString()
        : null;
    return AuthUser(
      userId: u.userId,
      email: u.email,
      nickname: u.nickname.isEmpty ? null : u.nickname,
      profileImageUrl: u.profileImageUrl.isEmpty ? null : u.profileImageUrl,
      neighborhood: u.neighborhood.isEmpty ? null : u.neighborhood,
      surveyCompleted: u.surveyCompleted,
      surveyId: surveyId,
      onboardingCompleted: u.onboardingCompleted,
    );
  }
}
