//
//  Generated code. Do not modify.
//  source: appgateway/v1/app_gateway.proto
//
// @dart = 2.12

// ignore_for_file: annotate_overrides, camel_case_types, comment_references
// ignore_for_file: constant_identifier_names, library_prefixes
// ignore_for_file: non_constant_identifier_names, prefer_final_fields
// ignore_for_file: unnecessary_import, unnecessary_this, unused_import

import 'dart:convert' as $convert;
import 'dart:core' as $core;
import 'dart:typed_data' as $typed_data;

@$core.Deprecated('Use chatbotMessageRoleDescriptor instead')
const ChatbotMessageRole$json = {
  '1': 'ChatbotMessageRole',
  '2': [
    {'1': 'CHATBOT_MESSAGE_ROLE_UNSPECIFIED', '2': 0},
    {'1': 'CHATBOT_MESSAGE_ROLE_USER', '2': 1},
    {'1': 'CHATBOT_MESSAGE_ROLE_ASSISTANT', '2': 2},
    {'1': 'CHATBOT_MESSAGE_ROLE_SYSTEM', '2': 3},
  ],
};

/// Descriptor for `ChatbotMessageRole`. Decode as a `google.protobuf.EnumDescriptorProto`.
final $typed_data.Uint8List chatbotMessageRoleDescriptor = $convert.base64Decode(
    'ChJDaGF0Ym90TWVzc2FnZVJvbGUSJAogQ0hBVEJPVF9NRVNTQUdFX1JPTEVfVU5TUEVDSUZJRU'
    'QQABIdChlDSEFUQk9UX01FU1NBR0VfUk9MRV9VU0VSEAESIgoeQ0hBVEJPVF9NRVNTQUdFX1JP'
    'TEVfQVNTSVNUQU5UEAISHwobQ0hBVEJPVF9NRVNTQUdFX1JPTEVfU1lTVEVNEAM=');

@$core.Deprecated('Use chatbotFeedbackTypeDescriptor instead')
const ChatbotFeedbackType$json = {
  '1': 'ChatbotFeedbackType',
  '2': [
    {'1': 'CHATBOT_FEEDBACK_TYPE_UNSPECIFIED', '2': 0},
    {'1': 'CHATBOT_FEEDBACK_TYPE_HELPFUL', '2': 1},
    {'1': 'CHATBOT_FEEDBACK_TYPE_NOT_HELPFUL', '2': 2},
    {'1': 'CHATBOT_FEEDBACK_TYPE_DISMISS', '2': 3},
    {'1': 'CHATBOT_FEEDBACK_TYPE_COPY', '2': 4},
    {'1': 'CHATBOT_FEEDBACK_TYPE_REPORT', '2': 5},
  ],
};

/// Descriptor for `ChatbotFeedbackType`. Decode as a `google.protobuf.EnumDescriptorProto`.
final $typed_data.Uint8List chatbotFeedbackTypeDescriptor = $convert.base64Decode(
    'ChNDaGF0Ym90RmVlZGJhY2tUeXBlEiUKIUNIQVRCT1RfRkVFREJBQ0tfVFlQRV9VTlNQRUNJRk'
    'lFRBAAEiEKHUNIQVRCT1RfRkVFREJBQ0tfVFlQRV9IRUxQRlVMEAESJQohQ0hBVEJPVF9GRUVE'
    'QkFDS19UWVBFX05PVF9IRUxQRlVMEAISIQodQ0hBVEJPVF9GRUVEQkFDS19UWVBFX0RJU01JU1'
    'MQAxIeChpDSEFUQk9UX0ZFRURCQUNLX1RZUEVfQ09QWRAEEiAKHENIQVRCT1RfRkVFREJBQ0tf'
    'VFlQRV9SRVBPUlQQBQ==');

@$core.Deprecated('Use recommendationProfileStatusDescriptor instead')
const RecommendationProfileStatus$json = {
  '1': 'RecommendationProfileStatus',
  '2': [
    {'1': 'RECOMMENDATION_PROFILE_STATUS_UNSPECIFIED', '2': 0},
    {'1': 'RECOMMENDATION_PROFILE_STATUS_MISSING', '2': 1},
    {'1': 'RECOMMENDATION_PROFILE_STATUS_PENDING', '2': 2},
    {'1': 'RECOMMENDATION_PROFILE_STATUS_ACTIVE', '2': 3},
    {'1': 'RECOMMENDATION_PROFILE_STATUS_STALE', '2': 4},
    {'1': 'RECOMMENDATION_PROFILE_STATUS_FAILED', '2': 5},
  ],
};

/// Descriptor for `RecommendationProfileStatus`. Decode as a `google.protobuf.EnumDescriptorProto`.
final $typed_data.Uint8List recommendationProfileStatusDescriptor = $convert.base64Decode(
    'ChtSZWNvbW1lbmRhdGlvblByb2ZpbGVTdGF0dXMSLQopUkVDT01NRU5EQVRJT05fUFJPRklMRV'
    '9TVEFUVVNfVU5TUEVDSUZJRUQQABIpCiVSRUNPTU1FTkRBVElPTl9QUk9GSUxFX1NUQVRVU19N'
    'SVNTSU5HEAESKQolUkVDT01NRU5EQVRJT05fUFJPRklMRV9TVEFUVVNfUEVORElORxACEigKJF'
    'JFQ09NTUVOREFUSU9OX1BST0ZJTEVfU1RBVFVTX0FDVElWRRADEicKI1JFQ09NTUVOREFUSU9O'
    'X1BST0ZJTEVfU1RBVFVTX1NUQUxFEAQSKAokUkVDT01NRU5EQVRJT05fUFJPRklMRV9TVEFUVV'
    'NfRkFJTEVEEAU=');

@$core.Deprecated('Use screenContextDescriptor instead')
const ScreenContext$json = {
  '1': 'ScreenContext',
  '2': [
    {'1': 'SCREEN_CONTEXT_UNSPECIFIED', '2': 0},
    {'1': 'SCREEN_CONTEXT_HOME', '2': 1},
    {'1': 'SCREEN_CONTEXT_BOARD', '2': 2},
    {'1': 'SCREEN_CONTEXT_MAP', '2': 3},
    {'1': 'SCREEN_CONTEXT_CHAT', '2': 4},
  ],
};

