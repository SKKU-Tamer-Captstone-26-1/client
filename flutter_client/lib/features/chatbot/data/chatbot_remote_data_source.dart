import 'package:grpc/grpc.dart';

import '../../../core/gateway/app_gateway_grpc_endpoint.dart';
import '../../../core/gateway/app_gateway_struct.dart';
import '../../../core/gateway/grpc_gen/appgateway/v1/app_gateway.pbgrpc.dart'
    as pb;
import '../models/chatbot_models.dart';

abstract class ChatbotRemoteDataSource {
  Future<pb.SendChatbotMessageResponse> askChatbot({
    required ChatbotSendRequest request,
  });

  Future<pb.GetChatbotConversationResponse> getConversation({
    required String authToken,
    required String conversationId,
    int pageSize = 20,
    String pageToken = '',
  });

  Future<pb.RecordChatbotFeedbackResponse> recordFeedback({
    required String authToken,
    required String conversationId,
    required String messageId,
    required pb.ChatbotFeedbackType eventType,
    required String idempotencyKey,
    String comment = '',
    Map<String, Object> metadata = const <String, Object>{},
  });

  Future<void> dispose();
}

class GrpcChatbotRemoteDataSource implements ChatbotRemoteDataSource {
  factory GrpcChatbotRemoteDataSource({AppGatewayGrpcEndpoint? endpoint}) {
    final resolvedEndpoint =
        endpoint ?? AppGatewayGrpcEndpoint.fromEnvironment();
    final channel = ClientChannel(
      resolvedEndpoint.host,
      port: resolvedEndpoint.port,
      options: ChannelOptions(
        credentials: resolvedEndpoint.useTls
            ? const ChannelCredentials.secure()
            : const ChannelCredentials.insecure(),
      ),
    );

    return GrpcChatbotRemoteDataSource._(
      resolvedEndpoint,
      channel,
      pb.AppGatewayServiceClient(channel),
    );
  }

  GrpcChatbotRemoteDataSource._(this._endpoint, this._channel, this._client);

  final AppGatewayGrpcEndpoint _endpoint;
  final ClientChannel _channel;
  final pb.AppGatewayServiceClient _client;

  @override
  Future<pb.SendChatbotMessageResponse> askChatbot({
    required ChatbotSendRequest request,
  }) {
    final proto = pb.SendChatbotMessageRequest(
      clientMessageId: request.clientMessageId,
      message: request.message,
      screenContext: _screenContextToProto(request.screenContext),
      beverageLimit: request.beverageLimit,
      venueLimit: request.venueLimit,
      budgetMode: _budgetModeToProto(request.budgetMode),
      clientContext: mapToStruct(request.clientContext),
    );

    final conversationId = request.conversationId.trim();
    if (conversationId.isNotEmpty) {
      proto.conversationId = conversationId;
    }
    final selectedBeverageId = request.selectedBeverageId.trim();
    if (selectedBeverageId.isNotEmpty) {
      proto.selectedBeverageId = selectedBeverageId;
    }
    final category = request.category.trim();
    if (category.isNotEmpty) {
      proto.category = category;
    }
    final lat = request.lat;
    final lng = request.lng;
    final radiusM = request.radiusM;
    if (lat != null && lng != null) {
      proto.lat = lat;
      proto.lng = lng;
      if (radiusM != null && radiusM > 0) {
        proto.radiusM = radiusM;
      }
    }

    return _client.sendChatbotMessage(
      proto,
      options: _authenticatedOptions(request.authToken),
    );
  }

  @override
  Future<pb.GetChatbotConversationResponse> getConversation({
    required String authToken,
    required String conversationId,
    int pageSize = 20,
    String pageToken = '',
  }) {
    return _client.getChatbotConversation(
      pb.GetChatbotConversationRequest(
        conversationId: conversationId,
        pageSize: pageSize,
        pageToken: pageToken,
      ),
      options: _authenticatedOptions(authToken),
    );
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
    return _client.recordChatbotFeedback(
      pb.RecordChatbotFeedbackRequest(
        idempotencyKey: idempotencyKey,
        conversationId: conversationId,
        messageId: messageId,
        feedbackType: eventType,
        comment: comment,
        clientContext: mapToStruct(metadata),
      ),
      options: _authenticatedOptions(authToken),
    );
  }

  @override
  Future<void> dispose() {
    return _channel.shutdown();
  }

  CallOptions _authenticatedOptions(String authToken) {
    final token = authToken.trim();
    return CallOptions(
      timeout: const Duration(seconds: 12),
      metadata: token.isEmpty
          ? const <String, String>{}
          : <String, String>{'authorization': 'Bearer $token'},
    );
  }

  static pb.ScreenContext _screenContextToProto(ChatbotScreenContext context) {
    return switch (context) {
      ChatbotScreenContext.home => pb.ScreenContext.SCREEN_CONTEXT_HOME,
      ChatbotScreenContext.board => pb.ScreenContext.SCREEN_CONTEXT_BOARD,
      ChatbotScreenContext.map => pb.ScreenContext.SCREEN_CONTEXT_MAP,
      ChatbotScreenContext.chat => pb.ScreenContext.SCREEN_CONTEXT_CHAT,
    };
  }

  static pb.BudgetMode _budgetModeToProto(ChatbotBudgetMode mode) {
    return switch (mode) {
      ChatbotBudgetMode.soft => pb.BudgetMode.BUDGET_MODE_SOFT,
      ChatbotBudgetMode.strict => pb.BudgetMode.BUDGET_MODE_STRICT,
      ChatbotBudgetMode.unspecified => pb.BudgetMode.BUDGET_MODE_UNSPECIFIED,
    };
  }

  @override
  String toString() =>
      'GrpcChatbotRemoteDataSource(${_endpoint.host}:${_endpoint.port}, tls=${_endpoint.useTls})';
}
