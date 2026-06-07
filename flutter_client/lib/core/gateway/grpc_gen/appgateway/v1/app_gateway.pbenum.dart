//
//  Generated code. Do not modify.
//  source: appgateway/v1/app_gateway.proto
//
// @dart = 2.12

// ignore_for_file: annotate_overrides, camel_case_types, comment_references
// ignore_for_file: constant_identifier_names, library_prefixes
// ignore_for_file: non_constant_identifier_names, prefer_final_fields
// ignore_for_file: unnecessary_import, unnecessary_this, unused_import

import 'dart:core' as $core;

import 'package:protobuf/protobuf.dart' as $pb;

class ChatbotMessageRole extends $pb.ProtobufEnum {
  static const ChatbotMessageRole CHATBOT_MESSAGE_ROLE_UNSPECIFIED =
      ChatbotMessageRole._(
          0, _omitEnumNames ? '' : 'CHATBOT_MESSAGE_ROLE_UNSPECIFIED');
  static const ChatbotMessageRole CHATBOT_MESSAGE_ROLE_USER =
      ChatbotMessageRole._(
          1, _omitEnumNames ? '' : 'CHATBOT_MESSAGE_ROLE_USER');
  static const ChatbotMessageRole CHATBOT_MESSAGE_ROLE_ASSISTANT =
      ChatbotMessageRole._(
          2, _omitEnumNames ? '' : 'CHATBOT_MESSAGE_ROLE_ASSISTANT');
  static const ChatbotMessageRole CHATBOT_MESSAGE_ROLE_SYSTEM =
      ChatbotMessageRole._(
          3, _omitEnumNames ? '' : 'CHATBOT_MESSAGE_ROLE_SYSTEM');

  static const $core.List<ChatbotMessageRole> values = <ChatbotMessageRole>[
    CHATBOT_MESSAGE_ROLE_UNSPECIFIED,
    CHATBOT_MESSAGE_ROLE_USER,
    CHATBOT_MESSAGE_ROLE_ASSISTANT,
    CHATBOT_MESSAGE_ROLE_SYSTEM,
  ];

  static final $core.Map<$core.int, ChatbotMessageRole> _byValue =
      $pb.ProtobufEnum.initByValue(values);
  static ChatbotMessageRole? valueOf($core.int value) => _byValue[value];

  const ChatbotMessageRole._($core.int v, $core.String n) : super(v, n);
}

class ChatbotFeedbackType extends $pb.ProtobufEnum {
  static const ChatbotFeedbackType CHATBOT_FEEDBACK_TYPE_UNSPECIFIED =
      ChatbotFeedbackType._(
          0, _omitEnumNames ? '' : 'CHATBOT_FEEDBACK_TYPE_UNSPECIFIED');
  static const ChatbotFeedbackType CHATBOT_FEEDBACK_TYPE_HELPFUL =
      ChatbotFeedbackType._(
          1, _omitEnumNames ? '' : 'CHATBOT_FEEDBACK_TYPE_HELPFUL');
  static const ChatbotFeedbackType CHATBOT_FEEDBACK_TYPE_NOT_HELPFUL =
      ChatbotFeedbackType._(
          2, _omitEnumNames ? '' : 'CHATBOT_FEEDBACK_TYPE_NOT_HELPFUL');
  static const ChatbotFeedbackType CHATBOT_FEEDBACK_TYPE_DISMISS =
      ChatbotFeedbackType._(
          3, _omitEnumNames ? '' : 'CHATBOT_FEEDBACK_TYPE_DISMISS');
  static const ChatbotFeedbackType CHATBOT_FEEDBACK_TYPE_COPY =
      ChatbotFeedbackType._(
          4, _omitEnumNames ? '' : 'CHATBOT_FEEDBACK_TYPE_COPY');
  static const ChatbotFeedbackType CHATBOT_FEEDBACK_TYPE_REPORT =
      ChatbotFeedbackType._(
          5, _omitEnumNames ? '' : 'CHATBOT_FEEDBACK_TYPE_REPORT');

  static const $core.List<ChatbotFeedbackType> values = <ChatbotFeedbackType>[
    CHATBOT_FEEDBACK_TYPE_UNSPECIFIED,
    CHATBOT_FEEDBACK_TYPE_HELPFUL,
    CHATBOT_FEEDBACK_TYPE_NOT_HELPFUL,
    CHATBOT_FEEDBACK_TYPE_DISMISS,
    CHATBOT_FEEDBACK_TYPE_COPY,
    CHATBOT_FEEDBACK_TYPE_REPORT,
  ];

  static final $core.Map<$core.int, ChatbotFeedbackType> _byValue =
      $pb.ProtobufEnum.initByValue(values);
  static ChatbotFeedbackType? valueOf($core.int value) => _byValue[value];

