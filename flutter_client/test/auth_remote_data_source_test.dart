import 'package:flutter_client/features/auth/data/auth_remote_data_source.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  test('Google Sign-In uses generated platform configuration', () {
    final googleSignIn = GrpcAuthRemoteDataSource.createGoogleSignIn();

    expect(googleSignIn.clientId, isNull);
    expect(googleSignIn.serverClientId, isNull);
  });
}
