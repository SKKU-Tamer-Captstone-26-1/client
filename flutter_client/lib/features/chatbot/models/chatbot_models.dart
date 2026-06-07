enum ChatbotScreenContext { home, board, map, chat }

enum ChatbotMessageRole { user, assistant }

enum ChatbotResponseStatus { unspecified, answered, refused, insufficientData }

enum ChatbotProfileStatus {
  unspecified,
  missing,
  pendingGeneration,
  active,
  stale,
  failedGeneration,
}

enum ChatbotBudgetMode { unspecified, soft, strict }

enum ChatbotFeedbackType { helpful, notHelpful, dismiss, copy, report }

enum ChatbotCardKind {
  unspecified,
  beverageRecommendation,
  venueRecommendation,
  purchaseOption,
  comparison,
  profileStatus,
}

class ChatbotSendRequest {
  const ChatbotSendRequest({
    required this.authToken,
    required this.clientMessageId,
    required this.message,
    required this.screenContext,
    this.conversationId = '',
    this.lat,
    this.lng,
    this.radiusM,
    this.budgetHintKrw,
    this.selectedBeverageId = '',
    this.category = '',
    this.beverageLimit = 3,
    this.venueLimit = 3,
    this.budgetMode = ChatbotBudgetMode.unspecified,
    this.clientContext = const <String, Object>{},
  });

  final String authToken;
  final String clientMessageId;
  final String conversationId;
  final String message;
  final ChatbotScreenContext screenContext;
  final double? lat;
  final double? lng;
  final int? radiusM;
  final int? budgetHintKrw;
  final String selectedBeverageId;
  final String category;
  final int beverageLimit;
  final int venueLimit;
  final ChatbotBudgetMode budgetMode;
  final Map<String, Object> clientContext;
}

class ChatbotConversationPage {
  const ChatbotConversationPage({
    required this.conversationId,
    required this.messages,
    required this.nextPageToken,
  });

  final String conversationId;
  final List<ChatbotConversationMessage> messages;
  final String nextPageToken;
}

class ChatbotConversationMessage {
  const ChatbotConversationMessage({
    required this.messageId,
    required this.role,
    required this.content,
    this.cards = const <ChatbotCardModel>[],
  });

  final String messageId;
  final ChatbotMessageRole role;
  final String content;
  final List<ChatbotCardModel> cards;
}

class ChatbotAnswer {
  const ChatbotAnswer({
    required this.conversationId,
    required this.messageId,
    required this.answer,
    required this.status,
    required this.refused,
    required this.refusalReason,
    required this.profileStatus,
    required this.missingFacts,
    required this.followUpQuestions,
    required this.cards,
  });

  final String conversationId;
  final String messageId;
  final String answer;
  final ChatbotResponseStatus status;
  final bool refused;
  final String refusalReason;
  final ChatbotProfileStatus profileStatus;
  final List<String> missingFacts;
  final List<String> followUpQuestions;
  final List<ChatbotCardModel> cards;
}

class ChatbotCardModel {
  const ChatbotCardModel({
    required this.kind,
    required this.title,
    required this.subtitle,
    required this.displayReason,
    required this.reasonCodes,
    this.beverage,
    this.venue,
    this.purchaseOption,
    this.comparison,
    this.profileStatus,
  });

  final ChatbotCardKind kind;
  final String title;
  final String subtitle;
  final String displayReason;
  final List<String> reasonCodes;
  final ChatbotBeverageCard? beverage;
  final ChatbotVenueCard? venue;
  final ChatbotPurchaseOptionCard? purchaseOption;
  final ChatbotComparisonCard? comparison;
  final ChatbotProfileStatusCard? profileStatus;
}

class ChatbotBeverageCard {
  const ChatbotBeverageCard({
    required this.rank,
    required this.resultId,
    required this.beverageId,
    required this.nameKo,
    required this.nameEn,
    required this.category,
    required this.reasonCodes,
    required this.explanation,
  });

  final int rank;
  final String resultId;
  final String beverageId;
  final String nameKo;
  final String nameEn;
  final String category;
  final List<String> reasonCodes;
  final String explanation;

  String get displayName => nameKo.trim().isNotEmpty ? nameKo : nameEn;
}

class ChatbotVenueCard {
  const ChatbotVenueCard({
    required this.rank,
    required this.resultId,
    required this.placeId,
    required this.name,
    required this.placeType,
    required this.address,
    this.distanceM,
    this.priceKrw,
    this.estimatedTravelTimeSec,
    required this.availabilityLabel,
    required this.freshnessLabel,
    required this.reasonCodes,
    required this.explanation,
  });

  final int rank;
  final String resultId;
  final String placeId;
  final String name;
  final String placeType;
  final String address;
  final double? distanceM;
  final int? priceKrw;
  final int? estimatedTravelTimeSec;
  final String availabilityLabel;
  final String freshnessLabel;
  final List<String> reasonCodes;
  final String explanation;
}

class ChatbotPurchaseOptionCard {
  const ChatbotPurchaseOptionCard({
    required this.resultId,
    required this.beverageId,
    required this.beverageName,
    required this.placeId,
    required this.placeName,
    required this.placeType,
    required this.address,
    this.distanceM,
    this.priceKrw,
    this.estimatedTravelTimeSec,
    required this.availabilityLabel,
    required this.freshnessLabel,
    required this.reasonCodes,
    required this.explanation,
  });

  final String resultId;
  final String beverageId;
  final String beverageName;
  final String placeId;
  final String placeName;
  final String placeType;
  final String address;
  final double? distanceM;
  final int? priceKrw;
  final int? estimatedTravelTimeSec;
  final String availabilityLabel;
  final String freshnessLabel;
  final List<String> reasonCodes;
  final String explanation;
}

class ChatbotComparisonCard {
  const ChatbotComparisonCard({required this.options, required this.summary});

  final List<ChatbotPurchaseOptionCard> options;
  final String summary;
}

class ChatbotProfileStatusCard {
  const ChatbotProfileStatusCard({
    required this.status,
    required this.profileRevision,
    required this.surveyResponseId,
    required this.staleReason,
  });

  final ChatbotProfileStatus status;
  final int profileRevision;
  final String surveyResponseId;
  final String staleReason;
}
