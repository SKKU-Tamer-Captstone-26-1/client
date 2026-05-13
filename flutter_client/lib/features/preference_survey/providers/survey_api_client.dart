import 'dart:convert';
import 'package:http/http.dart' as http;

class SurveyApiClient {
  final String baseUrl;
  final String authToken;

  const SurveyApiClient({required this.baseUrl, required this.authToken});

  Future<void> submit({
    required String userId,
    required Map<String, List<String>?> answers,
  }) async {
    String? single(String key) => answers[key]?.first;

    final body = <String, dynamic>{
      'userId':    userId,
      'q1Answer':  single('q1'),
      'q2Answer':  answers['q2'],
      'q3Answer':  single('q3'),
      'q4Answer':  single('q4'),
      'q5Answer':  single('q5'),
      'q6Answer':  single('q6'),
      'q7Answer':  single('q7'),
      'q8Answer':  single('q8'),
      'q9Answer':  single('q9'),
      'q10Answer': single('q10'),
      'q11Answer': answers['q11'],
      'q12Answer': single('q12'),
    };

    final response = await http.post(
      Uri.parse('$baseUrl/api/v1/surveys'),
      headers: {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer $authToken',
      },
      body: jsonEncode(body),
    );

    if (response.statusCode != 200) {
      throw Exception('Survey submit failed: ${response.statusCode}');
    }
  }
}
