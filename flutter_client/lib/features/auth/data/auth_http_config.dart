const _kIsRelease = bool.fromEnvironment('dart.vm.product');

class AuthHttpConfig {
  const AuthHttpConfig({required this.baseUrl});

  final String baseUrl;

  static AuthHttpConfig fromEnvironment() {
    const baseUrl = String.fromEnvironment(
      'AUTH_BASE_URL',
      defaultValue: 'http://10.0.2.2:8080', // Android emulator → gateway
    );

    assert(
      !_kIsRelease || !baseUrl.startsWith('http://10.0.2.2'),
      'AUTH_BASE_URL must be set in release builds (emulator alias is not valid for production)',
    );

    return const AuthHttpConfig(baseUrl: baseUrl);
  }
}
