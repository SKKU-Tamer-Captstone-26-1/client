//
//  Generated code. Do not modify.
//  source: recommendation/v1/recommendation.proto
//
// @dart = 2.12

// ignore_for_file: annotate_overrides, camel_case_types, comment_references
// ignore_for_file: constant_identifier_names, library_prefixes
// ignore_for_file: non_constant_identifier_names, prefer_final_fields
// ignore_for_file: unnecessary_import, unnecessary_this, unused_import

import 'dart:core' as $core;

import 'package:protobuf/protobuf.dart' as $pb;

class ProfileStatus extends $pb.ProtobufEnum {
  static const ProfileStatus PROFILE_STATUS_UNSPECIFIED = ProfileStatus._(0, _omitEnumNames ? '' : 'PROFILE_STATUS_UNSPECIFIED');
  static const ProfileStatus PROFILE_STATUS_MISSING = ProfileStatus._(1, _omitEnumNames ? '' : 'PROFILE_STATUS_MISSING');
  static const ProfileStatus PROFILE_STATUS_PENDING_GENERATION = ProfileStatus._(2, _omitEnumNames ? '' : 'PROFILE_STATUS_PENDING_GENERATION');
  static const ProfileStatus PROFILE_STATUS_ACTIVE = ProfileStatus._(3, _omitEnumNames ? '' : 'PROFILE_STATUS_ACTIVE');
  static const ProfileStatus PROFILE_STATUS_STALE = ProfileStatus._(4, _omitEnumNames ? '' : 'PROFILE_STATUS_STALE');
  static const ProfileStatus PROFILE_STATUS_FAILED_GENERATION = ProfileStatus._(5, _omitEnumNames ? '' : 'PROFILE_STATUS_FAILED_GENERATION');

  static const $core.List<ProfileStatus> values = <ProfileStatus> [
    PROFILE_STATUS_UNSPECIFIED,
    PROFILE_STATUS_MISSING,
    PROFILE_STATUS_PENDING_GENERATION,
    PROFILE_STATUS_ACTIVE,
    PROFILE_STATUS_STALE,
    PROFILE_STATUS_FAILED_GENERATION,
  ];

  static final $core.Map<$core.int, ProfileStatus> _byValue = $pb.ProtobufEnum.initByValue(values);
  static ProfileStatus? valueOf($core.int value) => _byValue[value];

  const ProfileStatus._($core.int v, $core.String n) : super(v, n);
}

class BudgetMode extends $pb.ProtobufEnum {
  static const BudgetMode BUDGET_MODE_UNSPECIFIED = BudgetMode._(0, _omitEnumNames ? '' : 'BUDGET_MODE_UNSPECIFIED');
  static const BudgetMode BUDGET_MODE_SOFT = BudgetMode._(1, _omitEnumNames ? '' : 'BUDGET_MODE_SOFT');
  static const BudgetMode BUDGET_MODE_STRICT = BudgetMode._(2, _omitEnumNames ? '' : 'BUDGET_MODE_STRICT');

  static const $core.List<BudgetMode> values = <BudgetMode> [
    BUDGET_MODE_UNSPECIFIED,
    BUDGET_MODE_SOFT,
    BUDGET_MODE_STRICT,
  ];

  static final $core.Map<$core.int, BudgetMode> _byValue = $pb.ProtobufEnum.initByValue(values);
  static BudgetMode? valueOf($core.int value) => _byValue[value];

  const BudgetMode._($core.int v, $core.String n) : super(v, n);
}

class RecommendationEventType extends $pb.ProtobufEnum {
  static const RecommendationEventType RECOMMENDATION_EVENT_TYPE_UNSPECIFIED = RecommendationEventType._(0, _omitEnumNames ? '' : 'RECOMMENDATION_EVENT_TYPE_UNSPECIFIED');
  static const RecommendationEventType RECOMMENDATION_EVENT_TYPE_IMPRESSION = RecommendationEventType._(1, _omitEnumNames ? '' : 'RECOMMENDATION_EVENT_TYPE_IMPRESSION');
  static const RecommendationEventType RECOMMENDATION_EVENT_TYPE_CLICK = RecommendationEventType._(2, _omitEnumNames ? '' : 'RECOMMENDATION_EVENT_TYPE_CLICK');
  static const RecommendationEventType RECOMMENDATION_EVENT_TYPE_SAVE = RecommendationEventType._(3, _omitEnumNames ? '' : 'RECOMMENDATION_EVENT_TYPE_SAVE');
  static const RecommendationEventType RECOMMENDATION_EVENT_TYPE_DISMISS = RecommendationEventType._(4, _omitEnumNames ? '' : 'RECOMMENDATION_EVENT_TYPE_DISMISS');
  static const RecommendationEventType RECOMMENDATION_EVENT_TYPE_DETAIL_VIEW = RecommendationEventType._(5, _omitEnumNames ? '' : 'RECOMMENDATION_EVENT_TYPE_DETAIL_VIEW');

  static const $core.List<RecommendationEventType> values = <RecommendationEventType> [
    RECOMMENDATION_EVENT_TYPE_UNSPECIFIED,
    RECOMMENDATION_EVENT_TYPE_IMPRESSION,
    RECOMMENDATION_EVENT_TYPE_CLICK,
    RECOMMENDATION_EVENT_TYPE_SAVE,
    RECOMMENDATION_EVENT_TYPE_DISMISS,
    RECOMMENDATION_EVENT_TYPE_DETAIL_VIEW,
  ];

  static final $core.Map<$core.int, RecommendationEventType> _byValue = $pb.ProtobufEnum.initByValue(values);
  static RecommendationEventType? valueOf($core.int value) => _byValue[value];

