import '../data/chatbot_repository.dart';
import '../models/chatbot_models.dart';

class SendChatbotMessageUseCase {
  const SendChatbotMessageUseCase(this._repository);

  final ChatbotRepository _repository;

  Future<ChatbotAnswer> call(ChatbotSendRequest request) {
    return _repository.sendMessage(request);
  }
}

class GetChatbotConversationUseCase {
  const GetChatbotConversationUseCase(this._repository);

  final ChatbotRepository _repository;

  Future<ChatbotConversationPage> call({
    required String authToken,
    required String conversationId,
    int pageSize = 20,
    String pageToken = '',
  }) {
    return _repository.getConversation(
      authToken: authToken,
      conversationId: conversationId,
      pageSize: pageSize,
      pageToken: pageToken,
    );
  }
}

class RecordChatbotFeedbackUseCase {
  const RecordChatbotFeedbackUseCase(this._repository);

  final ChatbotRepository _repository;

  Future<void> call({
    required String authToken,
    required String conversationId,
    required String messageId,
    required ChatbotFeedbackType eventType,
    required String idempotencyKey,
    String comment = '',
    Map<String, Object> metadata = const <String, Object>{},
  }) {
    return _repository.recordFeedback(
      authToken: authToken,
      conversationId: conversationId,
      messageId: messageId,
      eventType: eventType,
      idempotencyKey: idempotencyKey,
      comment: comment,
      metadata: metadata,
    );
  }
}