/// Descriptor for `ScreenContext`. Decode as a `google.protobuf.EnumDescriptorProto`.
final $typed_data.Uint8List screenContextDescriptor = $convert.base64Decode(
    'Cg1TY3JlZW5Db250ZXh0Eh4KGlNDUkVFTl9DT05URVhUX1VOU1BFQ0lGSUVEEAASFwoTU0NSRU'
    'VOX0NPTlRFWFRfSE9NRRABEhgKFFNDUkVFTl9DT05URVhUX0JPQVJEEAISFgoSU0NSRUVOX0NP'
    'TlRFWFRfTUFQEAMSFwoTU0NSRUVOX0NPTlRFWFRfQ0hBVBAE');

@$core.Deprecated('Use budgetModeDescriptor instead')
const BudgetMode$json = {
  '1': 'BudgetMode',
  '2': [
    {'1': 'BUDGET_MODE_UNSPECIFIED', '2': 0},
    {'1': 'BUDGET_MODE_SOFT', '2': 1},
    {'1': 'BUDGET_MODE_STRICT', '2': 2},
  ],
};

/// Descriptor for `BudgetMode`. Decode as a `google.protobuf.EnumDescriptorProto`.
final $typed_data.Uint8List budgetModeDescriptor = $convert.base64Decode(
    'CgpCdWRnZXRNb2RlEhsKF0JVREdFVF9NT0RFX1VOU1BFQ0lGSUVEEAASFAoQQlVER0VUX01PRE'
    'VfU09GVBABEhYKEkJVREdFVF9NT0RFX1NUUklDVBAC');

@$core.Deprecated('Use beverageDiversityModeDescriptor instead')
const BeverageDiversityMode$json = {
  '1': 'BeverageDiversityMode',
  '2': [
    {'1': 'BEVERAGE_DIVERSITY_MODE_UNSPECIFIED', '2': 0},
    {'1': 'BEVERAGE_DIVERSITY_MODE_STANDARD', '2': 1},
    {'1': 'BEVERAGE_DIVERSITY_MODE_DIFFERENT', '2': 2},
    {'1': 'BEVERAGE_DIVERSITY_MODE_ADJACENT', '2': 3},
  ],
};

/// Descriptor for `BeverageDiversityMode`. Decode as a `google.protobuf.EnumDescriptorProto`.
final $typed_data.Uint8List beverageDiversityModeDescriptor = $convert.base64Decode(
    'ChVCZXZlcmFnZURpdmVyc2l0eU1vZGUSJwojQkVWRVJBR0VfRElWRVJTSVRZX01PREVfVU5TUE'
    'VDSUZJRUQQABIkCiBCRVZFUkFHRV9ESVZFUlNJVFlfTU9ERV9TVEFOREFSRBABEiUKIUJFVkVS'
    'QUdFX0RJVkVSU0lUWV9NT0RFX0RJRkZFUkVOVBACEiQKIEJFVkVSQUdFX0RJVkVSU0lUWV9NT0'
    'RFX0FESkFDRU5UEAM=');

@$core.Deprecated('Use recommendationEventTypeDescriptor instead')
const RecommendationEventType$json = {
  '1': 'RecommendationEventType',
  '2': [
    {'1': 'RECOMMENDATION_EVENT_TYPE_UNSPECIFIED', '2': 0},
    {'1': 'RECOMMENDATION_EVENT_TYPE_IMPRESSION', '2': 1},
    {'1': 'RECOMMENDATION_EVENT_TYPE_CLICK', '2': 2},
    {'1': 'RECOMMENDATION_EVENT_TYPE_SAVE', '2': 3},
    {'1': 'RECOMMENDATION_EVENT_TYPE_DISMISS', '2': 4},
    {'1': 'RECOMMENDATION_EVENT_TYPE_DETAIL_VIEW', '2': 5},
  ],
};

/// Descriptor for `RecommendationEventType`. Decode as a `google.protobuf.EnumDescriptorProto`.
final $typed_data.Uint8List recommendationEventTypeDescriptor = $convert.base64Decode(
    'ChdSZWNvbW1lbmRhdGlvbkV2ZW50VHlwZRIpCiVSRUNPTU1FTkRBVElPTl9FVkVOVF9UWVBFX1'
    'VOU1BFQ0lGSUVEEAASKAokUkVDT01NRU5EQVRJT05fRVZFTlRfVFlQRV9JTVBSRVNTSU9OEAES'
    'IwofUkVDT01NRU5EQVRJT05fRVZFTlRfVFlQRV9DTElDSxACEiIKHlJFQ09NTUVOREFUSU9OX0'
    'VWRU5UX1RZUEVfU0FWRRADEiUKIVJFQ09NTUVOREFUSU9OX0VWRU5UX1RZUEVfRElTTUlTUxAE'
    'EikKJVJFQ09NTUVOREFUSU9OX0VWRU5UX1RZUEVfREVUQUlMX1ZJRVcQBQ==');

@$core.Deprecated('Use getMeRequestDescriptor instead')
const GetMeRequest$json = {
  '1': 'GetMeRequest',
};

/// Descriptor for `GetMeRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List getMeRequestDescriptor =
    $convert.base64Decode('CgxHZXRNZVJlcXVlc3Q=');

@$core.Deprecated('Use getMeResponseDescriptor instead')
const GetMeResponse$json = {
  '1': 'GetMeResponse',
  '2': [
    {'1': 'user_id', '3': 1, '4': 1, '5': 9, '10': 'userId'},
    {'1': 'display_name', '3': 2, '4': 1, '5': 9, '10': 'displayName'},
    {'1': 'email', '3': 3, '4': 1, '5': 9, '10': 'email'},
    {'1': 'authenticated', '3': 4, '4': 1, '5': 8, '10': 'authenticated'},
    {
      '1': 'claims',
      '3': 20,
      '4': 1,
      '5': 11,
      '6': '.google.protobuf.Struct',
      '10': 'claims'
    },
  ],
};

/// Descriptor for `GetMeResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List getMeResponseDescriptor = $convert.base64Decode(
    'Cg1HZXRNZVJlc3BvbnNlEhcKB3VzZXJfaWQYASABKAlSBnVzZXJJZBIhCgxkaXNwbGF5X25hbW'
    'UYAiABKAlSC2Rpc3BsYXlOYW1lEhQKBWVtYWlsGAMgASgJUgVlbWFpbBIkCg1hdXRoZW50aWNh'
    'dGVkGAQgASgIUg1hdXRoZW50aWNhdGVkEi8KBmNsYWltcxgUIAEoCzIXLmdvb2dsZS5wcm90b2'
    'J1Zi5TdHJ1Y3RSBmNsYWltcw==');

