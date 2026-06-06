const _kIsRelease = bool.fromEnvironment('dart.vm.product');

const String kGatewayBaseUrl = String.fromEnvironment(
  'GATEWAY_BASE_URL',
  defaultValue: 'http://10.0.2.2:8080',
);

const String kAppGatewayGrpcHost = String.fromEnvironment(
  'APP_GATEWAY_GRPC_HOST',
  defaultValue: '',
);

const String kAppGatewayGrpcTls = String.fromEnvironment(
  'APP_GATEWAY_GRPC_TLS',
  defaultValue: 'true',
);

const bool kBypassSurvey = bool.fromEnvironment('BYPASS_SURVEY');

const String kKakaoRestApiKey = String.fromEnvironment('KAKAO_REST_API_KEY');

const String kGcsBucket = String.fromEnvironment(
  'GCS_BUCKET',
  defaultValue: '',
);
const String kGcsApiKey = String.fromEnvironment(
  'GCS_API_KEY',
  defaultValue: '',
);

const String kSurveyGrpcHost = String.fromEnvironment(
  'SURVEY_GRPC_HOST',
  defaultValue: '10.0.2.2',
);
const String kSurveyGrpcPort = String.fromEnvironment(
  'SURVEY_GRPC_PORT',
  defaultValue: '9093',
);

/// Call once from main() before any network requests.
/// Catches insecure HTTP defaults that would send bearer tokens over plaintext.
void assertSecureConfig() {
  if (!_kIsRelease) return;
  if (kBypassSurvey) {
    throw StateError('BYPASS_SURVEY must be false in release builds.');
  }
  if (!kGatewayBaseUrl.startsWith('https://')) {
    throw StateError(
      'GATEWAY_BASE_URL must use https:// in release builds (got: $kGatewayBaseUrl)',
    );
  }
  if (kAppGatewayGrpcHost.isNotEmpty &&
      kAppGatewayGrpcTls.toLowerCase() != 'true') {
    throw StateError('APP_GATEWAY_GRPC_TLS must be true in release builds.');
  }
}
