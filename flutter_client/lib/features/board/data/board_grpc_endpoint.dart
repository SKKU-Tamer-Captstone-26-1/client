class BoardGrpcEndpoint {
  const BoardGrpcEndpoint({
    required this.host,
    required this.port,
    required this.useTls,
  });

  final String host;
  final int port;
  final bool useTls;

  static BoardGrpcEndpoint fromEnvironment() {
    const host = String.fromEnvironment(
      'BOARD_GRPC_HOST',
      defaultValue: '127.0.0.1',
    );
    const portValue = String.fromEnvironment(
      'BOARD_GRPC_PORT',
      defaultValue: '9090',
    );
    const useTlsValue = String.fromEnvironment(
      'BOARD_GRPC_TLS',
      defaultValue: 'false',
    );

    final parsedPort = int.tryParse(portValue) ?? 9090;
    final parsedTls = useTlsValue.toLowerCase() == 'true';

    return BoardGrpcEndpoint(host: host, port: parsedPort, useTls: parsedTls);
  }
}