  const ChatbotFeedbackType._($core.int v, $core.String n) : super(v, n);
}

class RecommendationProfileStatus extends $pb.ProtobufEnum {
  static const RecommendationProfileStatus
      RECOMMENDATION_PROFILE_STATUS_UNSPECIFIED = RecommendationProfileStatus._(
          0, _omitEnumNames ? '' : 'RECOMMENDATION_PROFILE_STATUS_UNSPECIFIED');
  static const RecommendationProfileStatus
      RECOMMENDATION_PROFILE_STATUS_MISSING = RecommendationProfileStatus._(
          1, _omitEnumNames ? '' : 'RECOMMENDATION_PROFILE_STATUS_MISSING');
  static const RecommendationProfileStatus
      RECOMMENDATION_PROFILE_STATUS_PENDING = RecommendationProfileStatus._(
          2, _omitEnumNames ? '' : 'RECOMMENDATION_PROFILE_STATUS_PENDING');
  static const RecommendationProfileStatus
      RECOMMENDATION_PROFILE_STATUS_ACTIVE = RecommendationProfileStatus._(
          3, _omitEnumNames ? '' : 'RECOMMENDATION_PROFILE_STATUS_ACTIVE');
  static const RecommendationProfileStatus RECOMMENDATION_PROFILE_STATUS_STALE =
      RecommendationProfileStatus._(
          4, _omitEnumNames ? '' : 'RECOMMENDATION_PROFILE_STATUS_STALE');
  static const RecommendationProfileStatus
      RECOMMENDATION_PROFILE_STATUS_FAILED = RecommendationProfileStatus._(
          5, _omitEnumNames ? '' : 'RECOMMENDATION_PROFILE_STATUS_FAILED');

  static const $core.List<RecommendationProfileStatus> values =
      <RecommendationProfileStatus>[
    RECOMMENDATION_PROFILE_STATUS_UNSPECIFIED,
    RECOMMENDATION_PROFILE_STATUS_MISSING,
    RECOMMENDATION_PROFILE_STATUS_PENDING,
    RECOMMENDATION_PROFILE_STATUS_ACTIVE,
    RECOMMENDATION_PROFILE_STATUS_STALE,
    RECOMMENDATION_PROFILE_STATUS_FAILED,
  ];

  static final $core.Map<$core.int, RecommendationProfileStatus> _byValue =
      $pb.ProtobufEnum.initByValue(values);
  static RecommendationProfileStatus? valueOf($core.int value) =>
      _byValue[value];

  const RecommendationProfileStatus._($core.int v, $core.String n)
      : super(v, n);
}

class ScreenContext extends $pb.ProtobufEnum {
  static const ScreenContext SCREEN_CONTEXT_UNSPECIFIED =
      ScreenContext._(0, _omitEnumNames ? '' : 'SCREEN_CONTEXT_UNSPECIFIED');
  static const ScreenContext SCREEN_CONTEXT_HOME =
      ScreenContext._(1, _omitEnumNames ? '' : 'SCREEN_CONTEXT_HOME');
  static const ScreenContext SCREEN_CONTEXT_BOARD =
      ScreenContext._(2, _omitEnumNames ? '' : 'SCREEN_CONTEXT_BOARD');
  static const ScreenContext SCREEN_CONTEXT_MAP =
      ScreenContext._(3, _omitEnumNames ? '' : 'SCREEN_CONTEXT_MAP');
  static const ScreenContext SCREEN_CONTEXT_CHAT =
      ScreenContext._(4, _omitEnumNames ? '' : 'SCREEN_CONTEXT_CHAT');

  static const $core.List<ScreenContext> values = <ScreenContext>[
    SCREEN_CONTEXT_UNSPECIFIED,
    SCREEN_CONTEXT_HOME,
    SCREEN_CONTEXT_BOARD,
    SCREEN_CONTEXT_MAP,
    SCREEN_CONTEXT_CHAT,
  ];

  static final $core.Map<$core.int, ScreenContext> _byValue =
      $pb.ProtobufEnum.initByValue(values);
  static ScreenContext? valueOf($core.int value) => _byValue[value];

  const ScreenContext._($core.int v, $core.String n) : super(v, n);
}

class BudgetMode extends $pb.ProtobufEnum {
  static const BudgetMode BUDGET_MODE_UNSPECIFIED =
      BudgetMode._(0, _omitEnumNames ? '' : 'BUDGET_MODE_UNSPECIFIED');
  static const BudgetMode BUDGET_MODE_SOFT =
      BudgetMode._(1, _omitEnumNames ? '' : 'BUDGET_MODE_SOFT');
  static const BudgetMode BUDGET_MODE_STRICT =
      BudgetMode._(2, _omitEnumNames ? '' : 'BUDGET_MODE_STRICT');