  const RecommendationEventType._($core.int v, $core.String n) : super(v, n);
}

class VenueOptionType extends $pb.ProtobufEnum {
  static const VenueOptionType VENUE_OPTION_TYPE_UNSPECIFIED = VenueOptionType._(0, _omitEnumNames ? '' : 'VENUE_OPTION_TYPE_UNSPECIFIED');
  static const VenueOptionType VENUE_OPTION_TYPE_NEAREST_REASONABLE = VenueOptionType._(1, _omitEnumNames ? '' : 'VENUE_OPTION_TYPE_NEAREST_REASONABLE');
  static const VenueOptionType VENUE_OPTION_TYPE_BEST_PRICE = VenueOptionType._(2, _omitEnumNames ? '' : 'VENUE_OPTION_TYPE_BEST_PRICE');
  static const VenueOptionType VENUE_OPTION_TYPE_BALANCED_BEST = VenueOptionType._(3, _omitEnumNames ? '' : 'VENUE_OPTION_TYPE_BALANCED_BEST');

  static const $core.List<VenueOptionType> values = <VenueOptionType> [
    VENUE_OPTION_TYPE_UNSPECIFIED,
    VENUE_OPTION_TYPE_NEAREST_REASONABLE,
    VENUE_OPTION_TYPE_BEST_PRICE,
    VENUE_OPTION_TYPE_BALANCED_BEST,
  ];

  static final $core.Map<$core.int, VenueOptionType> _byValue = $pb.ProtobufEnum.initByValue(values);
  static VenueOptionType? valueOf($core.int value) => _byValue[value];

  const VenueOptionType._($core.int v, $core.String n) : super(v, n);
}

class VenueAvailabilityStatus extends $pb.ProtobufEnum {
  static const VenueAvailabilityStatus VENUE_AVAILABILITY_STATUS_UNSPECIFIED = VenueAvailabilityStatus._(0, _omitEnumNames ? '' : 'VENUE_AVAILABILITY_STATUS_UNSPECIFIED');
  static const VenueAvailabilityStatus VENUE_AVAILABILITY_STATUS_AVAILABLE = VenueAvailabilityStatus._(1, _omitEnumNames ? '' : 'VENUE_AVAILABILITY_STATUS_AVAILABLE');
  static const VenueAvailabilityStatus VENUE_AVAILABILITY_STATUS_LIKELY_AVAILABLE = VenueAvailabilityStatus._(2, _omitEnumNames ? '' : 'VENUE_AVAILABILITY_STATUS_LIKELY_AVAILABLE');
  static const VenueAvailabilityStatus VENUE_AVAILABILITY_STATUS_UNKNOWN = VenueAvailabilityStatus._(3, _omitEnumNames ? '' : 'VENUE_AVAILABILITY_STATUS_UNKNOWN');
  static const VenueAvailabilityStatus VENUE_AVAILABILITY_STATUS_UNAVAILABLE = VenueAvailabilityStatus._(4, _omitEnumNames ? '' : 'VENUE_AVAILABILITY_STATUS_UNAVAILABLE');

  static const $core.List<VenueAvailabilityStatus> values = <VenueAvailabilityStatus> [
    VENUE_AVAILABILITY_STATUS_UNSPECIFIED,
    VENUE_AVAILABILITY_STATUS_AVAILABLE,
    VENUE_AVAILABILITY_STATUS_LIKELY_AVAILABLE,
    VENUE_AVAILABILITY_STATUS_UNKNOWN,
    VENUE_AVAILABILITY_STATUS_UNAVAILABLE,
  ];

  static final $core.Map<$core.int, VenueAvailabilityStatus> _byValue = $pb.ProtobufEnum.initByValue(values);
  static VenueAvailabilityStatus? valueOf($core.int value) => _byValue[value];

  const VenueAvailabilityStatus._($core.int v, $core.String n) : super(v, n);
}

class VenueFreshnessStatus extends $pb.ProtobufEnum {
  static const VenueFreshnessStatus VENUE_FRESHNESS_STATUS_UNSPECIFIED = VenueFreshnessStatus._(0, _omitEnumNames ? '' : 'VENUE_FRESHNESS_STATUS_UNSPECIFIED');
  static const VenueFreshnessStatus VENUE_FRESHNESS_STATUS_FRESH = VenueFreshnessStatus._(1, _omitEnumNames ? '' : 'VENUE_FRESHNESS_STATUS_FRESH');
  static const VenueFreshnessStatus VENUE_FRESHNESS_STATUS_STALE = VenueFreshnessStatus._(2, _omitEnumNames ? '' : 'VENUE_FRESHNESS_STATUS_STALE');
  static const VenueFreshnessStatus VENUE_FRESHNESS_STATUS_EXPIRED = VenueFreshnessStatus._(3, _omitEnumNames ? '' : 'VENUE_FRESHNESS_STATUS_EXPIRED');

  static const $core.List<VenueFreshnessStatus> values = <VenueFreshnessStatus> [
    VENUE_FRESHNESS_STATUS_UNSPECIFIED,
    VENUE_FRESHNESS_STATUS_FRESH,
    VENUE_FRESHNESS_STATUS_STALE,
    VENUE_FRESHNESS_STATUS_EXPIRED,
  ];

  static final $core.Map<$core.int, VenueFreshnessStatus> _byValue = $pb.ProtobufEnum.initByValue(values);
  static VenueFreshnessStatus? valueOf($core.int value) => _byValue[value];

  const VenueFreshnessStatus._($core.int v, $core.String n) : super(v, n);
}


const _omitEnumNames = $core.bool.fromEnvironment('protobuf.omit_enum_names');
