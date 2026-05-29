import 'package:google_sign_in/google_sign_in.dart';
import 'package:grpc/grpc.dart';

import 'auth_grpc_endpoint.dart';
import 'grpc_gen/auth/v1/auth.pbgrpc.dart';

abstract class AuthRemoteDataSource {
  Future<GoogleLoginResponse> googleLogin();
  Future<RefreshTokenResponse> refreshToken(String token);
  Future<UpdateProfileResponse> updateProfile(String authToken, String nickname, String profileImageUrl);
  Future<GenerateProfileUploadUrlResponse> generateProfileUploadUrl(String authToken);
  Future<UpdateNeighborhoodResponse> updateNeighborhood(String authToken, String neighborhood);
  Future<CompleteOnboardingResponse> completeOnboarding(String authToken);
  Future<GetUserResponse> getUser(String userId);
  Future<void> logout(String authToken);
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
  Future<UpdateProfileResponse> updateProfile(String authToken, String nickname, String profileImageUrl) {
    return _client.updateProfile(
      UpdateProfileRequest()
        ..nickname = nickname
        ..profileImageUrl = profileImageUrl,
      options: _authenticatedOptions(authToken),
    );
  }

  @override
  Future<GenerateProfileUploadUrlResponse> generateProfileUploadUrl(String authToken) {
    return _client.generateProfileUploadUrl(
      GenerateProfileUploadUrlRequest(),
      options: _authenticatedOptions(authToken),
    );
  }

  @override
  Future<UpdateNeighborhoodResponse> updateNeighborhood(String authToken, String neighborhood) {
    return _client.updateNeighborhood(
      UpdateNeighborhoodRequest()..neighborhood = neighborhood,
      options: _authenticatedOptions(authToken),
    );
  }

  @override
  Future<CompleteOnboardingResponse> completeOnboarding(String authToken) {
    return _client.completeOnboarding(
      CompleteOnboardingRequest(),
      options: _authenticatedOptions(authToken),
    );
  }

  @override
  Future<GetUserResponse> getUser(String userId) {
    return _client.getUser(GetUserRequest()..userId = userId);
  }

  @override
  Future<void> logout(String authToken) async {
    await _googleSignIn.signOut();
    await _client.logout(
      LogoutRequest(),
      options: _authenticatedOptions(authToken),
    );
  }

  CallOptions _authenticatedOptions(String authToken) {
    return CallOptions(
      timeout: const Duration(seconds: 30),
      metadata: authToken.trim().isEmpty
          ? const <String, String>{}
          : <String, String>{'authorization': 'Bearer $authToken'},
    );
  }

  @override
  Future<void> dispose() => _channel.shutdown();

  @override
  String toString() =>
      'GrpcAuthRemoteDataSource(${_endpoint.host}:${_endpoint.port}, tls=${_endpoint.useTls})';
}