  static const $core.List<BudgetMode> values = <BudgetMode>[
    BUDGET_MODE_UNSPECIFIED,
    BUDGET_MODE_SOFT,
    BUDGET_MODE_STRICT,
  ];

  static final $core.Map<$core.int, BudgetMode> _byValue =
      $pb.ProtobufEnum.initByValue(values);
  static BudgetMode? valueOf($core.int value) => _byValue[value];

  const BudgetMode._($core.int v, $core.String n) : super(v, n);
}

class BeverageDiversityMode extends $pb.ProtobufEnum {
  static const BeverageDiversityMode BEVERAGE_DIVERSITY_MODE_UNSPECIFIED =
      BeverageDiversityMode._(
          0, _omitEnumNames ? '' : 'BEVERAGE_DIVERSITY_MODE_UNSPECIFIED');
  static const BeverageDiversityMode BEVERAGE_DIVERSITY_MODE_STANDARD =
      BeverageDiversityMode._(
          1, _omitEnumNames ? '' : 'BEVERAGE_DIVERSITY_MODE_STANDARD');
  static const BeverageDiversityMode BEVERAGE_DIVERSITY_MODE_DIFFERENT =
      BeverageDiversityMode._(
          2, _omitEnumNames ? '' : 'BEVERAGE_DIVERSITY_MODE_DIFFERENT');
  static const BeverageDiversityMode BEVERAGE_DIVERSITY_MODE_ADJACENT =
      BeverageDiversityMode._(
          3, _omitEnumNames ? '' : 'BEVERAGE_DIVERSITY_MODE_ADJACENT');

  static const $core.List<BeverageDiversityMode> values =
      <BeverageDiversityMode>[
    BEVERAGE_DIVERSITY_MODE_UNSPECIFIED,
    BEVERAGE_DIVERSITY_MODE_STANDARD,
    BEVERAGE_DIVERSITY_MODE_DIFFERENT,
    BEVERAGE_DIVERSITY_MODE_ADJACENT,
  ];

  static final $core.Map<$core.int, BeverageDiversityMode> _byValue =
      $pb.ProtobufEnum.initByValue(values);
  static BeverageDiversityMode? valueOf($core.int value) => _byValue[value];

  const BeverageDiversityMode._($core.int v, $core.String n) : super(v, n);
}

class RecommendationEventType extends $pb.ProtobufEnum {
  static const RecommendationEventType RECOMMENDATION_EVENT_TYPE_UNSPECIFIED =
      RecommendationEventType._(
          0, _omitEnumNames ? '' : 'RECOMMENDATION_EVENT_TYPE_UNSPECIFIED');
  static const RecommendationEventType RECOMMENDATION_EVENT_TYPE_IMPRESSION =
      RecommendationEventType._(
          1, _omitEnumNames ? '' : 'RECOMMENDATION_EVENT_TYPE_IMPRESSION');
  static const RecommendationEventType RECOMMENDATION_EVENT_TYPE_CLICK =
      RecommendationEventType._(
          2, _omitEnumNames ? '' : 'RECOMMENDATION_EVENT_TYPE_CLICK');
  static const RecommendationEventType RECOMMENDATION_EVENT_TYPE_SAVE =
      RecommendationEventType._(
          3, _omitEnumNames ? '' : 'RECOMMENDATION_EVENT_TYPE_SAVE');
  static const RecommendationEventType RECOMMENDATION_EVENT_TYPE_DISMISS =
      RecommendationEventType._(
          4, _omitEnumNames ? '' : 'RECOMMENDATION_EVENT_TYPE_DISMISS');
  static const RecommendationEventType RECOMMENDATION_EVENT_TYPE_DETAIL_VIEW =
      RecommendationEventType._(
          5, _omitEnumNames ? '' : 'RECOMMENDATION_EVENT_TYPE_DETAIL_VIEW');

  static const $core.List<RecommendationEventType> values =
      <RecommendationEventType>[
    RECOMMENDATION_EVENT_TYPE_UNSPECIFIED,
    RECOMMENDATION_EVENT_TYPE_IMPRESSION,
    RECOMMENDATION_EVENT_TYPE_CLICK,
    RECOMMENDATION_EVENT_TYPE_SAVE,
    RECOMMENDATION_EVENT_TYPE_DISMISS,
    RECOMMENDATION_EVENT_TYPE_DETAIL_VIEW,
  ];

  static final $core.Map<$core.int, RecommendationEventType> _byValue =
      $pb.ProtobufEnum.initByValue(values);
  static RecommendationEventType? valueOf($core.int value) => _byValue[value];

  const RecommendationEventType._($core.int v, $core.String n) : super(v, n);
}

const _omitEnumNames = $core.bool.fromEnvironment('protobuf.omit_enum_names');
