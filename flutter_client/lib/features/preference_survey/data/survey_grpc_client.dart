import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:grpc/grpc.dart';

import '../models/survey_question.dart';
import 'grpc_gen/survey/v1/survey.pbgrpc.dart' as pb;
import 'survey_grpc_endpoint.dart';

class SurveyGrpcClient {
  SurveyGrpcClient(this._endpoint);

  final SurveyGrpcEndpoint _endpoint;

  Future<List<SurveyQuestion>> fetchQuestions() async {
    final channel = ClientChannel(
      _endpoint.host,
      port: _endpoint.port,
      options: ChannelOptions(
        credentials: _endpoint.useTls
            ? const ChannelCredentials.secure()
            : const ChannelCredentials.insecure(),
      ),
    );
    try {
      final stub = pb.SurveyServiceClient(channel);
      final response = await stub.getSurveyQuestions(pb.GetSurveyQuestionsRequest());
      return response.questions
          .map(SurveyQuestion.fromProto)
          .toList();
    } finally {
      await channel.shutdown();
    }
  }
}

final surveyGrpcClientProvider = Provider<SurveyGrpcClient>((ref) {
  return SurveyGrpcClient(SurveyGrpcEndpoint.fromEnvironment());
});
