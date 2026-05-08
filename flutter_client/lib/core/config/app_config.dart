const String kGatewayBaseUrl = String.fromEnvironment(
  'GATEWAY_BASE_URL',
  defaultValue: 'http://10.0.2.2:8080',
);

const String kSurveyBaseUrl = String.fromEnvironment(
  'SURVEY_BASE_URL',
  defaultValue: 'http://10.0.2.2:8083',
);
