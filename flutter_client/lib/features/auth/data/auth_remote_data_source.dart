import 'dart:convert';

import 'package:google_sign_in/google_sign_in.dart';
import 'package:http/http.dart' as http;

import '../models/auth_models.dart';
import 'auth_http_config.dart';

abstract class AuthRemoteDataSource {
  Future<AuthSession> googleLogin();
  Future<AuthSession> refreshToken(String token);
  Future<AuthUser> updateProfile({
    required String accessToken,
    required String nickname,
    required String profileImageUrl,
  });
  Future<void> logout({required String accessToken, required String userId});
  Future<void> dispose();
}

class HttpAuthRemoteDataSource implements AuthRemoteDataSource {
  HttpAuthRemoteDataSource({AuthHttpConfig? config})
      : _config = config ?? AuthHttpConfig.fromEnvironment(),
        _googleSignIn = GoogleSignIn(
          serverClientId:
              '44649239380-2pqbv44f0hb68vu90t7f7bl2vqltl5pq.apps.googleusercontent.com',
        );

  final AuthHttpConfig _config;
  final GoogleSignIn _googleSignIn;
  final http.Client _client = http.Client();

  Uri _uri(String path) => Uri.parse('${_config.baseUrl}$path');

  @override
  Future<AuthSession> googleLogin() async {
    final account = await _googleSignIn.signIn();
    if (account == null) throw Exception('Google sign-in cancelled');

    final auth = await account.authentication;
    final idToken = auth.idToken;
    if (idToken == null) throw Exception('Failed to get Google ID token');

    final resp = await _client.post(
      _uri('/auth/google'),
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode({'id_token': idToken}),
    );
    _assertOk(resp);
    final body = jsonDecode(resp.body) as Map<String, dynamic>;
    return AuthSession(
      accessToken: body['access_token'] as String,
      refreshToken: body['refresh_token'] as String,
      user: _parseUser(body['user'] as Map<String, dynamic>),
      isNewUser: body['is_new_user'] as bool? ?? false,
    );
  }

  @override
  Future<AuthSession> refreshToken(String token) async {
    final resp = await _client.post(
      _uri('/auth/refresh'),
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode({'refresh_token': token}),
    );
    _assertOk(resp);
    final body = jsonDecode(resp.body) as Map<String, dynamic>;
    return AuthSession(
      accessToken: body['access_token'] as String,
      refreshToken: body['refresh_token'] as String,
      user: _parseUser(body['user'] as Map<String, dynamic>),
      isNewUser: false,
    );
  }

  @override
  Future<AuthUser> updateProfile({
    required String accessToken,
    required String nickname,
    required String profileImageUrl,
  }) async {
    final resp = await _client.patch(
      _uri('/auth/profile'),
      headers: {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer $accessToken',
      },
      body: jsonEncode({
        'nickname': nickname,
        'profile_image_url': profileImageUrl,
      }),
    );
    _assertOk(resp);
    return _parseUser(jsonDecode(resp.body) as Map<String, dynamic>);
  }

  @override
  Future<void> logout({
    required String accessToken,
    required String userId,
  }) async {
    await _googleSignIn.signOut();
    await _client.post(
      _uri('/auth/logout'),
      headers: {'Authorization': 'Bearer $accessToken'},
    );
  }

  @override
  Future<void> dispose() async {
    _client.close();
  }

  void _assertOk(http.Response resp) {
    if (resp.statusCode < 200 || resp.statusCode >= 300) {
      final body = resp.body.isNotEmpty ? resp.body : resp.statusCode.toString();
      throw Exception('Auth API error ${resp.statusCode}: $body');
    }
  }

  AuthUser _parseUser(Map<String, dynamic> u) {
    return AuthUser(
      userId: u['user_id'] as String,
      email: u['email'] as String,
      nickname: u['nickname'] as String?,
      profileImageUrl: u['profile_image_url'] as String?,
      neighborhood: u['neighborhood'] as String?,
      surveyCompleted: u['survey_completed'] as bool? ?? false,
      alcoholScore: u['alcohol_score'] as int? ?? 0,
      points: u['points'] as int? ?? 0,
    );
  }
}
