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
    String authToken,
    String nickname,
    String profileImageUrl,
  ) async {
    final res = await _dataSource.updateProfile(authToken, nickname, profileImageUrl);
    return _toAuthUser(res.user);
  }

  Future<({String uploadUrl, String objectUrl})> generateProfileUploadUrl(String authToken) async {
    final res = await _dataSource.generateProfileUploadUrl(authToken);
    return (uploadUrl: res.uploadUrl, objectUrl: res.objectUrl);
  }

  Future<AuthUser> updateNeighborhood(String authToken, String neighborhood) async {
    final res = await _dataSource.updateNeighborhood(authToken, neighborhood);
    return _toAuthUser(res.user);
  }

  Future<AuthUser> completeOnboarding(String authToken) async {
    final res = await _dataSource.completeOnboarding(authToken);
    return _toAuthUser(res.user);
  }

  Future<void> logout(String authToken) => _dataSource.logout(authToken);

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
    final surveyId = u.hasSurveyId() ? u.surveyId : null;
    return AuthUser(
      userId: u.userId,
      email: u.email,
      nickname: u.nickname.isEmpty ? null : u.nickname,
      profileImageUrl: u.profileImageUrl.isEmpty ? null : u.profileImageUrl,
      neighborhood: u.neighborhood.isEmpty ? null : u.neighborhood,
      surveyId: surveyId,
      alcoholScore: u.alcoholScore,
      points: u.points,
      onboardingCompleted: u.onboardingCompleted,
    );
  }
}
