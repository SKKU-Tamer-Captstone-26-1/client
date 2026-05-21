import 'package:google_sign_in/google_sign_in.dart';
import 'package:grpc/grpc.dart';

import 'auth_grpc_endpoint.dart';
import 'grpc_gen/auth/v1/auth.pbgrpc.dart';

abstract class AuthRemoteDataSource {
  Future<GoogleLoginResponse> googleLogin();
  Future<RefreshTokenResponse> refreshToken(String token);
  Future<UpdateProfileResponse> updateProfile(String userId, String nickname, String profileImageUrl);
  Future<void> logout(String userId);
  Future<void> dispose();
}

class GrpcAuthRemoteDataSource implements AuthRemoteDataSource {
  factory GrpcAuthRemoteDataSource({AuthGrpcEndpoint? endpoint}) {
    const serverClientId =
        '44649239380-2pqbv44f0hb68vu90t7f7bl2vqltl5pq.apps.googleusercontent.com';
    final googleSignIn = GoogleSignIn(serverClientId: serverClientId);

    final resolvedEndpoint = endpoint ?? AuthGrpcEndpoint.fromEnvironment();
    final channel = ClientChannel(
      resolvedEndpoint.host,
      port: resolvedEndpoint.port,
      options: ChannelOptions(
        credentials: resolvedEndpoint.useTls
            ? ChannelCredentials.secure()
            : ChannelCredentials.insecure(),
      ),
    );

    final client = AuthServiceClient(
      channel,
      options: CallOptions(timeout: const Duration(seconds: 30)),
    );

    return GrpcAuthRemoteDataSource._(resolvedEndpoint, channel, client, googleSignIn);
  }

  GrpcAuthRemoteDataSource._(this._endpoint, this._channel, this._client, this._googleSignIn);

  final AuthGrpcEndpoint _endpoint;
  final ClientChannel _channel;
  final AuthServiceClient _client;
  final GoogleSignIn _googleSignIn;

  @override
  Future<GoogleLoginResponse> googleLogin() async {
    final account = await _googleSignIn.signIn();
    if (account == null) throw Exception('Google sign-in cancelled');

    final auth = await account.authentication;
    final idToken = auth.idToken;
    if (idToken == null) throw Exception('Failed to get Google ID token');

    return _client.googleLogin(
      GoogleLoginRequest()..idToken = idToken,
    );
  }

  @override
  Future<RefreshTokenResponse> refreshToken(String token) {
    return _client.refreshToken(RefreshTokenRequest()..refreshToken = token);
  }

  @override
  Future<UpdateProfileResponse> updateProfile(String userId, String nickname, String profileImageUrl) {
    return _client.updateProfile(
      UpdateProfileRequest()
        ..userId = userId
        ..nickname = nickname
        ..profileImageUrl = profileImageUrl,
    );
  }

  @override
  Future<void> logout(String userId) async {
    await _googleSignIn.signOut();
    await _client.logout(LogoutRequest()..userId = userId);
  }

  @override
  Future<void> dispose() => _channel.shutdown();

  @override
  String toString() =>
      'GrpcAuthRemoteDataSource(${_endpoint.host}:${_endpoint.port}, tls=${_endpoint.useTls})';
}
