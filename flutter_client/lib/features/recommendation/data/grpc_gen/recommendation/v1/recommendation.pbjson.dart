//
//  Generated code. Do not modify.
//  source: recommendation/v1/recommendation.proto
//
// @dart = 2.12

// ignore_for_file: annotate_overrides, camel_case_types, comment_references
// ignore_for_file: constant_identifier_names, library_prefixes
// ignore_for_file: non_constant_identifier_names, prefer_final_fields
// ignore_for_file: unnecessary_import, unnecessary_this, unused_import

import 'dart:convert' as $convert;
import 'dart:core' as $core;
import 'dart:typed_data' as $typed_data;

@$core.Deprecated('Use profileStatusDescriptor instead')
const ProfileStatus$json = {
  '1': 'ProfileStatus',
  '2': [
    {'1': 'PROFILE_STATUS_UNSPECIFIED', '2': 0},
    {'1': 'PROFILE_STATUS_MISSING', '2': 1},
    {'1': 'PROFILE_STATUS_PENDING_GENERATION', '2': 2},
    {'1': 'PROFILE_STATUS_ACTIVE', '2': 3},
    {'1': 'PROFILE_STATUS_STALE', '2': 4},
    {'1': 'PROFILE_STATUS_FAILED_GENERATION', '2': 5},
  ],
};

/// Descriptor for `ProfileStatus`. Decode as a `google.protobuf.EnumDescriptorProto`.
final $typed_data.Uint8List profileStatusDescriptor = $convert.base64Decode(
    'Cg1Qcm9maWxlU3RhdHVzEh4KGlBST0ZJTEVfU1RBVFVTX1VOU1BFQ0lGSUVEEAASGgoWUFJPRk'
    'lMRV9TVEFUVVNfTUlTU0lORxABEiUKIVBST0ZJTEVfU1RBVFVTX1BFTkRJTkdfR0VORVJBVElP'
    'ThACEhkKFVBST0ZJTEVfU1RBVFVTX0FDVElWRRADEhgKFFBST0ZJTEVfU1RBVFVTX1NUQUxFEA'
    'QSJAogUFJPRklMRV9TVEFUVVNfRkFJTEVEX0dFTkVSQVRJT04QBQ==');

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

@$core.Deprecated('Use venueOptionTypeDescriptor instead')
const VenueOptionType$json = {
  '1': 'VenueOptionType',
  '2': [
    {'1': 'VENUE_OPTION_TYPE_UNSPECIFIED', '2': 0},
    {'1': 'VENUE_OPTION_TYPE_NEAREST_REASONABLE', '2': 1},
    {'1': 'VENUE_OPTION_TYPE_BEST_PRICE', '2': 2},
    {'1': 'VENUE_OPTION_TYPE_BALANCED_BEST', '2': 3},
  ],
};

/// Descriptor for `VenueOptionType`. Decode as a `google.protobuf.EnumDescriptorProto`.
final $typed_data.Uint8List venueOptionTypeDescriptor = $convert.base64Decode(
    'Cg9WZW51ZU9wdGlvblR5cGUSIQodVkVOVUVfT1BUSU9OX1RZUEVfVU5TUEVDSUZJRUQQABIoCi'
    'RWRU5VRV9PUFRJT05fVFlQRV9ORUFSRVNUX1JFQVNPTkFCTEUQARIgChxWRU5VRV9PUFRJT05f'
    'VFlQRV9CRVNUX1BSSUNFEAISIwofVkVOVUVfT1BUSU9OX1RZUEVfQkFMQU5DRURfQkVTVBAD');

@$core.Deprecated('Use venueAvailabilityStatusDescriptor instead')
const VenueAvailabilityStatus$json = {
  '1': 'VenueAvailabilityStatus',
  '2': [
    {'1': 'VENUE_AVAILABILITY_STATUS_UNSPECIFIED', '2': 0},
    {'1': 'VENUE_AVAILABILITY_STATUS_AVAILABLE', '2': 1},
    {'1': 'VENUE_AVAILABILITY_STATUS_LIKELY_AVAILABLE', '2': 2},
    {'1': 'VENUE_AVAILABILITY_STATUS_UNKNOWN', '2': 3},
    {'1': 'VENUE_AVAILABILITY_STATUS_UNAVAILABLE', '2': 4},
  ],
};