@$core.Deprecated('Use sendChatbotMessageRequestDescriptor instead')
const SendChatbotMessageRequest$json = {
  '1': 'SendChatbotMessageRequest',
  '2': [
    {'1': 'client_message_id', '3': 1, '4': 1, '5': 9, '10': 'clientMessageId'},
    {'1': 'conversation_id', '3': 2, '4': 1, '5': 9, '10': 'conversationId'},
    {'1': 'message', '3': 3, '4': 1, '5': 9, '10': 'message'},
    {
      '1': 'screen_context',
      '3': 4,
      '4': 1,
      '5': 14,
      '6': '.ontheblock.appgateway.v1.ScreenContext',
      '10': 'screenContext'
    },
    {'1': 'lat', '3': 5, '4': 1, '5': 1, '9': 0, '10': 'lat', '17': true},
    {'1': 'lng', '3': 6, '4': 1, '5': 1, '9': 1, '10': 'lng', '17': true},
    {'1': 'radius_m', '3': 7, '4': 1, '5': 5, '10': 'radiusM'},
    {
      '1': 'selected_beverage_id',
      '3': 8,
      '4': 1,
      '5': 9,
      '10': 'selectedBeverageId'
    },
    {'1': 'category', '3': 9, '4': 1, '5': 9, '10': 'category'},
    {'1': 'beverage_limit', '3': 10, '4': 1, '5': 5, '10': 'beverageLimit'},
    {'1': 'venue_limit', '3': 11, '4': 1, '5': 5, '10': 'venueLimit'},
    {
      '1': 'budget_mode',
      '3': 12,
      '4': 1,
      '5': 14,
      '6': '.ontheblock.appgateway.v1.BudgetMode',
      '10': 'budgetMode'
    },
    {
      '1': 'client_context',
      '3': 13,
      '4': 1,
      '5': 11,
      '6': '.google.protobuf.Struct',
      '10': 'clientContext'
    },
  ],
  '8': [
    {'1': '_lat'},
    {'1': '_lng'},
  ],
};

/// Descriptor for `SendChatbotMessageRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List sendChatbotMessageRequestDescriptor = $convert.base64Decode(
    'ChlTZW5kQ2hhdGJvdE1lc3NhZ2VSZXF1ZXN0EioKEWNsaWVudF9tZXNzYWdlX2lkGAEgASgJUg'
    '9jbGllbnRNZXNzYWdlSWQSJwoPY29udmVyc2F0aW9uX2lkGAIgASgJUg5jb252ZXJzYXRpb25J'
    'ZBIYCgdtZXNzYWdlGAMgASgJUgdtZXNzYWdlEk4KDnNjcmVlbl9jb250ZXh0GAQgASgOMicub2'
    '50aGVibG9jay5hcHBnYXRld2F5LnYxLlNjcmVlbkNvbnRleHRSDXNjcmVlbkNvbnRleHQSFQoD'
    'bGF0GAUgASgBSABSA2xhdIgBARIVCgNsbmcYBiABKAFIAVIDbG5niAEBEhkKCHJhZGl1c19tGA'
    'cgASgFUgdyYWRpdXNNEjAKFHNlbGVjdGVkX2JldmVyYWdlX2lkGAggASgJUhJzZWxlY3RlZEJl'
    'dmVyYWdlSWQSGgoIY2F0ZWdvcnkYCSABKAlSCGNhdGVnb3J5EiUKDmJldmVyYWdlX2xpbWl0GA'
    'ogASgFUg1iZXZlcmFnZUxpbWl0Eh8KC3ZlbnVlX2xpbWl0GAsgASgFUgp2ZW51ZUxpbWl0EkUK'
    'C2J1ZGdldF9tb2RlGAwgASgOMiQub250aGVibG9jay5hcHBnYXRld2F5LnYxLkJ1ZGdldE1vZG'
    'VSCmJ1ZGdldE1vZGUSPgoOY2xpZW50X2NvbnRleHQYDSABKAsyFy5nb29nbGUucHJvdG9idWYu'
    'U3RydWN0Ug1jbGllbnRDb250ZXh0QgYKBF9sYXRCBgoEX2xuZw==');

@$core.Deprecated('Use sendChatbotMessageResponseDescriptor instead')
const SendChatbotMessageResponse$json = {
  '1': 'SendChatbotMessageResponse',
  '2': [
    {'1': 'conversation_id', '3': 1, '4': 1, '5': 9, '10': 'conversationId'},
    {
      '1': 'assistant_message_id',
      '3': 2,
      '4': 1,
      '5': 9,
      '10': 'assistantMessageId'
    },
    {'1': 'message', '3': 3, '4': 1, '5': 9, '10': 'message'},
    {
      '1': 'recommendation_refs',
      '3': 4,
      '4': 3,
      '5': 11,
      '6': '.ontheblock.appgateway.v1.RecommendationReference',
      '10': 'recommendationRefs'
    },
    {
      '1': 'venue_refs',
      '3': 5,
      '4': 3,
      '5': 11,
      '6': '.ontheblock.appgateway.v1.VenueReference',
      '10': 'venueRefs'
    },
    {'1': 'fallback_reason', '3': 6, '4': 1, '5': 9, '10': 'fallbackReason'},
    {
      '1': 'service_payload',
      '3': 20,
      '4': 1,
      '5': 11,
      '6': '.google.protobuf.Struct',
      '10': 'servicePayload'
    },
  ],
};

/// Descriptor for `SendChatbotMessageResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List sendChatbotMessageResponseDescriptor = $convert.base64Decode(
    'ChpTZW5kQ2hhdGJvdE1lc3NhZ2VSZXNwb25zZRInCg9jb252ZXJzYXRpb25faWQYASABKAlSDm'
    'NvbnZlcnNhdGlvbklkEjAKFGFzc2lzdGFudF9tZXNzYWdlX2lkGAIgASgJUhJhc3Npc3RhbnRN'
    'ZXNzYWdlSWQSGAoHbWVzc2FnZRgDIAEoCVIHbWVzc2FnZRJiChNyZWNvbW1lbmRhdGlvbl9yZW'
    'ZzGAQgAygLMjEub250aGVibG9jay5hcHBnYXRld2F5LnYxLlJlY29tbWVuZGF0aW9uUmVmZXJl'
    'bmNlUhJyZWNvbW1lbmRhdGlvblJlZnMSRwoKdmVudWVfcmVmcxgFIAMoCzIoLm9udGhlYmxvY2'
    'suYXBwZ2F0ZXdheS52MS5WZW51ZVJlZmVyZW5jZVIJdmVudWVSZWZzEicKD2ZhbGxiYWNrX3Jl'
    'YXNvbhgGIAEoCVIOZmFsbGJhY2tSZWFzb24SQAoPc2VydmljZV9wYXlsb2FkGBQgASgLMhcuZ2'
    '9vZ2xlLnByb3RvYnVmLlN0cnVjdFIOc2VydmljZVBheWxvYWQ=');

