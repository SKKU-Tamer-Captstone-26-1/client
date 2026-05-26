import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:grpc/grpc.dart';

import '../models/survey_question.dart';
import 'grpc_gen/survey/v1/survey.pbgrpc.dart' as pb;
import 'survey_grpc_endpoint.dart';

class SurveyGrpcClient {
  SurveyGrpcClient(this._endpoint);

  final SurveyGrpcEndpoint _endpoint;

  ClientChannel _channel() => ClientChannel(
        _endpoint.host,
        port: _endpoint.port,
        options: ChannelOptions(
          credentials: _endpoint.useTls
              ? const ChannelCredentials.secure()
              : const ChannelCredentials.insecure(),
        ),
      );

  Future<List<SurveyQuestion>> fetchQuestions() async {
    final channel = _channel();
    try {
      final stub = pb.SurveyServiceClient(channel);
      final response =
          await stub.getSurveyQuestions(pb.GetSurveyQuestionsRequest());
      return response.questions.map(SurveyQuestion.fromProto).toList();
    } finally {
      await channel.shutdown();
    }
  }

  Future<String> submitAnswers({
    required String userId,
    required Map<String, List<String>?> answers,
  }) async {
    String? single(String key) => answers[key]?.first;

    final request = pb.SubmitSurveyRequest(
      userId: userId,
      level: single('q1') ?? '',
      categories: answers['q2'] ?? [],
      whiskey: answers['q3'] ?? answers['q4'] ?? [],
      wine: answers['q5'] ?? answers['q6'] ?? [],
      cocktail: answers['q7'] ?? answers['q8'] ?? [],
      beer: answers['q9'] ?? answers['q10'] ?? [],
      flavorKeywords: answers['q11'] ?? [],
      budget: single('q12') ?? '',
    );

    final channel = _channel();
    try {
      final stub = pb.SurveyServiceClient(channel);
      final response = await stub.submitSurvey(request);
      return response.surveyId;
    } finally {
      await channel.shutdown();
    }
  }
}

final surveyGrpcClientProvider = Provider<SurveyGrpcClient>((ref) {
  return SurveyGrpcClient(SurveyGrpcEndpoint.fromEnvironment());
});
