import '../models/auth_models.dart';
import 'auth_remote_data_source.dart';

class AuthRepository {
  const AuthRepository(this._dataSource);

  final AuthRemoteDataSource _dataSource;

  Future<AuthSession> googleLogin() => _dataSource.googleLogin();

  Future<AuthSession> refreshToken(String refreshToken) =>
      _dataSource.refreshToken(refreshToken);

  Future<AuthUser> updateProfile(
    String accessToken,
    String nickname,
    String profileImageUrl,
  ) =>
      _dataSource.updateProfile(
        accessToken: accessToken,
        nickname: nickname,
        profileImageUrl: profileImageUrl,
      );

  Future<void> logout(String accessToken, String userId) =>
      _dataSource.logout(accessToken: accessToken, userId: userId);

  Future<void> dispose() => _dataSource.dispose();
}