@$core.Deprecated('Use getChatbotConversationRequestDescriptor instead')
const GetChatbotConversationRequest$json = {
  '1': 'GetChatbotConversationRequest',
  '2': [
    {'1': 'conversation_id', '3': 1, '4': 1, '5': 9, '10': 'conversationId'},
    {'1': 'page_size', '3': 2, '4': 1, '5': 5, '10': 'pageSize'},
    {'1': 'page_token', '3': 3, '4': 1, '5': 9, '10': 'pageToken'},
  ],
};

/// Descriptor for `GetChatbotConversationRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List getChatbotConversationRequestDescriptor =
    $convert.base64Decode(
        'Ch1HZXRDaGF0Ym90Q29udmVyc2F0aW9uUmVxdWVzdBInCg9jb252ZXJzYXRpb25faWQYASABKA'
        'lSDmNvbnZlcnNhdGlvbklkEhsKCXBhZ2Vfc2l6ZRgCIAEoBVIIcGFnZVNpemUSHQoKcGFnZV90'
        'b2tlbhgDIAEoCVIJcGFnZVRva2Vu');

@$core.Deprecated('Use getChatbotConversationResponseDescriptor instead')
const GetChatbotConversationResponse$json = {
  '1': 'GetChatbotConversationResponse',
  '2': [
    {'1': 'conversation_id', '3': 1, '4': 1, '5': 9, '10': 'conversationId'},
    {
      '1': 'messages',
      '3': 2,
      '4': 3,
      '5': 11,
      '6': '.ontheblock.appgateway.v1.ChatbotConversationMessage',
      '10': 'messages'
    },
    {'1': 'next_page_token', '3': 3, '4': 1, '5': 9, '10': 'nextPageToken'},
  ],
};

/// Descriptor for `GetChatbotConversationResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List getChatbotConversationResponseDescriptor =
    $convert.base64Decode(
        'Ch5HZXRDaGF0Ym90Q29udmVyc2F0aW9uUmVzcG9uc2USJwoPY29udmVyc2F0aW9uX2lkGAEgAS'
        'gJUg5jb252ZXJzYXRpb25JZBJQCghtZXNzYWdlcxgCIAMoCzI0Lm9udGhlYmxvY2suYXBwZ2F0'
        'ZXdheS52MS5DaGF0Ym90Q29udmVyc2F0aW9uTWVzc2FnZVIIbWVzc2FnZXMSJgoPbmV4dF9wYW'
        'dlX3Rva2VuGAMgASgJUg1uZXh0UGFnZVRva2Vu');

@$core.Deprecated('Use recordChatbotFeedbackRequestDescriptor instead')
const RecordChatbotFeedbackRequest$json = {
  '1': 'RecordChatbotFeedbackRequest',
  '2': [
    {'1': 'idempotency_key', '3': 1, '4': 1, '5': 9, '10': 'idempotencyKey'},
    {'1': 'conversation_id', '3': 2, '4': 1, '5': 9, '10': 'conversationId'},
    {'1': 'message_id', '3': 3, '4': 1, '5': 9, '10': 'messageId'},
    {
      '1': 'feedback_type',
      '3': 4,
      '4': 1,
      '5': 14,
      '6': '.ontheblock.appgateway.v1.ChatbotFeedbackType',
      '10': 'feedbackType'
    },
    {'1': 'comment', '3': 5, '4': 1, '5': 9, '10': 'comment'},
    {
      '1': 'client_context',
      '3': 20,
      '4': 1,
      '5': 11,
      '6': '.google.protobuf.Struct',
      '10': 'clientContext'
    },
  ],
};

/// Descriptor for `RecordChatbotFeedbackRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List recordChatbotFeedbackRequestDescriptor = $convert.base64Decode(
    'ChxSZWNvcmRDaGF0Ym90RmVlZGJhY2tSZXF1ZXN0EicKD2lkZW1wb3RlbmN5X2tleRgBIAEoCV'
    'IOaWRlbXBvdGVuY3lLZXkSJwoPY29udmVyc2F0aW9uX2lkGAIgASgJUg5jb252ZXJzYXRpb25J'
    'ZBIdCgptZXNzYWdlX2lkGAMgASgJUgltZXNzYWdlSWQSUgoNZmVlZGJhY2tfdHlwZRgEIAEoDj'
    'ItLm9udGhlYmxvY2suYXBwZ2F0ZXdheS52MS5DaGF0Ym90RmVlZGJhY2tUeXBlUgxmZWVkYmFj'
    'a1R5cGUSGAoHY29tbWVudBgFIAEoCVIHY29tbWVudBI+Cg5jbGllbnRfY29udGV4dBgUIAEoCz'
    'IXLmdvb2dsZS5wcm90b2J1Zi5TdHJ1Y3RSDWNsaWVudENvbnRleHQ=');

@$core.Deprecated('Use recordChatbotFeedbackResponseDescriptor instead')
const RecordChatbotFeedbackResponse$json = {
  '1': 'RecordChatbotFeedbackResponse',
  '2': [
    {'1': 'accepted', '3': 1, '4': 1, '5': 8, '10': 'accepted'},
    {'1': 'feedback_id', '3': 2, '4': 1, '5': 9, '10': 'feedbackId'},
  ],
};

/// Descriptor for `RecordChatbotFeedbackResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List recordChatbotFeedbackResponseDescriptor =
    $convert.base64Decode(
        'Ch1SZWNvcmRDaGF0Ym90RmVlZGJhY2tSZXNwb25zZRIaCghhY2NlcHRlZBgBIAEoCFIIYWNjZX'
        'B0ZWQSHwoLZmVlZGJhY2tfaWQYAiABKAlSCmZlZWRiYWNrSWQ=');

@$core.Deprecated('Use getRecommendationProfileStatusRequestDescriptor instead')
const GetRecommendationProfileStatusRequest$json = {
  '1': 'GetRecommendationProfileStatusRequest',
};

/// Descriptor for `GetRecommendationProfileStatusRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List getRecommendationProfileStatusRequestDescriptor =
    $convert
        .base64Decode('CiVHZXRSZWNvbW1lbmRhdGlvblByb2ZpbGVTdGF0dXNSZXF1ZXN0');

@$core
    .Deprecated('Use getRecommendationProfileStatusResponseDescriptor instead')
