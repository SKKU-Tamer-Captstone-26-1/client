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
        alcoholScore: user.alcoholScore,
        points: user.points,
        surveyData: user.hasSurveyData() ? user.surveyData : null,
        surveyCompleted: user.surveyCompleted,
      ),
      isNewUser: response.isNewUser,
    );
  }

  Future<void> logout(String userId) => _dataSource.logout(userId);

  Future<void> updateSurveyData({required String userId, required String surveyData}) =>
      _dataSource.updateSurveyData(userId: userId, surveyData: surveyData);

  Future<void> dispose() => _dataSource.dispose();
}
