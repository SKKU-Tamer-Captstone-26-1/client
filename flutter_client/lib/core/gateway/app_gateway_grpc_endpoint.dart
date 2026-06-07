class AppGatewayGrpcEndpoint {
  const AppGatewayGrpcEndpoint({
    required this.host,
    required this.port,
    required this.useTls,
  });

  final String host;
  final int port;
  final bool useTls;

  bool get isConfigured => host.trim().isNotEmpty;

  static AppGatewayGrpcEndpoint fromEnvironment() {
    const host = String.fromEnvironment(
      'APP_GATEWAY_GRPC_HOST',
      defaultValue: '',
    );
    const portValue = String.fromEnvironment(
      'APP_GATEWAY_GRPC_PORT',
      defaultValue: '443',
    );
    const useTlsValue = String.fromEnvironment(
      'APP_GATEWAY_GRPC_TLS',
      defaultValue: 'true',
    );

    return AppGatewayGrpcEndpoint(
      host: host,
      port: int.tryParse(portValue) ?? 443,
      useTls: useTlsValue.toLowerCase() == 'true',
    );
  }
}