const GetRecommendationProfileStatusResponse$json = {
  '1': 'GetRecommendationProfileStatusResponse',
  '2': [
    {
      '1': 'status',
      '3': 1,
      '4': 1,
      '5': 14,
      '6': '.ontheblock.appgateway.v1.RecommendationProfileStatus',
      '10': 'status'
    },
    {'1': 'status_message', '3': 2, '4': 1, '5': 9, '10': 'statusMessage'},
    {
      '1': 'updated_at',
      '3': 3,
      '4': 1,
      '5': 11,
      '6': '.google.protobuf.Timestamp',
      '10': 'updatedAt'
    },
    {
      '1': 'service_payload',
      '3': 20,
      '4': 1,
      '5': 11,
      '6': '.google.protobuf.Struct',
      '10': 'servicePayload'
    },
  ],
};

/// Descriptor for `GetRecommendationProfileStatusResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List getRecommendationProfileStatusResponseDescriptor =
    $convert.base64Decode(
        'CiZHZXRSZWNvbW1lbmRhdGlvblByb2ZpbGVTdGF0dXNSZXNwb25zZRJNCgZzdGF0dXMYASABKA'
        '4yNS5vbnRoZWJsb2NrLmFwcGdhdGV3YXkudjEuUmVjb21tZW5kYXRpb25Qcm9maWxlU3RhdHVz'
        'UgZzdGF0dXMSJQoOc3RhdHVzX21lc3NhZ2UYAiABKAlSDXN0YXR1c01lc3NhZ2USOQoKdXBkYX'
        'RlZF9hdBgDIAEoCzIaLmdvb2dsZS5wcm90b2J1Zi5UaW1lc3RhbXBSCXVwZGF0ZWRBdBJACg9z'
        'ZXJ2aWNlX3BheWxvYWQYFCABKAsyFy5nb29nbGUucHJvdG9idWYuU3RydWN0Ug5zZXJ2aWNlUG'
        'F5bG9hZA==');

@$core.Deprecated('Use getBeverageRecommendationsRequestDescriptor instead')
const GetBeverageRecommendationsRequest$json = {
  '1': 'GetBeverageRecommendationsRequest',
  '2': [
    {'1': 'limit', '3': 1, '4': 1, '5': 5, '10': 'limit'},
    {'1': 'page_token', '3': 2, '4': 1, '5': 9, '10': 'pageToken'},
    {
      '1': 'screen_context',
      '3': 3,
      '4': 1,
      '5': 11,
      '6': '.google.protobuf.Struct',
      '10': 'screenContext'
    },
    {'1': 'category', '3': 4, '4': 1, '5': 9, '10': 'category'},
    {
      '1': 'budget_mode',
      '3': 5,
      '4': 1,
      '5': 14,
      '6': '.ontheblock.appgateway.v1.BudgetMode',
      '10': 'budgetMode'
    },
    {
      '1': 'exclude_beverage_ids',
      '3': 6,
      '4': 3,
      '5': 9,
      '10': 'excludeBeverageIds'
    },
    {
      '1': 'exclude_result_ids',
      '3': 7,
      '4': 3,
      '5': 9,
      '10': 'excludeResultIds'
    },
    {
      '1': 'diversity_mode',
      '3': 8,
      '4': 1,
      '5': 14,
      '6': '.ontheblock.appgateway.v1.BeverageDiversityMode',
      '10': 'diversityMode'
    },
    {
      '1': 'client_context',
      '3': 20,
      '4': 1,
      '5': 11,
      '6': '.google.protobuf.Struct',
      '10': 'clientContext'
    },
  ],
};

/// Descriptor for `GetBeverageRecommendationsRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List getBeverageRecommendationsRequestDescriptor = $convert.base64Decode(
    'CiFHZXRCZXZlcmFnZVJlY29tbWVuZGF0aW9uc1JlcXVlc3QSFAoFbGltaXQYASABKAVSBWxpbW'
    'l0Eh0KCnBhZ2VfdG9rZW4YAiABKAlSCXBhZ2VUb2tlbhI+Cg5zY3JlZW5fY29udGV4dBgDIAEo'
    'CzIXLmdvb2dsZS5wcm90b2J1Zi5TdHJ1Y3RSDXNjcmVlbkNvbnRleHQSGgoIY2F0ZWdvcnkYBC'
    'ABKAlSCGNhdGVnb3J5EkUKC2J1ZGdldF9tb2RlGAUgASgOMiQub250aGVibG9jay5hcHBnYXRl'
    'd2F5LnYxLkJ1ZGdldE1vZGVSCmJ1ZGdldE1vZGUSMAoUZXhjbHVkZV9iZXZlcmFnZV9pZHMYBi'
    'ADKAlSEmV4Y2x1ZGVCZXZlcmFnZUlkcxIsChJleGNsdWRlX3Jlc3VsdF9pZHMYByADKAlSEGV4'
    'Y2x1ZGVSZXN1bHRJZHMSVgoOZGl2ZXJzaXR5X21vZGUYCCABKA4yLy5vbnRoZWJsb2NrLmFwcG'
    'dhdGV3YXkudjEuQmV2ZXJhZ2VEaXZlcnNpdHlNb2RlUg1kaXZlcnNpdHlNb2RlEj4KDmNsaWVu'
    'dF9jb250ZXh0GBQgASgLMhcuZ29vZ2xlLnByb3RvYnVmLlN0cnVjdFINY2xpZW50Q29udGV4dA'
    '==');

@$core.Deprecated('Use getBeverageRecommendationsResponseDescriptor instead')
const GetBeverageRecommendationsResponse$json = {
  '1': 'GetBeverageRecommendationsResponse',
  '2': [
    {
      '1': 'recommendations',
      '3': 1,
      '4': 3,
      '5': 11,
      '6': '.ontheblock.appgateway.v1.BeverageRecommendation',
      '10': 'recommendations'
    },
    {'1': 'next_page_token', '3': 2, '4': 1, '5': 9, '10': 'nextPageToken'},
    {
      '1': 'generated_at',
      '3': 3,
      '4': 1,
      '5': 11,
      '6': '.google.protobuf.Timestamp',
      '10': 'generatedAt'
    },
    {
      '1': 'service_payload',
      '3': 20,
      '4': 1,
      '5': 11,
      '6': '.google.protobuf.Struct',
      '10': 'servicePayload'
    },
  ],
};