/// Descriptor for `VenueAvailabilityStatus`. Decode as a `google.protobuf.EnumDescriptorProto`.
final $typed_data.Uint8List venueAvailabilityStatusDescriptor = $convert.base64Decode(
    'ChdWZW51ZUF2YWlsYWJpbGl0eVN0YXR1cxIpCiVWRU5VRV9BVkFJTEFCSUxJVFlfU1RBVFVTX1'
    'VOU1BFQ0lGSUVEEAASJwojVkVOVUVfQVZBSUxBQklMSVRZX1NUQVRVU19BVkFJTEFCTEUQARIu'
    'CipWRU5VRV9BVkFJTEFCSUxJVFlfU1RBVFVTX0xJS0VMWV9BVkFJTEFCTEUQAhIlCiFWRU5VRV'
    '9BVkFJTEFCSUxJVFlfU1RBVFVTX1VOS05PV04QAxIpCiVWRU5VRV9BVkFJTEFCSUxJVFlfU1RB'
    'VFVTX1VOQVZBSUxBQkxFEAQ=');

@$core.Deprecated('Use venueFreshnessStatusDescriptor instead')
const VenueFreshnessStatus$json = {
  '1': 'VenueFreshnessStatus',
  '2': [
    {'1': 'VENUE_FRESHNESS_STATUS_UNSPECIFIED', '2': 0},
    {'1': 'VENUE_FRESHNESS_STATUS_FRESH', '2': 1},
    {'1': 'VENUE_FRESHNESS_STATUS_STALE', '2': 2},
    {'1': 'VENUE_FRESHNESS_STATUS_EXPIRED', '2': 3},
  ],
};

/// Descriptor for `VenueFreshnessStatus`. Decode as a `google.protobuf.EnumDescriptorProto`.
final $typed_data.Uint8List venueFreshnessStatusDescriptor = $convert.base64Decode(
    'ChRWZW51ZUZyZXNobmVzc1N0YXR1cxImCiJWRU5VRV9GUkVTSE5FU1NfU1RBVFVTX1VOU1BFQ0'
    'lGSUVEEAASIAocVkVOVUVfRlJFU0hORVNTX1NUQVRVU19GUkVTSBABEiAKHFZFTlVFX0ZSRVNI'
    'TkVTU19TVEFUVVNfU1RBTEUQAhIiCh5WRU5VRV9GUkVTSE5FU1NfU1RBVFVTX0VYUElSRUQQAw'
    '==');

@$core.Deprecated('Use getProfileStatusRequestDescriptor instead')
const GetProfileStatusRequest$json = {
  '1': 'GetProfileStatusRequest',
};

/// Descriptor for `GetProfileStatusRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List getProfileStatusRequestDescriptor = $convert.base64Decode(
    'ChdHZXRQcm9maWxlU3RhdHVzUmVxdWVzdA==');

@$core.Deprecated('Use getProfileStatusResponseDescriptor instead')
const GetProfileStatusResponse$json = {
  '1': 'GetProfileStatusResponse',
  '2': [
    {'1': 'status', '3': 1, '4': 1, '5': 14, '6': '.ontheblock.recommendation.v1.ProfileStatus', '10': 'status'},
    {'1': 'profile_revision', '3': 2, '4': 1, '5': 5, '10': 'profileRevision'},
    {'1': 'survey_response_id', '3': 3, '4': 1, '5': 9, '10': 'surveyResponseId'},
    {'1': 'generated_at', '3': 4, '4': 1, '5': 11, '6': '.google.protobuf.Timestamp', '10': 'generatedAt'},
    {'1': 'stale_reason', '3': 5, '4': 1, '5': 9, '10': 'staleReason'},
  ],
};

/// Descriptor for `GetProfileStatusResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List getProfileStatusResponseDescriptor = $convert.base64Decode(
    'ChhHZXRQcm9maWxlU3RhdHVzUmVzcG9uc2USQwoGc3RhdHVzGAEgASgOMisub250aGVibG9jay'
    '5yZWNvbW1lbmRhdGlvbi52MS5Qcm9maWxlU3RhdHVzUgZzdGF0dXMSKQoQcHJvZmlsZV9yZXZp'
    'c2lvbhgCIAEoBVIPcHJvZmlsZVJldmlzaW9uEiwKEnN1cnZleV9yZXNwb25zZV9pZBgDIAEoCV'
    'IQc3VydmV5UmVzcG9uc2VJZBI9CgxnZW5lcmF0ZWRfYXQYBCABKAsyGi5nb29nbGUucHJvdG9i'
    'dWYuVGltZXN0YW1wUgtnZW5lcmF0ZWRBdBIhCgxzdGFsZV9yZWFzb24YBSABKAlSC3N0YWxlUm'
    'Vhc29u');

