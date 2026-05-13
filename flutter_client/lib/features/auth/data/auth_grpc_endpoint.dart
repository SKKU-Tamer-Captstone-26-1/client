// true in release/profile builds, false in debug
const _kIsRelease = bool.fromEnvironment('dart.vm.product');

class AuthGrpcEndpoint {
  const AuthGrpcEndpoint({
    required this.host,
    required this.port,
    required this.useTls,
  });

  final String host;
  final int port;
  final bool useTls;

  static AuthGrpcEndpoint fromEnvironment() {
    const host = String.fromEnvironment(
      'AUTH_GRPC_HOST',
      defaultValue: '10.0.2.2', // Android emulator localhost alias
    );
    const portValue = String.fromEnvironment(
      'AUTH_GRPC_PORT',
      defaultValue: '9090',
    );
    const tlsOverride = String.fromEnvironment('AUTH_GRPC_TLS');

    final parsedPort = int.tryParse(portValue) ?? 9090;
    final parsedTls = tlsOverride.isNotEmpty
        ? tlsOverride.toLowerCase() == 'true'
        : _kIsRelease; // default: TLS on in release, off in debug

    assert(
      !_kIsRelease || host != '10.0.2.2',
      'AUTH_GRPC_HOST must be explicitly set in release builds (emulator alias is not valid for production)',
    );

    return AuthGrpcEndpoint(host: host, port: parsedPort, useTls: parsedTls);
  }
}
