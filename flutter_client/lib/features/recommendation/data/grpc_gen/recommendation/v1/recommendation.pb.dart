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

import '../../google/protobuf/struct.pb.dart' as $2;
import '../../google/protobuf/timestamp.pb.dart' as $1;
import 'recommendation.pbenum.dart';

export 'recommendation.pbenum.dart';

class GetProfileStatusRequest extends $pb.GeneratedMessage {
  factory GetProfileStatusRequest() => create();
  GetProfileStatusRequest._() : super();
  factory GetProfileStatusRequest.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory GetProfileStatusRequest.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'GetProfileStatusRequest', package: const $pb.PackageName(_omitMessageNames ? '' : 'ontheblock.recommendation.v1'), createEmptyInstance: create)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  GetProfileStatusRequest clone() => GetProfileStatusRequest()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  GetProfileStatusRequest copyWith(void Function(GetProfileStatusRequest) updates) => super.copyWith((message) => updates(message as GetProfileStatusRequest)) as GetProfileStatusRequest;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static GetProfileStatusRequest create() => GetProfileStatusRequest._();
  GetProfileStatusRequest createEmptyInstance() => create();
  static $pb.PbList<GetProfileStatusRequest> createRepeated() => $pb.PbList<GetProfileStatusRequest>();
  @$core.pragma('dart2js:noInline')
  static GetProfileStatusRequest getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<GetProfileStatusRequest>(create);
  static GetProfileStatusRequest? _defaultInstance;
}