@$core.Deprecated('Use getBeverageRecommendationsRequestDescriptor instead')
const GetBeverageRecommendationsRequest$json = {
  '1': 'GetBeverageRecommendationsRequest',
  '2': [
    {'1': 'category', '3': 1, '4': 1, '5': 9, '10': 'category'},
    {'1': 'limit', '3': 2, '4': 1, '5': 5, '10': 'limit'},
    {'1': 'budget_mode', '3': 3, '4': 1, '5': 14, '6': '.ontheblock.recommendation.v1.BudgetMode', '10': 'budgetMode'},
  ],
};

/// Descriptor for `GetBeverageRecommendationsRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List getBeverageRecommendationsRequestDescriptor = $convert.base64Decode(
    'CiFHZXRCZXZlcmFnZVJlY29tbWVuZGF0aW9uc1JlcXVlc3QSGgoIY2F0ZWdvcnkYASABKAlSCG'
    'NhdGVnb3J5EhQKBWxpbWl0GAIgASgFUgVsaW1pdBJJCgtidWRnZXRfbW9kZRgDIAEoDjIoLm9u'
    'dGhlYmxvY2sucmVjb21tZW5kYXRpb24udjEuQnVkZ2V0TW9kZVIKYnVkZ2V0TW9kZQ==');

@$core.Deprecated('Use beverageRecommendationDescriptor instead')
const BeverageRecommendation$json = {
  '1': 'BeverageRecommendation',
  '2': [
    {'1': 'rank', '3': 1, '4': 1, '5': 5, '10': 'rank'},
    {'1': 'result_id', '3': 2, '4': 1, '5': 9, '10': 'resultId'},
    {'1': 'beverage_id', '3': 3, '4': 1, '5': 9, '10': 'beverageId'},
    {'1': 'name_ko', '3': 4, '4': 1, '5': 9, '10': 'nameKo'},
    {'1': 'name_en', '3': 5, '4': 1, '5': 9, '10': 'nameEn'},
    {'1': 'category', '3': 6, '4': 1, '5': 9, '10': 'category'},
    {'1': 'score', '3': 7, '4': 1, '5': 1, '10': 'score'},
    {'1': 'reason_codes', '3': 8, '4': 3, '5': 9, '10': 'reasonCodes'},
    {'1': 'explanation', '3': 9, '4': 1, '5': 9, '10': 'explanation'},
    {'1': 'metadata', '3': 10, '4': 1, '5': 11, '6': '.google.protobuf.Struct', '10': 'metadata'},
  ],
};

/// Descriptor for `BeverageRecommendation`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List beverageRecommendationDescriptor = $convert.base64Decode(
    'ChZCZXZlcmFnZVJlY29tbWVuZGF0aW9uEhIKBHJhbmsYASABKAVSBHJhbmsSGwoJcmVzdWx0X2'
    'lkGAIgASgJUghyZXN1bHRJZBIfCgtiZXZlcmFnZV9pZBgDIAEoCVIKYmV2ZXJhZ2VJZBIXCgdu'
    'YW1lX2tvGAQgASgJUgZuYW1lS28SFwoHbmFtZV9lbhgFIAEoCVIGbmFtZUVuEhoKCGNhdGVnb3'
    'J5GAYgASgJUghjYXRlZ29yeRIUCgVzY29yZRgHIAEoAVIFc2NvcmUSIQoMcmVhc29uX2NvZGVz'
    'GAggAygJUgtyZWFzb25Db2RlcxIgCgtleHBsYW5hdGlvbhgJIAEoCVILZXhwbGFuYXRpb24SMw'
    'oIbWV0YWRhdGEYCiABKAsyFy5nb29nbGUucHJvdG9idWYuU3RydWN0UghtZXRhZGF0YQ==');

