import '../models/auth_models.dart';
import 'auth_remote_data_source.dart';

class AuthRepository {
  const AuthRepository(this._dataSource);

  final AuthRemoteDataSource _dataSource;

  Future<AuthSession> googleLogin() async {
    final response = await _dataSource.googleLogin();
    final user = response.user;
    return AuthSession(
      accessToken: response.accessToken,
      refreshToken: response.refreshToken,
      user: AuthUser(
        userId: user.userId,
        email: user.email,
        nickname: user.hasNickname() ? user.nickname : null,
        profileImageUrl: user.hasProfileImageUrl() ? user.profileImageUrl : null,
        neighborhood: user.hasNeighborhood() ? user.neighborhood : null,
        surveyCompleted: user.surveyCompleted,
        alcoholScore: user.alcoholScore,
        points: user.points,
      ),
      isNewUser: response.isNewUser,
    );
  }

  Future<AuthSession> refreshToken(String refreshToken) async {
    final response = await _dataSource.refreshToken(refreshToken);
    final user = response.user;
    return AuthSession(
      accessToken: response.accessToken,
      refreshToken: response.refreshToken,
      user: AuthUser(
        userId: user.userId,
        email: user.email,
        nickname: user.hasNickname() ? user.nickname : null,
        profileImageUrl: user.hasProfileImageUrl() ? user.profileImageUrl : null,
        neighborhood: user.hasNeighborhood() ? user.neighborhood : null,
        surveyCompleted: user.surveyCompleted,
        alcoholScore: user.alcoholScore,
        points: user.points,
      ),
      isNewUser: false,
    );
  }

  Future<AuthUser> updateProfile(String userId, String nickname, String profileImageUrl) async {
    final response = await _dataSource.updateProfile(userId, nickname, profileImageUrl);
    final user = response.user;
    return AuthUser(
      userId: user.userId,
      email: user.email,
      nickname: user.hasNickname() ? user.nickname : null,
      profileImageUrl: user.hasProfileImageUrl() ? user.profileImageUrl : null,
      neighborhood: user.hasNeighborhood() ? user.neighborhood : null,
      surveyCompleted: user.surveyCompleted,
      alcoholScore: user.alcoholScore,
      points: user.points,
    );
  }

  Future<void> logout(String userId) => _dataSource.logout(userId);

  Future<void> dispose() => _dataSource.dispose();
}
