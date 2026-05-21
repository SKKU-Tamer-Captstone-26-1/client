const _kIsRelease = bool.fromEnvironment('dart.vm.product');

class SurveyGrpcEndpoint {
  const SurveyGrpcEndpoint({
    required this.host,
    required this.port,
    required this.useTls,
  });

  final String host;
  final int port;
  final bool useTls;

  static SurveyGrpcEndpoint fromEnvironment() {
    const host = String.fromEnvironment(
      'SURVEY_GRPC_HOST',
      defaultValue: '10.0.2.2',
    );
    const portValue = String.fromEnvironment(
      'SURVEY_GRPC_PORT',
      defaultValue: '9093',
    );
    const tlsOverride = String.fromEnvironment('SURVEY_GRPC_TLS');

    final parsedPort = int.tryParse(portValue) ?? 9093;
    final parsedTls = tlsOverride.isNotEmpty
        ? tlsOverride.toLowerCase() == 'true'
        : _kIsRelease;

    assert(
      !_kIsRelease || host != '10.0.2.2',
      'SURVEY_GRPC_HOST must be explicitly set in release builds',
    );

    return SurveyGrpcEndpoint(host: host, port: parsedPort, useTls: parsedTls);
  }
}
