import '../../../core/gateway/app_gateway_struct.dart';
import '../../../core/gateway/grpc_gen/appgateway/v1/app_gateway.pbgrpc.dart'
    as pb;
import '../../../core/gateway/grpc_gen/google/protobuf/struct.pb.dart'
    as structpb;
import '../models/chatbot_models.dart';
import 'chatbot_remote_data_source.dart';

const Set<String> _chatbotFeedbackMetadataAllowlist = <String>{
  'client_platform',
  'app_version',
  'surface',
  'screen_context',
  'session_id_hash',
  'source',
};

abstract class ChatbotRepository {
  Future<ChatbotAnswer> sendMessage(ChatbotSendRequest request);

  Future<ChatbotConversationPage> getConversation({
    required String authToken,
    required String conversationId,
    int pageSize = 20,
    String pageToken = '',
  });

  Future<void> recordFeedback({
    required String authToken,
    required String conversationId,
    required String messageId,
    required ChatbotFeedbackType eventType,
    required String idempotencyKey,
    String comment = '',
    Map<String, Object> metadata = const <String, Object>{},
  });

  Future<void> dispose();
}

class ChatbotRepositoryUnavailableException implements Exception {
  const ChatbotRepositoryUnavailableException(this.message);

  final String message;

  @override
  String toString() => message;
}

class UnavailableChatbotRepository implements ChatbotRepository {
  const UnavailableChatbotRepository();

  static const _message =
      'AppGateway gRPC endpoint is not configured. Set APP_GATEWAY_GRPC_HOST/PORT/TLS.';

  @override
  Future<ChatbotAnswer> sendMessage(ChatbotSendRequest request) {
    throw const ChatbotRepositoryUnavailableException(_message);
  }

  @override
  Future<ChatbotConversationPage> getConversation({
    required String authToken,
    required String conversationId,
    int pageSize = 20,
    String pageToken = '',
  }) {
    throw const ChatbotRepositoryUnavailableException(_message);
  }

  @override
  Future<void> recordFeedback({
    required String authToken,
    required String conversationId,
    required String messageId,
    required ChatbotFeedbackType eventType,
    required String idempotencyKey,
    String comment = '',
    Map<String, Object> metadata = const <String, Object>{},
  }) async {}

  @override
  Future<void> dispose() async {}
}

class GrpcChatbotRepository implements ChatbotRepository {
  const GrpcChatbotRepository(this._remote);

  final ChatbotRemoteDataSource _remote;

  @override
  Future<ChatbotAnswer> sendMessage(ChatbotSendRequest request) async {
    final response = await _remote.askChatbot(request: request);
    return _answerFromProto(response);
  }

  @override
  Future<ChatbotConversationPage> getConversation({
    required String authToken,
    required String conversationId,
    int pageSize = 20,
    String pageToken = '',
  }) async {
    final response = await _remote.getConversation(
      authToken: authToken,
      conversationId: conversationId,
      pageSize: pageSize,
      pageToken: pageToken,
    );
    return ChatbotConversationPage(
      conversationId: response.conversationId,
      nextPageToken: response.nextPageToken,
      messages: response.messages.map(_conversationMessageFromProto).toList(),
    );
  }

  @override
  Future<void> recordFeedback({
    required String authToken,
    required String conversationId,
    required String messageId,
    required ChatbotFeedbackType eventType,
    required String idempotencyKey,
    String comment = '',
    Map<String, Object> metadata = const <String, Object>{},
  }) async {
    await _remote.recordFeedback(
      authToken: authToken,
      conversationId: conversationId,
      messageId: messageId,
      eventType: _feedbackTypeToProto(eventType),
      idempotencyKey: idempotencyKey,
      comment: comment,
      metadata: _filterFeedbackMetadata(metadata),
    );
  }

  @override
  Future<void> dispose() {
    return _remote.dispose();
  }