/// Descriptor for `GetBeverageRecommendationsResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List getBeverageRecommendationsResponseDescriptor = $convert.base64Decode(
    'CiJHZXRCZXZlcmFnZVJlY29tbWVuZGF0aW9uc1Jlc3BvbnNlEloKD3JlY29tbWVuZGF0aW9ucx'
    'gBIAMoCzIwLm9udGhlYmxvY2suYXBwZ2F0ZXdheS52MS5CZXZlcmFnZVJlY29tbWVuZGF0aW9u'
    'Ug9yZWNvbW1lbmRhdGlvbnMSJgoPbmV4dF9wYWdlX3Rva2VuGAIgASgJUg1uZXh0UGFnZVRva2'
    'VuEj0KDGdlbmVyYXRlZF9hdBgDIAEoCzIaLmdvb2dsZS5wcm90b2J1Zi5UaW1lc3RhbXBSC2dl'
    'bmVyYXRlZEF0EkAKD3NlcnZpY2VfcGF5bG9hZBgUIAEoCzIXLmdvb2dsZS5wcm90b2J1Zi5TdH'
    'J1Y3RSDnNlcnZpY2VQYXlsb2Fk');

@$core.Deprecated('Use getVenueRecommendationsRequestDescriptor instead')
const GetVenueRecommendationsRequest$json = {
  '1': 'GetVenueRecommendationsRequest',
  '2': [
    {'1': 'lat', '3': 1, '4': 1, '5': 1, '9': 0, '10': 'lat', '17': true},
    {'1': 'lng', '3': 2, '4': 1, '5': 1, '9': 1, '10': 'lng', '17': true},
    {'1': 'radius_m', '3': 3, '4': 1, '5': 5, '10': 'radiusM'},
    {
      '1': 'selected_beverage_id',
      '3': 4,
      '4': 1,
      '5': 9,
      '10': 'selectedBeverageId'
    },
    {'1': 'category', '3': 5, '4': 1, '5': 9, '10': 'category'},
    {'1': 'limit', '3': 6, '4': 1, '5': 5, '10': 'limit'},
    {'1': 'page_token', '3': 7, '4': 1, '5': 9, '10': 'pageToken'},
    {
      '1': 'screen_context',
      '3': 8,
      '4': 1,
      '5': 11,
      '6': '.google.protobuf.Struct',
      '10': 'screenContext'
    },
    {
      '1': 'budget_mode',
      '3': 9,
      '4': 1,
      '5': 14,
      '6': '.ontheblock.appgateway.v1.BudgetMode',
      '10': 'budgetMode'
    },
    {
      '1': 'client_context',
      '3': 20,
      '4': 1,
      '5': 11,
      '6': '.google.protobuf.Struct',
      '10': 'clientContext'
    },
  ],
  '8': [
    {'1': '_lat'},
    {'1': '_lng'},
  ],
};

/// Descriptor for `GetVenueRecommendationsRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List getVenueRecommendationsRequestDescriptor = $convert.base64Decode(
    'Ch5HZXRWZW51ZVJlY29tbWVuZGF0aW9uc1JlcXVlc3QSFQoDbGF0GAEgASgBSABSA2xhdIgBAR'
    'IVCgNsbmcYAiABKAFIAVIDbG5niAEBEhkKCHJhZGl1c19tGAMgASgFUgdyYWRpdXNNEjAKFHNl'
    'bGVjdGVkX2JldmVyYWdlX2lkGAQgASgJUhJzZWxlY3RlZEJldmVyYWdlSWQSGgoIY2F0ZWdvcn'
    'kYBSABKAlSCGNhdGVnb3J5EhQKBWxpbWl0GAYgASgFUgVsaW1pdBIdCgpwYWdlX3Rva2VuGAcg'
    'ASgJUglwYWdlVG9rZW4SPgoOc2NyZWVuX2NvbnRleHQYCCABKAsyFy5nb29nbGUucHJvdG9idW'
    'YuU3RydWN0Ug1zY3JlZW5Db250ZXh0EkUKC2J1ZGdldF9tb2RlGAkgASgOMiQub250aGVibG9j'
    'ay5hcHBnYXRld2F5LnYxLkJ1ZGdldE1vZGVSCmJ1ZGdldE1vZGUSPgoOY2xpZW50X2NvbnRleH'
    'QYFCABKAsyFy5nb29nbGUucHJvdG9idWYuU3RydWN0Ug1jbGllbnRDb250ZXh0QgYKBF9sYXRC'
    'BgoEX2xuZw==');

@$core.Deprecated('Use getVenueRecommendationsResponseDescriptor instead')
const GetVenueRecommendationsResponse$json = {
  '1': 'GetVenueRecommendationsResponse',
  '2': [
    {
      '1': 'recommendations',
      '3': 1,
      '4': 3,
      '5': 11,
      '6': '.ontheblock.appgateway.v1.VenueRecommendation',
      '10': 'recommendations'
    },
    {'1': 'next_page_token', '3': 2, '4': 1, '5': 9, '10': 'nextPageToken'},
    {
      '1': 'generated_at',
      '3': 3,
      '4': 1,
      '5': 11,
      '6': '.google.protobuf.Timestamp',
      '10': 'generatedAt'
    },
    {
      '1': 'service_payload',
      '3': 20,
      '4': 1,
      '5': 11,
      '6': '.google.protobuf.Struct',
      '10': 'servicePayload'
    },
  ],
};

/// Descriptor for `GetVenueRecommendationsResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List getVenueRecommendationsResponseDescriptor = $convert.base64Decode(
    'Ch9HZXRWZW51ZVJlY29tbWVuZGF0aW9uc1Jlc3BvbnNlElcKD3JlY29tbWVuZGF0aW9ucxgBIA'
    'MoCzItLm9udGhlYmxvY2suYXBwZ2F0ZXdheS52MS5WZW51ZVJlY29tbWVuZGF0aW9uUg9yZWNv'
    'bW1lbmRhdGlvbnMSJgoPbmV4dF9wYWdlX3Rva2VuGAIgASgJUg1uZXh0UGFnZVRva2VuEj0KDG'
    'dlbmVyYXRlZF9hdBgDIAEoCzIaLmdvb2dsZS5wcm90b2J1Zi5UaW1lc3RhbXBSC2dlbmVyYXRl'
    'ZEF0EkAKD3NlcnZpY2VfcGF5bG9hZBgUIAEoCzIXLmdvb2dsZS5wcm90b2J1Zi5TdHJ1Y3RSDn'
    'NlcnZpY2VQYXlsb2Fk');

