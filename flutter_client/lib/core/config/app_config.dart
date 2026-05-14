const _kIsRelease = bool.fromEnvironment('dart.vm.product');

const String kGatewayBaseUrl = String.fromEnvironment(
  'GATEWAY_BASE_URL',
  defaultValue: 'http://10.0.2.2:8080',
);

const String kSurveyBaseUrl = String.fromEnvironment(
  'SURVEY_BASE_URL',
  defaultValue: 'http://10.0.2.2:8083',
);

const bool kBypassSurvey = bool.fromEnvironment('BYPASS_SURVEY');

/// Call once from main() before any network requests.
/// Catches insecure HTTP defaults that would send bearer tokens over plaintext.
void assertSecureConfig() {
  if (!_kIsRelease) return;
  if (kBypassSurvey) {
    throw StateError('BYPASS_SURVEY must be false in release builds.');
  }
  assert(
    kSurveyBaseUrl.startsWith('https://'),
    'SURVEY_BASE_URL must use https:// in release builds (got: $kSurveyBaseUrl)',
  );
  assert(
    kGatewayBaseUrl.startsWith('https://'),
    'GATEWAY_BASE_URL must use https:// in release builds (got: $kGatewayBaseUrl)',
  );
}
