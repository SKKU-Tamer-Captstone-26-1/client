class BoardGatewayEndpoint {
  const BoardGatewayEndpoint({
    required this.baseUrl,
  });

  final String baseUrl;

  static BoardGatewayEndpoint fromEnvironment() {
    const host = String.fromEnvironment(
      'GATEWAY_HOST',
      defaultValue: '127.0.0.1',
    );
    const port = String.fromEnvironment(
      'GATEWAY_PORT',
      defaultValue: '8080',
    );
    const useTlsValue = String.fromEnvironment(
      'GATEWAY_TLS',
      defaultValue: 'false',
    );
    final scheme = useTlsValue.toLowerCase() == 'true' ? 'https' : 'http';
    return BoardGatewayEndpoint(baseUrl: '$scheme://$host:$port');
  }
}