@$core.Deprecated('Use getBeverageRecommendationsResponseDescriptor instead')
const GetBeverageRecommendationsResponse$json = {
  '1': 'GetBeverageRecommendationsResponse',
  '2': [
    {'1': 'request_id', '3': 1, '4': 1, '5': 9, '10': 'requestId'},
    {'1': 'profile_status', '3': 2, '4': 1, '5': 14, '6': '.ontheblock.recommendation.v1.ProfileStatus', '10': 'profileStatus'},
    {'1': 'profile_revision', '3': 3, '4': 1, '5': 5, '10': 'profileRevision'},
    {'1': 'recommendations', '3': 4, '4': 3, '5': 11, '6': '.ontheblock.recommendation.v1.BeverageRecommendation', '10': 'recommendations'},
  ],
};

/// Descriptor for `GetBeverageRecommendationsResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List getBeverageRecommendationsResponseDescriptor = $convert.base64Decode(
    'CiJHZXRCZXZlcmFnZVJlY29tbWVuZGF0aW9uc1Jlc3BvbnNlEh0KCnJlcXVlc3RfaWQYASABKA'
    'lSCXJlcXVlc3RJZBJSCg5wcm9maWxlX3N0YXR1cxgCIAEoDjIrLm9udGhlYmxvY2sucmVjb21t'
    'ZW5kYXRpb24udjEuUHJvZmlsZVN0YXR1c1INcHJvZmlsZVN0YXR1cxIpChBwcm9maWxlX3Jldm'
    'lzaW9uGAMgASgFUg9wcm9maWxlUmV2aXNpb24SXgoPcmVjb21tZW5kYXRpb25zGAQgAygLMjQu'
    'b250aGVibG9jay5yZWNvbW1lbmRhdGlvbi52MS5CZXZlcmFnZVJlY29tbWVuZGF0aW9uUg9yZW'
    'NvbW1lbmRhdGlvbnM=');

@$core.Deprecated('Use getVenueRecommendationsRequestDescriptor instead')
const GetVenueRecommendationsRequest$json = {
  '1': 'GetVenueRecommendationsRequest',
  '2': [
    {'1': 'selected_beverage_id', '3': 1, '4': 1, '5': 9, '10': 'selectedBeverageId'},
    {'1': 'lat', '3': 2, '4': 1, '5': 1, '10': 'lat'},
    {'1': 'lng', '3': 3, '4': 1, '5': 1, '10': 'lng'},
    {'1': 'radius_m', '3': 4, '4': 1, '5': 5, '10': 'radiusM'},
    {'1': 'limit', '3': 5, '4': 1, '5': 5, '10': 'limit'},
    {'1': 'budget_mode', '3': 6, '4': 1, '5': 14, '6': '.ontheblock.recommendation.v1.BudgetMode', '10': 'budgetMode'},
  ],
};

/// Descriptor for `GetVenueRecommendationsRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List getVenueRecommendationsRequestDescriptor = $convert.base64Decode(
    'Ch5HZXRWZW51ZVJlY29tbWVuZGF0aW9uc1JlcXVlc3QSMAoUc2VsZWN0ZWRfYmV2ZXJhZ2VfaW'
    'QYASABKAlSEnNlbGVjdGVkQmV2ZXJhZ2VJZBIQCgNsYXQYAiABKAFSA2xhdBIQCgNsbmcYAyAB'
    'KAFSA2xuZxIZCghyYWRpdXNfbRgEIAEoBVIHcmFkaXVzTRIUCgVsaW1pdBgFIAEoBVIFbGltaX'
    'QSSQoLYnVkZ2V0X21vZGUYBiABKA4yKC5vbnRoZWJsb2NrLnJlY29tbWVuZGF0aW9uLnYxLkJ1'
    'ZGdldE1vZGVSCmJ1ZGdldE1vZGU=');