class GetProfileStatusResponse extends $pb.GeneratedMessage {
  factory GetProfileStatusResponse({
    ProfileStatus? status,
    $core.int? profileRevision,
    $core.String? surveyResponseId,
    $1.Timestamp? generatedAt,
    $core.String? staleReason,
  }) {
    final $result = create();
    if (status != null) {
      $result.status = status;
    }
    if (profileRevision != null) {
      $result.profileRevision = profileRevision;
    }
    if (surveyResponseId != null) {
      $result.surveyResponseId = surveyResponseId;
    }
    if (generatedAt != null) {
      $result.generatedAt = generatedAt;
    }
    if (staleReason != null) {
      $result.staleReason = staleReason;
    }
    return $result;
  }
  GetProfileStatusResponse._() : super();
  factory GetProfileStatusResponse.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory GetProfileStatusResponse.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'GetProfileStatusResponse', package: const $pb.PackageName(_omitMessageNames ? '' : 'ontheblock.recommendation.v1'), createEmptyInstance: create)
    ..e<ProfileStatus>(1, _omitFieldNames ? '' : 'status', $pb.PbFieldType.OE, defaultOrMaker: ProfileStatus.PROFILE_STATUS_UNSPECIFIED, valueOf: ProfileStatus.valueOf, enumValues: ProfileStatus.values)
    ..a<$core.int>(2, _omitFieldNames ? '' : 'profileRevision', $pb.PbFieldType.O3)
    ..aOS(3, _omitFieldNames ? '' : 'surveyResponseId')
    ..aOM<$1.Timestamp>(4, _omitFieldNames ? '' : 'generatedAt', subBuilder: $1.Timestamp.create)
    ..aOS(5, _omitFieldNames ? '' : 'staleReason')
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  GetProfileStatusResponse clone() => GetProfileStatusResponse()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  GetProfileStatusResponse copyWith(void Function(GetProfileStatusResponse) updates) => super.copyWith((message) => updates(message as GetProfileStatusResponse)) as GetProfileStatusResponse;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static GetProfileStatusResponse create() => GetProfileStatusResponse._();
  GetProfileStatusResponse createEmptyInstance() => create();
  static $pb.PbList<GetProfileStatusResponse> createRepeated() => $pb.PbList<GetProfileStatusResponse>();
  @$core.pragma('dart2js:noInline')
  static GetProfileStatusResponse getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<GetProfileStatusResponse>(create);
  static GetProfileStatusResponse? _defaultInstance;

  @$pb.TagNumber(1)
  ProfileStatus get status => $_getN(0);
  @$pb.TagNumber(1)
  set status(ProfileStatus v) { setField(1, v); }
  @$pb.TagNumber(1)
  $core.bool hasStatus() => $_has(0);
  @$pb.TagNumber(1)
  void clearStatus() => clearField(1);

  @$pb.TagNumber(2)
  $core.int get profileRevision => $_getIZ(1);
  @$pb.TagNumber(2)
  set profileRevision($core.int v) { $_setSignedInt32(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasProfileRevision() => $_has(1);
  @$pb.TagNumber(2)
  void clearProfileRevision() => clearField(2);

  @$pb.TagNumber(3)
  $core.String get surveyResponseId => $_getSZ(2);
  @$pb.TagNumber(3)
  set surveyResponseId($core.String v) { $_setString(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasSurveyResponseId() => $_has(2);
  @$pb.TagNumber(3)
  void clearSurveyResponseId() => clearField(3);

  @$pb.TagNumber(4)
  $1.Timestamp get generatedAt => $_getN(3);
  @$pb.TagNumber(4)
  set generatedAt($1.Timestamp v) { setField(4, v); }
  @$pb.TagNumber(4)
  $core.bool hasGeneratedAt() => $_has(3);
  @$pb.TagNumber(4)
  void clearGeneratedAt() => clearField(4);
  @$pb.TagNumber(4)
  $1.Timestamp ensureGeneratedAt() => $_ensure(3);

  @$pb.TagNumber(5)
  $core.String get staleReason => $_getSZ(4);
  @$pb.TagNumber(5)
  set staleReason($core.String v) { $_setString(4, v); }
  @$pb.TagNumber(5)
  $core.bool hasStaleReason() => $_has(4);
  @$pb.TagNumber(5)
  void clearStaleReason() => clearField(5);
}

class GetBeverageRecommendationsRequest extends $pb.GeneratedMessage {
  factory GetBeverageRecommendationsRequest({
    $core.String? category,
    $core.int? limit,
    BudgetMode? budgetMode,
  }) {
    final $result = create();
    if (category != null) {
      $result.category = category;
    }
    if (limit != null) {
      $result.limit = limit;
    }
    if (budgetMode != null) {
      $result.budgetMode = budgetMode;
    }
    return $result;
  }
  GetBeverageRecommendationsRequest._() : super();
  factory GetBeverageRecommendationsRequest.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory GetBeverageRecommendationsRequest.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'GetBeverageRecommendationsRequest', package: const $pb.PackageName(_omitMessageNames ? '' : 'ontheblock.recommendation.v1'), createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'category')
    ..a<$core.int>(2, _omitFieldNames ? '' : 'limit', $pb.PbFieldType.O3)
    ..e<BudgetMode>(3, _omitFieldNames ? '' : 'budgetMode', $pb.PbFieldType.OE, defaultOrMaker: BudgetMode.BUDGET_MODE_UNSPECIFIED, valueOf: BudgetMode.valueOf, enumValues: BudgetMode.values)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  GetBeverageRecommendationsRequest clone() => GetBeverageRecommendationsRequest()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  GetBeverageRecommendationsRequest copyWith(void Function(GetBeverageRecommendationsRequest) updates) => super.copyWith((message) => updates(message as GetBeverageRecommendationsRequest)) as GetBeverageRecommendationsRequest;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static GetBeverageRecommendationsRequest create() => GetBeverageRecommendationsRequest._();
  GetBeverageRecommendationsRequest createEmptyInstance() => create();
  static $pb.PbList<GetBeverageRecommendationsRequest> createRepeated() => $pb.PbList<GetBeverageRecommendationsRequest>();
  @$core.pragma('dart2js:noInline')
  static GetBeverageRecommendationsRequest getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<GetBeverageRecommendationsRequest>(create);
  static GetBeverageRecommendationsRequest? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get category => $_getSZ(0);
  @$pb.TagNumber(1)
  set category($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasCategory() => $_has(0);
  @$pb.TagNumber(1)
  void clearCategory() => clearField(1);

  @$pb.TagNumber(2)
  $core.int get limit => $_getIZ(1);
  @$pb.TagNumber(2)
  set limit($core.int v) { $_setSignedInt32(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasLimit() => $_has(1);
  @$pb.TagNumber(2)
  void clearLimit() => clearField(2);

  @$pb.TagNumber(3)
  BudgetMode get budgetMode => $_getN(2);
  @$pb.TagNumber(3)
  set budgetMode(BudgetMode v) { setField(3, v); }
  @$pb.TagNumber(3)
  $core.bool hasBudgetMode() => $_has(2);
  @$pb.TagNumber(3)
  void clearBudgetMode() => clearField(3);
}

class BeverageRecommendation extends $pb.GeneratedMessage {
  factory BeverageRecommendation({
    $core.int? rank,
    $core.String? resultId,
    $core.String? beverageId,
    $core.String? nameKo,
    $core.String? nameEn,
    $core.String? category,
    $core.double? score,
    $core.Iterable<$core.String>? reasonCodes,
    $core.String? explanation,
    $2.Struct? metadata,
  }) {
    final $result = create();
    if (rank != null) {
      $result.rank = rank;
    }
    if (resultId != null) {
      $result.resultId = resultId;
    }
    if (beverageId != null) {
      $result.beverageId = beverageId;
    }
    if (nameKo != null) {
      $result.nameKo = nameKo;
    }
    if (nameEn != null) {
      $result.nameEn = nameEn;
    }
    if (category != null) {
      $result.category = category;
    }
    if (score != null) {
      $result.score = score;
    }
    if (reasonCodes != null) {
      $result.reasonCodes.addAll(reasonCodes);
    }
    if (explanation != null) {
      $result.explanation = explanation;
    }
    if (metadata != null) {
      $result.metadata = metadata;
    }
    return $result;
  }
  BeverageRecommendation._() : super();
  factory BeverageRecommendation.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory BeverageRecommendation.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'BeverageRecommendation', package: const $pb.PackageName(_omitMessageNames ? '' : 'ontheblock.recommendation.v1'), createEmptyInstance: create)
    ..a<$core.int>(1, _omitFieldNames ? '' : 'rank', $pb.PbFieldType.O3)
    ..aOS(2, _omitFieldNames ? '' : 'resultId')
    ..aOS(3, _omitFieldNames ? '' : 'beverageId')
    ..aOS(4, _omitFieldNames ? '' : 'nameKo')
    ..aOS(5, _omitFieldNames ? '' : 'nameEn')
    ..aOS(6, _omitFieldNames ? '' : 'category')
    ..a<$core.double>(7, _omitFieldNames ? '' : 'score', $pb.PbFieldType.OD)
    ..pPS(8, _omitFieldNames ? '' : 'reasonCodes')
    ..aOS(9, _omitFieldNames ? '' : 'explanation')
    ..aOM<$2.Struct>(10, _omitFieldNames ? '' : 'metadata', subBuilder: $2.Struct.create)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  BeverageRecommendation clone() => BeverageRecommendation()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  BeverageRecommendation copyWith(void Function(BeverageRecommendation) updates) => super.copyWith((message) => updates(message as BeverageRecommendation)) as BeverageRecommendation;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static BeverageRecommendation create() => BeverageRecommendation._();
  BeverageRecommendation createEmptyInstance() => create();
  static $pb.PbList<BeverageRecommendation> createRepeated() => $pb.PbList<BeverageRecommendation>();
  @$core.pragma('dart2js:noInline')
  static BeverageRecommendation getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<BeverageRecommendation>(create);
  static BeverageRecommendation? _defaultInstance;

  @$pb.TagNumber(1)
  $core.int get rank => $_getIZ(0);
  @$pb.TagNumber(1)
  set rank($core.int v) { $_setSignedInt32(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasRank() => $_has(0);
  @$pb.TagNumber(1)
  void clearRank() => clearField(1);

  @$pb.TagNumber(2)
  $core.String get resultId => $_getSZ(1);
  @$pb.TagNumber(2)
  set resultId($core.String v) { $_setString(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasResultId() => $_has(1);
  @$pb.TagNumber(2)
  void clearResultId() => clearField(2);

  @$pb.TagNumber(3)
  $core.String get beverageId => $_getSZ(2);
  @$pb.TagNumber(3)
  set beverageId($core.String v) { $_setString(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasBeverageId() => $_has(2);
  @$pb.TagNumber(3)
  void clearBeverageId() => clearField(3);

  @$pb.TagNumber(4)
  $core.String get nameKo => $_getSZ(3);
  @$pb.TagNumber(4)
  set nameKo($core.String v) { $_setString(3, v); }
  @$pb.TagNumber(4)
  $core.bool hasNameKo() => $_has(3);
  @$pb.TagNumber(4)
  void clearNameKo() => clearField(4);

  @$pb.TagNumber(5)
  $core.String get nameEn => $_getSZ(4);
  @$pb.TagNumber(5)
  set nameEn($core.String v) { $_setString(4, v); }
  @$pb.TagNumber(5)
  $core.bool hasNameEn() => $_has(4);
  @$pb.TagNumber(5)
  void clearNameEn() => clearField(5);

  @$pb.TagNumber(6)
  $core.String get category => $_getSZ(5);
  @$pb.TagNumber(6)
  set category($core.String v) { $_setString(5, v); }
  @$pb.TagNumber(6)
  $core.bool hasCategory() => $_has(5);
  @$pb.TagNumber(6)
  void clearCategory() => clearField(6);

  @$pb.TagNumber(7)
  $core.double get score => $_getN(6);
  @$pb.TagNumber(7)
  set score($core.double v) { $_setDouble(6, v); }
  @$pb.TagNumber(7)
  $core.bool hasScore() => $_has(6);
  @$pb.TagNumber(7)
  void clearScore() => clearField(7);

  @$pb.TagNumber(8)
  $core.List<$core.String> get reasonCodes => $_getList(7);

  @$pb.TagNumber(9)
  $core.String get explanation => $_getSZ(8);
  @$pb.TagNumber(9)
  set explanation($core.String v) { $_setString(8, v); }
  @$pb.TagNumber(9)
  $core.bool hasExplanation() => $_has(8);
  @$pb.TagNumber(9)
  void clearExplanation() => clearField(9);

  @$pb.TagNumber(10)
  $2.Struct get metadata => $_getN(9);
  @$pb.TagNumber(10)
  set metadata($2.Struct v) { setField(10, v); }
  @$pb.TagNumber(10)
  $core.bool hasMetadata() => $_has(9);
  @$pb.TagNumber(10)
  void clearMetadata() => clearField(10);
  @$pb.TagNumber(10)
  $2.Struct ensureMetadata() => $_ensure(9);
}

class GetBeverageRecommendationsResponse extends $pb.GeneratedMessage {
  factory GetBeverageRecommendationsResponse({
    $core.String? requestId,
    ProfileStatus? profileStatus,
    $core.int? profileRevision,
    $core.Iterable<BeverageRecommendation>? recommendations,
  }) {
    final $result = create();
    if (requestId != null) {
      $result.requestId = requestId;
    }
    if (profileStatus != null) {
      $result.profileStatus = profileStatus;
    }
    if (profileRevision != null) {
      $result.profileRevision = profileRevision;
    }
    if (recommendations != null) {
      $result.recommendations.addAll(recommendations);
    }
    return $result;
  }
  GetBeverageRecommendationsResponse._() : super();
  factory GetBeverageRecommendationsResponse.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory GetBeverageRecommendationsResponse.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'GetBeverageRecommendationsResponse', package: const $pb.PackageName(_omitMessageNames ? '' : 'ontheblock.recommendation.v1'), createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'requestId')
    ..e<ProfileStatus>(2, _omitFieldNames ? '' : 'profileStatus', $pb.PbFieldType.OE, defaultOrMaker: ProfileStatus.PROFILE_STATUS_UNSPECIFIED, valueOf: ProfileStatus.valueOf, enumValues: ProfileStatus.values)
    ..a<$core.int>(3, _omitFieldNames ? '' : 'profileRevision', $pb.PbFieldType.O3)
    ..pc<BeverageRecommendation>(4, _omitFieldNames ? '' : 'recommendations', $pb.PbFieldType.PM, subBuilder: BeverageRecommendation.create)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  GetBeverageRecommendationsResponse clone() => GetBeverageRecommendationsResponse()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  GetBeverageRecommendationsResponse copyWith(void Function(GetBeverageRecommendationsResponse) updates) => super.copyWith((message) => updates(message as GetBeverageRecommendationsResponse)) as GetBeverageRecommendationsResponse;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static GetBeverageRecommendationsResponse create() => GetBeverageRecommendationsResponse._();
  GetBeverageRecommendationsResponse createEmptyInstance() => create();
  static $pb.PbList<GetBeverageRecommendationsResponse> createRepeated() => $pb.PbList<GetBeverageRecommendationsResponse>();
  @$core.pragma('dart2js:noInline')
  static GetBeverageRecommendationsResponse getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<GetBeverageRecommendationsResponse>(create);
  static GetBeverageRecommendationsResponse? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get requestId => $_getSZ(0);
  @$pb.TagNumber(1)
  set requestId($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasRequestId() => $_has(0);
  @$pb.TagNumber(1)
  void clearRequestId() => clearField(1);

  @$pb.TagNumber(2)
  ProfileStatus get profileStatus => $_getN(1);
  @$pb.TagNumber(2)
  set profileStatus(ProfileStatus v) { setField(2, v); }
  @$pb.TagNumber(2)
  $core.bool hasProfileStatus() => $_has(1);
  @$pb.TagNumber(2)
  void clearProfileStatus() => clearField(2);

  @$pb.TagNumber(3)
  $core.int get profileRevision => $_getIZ(2);
  @$pb.TagNumber(3)
  set profileRevision($core.int v) { $_setSignedInt32(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasProfileRevision() => $_has(2);
  @$pb.TagNumber(3)
  void clearProfileRevision() => clearField(3);

  @$pb.TagNumber(4)
  $core.List<BeverageRecommendation> get recommendations => $_getList(3);
}

class GetVenueRecommendationsRequest extends $pb.GeneratedMessage {
  factory GetVenueRecommendationsRequest({
    $core.String? selectedBeverageId,
    $core.double? lat,
    $core.double? lng,
    $core.int? radiusM,
    $core.int? limit,
    BudgetMode? budgetMode,
  }) {
    final $result = create();
    if (selectedBeverageId != null) {
      $result.selectedBeverageId = selectedBeverageId;
    }
    if (lat != null) {
      $result.lat = lat;
    }
    if (lng != null) {
      $result.lng = lng;
    }
    if (radiusM != null) {
      $result.radiusM = radiusM;
    }
    if (limit != null) {
      $result.limit = limit;
    }
    if (budgetMode != null) {
      $result.budgetMode = budgetMode;
    }
    return $result;
  }
  GetVenueRecommendationsRequest._() : super();
  factory GetVenueRecommendationsRequest.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory GetVenueRecommendationsRequest.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'GetVenueRecommendationsRequest', package: const $pb.PackageName(_omitMessageNames ? '' : 'ontheblock.recommendation.v1'), createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'selectedBeverageId')
    ..a<$core.double>(2, _omitFieldNames ? '' : 'lat', $pb.PbFieldType.OD)
    ..a<$core.double>(3, _omitFieldNames ? '' : 'lng', $pb.PbFieldType.OD)
    ..a<$core.int>(4, _omitFieldNames ? '' : 'radiusM', $pb.PbFieldType.O3)
    ..a<$core.int>(5, _omitFieldNames ? '' : 'limit', $pb.PbFieldType.O3)
    ..e<BudgetMode>(6, _omitFieldNames ? '' : 'budgetMode', $pb.PbFieldType.OE, defaultOrMaker: BudgetMode.BUDGET_MODE_UNSPECIFIED, valueOf: BudgetMode.valueOf, enumValues: BudgetMode.values)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  GetVenueRecommendationsRequest clone() => GetVenueRecommendationsRequest()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  GetVenueRecommendationsRequest copyWith(void Function(GetVenueRecommendationsRequest) updates) => super.copyWith((message) => updates(message as GetVenueRecommendationsRequest)) as GetVenueRecommendationsRequest;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static GetVenueRecommendationsRequest create() => GetVenueRecommendationsRequest._();
  GetVenueRecommendationsRequest createEmptyInstance() => create();
  static $pb.PbList<GetVenueRecommendationsRequest> createRepeated() => $pb.PbList<GetVenueRecommendationsRequest>();
  @$core.pragma('dart2js:noInline')
  static GetVenueRecommendationsRequest getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<GetVenueRecommendationsRequest>(create);
  static GetVenueRecommendationsRequest? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get selectedBeverageId => $_getSZ(0);
  @$pb.TagNumber(1)
  set selectedBeverageId($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasSelectedBeverageId() => $_has(0);
  @$pb.TagNumber(1)
  void clearSelectedBeverageId() => clearField(1);

  @$pb.TagNumber(2)
  $core.double get lat => $_getN(1);
  @$pb.TagNumber(2)
  set lat($core.double v) { $_setDouble(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasLat() => $_has(1);
  @$pb.TagNumber(2)
  void clearLat() => clearField(2);

  @$pb.TagNumber(3)
  $core.double get lng => $_getN(2);
  @$pb.TagNumber(3)
  set lng($core.double v) { $_setDouble(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasLng() => $_has(2);
  @$pb.TagNumber(3)
  void clearLng() => clearField(3);

  @$pb.TagNumber(4)
  $core.int get radiusM => $_getIZ(3);
  @$pb.TagNumber(4)
  set radiusM($core.int v) { $_setSignedInt32(3, v); }
  @$pb.TagNumber(4)
  $core.bool hasRadiusM() => $_has(3);
  @$pb.TagNumber(4)
  void clearRadiusM() => clearField(4);

  @$pb.TagNumber(5)
  $core.int get limit => $_getIZ(4);
  @$pb.TagNumber(5)
  set limit($core.int v) { $_setSignedInt32(4, v); }
  @$pb.TagNumber(5)
  $core.bool hasLimit() => $_has(4);
  @$pb.TagNumber(5)
  void clearLimit() => clearField(5);

  @$pb.TagNumber(6)
  BudgetMode get budgetMode => $_getN(5);
  @$pb.TagNumber(6)
  set budgetMode(BudgetMode v) { setField(6, v); }
  @$pb.TagNumber(6)
  $core.bool hasBudgetMode() => $_has(5);
  @$pb.TagNumber(6)
  void clearBudgetMode() => clearField(6);
}

class VenueRecommendation extends $pb.GeneratedMessage {
  factory VenueRecommendation({
    $core.int? rank,
    $core.String? resultId,
    $core.String? placeId,
    $core.String? name,
    $core.String? placeType,
    $core.String? address,
    VenueOptionType? optionType,
    $core.double? distanceM,
    $core.int? priceKrw,
    VenueAvailabilityStatus? availabilityStatus,
    VenueFreshnessStatus? freshnessStatus,
    $core.double? score,
    $core.Iterable<$core.String>? reasonCodes,
    $core.String? explanation,
    $2.Struct? metadata,
  }) {
    final $result = create();
    if (rank != null) {
      $result.rank = rank;
    }
    if (resultId != null) {
      $result.resultId = resultId;
    }
    if (placeId != null) {
      $result.placeId = placeId;
    }
    if (name != null) {
      $result.name = name;
    }
    if (placeType != null) {
      $result.placeType = placeType;
    }
    if (address != null) {
      $result.address = address;
    }
    if (optionType != null) {
      $result.optionType = optionType;
    }
    if (distanceM != null) {
      $result.distanceM = distanceM;
    }
    if (priceKrw != null) {
      $result.priceKrw = priceKrw;
    }
    if (availabilityStatus != null) {
      $result.availabilityStatus = availabilityStatus;
    }
    if (freshnessStatus != null) {
      $result.freshnessStatus = freshnessStatus;
    }
    if (score != null) {
      $result.score = score;
    }
    if (reasonCodes != null) {
      $result.reasonCodes.addAll(reasonCodes);
    }
    if (explanation != null) {
      $result.explanation = explanation;
    }
    if (metadata != null) {
      $result.metadata = metadata;
    }
    return $result;
  }
  VenueRecommendation._() : super();
  factory VenueRecommendation.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory VenueRecommendation.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'VenueRecommendation', package: const $pb.PackageName(_omitMessageNames ? '' : 'ontheblock.recommendation.v1'), createEmptyInstance: create)
    ..a<$core.int>(1, _omitFieldNames ? '' : 'rank', $pb.PbFieldType.O3)
    ..aOS(2, _omitFieldNames ? '' : 'resultId')
    ..aOS(3, _omitFieldNames ? '' : 'placeId')
    ..aOS(4, _omitFieldNames ? '' : 'name')
    ..aOS(5, _omitFieldNames ? '' : 'placeType')
    ..aOS(6, _omitFieldNames ? '' : 'address')
    ..e<VenueOptionType>(7, _omitFieldNames ? '' : 'optionType', $pb.PbFieldType.OE, defaultOrMaker: VenueOptionType.VENUE_OPTION_TYPE_UNSPECIFIED, valueOf: VenueOptionType.valueOf, enumValues: VenueOptionType.values)
    ..a<$core.double>(8, _omitFieldNames ? '' : 'distanceM', $pb.PbFieldType.OD)
    ..a<$core.int>(9, _omitFieldNames ? '' : 'priceKrw', $pb.PbFieldType.O3)
    ..e<VenueAvailabilityStatus>(10, _omitFieldNames ? '' : 'availabilityStatus', $pb.PbFieldType.OE, defaultOrMaker: VenueAvailabilityStatus.VENUE_AVAILABILITY_STATUS_UNSPECIFIED, valueOf: VenueAvailabilityStatus.valueOf, enumValues: VenueAvailabilityStatus.values)
    ..e<VenueFreshnessStatus>(11, _omitFieldNames ? '' : 'freshnessStatus', $pb.PbFieldType.OE, defaultOrMaker: VenueFreshnessStatus.VENUE_FRESHNESS_STATUS_UNSPECIFIED, valueOf: VenueFreshnessStatus.valueOf, enumValues: VenueFreshnessStatus.values)
    ..a<$core.double>(12, _omitFieldNames ? '' : 'score', $pb.PbFieldType.OD)
    ..pPS(13, _omitFieldNames ? '' : 'reasonCodes')
    ..aOS(14, _omitFieldNames ? '' : 'explanation')
    ..aOM<$2.Struct>(15, _omitFieldNames ? '' : 'metadata', subBuilder: $2.Struct.create)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  VenueRecommendation clone() => VenueRecommendation()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  VenueRecommendation copyWith(void Function(VenueRecommendation) updates) => super.copyWith((message) => updates(message as VenueRecommendation)) as VenueRecommendation;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static VenueRecommendation create() => VenueRecommendation._();
  VenueRecommendation createEmptyInstance() => create();
  static $pb.PbList<VenueRecommendation> createRepeated() => $pb.PbList<VenueRecommendation>();
  @$core.pragma('dart2js:noInline')
  static VenueRecommendation getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<VenueRecommendation>(create);
  static VenueRecommendation? _defaultInstance;

  @$pb.TagNumber(1)
  $core.int get rank => $_getIZ(0);
  @$pb.TagNumber(1)
  set rank($core.int v) { $_setSignedInt32(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasRank() => $_has(0);
  @$pb.TagNumber(1)
  void clearRank() => clearField(1);

  @$pb.TagNumber(2)
  $core.String get resultId => $_getSZ(1);
  @$pb.TagNumber(2)
  set resultId($core.String v) { $_setString(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasResultId() => $_has(1);
  @$pb.TagNumber(2)
  void clearResultId() => clearField(2);

  @$pb.TagNumber(3)
  $core.String get placeId => $_getSZ(2);
  @$pb.TagNumber(3)
  set placeId($core.String v) { $_setString(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasPlaceId() => $_has(2);
  @$pb.TagNumber(3)
  void clearPlaceId() => clearField(3);

  @$pb.TagNumber(4)
  $core.String get name => $_getSZ(3);
  @$pb.TagNumber(4)
  set name($core.String v) { $_setString(3, v); }
  @$pb.TagNumber(4)
  $core.bool hasName() => $_has(3);
  @$pb.TagNumber(4)
  void clearName() => clearField(4);

  @$pb.TagNumber(5)
  $core.String get placeType => $_getSZ(4);
  @$pb.TagNumber(5)
  set placeType($core.String v) { $_setString(4, v); }
  @$pb.TagNumber(5)
  $core.bool hasPlaceType() => $_has(4);
  @$pb.TagNumber(5)
  void clearPlaceType() => clearField(5);

  @$pb.TagNumber(6)
  $core.String get address => $_getSZ(5);
  @$pb.TagNumber(6)
  set address($core.String v) { $_setString(5, v); }
  @$pb.TagNumber(6)
  $core.bool hasAddress() => $_has(5);
  @$pb.TagNumber(6)
  void clearAddress() => clearField(6);

  @$pb.TagNumber(7)
  VenueOptionType get optionType => $_getN(6);
  @$pb.TagNumber(7)
  set optionType(VenueOptionType v) { setField(7, v); }
  @$pb.TagNumber(7)
  $core.bool hasOptionType() => $_has(6);
  @$pb.TagNumber(7)
  void clearOptionType() => clearField(7);

  @$pb.TagNumber(8)
  $core.double get distanceM => $_getN(7);
  @$pb.TagNumber(8)
  set distanceM($core.double v) { $_setDouble(7, v); }
  @$pb.TagNumber(8)
  $core.bool hasDistanceM() => $_has(7);
  @$pb.TagNumber(8)
  void clearDistanceM() => clearField(8);

  @$pb.TagNumber(9)
  $core.int get priceKrw => $_getIZ(8);
  @$pb.TagNumber(9)
  set priceKrw($core.int v) { $_setSignedInt32(8, v); }
  @$pb.TagNumber(9)
  $core.bool hasPriceKrw() => $_has(8);
  @$pb.TagNumber(9)
  void clearPriceKrw() => clearField(9);

  @$pb.TagNumber(10)
  VenueAvailabilityStatus get availabilityStatus => $_getN(9);
  @$pb.TagNumber(10)
  set availabilityStatus(VenueAvailabilityStatus v) { setField(10, v); }
  @$pb.TagNumber(10)
  $core.bool hasAvailabilityStatus() => $_has(9);
  @$pb.TagNumber(10)
  void clearAvailabilityStatus() => clearField(10);

  @$pb.TagNumber(11)
  VenueFreshnessStatus get freshnessStatus => $_getN(10);
  @$pb.TagNumber(11)
  set freshnessStatus(VenueFreshnessStatus v) { setField(11, v); }
  @$pb.TagNumber(11)
  $core.bool hasFreshnessStatus() => $_has(10);
  @$pb.TagNumber(11)
  void clearFreshnessStatus() => clearField(11);

  @$pb.TagNumber(12)
  $core.double get score => $_getN(11);
  @$pb.TagNumber(12)
  set score($core.double v) { $_setDouble(11, v); }
  @$pb.TagNumber(12)
  $core.bool hasScore() => $_has(11);
  @$pb.TagNumber(12)
  void clearScore() => clearField(12);

  @$pb.TagNumber(13)
  $core.List<$core.String> get reasonCodes => $_getList(12);

  @$pb.TagNumber(14)
  $core.String get explanation => $_getSZ(13);
  @$pb.TagNumber(14)
  set explanation($core.String v) { $_setString(13, v); }
  @$pb.TagNumber(14)
  $core.bool hasExplanation() => $_has(13);
  @$pb.TagNumber(14)
  void clearExplanation() => clearField(14);

  @$pb.TagNumber(15)
  $2.Struct get metadata => $_getN(14);
  @$pb.TagNumber(15)
  set metadata($2.Struct v) { setField(15, v); }
  @$pb.TagNumber(15)
  $core.bool hasMetadata() => $_has(14);
  @$pb.TagNumber(15)
  void clearMetadata() => clearField(15);
  @$pb.TagNumber(15)
  $2.Struct ensureMetadata() => $_ensure(14);
}

class GetVenueRecommendationsResponse extends $pb.GeneratedMessage {
  factory GetVenueRecommendationsResponse({
    $core.String? requestId,
    ProfileStatus? profileStatus,
    $core.int? profileRevision,
    $core.Iterable<VenueRecommendation>? recommendations,
  }) {
    final $result = create();
    if (requestId != null) {
      $result.requestId = requestId;
    }
    if (profileStatus != null) {
      $result.profileStatus = profileStatus;
    }
    if (profileRevision != null) {
      $result.profileRevision = profileRevision;
    }
    if (recommendations != null) {
      $result.recommendations.addAll(recommendations);
    }
    return $result;
  }
  GetVenueRecommendationsResponse._() : super();
  factory GetVenueRecommendationsResponse.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory GetVenueRecommendationsResponse.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'GetVenueRecommendationsResponse', package: const $pb.PackageName(_omitMessageNames ? '' : 'ontheblock.recommendation.v1'), createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'requestId')
    ..e<ProfileStatus>(2, _omitFieldNames ? '' : 'profileStatus', $pb.PbFieldType.OE, defaultOrMaker: ProfileStatus.PROFILE_STATUS_UNSPECIFIED, valueOf: ProfileStatus.valueOf, enumValues: ProfileStatus.values)
    ..a<$core.int>(3, _omitFieldNames ? '' : 'profileRevision', $pb.PbFieldType.O3)
    ..pc<VenueRecommendation>(4, _omitFieldNames ? '' : 'recommendations', $pb.PbFieldType.PM, subBuilder: VenueRecommendation.create)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  GetVenueRecommendationsResponse clone() => GetVenueRecommendationsResponse()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  GetVenueRecommendationsResponse copyWith(void Function(GetVenueRecommendationsResponse) updates) => super.copyWith((message) => updates(message as GetVenueRecommendationsResponse)) as GetVenueRecommendationsResponse;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static GetVenueRecommendationsResponse create() => GetVenueRecommendationsResponse._();
  GetVenueRecommendationsResponse createEmptyInstance() => create();
  static $pb.PbList<GetVenueRecommendationsResponse> createRepeated() => $pb.PbList<GetVenueRecommendationsResponse>();
  @$core.pragma('dart2js:noInline')
  static GetVenueRecommendationsResponse getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<GetVenueRecommendationsResponse>(create);
  static GetVenueRecommendationsResponse? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get requestId => $_getSZ(0);
  @$pb.TagNumber(1)
  set requestId($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasRequestId() => $_has(0);
  @$pb.TagNumber(1)
  void clearRequestId() => clearField(1);

  @$pb.TagNumber(2)
  ProfileStatus get profileStatus => $_getN(1);
  @$pb.TagNumber(2)
  set profileStatus(ProfileStatus v) { setField(2, v); }
  @$pb.TagNumber(2)
  $core.bool hasProfileStatus() => $_has(1);
  @$pb.TagNumber(2)
  void clearProfileStatus() => clearField(2);

  @$pb.TagNumber(3)
  $core.int get profileRevision => $_getIZ(2);
  @$pb.TagNumber(3)
  set profileRevision($core.int v) { $_setSignedInt32(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasProfileRevision() => $_has(2);
  @$pb.TagNumber(3)
  void clearProfileRevision() => clearField(3);

  @$pb.TagNumber(4)
  $core.List<VenueRecommendation> get recommendations => $_getList(3);
}

class RecordRecommendationEventRequest extends $pb.GeneratedMessage {
  factory RecordRecommendationEventRequest({
    $core.String? requestId,
    $core.String? resultId,
    RecommendationEventType? eventType,
    $core.String? idempotencyKey,
    $2.Struct? metadata,
  }) {
    final $result = create();
    if (requestId != null) {
      $result.requestId = requestId;
    }
    if (resultId != null) {
      $result.resultId = resultId;
    }
    if (eventType != null) {
      $result.eventType = eventType;
    }
    if (idempotencyKey != null) {
      $result.idempotencyKey = idempotencyKey;
    }
    if (metadata != null) {
      $result.metadata = metadata;
    }
    return $result;
  }
  RecordRecommendationEventRequest._() : super();
  factory RecordRecommendationEventRequest.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory RecordRecommendationEventRequest.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'RecordRecommendationEventRequest', package: const $pb.PackageName(_omitMessageNames ? '' : 'ontheblock.recommendation.v1'), createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'requestId')
    ..aOS(2, _omitFieldNames ? '' : 'resultId')
    ..e<RecommendationEventType>(3, _omitFieldNames ? '' : 'eventType', $pb.PbFieldType.OE, defaultOrMaker: RecommendationEventType.RECOMMENDATION_EVENT_TYPE_UNSPECIFIED, valueOf: RecommendationEventType.valueOf, enumValues: RecommendationEventType.values)
    ..aOS(4, _omitFieldNames ? '' : 'idempotencyKey')
    ..aOM<$2.Struct>(5, _omitFieldNames ? '' : 'metadata', subBuilder: $2.Struct.create)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  RecordRecommendationEventRequest clone() => RecordRecommendationEventRequest()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  RecordRecommendationEventRequest copyWith(void Function(RecordRecommendationEventRequest) updates) => super.copyWith((message) => updates(message as RecordRecommendationEventRequest)) as RecordRecommendationEventRequest;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static RecordRecommendationEventRequest create() => RecordRecommendationEventRequest._();
  RecordRecommendationEventRequest createEmptyInstance() => create();
  static $pb.PbList<RecordRecommendationEventRequest> createRepeated() => $pb.PbList<RecordRecommendationEventRequest>();
  @$core.pragma('dart2js:noInline')
  static RecordRecommendationEventRequest getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<RecordRecommendationEventRequest>(create);
  static RecordRecommendationEventRequest? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get requestId => $_getSZ(0);
  @$pb.TagNumber(1)
  set requestId($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasRequestId() => $_has(0);
  @$pb.TagNumber(1)
  void clearRequestId() => clearField(1);

  @$pb.TagNumber(2)
  $core.String get resultId => $_getSZ(1);
  @$pb.TagNumber(2)
  set resultId($core.String v) { $_setString(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasResultId() => $_has(1);
  @$pb.TagNumber(2)
  void clearResultId() => clearField(2);

  @$pb.TagNumber(3)
  RecommendationEventType get eventType => $_getN(2);
  @$pb.TagNumber(3)
  set eventType(RecommendationEventType v) { setField(3, v); }
  @$pb.TagNumber(3)
  $core.bool hasEventType() => $_has(2);
  @$pb.TagNumber(3)
  void clearEventType() => clearField(3);

  @$pb.TagNumber(4)
  $core.String get idempotencyKey => $_getSZ(3);
  @$pb.TagNumber(4)
  set idempotencyKey($core.String v) { $_setString(3, v); }
  @$pb.TagNumber(4)
  $core.bool hasIdempotencyKey() => $_has(3);
  @$pb.TagNumber(4)
  void clearIdempotencyKey() => clearField(4);

  @$pb.TagNumber(5)
  $2.Struct get metadata => $_getN(4);
  @$pb.TagNumber(5)
  set metadata($2.Struct v) { setField(5, v); }
  @$pb.TagNumber(5)
  $core.bool hasMetadata() => $_has(4);
  @$pb.TagNumber(5)
  void clearMetadata() => clearField(5);
  @$pb.TagNumber(5)
  $2.Struct ensureMetadata() => $_ensure(4);
}

class RecordRecommendationEventResponse extends $pb.GeneratedMessage {
  factory RecordRecommendationEventResponse({
    $core.String? interactionId,
    $core.bool? duplicate,
  }) {
    final $result = create();
    if (interactionId != null) {
      $result.interactionId = interactionId;
    }
    if (duplicate != null) {
      $result.duplicate = duplicate;
    }
    return $result;
  }
  RecordRecommendationEventResponse._() : super();
  factory RecordRecommendationEventResponse.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory RecordRecommendationEventResponse.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'RecordRecommendationEventResponse', package: const $pb.PackageName(_omitMessageNames ? '' : 'ontheblock.recommendation.v1'), createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'interactionId')
    ..aOB(2, _omitFieldNames ? '' : 'duplicate')
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  RecordRecommendationEventResponse clone() => RecordRecommendationEventResponse()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  RecordRecommendationEventResponse copyWith(void Function(RecordRecommendationEventResponse) updates) => super.copyWith((message) => updates(message as RecordRecommendationEventResponse)) as RecordRecommendationEventResponse;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static RecordRecommendationEventResponse create() => RecordRecommendationEventResponse._();
  RecordRecommendationEventResponse createEmptyInstance() => create();
  static $pb.PbList<RecordRecommendationEventResponse> createRepeated() => $pb.PbList<RecordRecommendationEventResponse>();
  @$core.pragma('dart2js:noInline')
  static RecordRecommendationEventResponse getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<RecordRecommendationEventResponse>(create);
  static RecordRecommendationEventResponse? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get interactionId => $_getSZ(0);
  @$pb.TagNumber(1)
  set interactionId($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasInteractionId() => $_has(0);
  @$pb.TagNumber(1)
  void clearInteractionId() => clearField(1);

  @$pb.TagNumber(2)
  $core.bool get duplicate => $_getBF(1);
  @$pb.TagNumber(2)
  set duplicate($core.bool v) { $_setBool(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasDuplicate() => $_has(1);
  @$pb.TagNumber(2)
  void clearDuplicate() => clearField(2);
}


const _omitFieldNames = $core.bool.fromEnvironment('protobuf.omit_field_names');
const _omitMessageNames = $core.bool.fromEnvironment('protobuf.omit_message_names');
