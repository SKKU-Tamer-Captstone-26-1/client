import 'package:flutter_test/flutter_test.dart';

import 'package:flutter_client/core/gateway/app_gateway_struct.dart';
import 'package:flutter_client/core/gateway/grpc_gen/appgateway/v1/app_gateway.pbgrpc.dart'
    as pb;
import 'package:flutter_client/features/chatbot/data/chatbot_remote_data_source.dart';
import 'package:flutter_client/features/chatbot/data/chatbot_repository.dart';
import 'package:flutter_client/features/chatbot/models/chatbot_models.dart';

void main() {
  test(
    'recommendation outage response is not mapped to missing profile',
    () async {
      final remote = _FakeChatbotRemoteDataSource(
        askResponse: pb.SendChatbotMessageResponse(
          conversationId: 'conv-1',
          assistantMessageId: 'msg-1',
          message: '추천 데이터를 일시적으로 불러오지 못했어요.',
          fallbackReason: 'RECOMMENDATION_SERVICE_UNAVAILABLE',
          servicePayload: mapToStruct(<String, Object>{
            'status': 'CHATBOT_RESPONSE_STATUS_INSUFFICIENT_DATA',
            'profile_status': 'PROFILE_STATUS_ACTIVE',
            'missing_facts': <String>['recommendation_service_unavailable'],
          }),
        ),
      );
      final repository = GrpcChatbotRepository(remote);

      final answer = await repository.sendMessage(_request());

      expect(answer.status, ChatbotResponseStatus.insufficientData);
      expect(answer.profileStatus, ChatbotProfileStatus.active);
      expect(answer.profileStatus, isNot(ChatbotProfileStatus.missing));
      expect(answer.refusalReason, 'RECOMMENDATION_SERVICE_UNAVAILABLE');
      expect(
        answer.missingFacts,
        contains('recommendation_service_unavailable'),
      );
    },
  );

  test(
    'sendMessage preserves conversation location and selected beverage context',
    () async {
      final remote = _FakeChatbotRemoteDataSource();
      final repository = GrpcChatbotRepository(remote);

      await repository.sendMessage(
        _request(
          conversationId: 'conv-1',
          screenContext: ChatbotScreenContext.map,
          lat: 37.2951,
          lng: 126.9774,
          radiusM: 1500,
          selectedBeverageId: 'bev-1',
        ),
      );

      final request = remote.lastRequest;
      expect(request, isNotNull);
      expect(request?.conversationId, 'conv-1');
      expect(request?.screenContext, ChatbotScreenContext.map);
      expect(request?.lat, 37.2951);
      expect(request?.lng, 126.9774);
      expect(request?.radiusM, 1500);
      expect(request?.selectedBeverageId, 'bev-1');
    },
  );

  test(
    'getConversation can request latest conversation with empty id',
    () async {
      final remote = _FakeChatbotRemoteDataSource(
        conversationResponse: pb.GetChatbotConversationResponse(
          conversationId: 'latest-conv',
          nextPageToken: '',
        ),
      );
      final repository = GrpcChatbotRepository(remote);

      final page = await repository.getConversation(
        authToken: 'access-token',
        conversationId: '',
      );

      expect(remote.lastConversationId, '');
      expect(page.conversationId, 'latest-conv');
    },
  );
}

ChatbotSendRequest _request({
  String conversationId = '',
  ChatbotScreenContext screenContext = ChatbotScreenContext.home,
  double? lat,
  double? lng,
  int? radiusM,
  String selectedBeverageId = '',
}) {
  return ChatbotSendRequest(
    authToken: 'access-token',
    clientMessageId: 'client-message-1',
    conversationId: conversationId,
    message: '추천해줘',
    screenContext: screenContext,
    lat: lat,
    lng: lng,
    radiusM: radiusM,
    selectedBeverageId: selectedBeverageId,
  );
}

class _FakeChatbotRemoteDataSource implements ChatbotRemoteDataSource {
  _FakeChatbotRemoteDataSource({
    pb.SendChatbotMessageResponse? askResponse,
    pb.GetChatbotConversationResponse? conversationResponse,
  }) : askResponse =
           askResponse ??
           pb.SendChatbotMessageResponse(
             conversationId: 'conv-1',
             assistantMessageId: 'msg-1',
             message: '답변입니다.',
             servicePayload: mapToStruct(<String, Object>{
               'status': 'CHATBOT_RESPONSE_STATUS_ANSWERED',
               'profile_status': 'PROFILE_STATUS_ACTIVE',
             }),
           ),
       conversationResponse =
           conversationResponse ??
           pb.GetChatbotConversationResponse(conversationId: 'conv-1');

  final pb.SendChatbotMessageResponse askResponse;
  final pb.GetChatbotConversationResponse conversationResponse;

  ChatbotSendRequest? lastRequest;
  String lastConversationId = '';

  @override
  Future<pb.SendChatbotMessageResponse> askChatbot({
    required ChatbotSendRequest request,
  }) async {
    lastRequest = request;
    return askResponse;
  }

  @override
  Future<pb.GetChatbotConversationResponse> getConversation({
    required String authToken,
    required String conversationId,
    int pageSize = 20,
    String pageToken = '',
  }) async {
    lastConversationId = conversationId;
    return conversationResponse;
  }

  @override
  Future<pb.RecordChatbotFeedbackResponse> recordFeedback({
    required String authToken,
    required String conversationId,
    required String messageId,
    required pb.ChatbotFeedbackType eventType,
    required String idempotencyKey,
    String comment = '',
    Map<String, Object> metadata = const <String, Object>{},
  }) {
    throw UnimplementedError();
  }

  @override
  Future<void> dispose() async {}
}