@$core.Deprecated('Use venueRecommendationDescriptor instead')
const VenueRecommendation$json = {
  '1': 'VenueRecommendation',
  '2': [
    {'1': 'rank', '3': 1, '4': 1, '5': 5, '10': 'rank'},
    {'1': 'result_id', '3': 2, '4': 1, '5': 9, '10': 'resultId'},
    {'1': 'place_id', '3': 3, '4': 1, '5': 9, '10': 'placeId'},
    {'1': 'name', '3': 4, '4': 1, '5': 9, '10': 'name'},
    {'1': 'place_type', '3': 5, '4': 1, '5': 9, '10': 'placeType'},
    {'1': 'address', '3': 6, '4': 1, '5': 9, '10': 'address'},
    {'1': 'option_type', '3': 7, '4': 1, '5': 14, '6': '.ontheblock.recommendation.v1.VenueOptionType', '10': 'optionType'},
    {'1': 'distance_m', '3': 8, '4': 1, '5': 1, '10': 'distanceM'},
    {'1': 'price_krw', '3': 9, '4': 1, '5': 5, '9': 0, '10': 'priceKrw', '17': true},
    {'1': 'availability_status', '3': 10, '4': 1, '5': 14, '6': '.ontheblock.recommendation.v1.VenueAvailabilityStatus', '10': 'availabilityStatus'},
    {'1': 'freshness_status', '3': 11, '4': 1, '5': 14, '6': '.ontheblock.recommendation.v1.VenueFreshnessStatus', '10': 'freshnessStatus'},
    {'1': 'score', '3': 12, '4': 1, '5': 1, '10': 'score'},
    {'1': 'reason_codes', '3': 13, '4': 3, '5': 9, '10': 'reasonCodes'},
    {'1': 'explanation', '3': 14, '4': 1, '5': 9, '10': 'explanation'},
    {'1': 'metadata', '3': 15, '4': 1, '5': 11, '6': '.google.protobuf.Struct', '10': 'metadata'},
  ],
  '8': [
    {'1': '_price_krw'},
  ],
};

/// Descriptor for `VenueRecommendation`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List venueRecommendationDescriptor = $convert.base64Decode(
    'ChNWZW51ZVJlY29tbWVuZGF0aW9uEhIKBHJhbmsYASABKAVSBHJhbmsSGwoJcmVzdWx0X2lkGA'
    'IgASgJUghyZXN1bHRJZBIZCghwbGFjZV9pZBgDIAEoCVIHcGxhY2VJZBISCgRuYW1lGAQgASgJ'
    'UgRuYW1lEh0KCnBsYWNlX3R5cGUYBSABKAlSCXBsYWNlVHlwZRIYCgdhZGRyZXNzGAYgASgJUg'
    'dhZGRyZXNzEk4KC29wdGlvbl90eXBlGAcgASgOMi0ub250aGVibG9jay5yZWNvbW1lbmRhdGlv'
    'bi52MS5WZW51ZU9wdGlvblR5cGVSCm9wdGlvblR5cGUSHQoKZGlzdGFuY2VfbRgIIAEoAVIJZG'
    'lzdGFuY2VNEiAKCXByaWNlX2tydxgJIAEoBUgAUghwcmljZUtyd4gBARJmChNhdmFpbGFiaWxp'
    'dHlfc3RhdHVzGAogASgOMjUub250aGVibG9jay5yZWNvbW1lbmRhdGlvbi52MS5WZW51ZUF2YW'
    'lsYWJpbGl0eVN0YXR1c1ISYXZhaWxhYmlsaXR5U3RhdHVzEl0KEGZyZXNobmVzc19zdGF0dXMY'
    'CyABKA4yMi5vbnRoZWJsb2NrLnJlY29tbWVuZGF0aW9uLnYxLlZlbnVlRnJlc2huZXNzU3RhdH'
    'VzUg9mcmVzaG5lc3NTdGF0dXMSFAoFc2NvcmUYDCABKAFSBXNjb3JlEiEKDHJlYXNvbl9jb2Rl'
    'cxgNIAMoCVILcmVhc29uQ29kZXMSIAoLZXhwbGFuYXRpb24YDiABKAlSC2V4cGxhbmF0aW9uEj'
    'MKCG1ldGFkYXRhGA8gASgLMhcuZ29vZ2xlLnByb3RvYnVmLlN0cnVjdFIIbWV0YWRhdGFCDAoK'
    'X3ByaWNlX2tydw==');

