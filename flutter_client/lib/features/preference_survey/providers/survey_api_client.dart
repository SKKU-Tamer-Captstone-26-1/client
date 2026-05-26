import 'dart:convert';
import 'package:http/http.dart' as http;

class SurveyApiClient {
  final String baseUrl;
  final String authToken;

  const SurveyApiClient({required this.baseUrl, required this.authToken});

  Future<String> submit({
    required String userId,
    required Map<String, List<String>?> answers,
  }) async {
    String? single(String key) => answers[key]?.first;

    // q3 (beginner) and q4 (expert) both cover whiskey — only one is shown.
    // q5/q6 = wine, q7/q8 = cocktail, q9/q10 = beer.
    final body = <String, dynamic>{
      'userId': userId,
      'level': single('q1'),
      'categories': answers['q2'],
      'whiskey': answers['q3'] ?? answers['q4'],
      'wine': answers['q5'] ?? answers['q6'],
      'cocktail': answers['q7'] ?? answers['q8'],
      'beer': answers['q9'] ?? answers['q10'],
      'flavorKeywords': answers['q11'],
      'budget': single('q12'),
    };

    final response = await http.post(
      Uri.parse('$baseUrl/api/v1/surveys'),
      headers: {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer $authToken',
      },
      body: jsonEncode(body),
    );

    if (response.statusCode < 200 || response.statusCode >= 300) {
      throw Exception('Survey submit failed: ${response.statusCode}');
    }

    final data = jsonDecode(response.body) as Map<String, dynamic>;
    return data['surveyId'] as String;
  }
}
