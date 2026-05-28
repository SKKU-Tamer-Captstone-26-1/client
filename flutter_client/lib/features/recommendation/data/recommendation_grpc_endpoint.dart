class RecommendationGrpcEndpoint {
  const RecommendationGrpcEndpoint({
    required this.host,
    required this.port,
    required this.useTls,
  });

  final String host;
  final int port;
  final bool useTls;

  bool get isConfigured => host.trim().isNotEmpty;

  static RecommendationGrpcEndpoint fromEnvironment() {
    const host = String.fromEnvironment('RECOMMENDATION_GRPC_HOST');
    const portValue = String.fromEnvironment(
      'RECOMMENDATION_GRPC_PORT',
      defaultValue: '443',
    );
    const useTlsValue = String.fromEnvironment(
      'RECOMMENDATION_GRPC_TLS',
      defaultValue: 'true',
    );

    final parsedPort = int.tryParse(portValue) ?? 443;
    final parsedTls = useTlsValue.toLowerCase() == 'true';

    return RecommendationGrpcEndpoint(
      host: host,
      port: parsedPort,
      useTls: parsedTls,
    );
  }
}