@$core.Deprecated('Use recordRecommendationEventRequestDescriptor instead')
const RecordRecommendationEventRequest$json = {
  '1': 'RecordRecommendationEventRequest',
  '2': [
    {'1': 'idempotency_key', '3': 1, '4': 1, '5': 9, '10': 'idempotencyKey'},
    {
      '1': 'event_type',
      '3': 2,
      '4': 1,
      '5': 14,
      '6': '.ontheblock.appgateway.v1.RecommendationEventType',
      '10': 'eventType'
    },
    {'1': 'request_id', '3': 3, '4': 1, '5': 9, '10': 'requestId'},
    {'1': 'result_id', '3': 4, '4': 1, '5': 9, '10': 'resultId'},
    {'1': 'beverage_id', '3': 5, '4': 1, '5': 9, '10': 'beverageId'},
    {'1': 'venue_id', '3': 6, '4': 1, '5': 9, '10': 'venueId'},
    {
      '1': 'event_context',
      '3': 7,
      '4': 1,
      '5': 11,
      '6': '.google.protobuf.Struct',
      '10': 'eventContext'
    },
    {
      '1': 'client_context',
      '3': 20,
      '4': 1,
      '5': 11,
      '6': '.google.protobuf.Struct',
      '10': 'clientContext'
    },
  ],
};

/// Descriptor for `RecordRecommendationEventRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List recordRecommendationEventRequestDescriptor = $convert.base64Decode(
    'CiBSZWNvcmRSZWNvbW1lbmRhdGlvbkV2ZW50UmVxdWVzdBInCg9pZGVtcG90ZW5jeV9rZXkYAS'
    'ABKAlSDmlkZW1wb3RlbmN5S2V5ElAKCmV2ZW50X3R5cGUYAiABKA4yMS5vbnRoZWJsb2NrLmFw'
    'cGdhdGV3YXkudjEuUmVjb21tZW5kYXRpb25FdmVudFR5cGVSCWV2ZW50VHlwZRIdCgpyZXF1ZX'
    'N0X2lkGAMgASgJUglyZXF1ZXN0SWQSGwoJcmVzdWx0X2lkGAQgASgJUghyZXN1bHRJZBIfCgti'
    'ZXZlcmFnZV9pZBgFIAEoCVIKYmV2ZXJhZ2VJZBIZCgh2ZW51ZV9pZBgGIAEoCVIHdmVudWVJZB'
    'I8Cg1ldmVudF9jb250ZXh0GAcgASgLMhcuZ29vZ2xlLnByb3RvYnVmLlN0cnVjdFIMZXZlbnRD'
    'b250ZXh0Ej4KDmNsaWVudF9jb250ZXh0GBQgASgLMhcuZ29vZ2xlLnByb3RvYnVmLlN0cnVjdF'
    'INY2xpZW50Q29udGV4dA==');

@$core.Deprecated('Use recordRecommendationEventResponseDescriptor instead')
const RecordRecommendationEventResponse$json = {
  '1': 'RecordRecommendationEventResponse',
  '2': [
    {'1': 'accepted', '3': 1, '4': 1, '5': 8, '10': 'accepted'},
    {'1': 'event_id', '3': 2, '4': 1, '5': 9, '10': 'eventId'},
  ],
};

/// Descriptor for `RecordRecommendationEventResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List recordRecommendationEventResponseDescriptor =
    $convert.base64Decode(
        'CiFSZWNvcmRSZWNvbW1lbmRhdGlvbkV2ZW50UmVzcG9uc2USGgoIYWNjZXB0ZWQYASABKAhSCG'
        'FjY2VwdGVkEhkKCGV2ZW50X2lkGAIgASgJUgdldmVudElk');

@$core.Deprecated('Use chatbotConversationMessageDescriptor instead')
const ChatbotConversationMessage$json = {
  '1': 'ChatbotConversationMessage',
  '2': [
    {'1': 'message_id', '3': 1, '4': 1, '5': 9, '10': 'messageId'},
    {
      '1': 'role',
      '3': 2,
      '4': 1,
      '5': 14,
      '6': '.ontheblock.appgateway.v1.ChatbotMessageRole',
      '10': 'role'
    },
    {'1': 'message', '3': 3, '4': 1, '5': 9, '10': 'message'},
    {
      '1': 'created_at',
      '3': 4,
      '4': 1,
      '5': 11,
      '6': '.google.protobuf.Timestamp',
      '10': 'createdAt'
    },
    {
      '1': 'service_payload',
      '3': 20,
      '4': 1,
      '5': 11,
      '6': '.google.protobuf.Struct',
      '10': 'servicePayload'
    },
  ],
};

/// Descriptor for `ChatbotConversationMessage`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List chatbotConversationMessageDescriptor = $convert.base64Decode(
    'ChpDaGF0Ym90Q29udmVyc2F0aW9uTWVzc2FnZRIdCgptZXNzYWdlX2lkGAEgASgJUgltZXNzYW'
    'dlSWQSQAoEcm9sZRgCIAEoDjIsLm9udGhlYmxvY2suYXBwZ2F0ZXdheS52MS5DaGF0Ym90TWVz'
    'c2FnZVJvbGVSBHJvbGUSGAoHbWVzc2FnZRgDIAEoCVIHbWVzc2FnZRI5CgpjcmVhdGVkX2F0GA'
    'QgASgLMhouZ29vZ2xlLnByb3RvYnVmLlRpbWVzdGFtcFIJY3JlYXRlZEF0EkAKD3NlcnZpY2Vf'
    'cGF5bG9hZBgUIAEoCzIXLmdvb2dsZS5wcm90b2J1Zi5TdHJ1Y3RSDnNlcnZpY2VQYXlsb2Fk');

@$core.Deprecated('Use recommendationReferenceDescriptor instead')
const RecommendationReference$json = {
  '1': 'RecommendationReference',
  '2': [
    {
      '1': 'recommendation_id',
      '3': 1,
      '4': 1,
      '5': 9,
      '10': 'recommendationId'
    },
    {'1': 'beverage_id', '3': 2, '4': 1, '5': 9, '10': 'beverageId'},
    {'1': 'venue_id', '3': 3, '4': 1, '5': 9, '10': 'venueId'},
    {'1': 'title', '3': 4, '4': 1, '5': 9, '10': 'title'},
    {
      '1': 'service_payload',
      '3': 20,
      '4': 1,
      '5': 11,
      '6': '.google.protobuf.Struct',
      '10': 'servicePayload'
    },
  ],
};

/// Descriptor for `RecommendationReference`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List recommendationReferenceDescriptor = $convert.base64Decode(
    'ChdSZWNvbW1lbmRhdGlvblJlZmVyZW5jZRIrChFyZWNvbW1lbmRhdGlvbl9pZBgBIAEoCVIQcm'
    'Vjb21tZW5kYXRpb25JZBIfCgtiZXZlcmFnZV9pZBgCIAEoCVIKYmV2ZXJhZ2VJZBIZCgh2ZW51'
    'ZV9pZBgDIAEoCVIHdmVudWVJZBIUCgV0aXRsZRgEIAEoCVIFdGl0bGUSQAoPc2VydmljZV9wYX'
    'lsb2FkGBQgASgLMhcuZ29vZ2xlLnByb3RvYnVmLlN0cnVjdFIOc2VydmljZVBheWxvYWQ=');

