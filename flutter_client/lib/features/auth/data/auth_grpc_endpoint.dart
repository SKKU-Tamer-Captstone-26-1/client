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
    const useTlsValue = String.fromEnvironment(
      'AUTH_GRPC_TLS',
      defaultValue: 'false',
    );

    final parsedPort = int.tryParse(portValue) ?? 9090;
    final parsedTls = useTlsValue.toLowerCase() == 'true';

    return AuthGrpcEndpoint(host: host, port: parsedPort, useTls: parsedTls);
  }
}
