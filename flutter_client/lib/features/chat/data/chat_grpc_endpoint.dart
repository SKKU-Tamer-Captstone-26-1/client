class ChatGrpcEndpoint {
  const ChatGrpcEndpoint({
    required this.host,
    required this.port,
    required this.useTls,
  });

  final String host;
  final int port;
  final bool useTls;

  static ChatGrpcEndpoint fromEnvironment() {
    const host = String.fromEnvironment(
      'CHAT_GRPC_HOST',
      defaultValue: 'localhost',
    );
    const portValue = String.fromEnvironment(
      'CHAT_GRPC_PORT',
      defaultValue: '9090',
    );
    const useTlsValue = String.fromEnvironment(
      'CHAT_GRPC_TLS',
      defaultValue: 'false',
    );

    final parsedPort = int.tryParse(portValue) ?? 9090;
    final parsedTls = useTlsValue.toLowerCase() == 'true';

    return ChatGrpcEndpoint(host: host, port: parsedPort, useTls: parsedTls);
  }
}