@$core.Deprecated('Use venueReferenceDescriptor instead')
const VenueReference$json = {
  '1': 'VenueReference',
  '2': [
    {'1': 'venue_id', '3': 1, '4': 1, '5': 9, '10': 'venueId'},
    {'1': 'name', '3': 2, '4': 1, '5': 9, '10': 'name'},
    {'1': 'lat', '3': 3, '4': 1, '5': 1, '9': 0, '10': 'lat', '17': true},
    {'1': 'lng', '3': 4, '4': 1, '5': 1, '9': 1, '10': 'lng', '17': true},
    {
      '1': 'service_payload',
      '3': 20,
      '4': 1,
      '5': 11,
      '6': '.google.protobuf.Struct',
      '10': 'servicePayload'
    },
  ],
  '8': [
    {'1': '_lat'},
    {'1': '_lng'},
  ],
};

/// Descriptor for `VenueReference`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List venueReferenceDescriptor = $convert.base64Decode(
    'Cg5WZW51ZVJlZmVyZW5jZRIZCgh2ZW51ZV9pZBgBIAEoCVIHdmVudWVJZBISCgRuYW1lGAIgAS'
    'gJUgRuYW1lEhUKA2xhdBgDIAEoAUgAUgNsYXSIAQESFQoDbG5nGAQgASgBSAFSA2xuZ4gBARJA'
    'Cg9zZXJ2aWNlX3BheWxvYWQYFCABKAsyFy5nb29nbGUucHJvdG9idWYuU3RydWN0Ug5zZXJ2aW'
    'NlUGF5bG9hZEIGCgRfbGF0QgYKBF9sbmc=');

@$core.Deprecated('Use beverageRecommendationDescriptor instead')
const BeverageRecommendation$json = {
  '1': 'BeverageRecommendation',
  '2': [
    {
      '1': 'recommendation_id',
      '3': 1,
      '4': 1,
      '5': 9,
      '10': 'recommendationId'
    },
    {'1': 'beverage_id', '3': 2, '4': 1, '5': 9, '10': 'beverageId'},
    {'1': 'display_name', '3': 3, '4': 1, '5': 9, '10': 'displayName'},
    {'1': 'rank', '3': 4, '4': 1, '5': 5, '10': 'rank'},
    {'1': 'score', '3': 5, '4': 1, '5': 1, '10': 'score'},
    {'1': 'reason', '3': 6, '4': 1, '5': 9, '10': 'reason'},
    {'1': 'tags', '3': 7, '4': 3, '5': 9, '10': 'tags'},
    {
      '1': 'service_payload',
      '3': 20,
      '4': 1,
      '5': 11,
      '6': '.google.protobuf.Struct',
      '10': 'servicePayload'
    },
  ],
};

/// Descriptor for `BeverageRecommendation`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List beverageRecommendationDescriptor = $convert.base64Decode(
    'ChZCZXZlcmFnZVJlY29tbWVuZGF0aW9uEisKEXJlY29tbWVuZGF0aW9uX2lkGAEgASgJUhByZW'
    'NvbW1lbmRhdGlvbklkEh8KC2JldmVyYWdlX2lkGAIgASgJUgpiZXZlcmFnZUlkEiEKDGRpc3Bs'
    'YXlfbmFtZRgDIAEoCVILZGlzcGxheU5hbWUSEgoEcmFuaxgEIAEoBVIEcmFuaxIUCgVzY29yZR'
    'gFIAEoAVIFc2NvcmUSFgoGcmVhc29uGAYgASgJUgZyZWFzb24SEgoEdGFncxgHIAMoCVIEdGFn'
    'cxJACg9zZXJ2aWNlX3BheWxvYWQYFCABKAsyFy5nb29nbGUucHJvdG9idWYuU3RydWN0Ug5zZX'
    'J2aWNlUGF5bG9hZA==');

@$core.Deprecated('Use venueRecommendationDescriptor instead')
const VenueRecommendation$json = {
  '1': 'VenueRecommendation',
  '2': [
    {
      '1': 'recommendation_id',
      '3': 1,
      '4': 1,
      '5': 9,
      '10': 'recommendationId'
    },
    {'1': 'venue_id', '3': 2, '4': 1, '5': 9, '10': 'venueId'},
    {'1': 'display_name', '3': 3, '4': 1, '5': 9, '10': 'displayName'},
    {'1': 'rank', '3': 4, '4': 1, '5': 5, '10': 'rank'},
    {'1': 'score', '3': 5, '4': 1, '5': 1, '10': 'score'},
    {'1': 'reason', '3': 6, '4': 1, '5': 9, '10': 'reason'},
    {'1': 'lat', '3': 7, '4': 1, '5': 1, '9': 0, '10': 'lat', '17': true},
    {'1': 'lng', '3': 8, '4': 1, '5': 1, '9': 1, '10': 'lng', '17': true},
    {'1': 'tags', '3': 9, '4': 3, '5': 9, '10': 'tags'},
    {
      '1': 'service_payload',
      '3': 20,
      '4': 1,
      '5': 11,
      '6': '.google.protobuf.Struct',
      '10': 'servicePayload'
    },
  ],
  '8': [
    {'1': '_lat'},
    {'1': '_lng'},
  ],
};

/// Descriptor for `VenueRecommendation`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List venueRecommendationDescriptor = $convert.base64Decode(
    'ChNWZW51ZVJlY29tbWVuZGF0aW9uEisKEXJlY29tbWVuZGF0aW9uX2lkGAEgASgJUhByZWNvbW'
    '1lbmRhdGlvbklkEhkKCHZlbnVlX2lkGAIgASgJUgd2ZW51ZUlkEiEKDGRpc3BsYXlfbmFtZRgD'
    'IAEoCVILZGlzcGxheU5hbWUSEgoEcmFuaxgEIAEoBVIEcmFuaxIUCgVzY29yZRgFIAEoAVIFc2'
    'NvcmUSFgoGcmVhc29uGAYgASgJUgZyZWFzb24SFQoDbGF0GAcgASgBSABSA2xhdIgBARIVCgNs'
    'bmcYCCABKAFIAVIDbG5niAEBEhIKBHRhZ3MYCSADKAlSBHRhZ3MSQAoPc2VydmljZV9wYXlsb2'
    'FkGBQgASgLMhcuZ29vZ2xlLnByb3RvYnVmLlN0cnVjdFIOc2VydmljZVBheWxvYWRCBgoEX2xh'
    'dEIGCgRfbG5n');
