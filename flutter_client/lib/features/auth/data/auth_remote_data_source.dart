import 'package:flutter/services.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:grpc/grpc.dart';

import 'auth_grpc_endpoint.dart';
import 'grpc_gen/auth/v1/auth.pbgrpc.dart';

abstract class AuthRemoteDataSource {
  Future<GoogleLoginResponse> googleLogin();
  Future<RefreshTokenResponse> refreshToken(String token);
  Future<UpdateProfileResponse> updateProfile(
    String authToken,
    String nickname,
    String profileImageUrl,
  );
  Future<GenerateProfileUploadUrlResponse> generateProfileUploadUrl(
    String authToken,
  );
  Future<UpdateNeighborhoodResponse> updateNeighborhood(
    String authToken,
    String neighborhood,
  );
  Future<CompleteOnboardingResponse> completeOnboarding(String authToken);
  Future<GetUserResponse> getUser(String userId);
  Future<void> logout(String authToken);
  Future<void> dispose();
}

class GoogleAuthException implements Exception {
  const GoogleAuthException(this.message, {this.code});

  final String message;
  final String? code;

  @override
  String toString() => code == null ? message : '$message (code: $code)';
}

class GrpcAuthRemoteDataSource implements AuthRemoteDataSource {
  factory GrpcAuthRemoteDataSource({AuthGrpcEndpoint? endpoint}) {
    final googleSignIn = createGoogleSignIn();

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

    return GrpcAuthRemoteDataSource._(
      resolvedEndpoint,
      channel,
      client,
      googleSignIn,
    );
  }

  GrpcAuthRemoteDataSource._(
    this._endpoint,
    this._channel,
    this._client,
    this._googleSignIn,
  );

  final AuthGrpcEndpoint _endpoint;
  final ClientChannel _channel;
  final AuthServiceClient _client;
  final GoogleSignIn _googleSignIn;

  static GoogleSignIn createGoogleSignIn() => GoogleSignIn();

  @override
  Future<GoogleLoginResponse> googleLogin() async {
    final GoogleSignInAccount? account;
    try {
      account = await _googleSignIn.signIn();
    } on PlatformException catch (error) {
      throw GoogleAuthException(
        _googleSignInFailureMessage(error),
        code: error.code,
      );
    }

    if (account == null) {
      throw const GoogleAuthException(
        'Google sign-in was cancelled before an account was selected.',
        code: GoogleSignIn.kSignInCanceledError,
      );
    }

    final GoogleSignInAuthentication auth;
    try {
      auth = await account.authentication;
    } on PlatformException catch (error) {
      throw GoogleAuthException(
        _googleSignInFailureMessage(error),
        code: error.code,
      );
    }
    final idToken = auth.idToken;
    if (idToken == null) {
      throw const GoogleAuthException(
        'Google Sign-In did not return an ID token. Verify that android/app/google-services.json contains a web OAuth client, default_web_client_id is generated, and the installed Android build signature is registered.',
        code: 'missing_google_id_token',
      );
    }

    return _client.googleLogin(GoogleLoginRequest()..idToken = idToken);
  }

  String _googleSignInFailureMessage(PlatformException error) {
    if (error.code == GoogleSignIn.kSignInFailedError) {
      return 'Google Sign-In failed before an ID token was returned. Verify the Firebase Android app package, the installed build signature SHA-1/SHA-256, and generated default_web_client_id.';
    }
    if (error.code == GoogleSignIn.kNetworkError) {
      return 'Google Sign-In failed because of a network error. Check connectivity and retry.';
    }
    if (error.code == GoogleSignIn.kSignInCanceledError) {
      return 'Google sign-in was cancelled before an account was selected.';
    }
    if (error.message?.trim().isNotEmpty ?? false) {
      return 'Google Sign-In failed: ${error.message!.trim()}';
    }
    return 'Google Sign-In failed before an ID token was returned.';
  }

  @override
  Future<RefreshTokenResponse> refreshToken(String token) {
    return _client.refreshToken(RefreshTokenRequest()..refreshToken = token);
  }

  @override
  Future<UpdateProfileResponse> updateProfile(
    String authToken,
    String nickname,
    String profileImageUrl,
  ) {
    return _client.updateProfile(
      UpdateProfileRequest()
        ..nickname = nickname
        ..profileImageUrl = profileImageUrl,
      options: _authenticatedOptions(authToken),
    );
  }

  @override
  Future<GenerateProfileUploadUrlResponse> generateProfileUploadUrl(
    String authToken,
  ) {
    return _client.generateProfileUploadUrl(
      GenerateProfileUploadUrlRequest(),
      options: _authenticatedOptions(authToken),
    );
  }

  @override
  Future<UpdateNeighborhoodResponse> updateNeighborhood(
    String authToken,
    String neighborhood,
  ) {
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