  static ChatbotAnswer _answerFromProto(
    pb.SendChatbotMessageResponse response,
  ) {
    final payload = response.servicePayload;
    final status = _responseStatusFromPayload(payload);
    final refused =
        structBool(payload, 'refused') ||
        status == ChatbotResponseStatus.refused;
    return ChatbotAnswer(
      conversationId: response.conversationId,
      messageId: response.assistantMessageId,
      answer: response.message,
      status: status,
      refused: refused,
      refusalReason: response.fallbackReason,
      profileStatus: _profileStatusFromPayload(payload),
      missingFacts: List<String>.unmodifiable(
        structStringList(payload, 'missing_facts'),
      ),
      followUpQuestions: List<String>.unmodifiable(
        structStringList(payload, 'follow_up_questions'),
      ),
      cards: _cardsFromGatewayResponse(response),
    );
  }

  static ChatbotConversationMessage _conversationMessageFromProto(
    pb.ChatbotConversationMessage message,
  ) {
    return ChatbotConversationMessage(
      messageId: message.messageId,
      role: _messageRoleFromProto(message.role),
      content: message.message,
      cards: const <ChatbotCardModel>[],
    );
  }

  static List<ChatbotCardModel> _cardsFromGatewayResponse(
    pb.SendChatbotMessageResponse response,
  ) {
    return <ChatbotCardModel>[
      ...response.recommendationRefs.map(_beverageCardFromRef),
      ...response.venueRefs.map(_venueCardFromRef),
    ];
  }

  static ChatbotCardModel _beverageCardFromRef(pb.RecommendationReference ref) {
    final title = ref.title.trim().isNotEmpty ? ref.title : '추천 주류';
    return ChatbotCardModel(
      kind: ChatbotCardKind.beverageRecommendation,
      title: title,
      subtitle: structString(ref.servicePayload, 'category'),
      displayReason: structString(ref.servicePayload, 'explanation'),
      reasonCodes: structStringList(ref.servicePayload, 'reason_codes'),
      beverage: ChatbotBeverageCard(
        rank: structInt(ref.servicePayload, 'rank'),
        resultId: ref.recommendationId,
        beverageId: ref.beverageId,
        nameKo: title,
        nameEn: structString(ref.servicePayload, 'name_en'),
        category: structString(ref.servicePayload, 'category'),
        reasonCodes: structStringList(ref.servicePayload, 'reason_codes'),
        explanation: structString(ref.servicePayload, 'explanation'),
      ),
    );
  }

  static ChatbotCardModel _venueCardFromRef(pb.VenueReference ref) {
    final name = ref.name.trim().isNotEmpty ? ref.name : '추천 장소';
    return ChatbotCardModel(
      kind: ChatbotCardKind.venueRecommendation,
      title: name,
      subtitle: structString(ref.servicePayload, 'address'),
      displayReason: structString(ref.servicePayload, 'explanation'),
      reasonCodes: structStringList(ref.servicePayload, 'reason_codes'),
      venue: ChatbotVenueCard(
        rank: structInt(ref.servicePayload, 'rank'),
        resultId: structString(ref.servicePayload, 'result_id'),
        placeId: ref.venueId,
        name: name,
        placeType: structString(ref.servicePayload, 'place_type'),
        address: structString(ref.servicePayload, 'address'),
        distanceM: structDoubleOrNull(ref.servicePayload, 'distance_m'),
        priceKrw: _positiveIntOrNull(ref.servicePayload, 'price_krw'),
        estimatedTravelTimeSec: _positiveIntOrNull(
          ref.servicePayload,
          'estimated_travel_time_sec',
        ),
        availabilityLabel: _availabilityLabel(
          structString(ref.servicePayload, 'availability_status'),
        ),
        freshnessLabel: _freshnessLabel(
          structString(ref.servicePayload, 'freshness_status'),
        ),
        reasonCodes: structStringList(ref.servicePayload, 'reason_codes'),
        explanation: structString(ref.servicePayload, 'explanation'),
      ),
    );
  }

