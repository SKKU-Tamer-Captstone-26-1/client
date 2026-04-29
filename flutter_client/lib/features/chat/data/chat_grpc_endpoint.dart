class ChatGrpcEndpoint {
  const ChatGrpcEndpoint({
    required this.host,
    required this.port,
    required this.useTls,
  });

  final String host;
  final int port;
  final bool useTls;

  static ChatGrpcEndpoint? tryFromEnvironment() {
    const host = String.fromEnvironment('CHAT_GRPC_HOST');
    const portValue = String.fromEnvironment('CHAT_GRPC_PORT');
    const useTlsValue = String.fromEnvironment(
      'CHAT_GRPC_TLS',
      defaultValue: 'false',
    );

    if (host.isEmpty || portValue.isEmpty) {
      return null;
    }
    final parsedPort = int.tryParse(portValue);
    if (parsedPort == null || parsedPort <= 0) {
      return null;
    }
    final parsedTls = useTlsValue.toLowerCase() == 'true';

    return ChatGrpcEndpoint(
      host: host,
      port: parsedPort,
      useTls: parsedTls,
    );
  }
}