@$core.Deprecated('Use getVenueRecommendationsResponseDescriptor instead')
const GetVenueRecommendationsResponse$json = {
  '1': 'GetVenueRecommendationsResponse',
  '2': [
    {'1': 'request_id', '3': 1, '4': 1, '5': 9, '10': 'requestId'},
    {'1': 'profile_status', '3': 2, '4': 1, '5': 14, '6': '.ontheblock.recommendation.v1.ProfileStatus', '10': 'profileStatus'},
    {'1': 'profile_revision', '3': 3, '4': 1, '5': 5, '10': 'profileRevision'},
    {'1': 'recommendations', '3': 4, '4': 3, '5': 11, '6': '.ontheblock.recommendation.v1.VenueRecommendation', '10': 'recommendations'},
  ],
};

/// Descriptor for `GetVenueRecommendationsResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List getVenueRecommendationsResponseDescriptor = $convert.base64Decode(
    'Ch9HZXRWZW51ZVJlY29tbWVuZGF0aW9uc1Jlc3BvbnNlEh0KCnJlcXVlc3RfaWQYASABKAlSCX'
    'JlcXVlc3RJZBJSCg5wcm9maWxlX3N0YXR1cxgCIAEoDjIrLm9udGhlYmxvY2sucmVjb21tZW5k'
    'YXRpb24udjEuUHJvZmlsZVN0YXR1c1INcHJvZmlsZVN0YXR1cxIpChBwcm9maWxlX3JldmlzaW'
    '9uGAMgASgFUg9wcm9maWxlUmV2aXNpb24SWwoPcmVjb21tZW5kYXRpb25zGAQgAygLMjEub250'
    'aGVibG9jay5yZWNvbW1lbmRhdGlvbi52MS5WZW51ZVJlY29tbWVuZGF0aW9uUg9yZWNvbW1lbm'
    'RhdGlvbnM=');

@$core.Deprecated('Use recordRecommendationEventRequestDescriptor instead')
const RecordRecommendationEventRequest$json = {
  '1': 'RecordRecommendationEventRequest',
  '2': [
    {'1': 'request_id', '3': 1, '4': 1, '5': 9, '10': 'requestId'},
    {'1': 'result_id', '3': 2, '4': 1, '5': 9, '10': 'resultId'},
    {'1': 'event_type', '3': 3, '4': 1, '5': 14, '6': '.ontheblock.recommendation.v1.RecommendationEventType', '10': 'eventType'},
    {'1': 'idempotency_key', '3': 4, '4': 1, '5': 9, '10': 'idempotencyKey'},
    {'1': 'metadata', '3': 5, '4': 1, '5': 11, '6': '.google.protobuf.Struct', '10': 'metadata'},
  ],
};

/// Descriptor for `RecordRecommendationEventRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List recordRecommendationEventRequestDescriptor = $convert.base64Decode(
    'CiBSZWNvcmRSZWNvbW1lbmRhdGlvbkV2ZW50UmVxdWVzdBIdCgpyZXF1ZXN0X2lkGAEgASgJUg'
    'lyZXF1ZXN0SWQSGwoJcmVzdWx0X2lkGAIgASgJUghyZXN1bHRJZBJUCgpldmVudF90eXBlGAMg'
    'ASgOMjUub250aGVibG9jay5yZWNvbW1lbmRhdGlvbi52MS5SZWNvbW1lbmRhdGlvbkV2ZW50VH'
    'lwZVIJZXZlbnRUeXBlEicKD2lkZW1wb3RlbmN5X2tleRgEIAEoCVIOaWRlbXBvdGVuY3lLZXkS'
    'MwoIbWV0YWRhdGEYBSABKAsyFy5nb29nbGUucHJvdG9idWYuU3RydWN0UghtZXRhZGF0YQ==');

@$core.Deprecated('Use recordRecommendationEventResponseDescriptor instead')
const RecordRecommendationEventResponse$json = {
  '1': 'RecordRecommendationEventResponse',
  '2': [
    {'1': 'interaction_id', '3': 1, '4': 1, '5': 9, '10': 'interactionId'},
    {'1': 'duplicate', '3': 2, '4': 1, '5': 8, '10': 'duplicate'},
  ],
};

/// Descriptor for `RecordRecommendationEventResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List recordRecommendationEventResponseDescriptor = $convert.base64Decode(
    'CiFSZWNvcmRSZWNvbW1lbmRhdGlvbkV2ZW50UmVzcG9uc2USJQoOaW50ZXJhY3Rpb25faWQYAS'
    'ABKAlSDWludGVyYWN0aW9uSWQSHAoJZHVwbGljYXRlGAIgASgIUglkdXBsaWNhdGU=');