  static ChatbotResponseStatus _responseStatusFromPayload(
    structpb.Struct payload,
  ) {
    final status = structString(payload, 'status');
    if (status.endsWith('REFUSED')) {
      return ChatbotResponseStatus.refused;
    }
    if (status.endsWith('INSUFFICIENT_DATA')) {
      return ChatbotResponseStatus.insufficientData;
    }
    if (status.endsWith('ANSWERED')) {
      return ChatbotResponseStatus.answered;
    }
    return ChatbotResponseStatus.unspecified;
  }

  static ChatbotMessageRole _messageRoleFromProto(pb.ChatbotMessageRole role) {
    return switch (role) {
      pb.ChatbotMessageRole.CHATBOT_MESSAGE_ROLE_USER =>
        ChatbotMessageRole.user,
      _ => ChatbotMessageRole.assistant,
    };
  }

  static ChatbotProfileStatus _profileStatusFromPayload(
    structpb.Struct payload,
  ) {
    final status = structString(payload, 'profile_status');
    if (status.endsWith('MISSING')) {
      return ChatbotProfileStatus.missing;
    }
    if (status.endsWith('PENDING_GENERATION') || status.endsWith('PENDING')) {
      return ChatbotProfileStatus.pendingGeneration;
    }
    if (status.endsWith('ACTIVE')) {
      return ChatbotProfileStatus.active;
    }
    if (status.endsWith('STALE')) {
      return ChatbotProfileStatus.stale;
    }
    if (status.endsWith('FAILED_GENERATION') || status.endsWith('FAILED')) {
      return ChatbotProfileStatus.failedGeneration;
    }
    return ChatbotProfileStatus.unspecified;
  }

  static pb.ChatbotFeedbackType _feedbackTypeToProto(ChatbotFeedbackType type) {
    return switch (type) {
      ChatbotFeedbackType.helpful =>
        pb.ChatbotFeedbackType.CHATBOT_FEEDBACK_TYPE_HELPFUL,
      ChatbotFeedbackType.notHelpful =>
        pb.ChatbotFeedbackType.CHATBOT_FEEDBACK_TYPE_NOT_HELPFUL,
      ChatbotFeedbackType.dismiss =>
        pb.ChatbotFeedbackType.CHATBOT_FEEDBACK_TYPE_DISMISS,
      ChatbotFeedbackType.copy =>
        pb.ChatbotFeedbackType.CHATBOT_FEEDBACK_TYPE_COPY,
      ChatbotFeedbackType.report =>
        pb.ChatbotFeedbackType.CHATBOT_FEEDBACK_TYPE_REPORT,
    };
  }

  static String _availabilityLabel(String status) {
    if (status.endsWith('LIKELY_AVAILABLE')) {
      return '이용 가능성이 높음';
    }
    if (status.endsWith('AVAILABLE') && !status.endsWith('UNAVAILABLE')) {
      return '확인된 이용 가능';
    }
    if (status.endsWith('UNAVAILABLE')) {
      return '이용 불가로 표시됨';
    }
    if (status.endsWith('UNKNOWN')) {
      return '확인 필요';
    }
    return '';
  }

  static String _freshnessLabel(String status) {
    if (status.endsWith('FRESH')) {
      return '최신 관측';
    }
    if (status.endsWith('STALE')) {
      return '오래된 관측';
    }
    if (status.endsWith('EXPIRED')) {
      return '만료된 관측';
    }
    return '';
  }

  static int? _positiveIntOrNull(structpb.Struct payload, String key) {
    final value = structInt(payload, key);
    return value > 0 ? value : null;
  }

  static Map<String, Object> _filterFeedbackMetadata(
    Map<String, Object> metadata,
  ) {
    return <String, Object>{
      for (final entry in metadata.entries)
        if (_chatbotFeedbackMetadataAllowlist.contains(entry.key))
          entry.key: entry.value,
    };
  }
}
