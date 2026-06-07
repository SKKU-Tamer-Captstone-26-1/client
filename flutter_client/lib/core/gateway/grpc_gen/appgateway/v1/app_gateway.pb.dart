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

import '../../google/protobuf/struct.pb.dart' as $1;
import '../../google/protobuf/timestamp.pb.dart' as $2;
import 'app_gateway.pbenum.dart';

export 'app_gateway.pbenum.dart';

class GetMeRequest extends $pb.GeneratedMessage {
  factory GetMeRequest() => create();
  GetMeRequest._() : super();
  factory GetMeRequest.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory GetMeRequest.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'GetMeRequest',
      package: const $pb.PackageName(
          _omitMessageNames ? '' : 'ontheblock.appgateway.v1'),
      createEmptyInstance: create)
    ..hasRequiredFields = false;

  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  GetMeRequest clone() => GetMeRequest()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  GetMeRequest copyWith(void Function(GetMeRequest) updates) =>
      super.copyWith((message) => updates(message as GetMeRequest))
          as GetMeRequest;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static GetMeRequest create() => GetMeRequest._();
  GetMeRequest createEmptyInstance() => create();
  static $pb.PbList<GetMeRequest> createRepeated() =>
      $pb.PbList<GetMeRequest>();
  @$core.pragma('dart2js:noInline')
  static GetMeRequest getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<GetMeRequest>(create);
  static GetMeRequest? _defaultInstance;
}

class GetMeResponse extends $pb.GeneratedMessage {
  factory GetMeResponse({
    $core.String? userId,
    $core.String? displayName,
    $core.String? email,
    $core.bool? authenticated,
    $1.Struct? claims,
  }) {
    final $result = create();
    if (userId != null) {
      $result.userId = userId;
    }
    if (displayName != null) {
      $result.displayName = displayName;
    }
    if (email != null) {
      $result.email = email;
    }
    if (authenticated != null) {
      $result.authenticated = authenticated;
    }
    if (claims != null) {
      $result.claims = claims;
    }
    return $result;
  }
  GetMeResponse._() : super();
  factory GetMeResponse.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory GetMeResponse.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'GetMeResponse',
      package: const $pb.PackageName(
          _omitMessageNames ? '' : 'ontheblock.appgateway.v1'),
      createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'userId')
    ..aOS(2, _omitFieldNames ? '' : 'displayName')
    ..aOS(3, _omitFieldNames ? '' : 'email')
    ..aOB(4, _omitFieldNames ? '' : 'authenticated')
    ..aOM<$1.Struct>(20, _omitFieldNames ? '' : 'claims',
        subBuilder: $1.Struct.create)
    ..hasRequiredFields = false;

  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  GetMeResponse clone() => GetMeResponse()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  GetMeResponse copyWith(void Function(GetMeResponse) updates) =>
      super.copyWith((message) => updates(message as GetMeResponse))
          as GetMeResponse;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static GetMeResponse create() => GetMeResponse._();
  GetMeResponse createEmptyInstance() => create();
  static $pb.PbList<GetMeResponse> createRepeated() =>
      $pb.PbList<GetMeResponse>();
  @$core.pragma('dart2js:noInline')
  static GetMeResponse getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<GetMeResponse>(create);
  static GetMeResponse? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get userId => $_getSZ(0);
  @$pb.TagNumber(1)
  set userId($core.String v) {
    $_setString(0, v);
  }

  @$pb.TagNumber(1)
  $core.bool hasUserId() => $_has(0);
  @$pb.TagNumber(1)
  void clearUserId() => clearField(1);

  @$pb.TagNumber(2)
  $core.String get displayName => $_getSZ(1);
  @$pb.TagNumber(2)
  set displayName($core.String v) {
    $_setString(1, v);
  }

  @$pb.TagNumber(2)
  $core.bool hasDisplayName() => $_has(1);
  @$pb.TagNumber(2)
  void clearDisplayName() => clearField(2);

  @$pb.TagNumber(3)
  $core.String get email => $_getSZ(2);
  @$pb.TagNumber(3)
  set email($core.String v) {
    $_setString(2, v);
  }

  @$pb.TagNumber(3)
  $core.bool hasEmail() => $_has(2);
  @$pb.TagNumber(3)
  void clearEmail() => clearField(3);

  @$pb.TagNumber(4)
  $core.bool get authenticated => $_getBF(3);
  @$pb.TagNumber(4)
  set authenticated($core.bool v) {
    $_setBool(3, v);
  }

  @$pb.TagNumber(4)
  $core.bool hasAuthenticated() => $_has(3);
  @$pb.TagNumber(4)
  void clearAuthenticated() => clearField(4);

  @$pb.TagNumber(20)
  $1.Struct get claims => $_getN(4);
  @$pb.TagNumber(20)
  set claims($1.Struct v) {
    setField(20, v);
  }

  @$pb.TagNumber(20)
  $core.bool hasClaims() => $_has(4);
  @$pb.TagNumber(20)
  void clearClaims() => clearField(20);
  @$pb.TagNumber(20)
  $1.Struct ensureClaims() => $_ensure(4);
}

class SendChatbotMessageRequest extends $pb.GeneratedMessage {
  factory SendChatbotMessageRequest({
    $core.String? clientMessageId,
    $core.String? conversationId,
    $core.String? message,
    ScreenContext? screenContext,
    $core.double? lat,
    $core.double? lng,
    $core.int? radiusM,
    $core.String? selectedBeverageId,
    $core.String? category,
    $core.int? beverageLimit,
    $core.int? venueLimit,
    BudgetMode? budgetMode,
    $1.Struct? clientContext,
  }) {
    final $result = create();
    if (clientMessageId != null) {
      $result.clientMessageId = clientMessageId;
    }
    if (conversationId != null) {
      $result.conversationId = conversationId;
    }
    if (message != null) {
      $result.message = message;
    }
    if (screenContext != null) {
      $result.screenContext = screenContext;
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
    if (selectedBeverageId != null) {
      $result.selectedBeverageId = selectedBeverageId;
    }
    if (category != null) {
      $result.category = category;
    }
    if (beverageLimit != null) {
      $result.beverageLimit = beverageLimit;
    }
    if (venueLimit != null) {
      $result.venueLimit = venueLimit;
    }
    if (budgetMode != null) {
      $result.budgetMode = budgetMode;
    }
    if (clientContext != null) {
      $result.clientContext = clientContext;
    }
    return $result;
  }
  SendChatbotMessageRequest._() : super();
  factory SendChatbotMessageRequest.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory SendChatbotMessageRequest.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'SendChatbotMessageRequest',
      package: const $pb.PackageName(
          _omitMessageNames ? '' : 'ontheblock.appgateway.v1'),
      createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'clientMessageId')
    ..aOS(2, _omitFieldNames ? '' : 'conversationId')
    ..aOS(3, _omitFieldNames ? '' : 'message')
    ..e<ScreenContext>(
        4, _omitFieldNames ? '' : 'screenContext', $pb.PbFieldType.OE,
        defaultOrMaker: ScreenContext.SCREEN_CONTEXT_UNSPECIFIED,
        valueOf: ScreenContext.valueOf,
        enumValues: ScreenContext.values)
    ..a<$core.double>(5, _omitFieldNames ? '' : 'lat', $pb.PbFieldType.OD)
    ..a<$core.double>(6, _omitFieldNames ? '' : 'lng', $pb.PbFieldType.OD)
    ..a<$core.int>(7, _omitFieldNames ? '' : 'radiusM', $pb.PbFieldType.O3)
    ..aOS(8, _omitFieldNames ? '' : 'selectedBeverageId')
    ..aOS(9, _omitFieldNames ? '' : 'category')
    ..a<$core.int>(
        10, _omitFieldNames ? '' : 'beverageLimit', $pb.PbFieldType.O3)
    ..a<$core.int>(11, _omitFieldNames ? '' : 'venueLimit', $pb.PbFieldType.O3)
    ..e<BudgetMode>(12, _omitFieldNames ? '' : 'budgetMode', $pb.PbFieldType.OE,
        defaultOrMaker: BudgetMode.BUDGET_MODE_UNSPECIFIED,
        valueOf: BudgetMode.valueOf,
        enumValues: BudgetMode.values)
    ..aOM<$1.Struct>(13, _omitFieldNames ? '' : 'clientContext',
        subBuilder: $1.Struct.create)
    ..hasRequiredFields = false;

  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  SendChatbotMessageRequest clone() =>
      SendChatbotMessageRequest()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  SendChatbotMessageRequest copyWith(
          void Function(SendChatbotMessageRequest) updates) =>
      super.copyWith((message) => updates(message as SendChatbotMessageRequest))
          as SendChatbotMessageRequest;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static SendChatbotMessageRequest create() => SendChatbotMessageRequest._();
  SendChatbotMessageRequest createEmptyInstance() => create();
  static $pb.PbList<SendChatbotMessageRequest> createRepeated() =>
      $pb.PbList<SendChatbotMessageRequest>();
  @$core.pragma('dart2js:noInline')
  static SendChatbotMessageRequest getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<SendChatbotMessageRequest>(create);
  static SendChatbotMessageRequest? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get clientMessageId => $_getSZ(0);
  @$pb.TagNumber(1)
  set clientMessageId($core.String v) {
    $_setString(0, v);
  }

  @$pb.TagNumber(1)
  $core.bool hasClientMessageId() => $_has(0);
  @$pb.TagNumber(1)
  void clearClientMessageId() => clearField(1);

  @$pb.TagNumber(2)
  $core.String get conversationId => $_getSZ(1);
  @$pb.TagNumber(2)
  set conversationId($core.String v) {
    $_setString(1, v);
  }

  @$pb.TagNumber(2)
  $core.bool hasConversationId() => $_has(1);
  @$pb.TagNumber(2)
  void clearConversationId() => clearField(2);

  @$pb.TagNumber(3)
  $core.String get message => $_getSZ(2);
  @$pb.TagNumber(3)
  set message($core.String v) {
    $_setString(2, v);
  }

  @$pb.TagNumber(3)
  $core.bool hasMessage() => $_has(2);
  @$pb.TagNumber(3)
  void clearMessage() => clearField(3);

  @$pb.TagNumber(4)
  ScreenContext get screenContext => $_getN(3);
  @$pb.TagNumber(4)
  set screenContext(ScreenContext v) {
    setField(4, v);
  }

  @$pb.TagNumber(4)
  $core.bool hasScreenContext() => $_has(3);
  @$pb.TagNumber(4)
  void clearScreenContext() => clearField(4);

  @$pb.TagNumber(5)
  $core.double get lat => $_getN(4);
  @$pb.TagNumber(5)
  set lat($core.double v) {
    $_setDouble(4, v);
  }

  @$pb.TagNumber(5)
  $core.bool hasLat() => $_has(4);
  @$pb.TagNumber(5)
  void clearLat() => clearField(5);

  @$pb.TagNumber(6)
  $core.double get lng => $_getN(5);
  @$pb.TagNumber(6)
  set lng($core.double v) {
    $_setDouble(5, v);
  }

  @$pb.TagNumber(6)
  $core.bool hasLng() => $_has(5);
  @$pb.TagNumber(6)
  void clearLng() => clearField(6);

  @$pb.TagNumber(7)
  $core.int get radiusM => $_getIZ(6);
  @$pb.TagNumber(7)
  set radiusM($core.int v) {
    $_setSignedInt32(6, v);
  }

  @$pb.TagNumber(7)
  $core.bool hasRadiusM() => $_has(6);
  @$pb.TagNumber(7)
  void clearRadiusM() => clearField(7);

  @$pb.TagNumber(8)
  $core.String get selectedBeverageId => $_getSZ(7);
  @$pb.TagNumber(8)
  set selectedBeverageId($core.String v) {
    $_setString(7, v);
  }

  @$pb.TagNumber(8)
  $core.bool hasSelectedBeverageId() => $_has(7);
  @$pb.TagNumber(8)
  void clearSelectedBeverageId() => clearField(8);

  @$pb.TagNumber(9)
  $core.String get category => $_getSZ(8);
  @$pb.TagNumber(9)
  set category($core.String v) {
    $_setString(8, v);
  }

  @$pb.TagNumber(9)
  $core.bool hasCategory() => $_has(8);
  @$pb.TagNumber(9)
  void clearCategory() => clearField(9);

  @$pb.TagNumber(10)
  $core.int get beverageLimit => $_getIZ(9);
  @$pb.TagNumber(10)
  set beverageLimit($core.int v) {
    $_setSignedInt32(9, v);
  }

  @$pb.TagNumber(10)
  $core.bool hasBeverageLimit() => $_has(9);
  @$pb.TagNumber(10)
  void clearBeverageLimit() => clearField(10);

  @$pb.TagNumber(11)
  $core.int get venueLimit => $_getIZ(10);
  @$pb.TagNumber(11)
  set venueLimit($core.int v) {
    $_setSignedInt32(10, v);
  }

  @$pb.TagNumber(11)
  $core.bool hasVenueLimit() => $_has(10);
  @$pb.TagNumber(11)
  void clearVenueLimit() => clearField(11);

  @$pb.TagNumber(12)
  BudgetMode get budgetMode => $_getN(11);
  @$pb.TagNumber(12)
  set budgetMode(BudgetMode v) {
    setField(12, v);
  }

  @$pb.TagNumber(12)
  $core.bool hasBudgetMode() => $_has(11);
  @$pb.TagNumber(12)
  void clearBudgetMode() => clearField(12);

  @$pb.TagNumber(13)
  $1.Struct get clientContext => $_getN(12);
  @$pb.TagNumber(13)
  set clientContext($1.Struct v) {
    setField(13, v);
  }

  @$pb.TagNumber(13)
  $core.bool hasClientContext() => $_has(12);
  @$pb.TagNumber(13)
  void clearClientContext() => clearField(13);
  @$pb.TagNumber(13)
  $1.Struct ensureClientContext() => $_ensure(12);
}

class SendChatbotMessageResponse extends $pb.GeneratedMessage {
  factory SendChatbotMessageResponse({
    $core.String? conversationId,
    $core.String? assistantMessageId,
    $core.String? message,
    $core.Iterable<RecommendationReference>? recommendationRefs,
    $core.Iterable<VenueReference>? venueRefs,
    $core.String? fallbackReason,
    $1.Struct? servicePayload,
  }) {
    final $result = create();
    if (conversationId != null) {
      $result.conversationId = conversationId;
    }
    if (assistantMessageId != null) {
      $result.assistantMessageId = assistantMessageId;
    }
    if (message != null) {
      $result.message = message;
    }
    if (recommendationRefs != null) {
      $result.recommendationRefs.addAll(recommendationRefs);
    }
    if (venueRefs != null) {
      $result.venueRefs.addAll(venueRefs);
    }
    if (fallbackReason != null) {
      $result.fallbackReason = fallbackReason;
    }
    if (servicePayload != null) {
      $result.servicePayload = servicePayload;
    }
    return $result;
  }
  SendChatbotMessageResponse._() : super();
  factory SendChatbotMessageResponse.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory SendChatbotMessageResponse.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'SendChatbotMessageResponse',
      package: const $pb.PackageName(
          _omitMessageNames ? '' : 'ontheblock.appgateway.v1'),
      createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'conversationId')
    ..aOS(2, _omitFieldNames ? '' : 'assistantMessageId')
    ..aOS(3, _omitFieldNames ? '' : 'message')
    ..pc<RecommendationReference>(
        4, _omitFieldNames ? '' : 'recommendationRefs', $pb.PbFieldType.PM,
        subBuilder: RecommendationReference.create)
    ..pc<VenueReference>(
        5, _omitFieldNames ? '' : 'venueRefs', $pb.PbFieldType.PM,
        subBuilder: VenueReference.create)
    ..aOS(6, _omitFieldNames ? '' : 'fallbackReason')
    ..aOM<$1.Struct>(20, _omitFieldNames ? '' : 'servicePayload',
        subBuilder: $1.Struct.create)
    ..hasRequiredFields = false;

  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  SendChatbotMessageResponse clone() =>
      SendChatbotMessageResponse()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  SendChatbotMessageResponse copyWith(
          void Function(SendChatbotMessageResponse) updates) =>
      super.copyWith(
              (message) => updates(message as SendChatbotMessageResponse))
          as SendChatbotMessageResponse;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static SendChatbotMessageResponse create() => SendChatbotMessageResponse._();
  SendChatbotMessageResponse createEmptyInstance() => create();
  static $pb.PbList<SendChatbotMessageResponse> createRepeated() =>
      $pb.PbList<SendChatbotMessageResponse>();
  @$core.pragma('dart2js:noInline')
  static SendChatbotMessageResponse getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<SendChatbotMessageResponse>(create);
  static SendChatbotMessageResponse? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get conversationId => $_getSZ(0);
  @$pb.TagNumber(1)
  set conversationId($core.String v) {
    $_setString(0, v);
  }

  @$pb.TagNumber(1)
  $core.bool hasConversationId() => $_has(0);
  @$pb.TagNumber(1)
  void clearConversationId() => clearField(1);

  @$pb.TagNumber(2)
  $core.String get assistantMessageId => $_getSZ(1);
  @$pb.TagNumber(2)
  set assistantMessageId($core.String v) {
    $_setString(1, v);
  }

  @$pb.TagNumber(2)
  $core.bool hasAssistantMessageId() => $_has(1);
  @$pb.TagNumber(2)
  void clearAssistantMessageId() => clearField(2);

  @$pb.TagNumber(3)
  $core.String get message => $_getSZ(2);
  @$pb.TagNumber(3)
  set message($core.String v) {
    $_setString(2, v);
  }

  @$pb.TagNumber(3)
  $core.bool hasMessage() => $_has(2);
  @$pb.TagNumber(3)
  void clearMessage() => clearField(3);

  @$pb.TagNumber(4)
  $core.List<RecommendationReference> get recommendationRefs => $_getList(3);

  @$pb.TagNumber(5)
  $core.List<VenueReference> get venueRefs => $_getList(4);

  @$pb.TagNumber(6)
  $core.String get fallbackReason => $_getSZ(5);
  @$pb.TagNumber(6)
  set fallbackReason($core.String v) {
    $_setString(5, v);
  }

  @$pb.TagNumber(6)
  $core.bool hasFallbackReason() => $_has(5);
  @$pb.TagNumber(6)
  void clearFallbackReason() => clearField(6);

  @$pb.TagNumber(20)
  $1.Struct get servicePayload => $_getN(6);
  @$pb.TagNumber(20)
  set servicePayload($1.Struct v) {
    setField(20, v);
  }

  @$pb.TagNumber(20)
  $core.bool hasServicePayload() => $_has(6);
  @$pb.TagNumber(20)
  void clearServicePayload() => clearField(20);
  @$pb.TagNumber(20)
  $1.Struct ensureServicePayload() => $_ensure(6);
}

class GetChatbotConversationRequest extends $pb.GeneratedMessage {
  factory GetChatbotConversationRequest({
    $core.String? conversationId,
    $core.int? pageSize,
    $core.String? pageToken,
  }) {
    final $result = create();
    if (conversationId != null) {
      $result.conversationId = conversationId;
    }
    if (pageSize != null) {
      $result.pageSize = pageSize;
    }
    if (pageToken != null) {
      $result.pageToken = pageToken;
    }
    return $result;
  }
  GetChatbotConversationRequest._() : super();
  factory GetChatbotConversationRequest.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory GetChatbotConversationRequest.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'GetChatbotConversationRequest',
      package: const $pb.PackageName(
          _omitMessageNames ? '' : 'ontheblock.appgateway.v1'),
      createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'conversationId')
    ..a<$core.int>(2, _omitFieldNames ? '' : 'pageSize', $pb.PbFieldType.O3)
    ..aOS(3, _omitFieldNames ? '' : 'pageToken')
    ..hasRequiredFields = false;

  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  GetChatbotConversationRequest clone() =>
      GetChatbotConversationRequest()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  GetChatbotConversationRequest copyWith(
          void Function(GetChatbotConversationRequest) updates) =>
      super.copyWith(
              (message) => updates(message as GetChatbotConversationRequest))
          as GetChatbotConversationRequest;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static GetChatbotConversationRequest create() =>
      GetChatbotConversationRequest._();
  GetChatbotConversationRequest createEmptyInstance() => create();
  static $pb.PbList<GetChatbotConversationRequest> createRepeated() =>
      $pb.PbList<GetChatbotConversationRequest>();
  @$core.pragma('dart2js:noInline')
  static GetChatbotConversationRequest getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<GetChatbotConversationRequest>(create);
  static GetChatbotConversationRequest? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get conversationId => $_getSZ(0);
  @$pb.TagNumber(1)
  set conversationId($core.String v) {
    $_setString(0, v);
  }

  @$pb.TagNumber(1)
  $core.bool hasConversationId() => $_has(0);
  @$pb.TagNumber(1)
  void clearConversationId() => clearField(1);

  @$pb.TagNumber(2)
  $core.int get pageSize => $_getIZ(1);
  @$pb.TagNumber(2)
  set pageSize($core.int v) {
    $_setSignedInt32(1, v);
  }

  @$pb.TagNumber(2)
  $core.bool hasPageSize() => $_has(1);
  @$pb.TagNumber(2)
  void clearPageSize() => clearField(2);

  @$pb.TagNumber(3)
  $core.String get pageToken => $_getSZ(2);
  @$pb.TagNumber(3)
  set pageToken($core.String v) {
    $_setString(2, v);
  }

  @$pb.TagNumber(3)
  $core.bool hasPageToken() => $_has(2);
  @$pb.TagNumber(3)
  void clearPageToken() => clearField(3);
}

class GetChatbotConversationResponse extends $pb.GeneratedMessage {
  factory GetChatbotConversationResponse({
    $core.String? conversationId,
    $core.Iterable<ChatbotConversationMessage>? messages,
    $core.String? nextPageToken,
  }) {
    final $result = create();
    if (conversationId != null) {
      $result.conversationId = conversationId;
    }
    if (messages != null) {
      $result.messages.addAll(messages);
    }
    if (nextPageToken != null) {
      $result.nextPageToken = nextPageToken;
    }
    return $result;
  }
  GetChatbotConversationResponse._() : super();
  factory GetChatbotConversationResponse.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory GetChatbotConversationResponse.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'GetChatbotConversationResponse',
      package: const $pb.PackageName(
          _omitMessageNames ? '' : 'ontheblock.appgateway.v1'),
      createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'conversationId')
    ..pc<ChatbotConversationMessage>(
        2, _omitFieldNames ? '' : 'messages', $pb.PbFieldType.PM,
        subBuilder: ChatbotConversationMessage.create)
    ..aOS(3, _omitFieldNames ? '' : 'nextPageToken')
    ..hasRequiredFields = false;

  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  GetChatbotConversationResponse clone() =>
      GetChatbotConversationResponse()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  GetChatbotConversationResponse copyWith(
          void Function(GetChatbotConversationResponse) updates) =>
      super.copyWith(
              (message) => updates(message as GetChatbotConversationResponse))
          as GetChatbotConversationResponse;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static GetChatbotConversationResponse create() =>
      GetChatbotConversationResponse._();
  GetChatbotConversationResponse createEmptyInstance() => create();
  static $pb.PbList<GetChatbotConversationResponse> createRepeated() =>
      $pb.PbList<GetChatbotConversationResponse>();
  @$core.pragma('dart2js:noInline')
  static GetChatbotConversationResponse getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<GetChatbotConversationResponse>(create);
  static GetChatbotConversationResponse? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get conversationId => $_getSZ(0);
  @$pb.TagNumber(1)
  set conversationId($core.String v) {
    $_setString(0, v);
  }

  @$pb.TagNumber(1)
  $core.bool hasConversationId() => $_has(0);
  @$pb.TagNumber(1)
  void clearConversationId() => clearField(1);

  @$pb.TagNumber(2)
  $core.List<ChatbotConversationMessage> get messages => $_getList(1);

  @$pb.TagNumber(3)
  $core.String get nextPageToken => $_getSZ(2);
  @$pb.TagNumber(3)
  set nextPageToken($core.String v) {
    $_setString(2, v);
  }

  @$pb.TagNumber(3)
  $core.bool hasNextPageToken() => $_has(2);
  @$pb.TagNumber(3)
  void clearNextPageToken() => clearField(3);
}

class RecordChatbotFeedbackRequest extends $pb.GeneratedMessage {
  factory RecordChatbotFeedbackRequest({
    $core.String? idempotencyKey,
    $core.String? conversationId,
    $core.String? messageId,
    ChatbotFeedbackType? feedbackType,
    $core.String? comment,
    $1.Struct? clientContext,
  }) {
    final $result = create();
    if (idempotencyKey != null) {
      $result.idempotencyKey = idempotencyKey;
    }
    if (conversationId != null) {
      $result.conversationId = conversationId;
    }
    if (messageId != null) {
      $result.messageId = messageId;
    }
    if (feedbackType != null) {
      $result.feedbackType = feedbackType;
    }
    if (comment != null) {
      $result.comment = comment;
    }
    if (clientContext != null) {
      $result.clientContext = clientContext;
    }
    return $result;
  }
  RecordChatbotFeedbackRequest._() : super();
  factory RecordChatbotFeedbackRequest.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory RecordChatbotFeedbackRequest.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'RecordChatbotFeedbackRequest',
      package: const $pb.PackageName(
          _omitMessageNames ? '' : 'ontheblock.appgateway.v1'),
      createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'idempotencyKey')
    ..aOS(2, _omitFieldNames ? '' : 'conversationId')
    ..aOS(3, _omitFieldNames ? '' : 'messageId')
    ..e<ChatbotFeedbackType>(
        4, _omitFieldNames ? '' : 'feedbackType', $pb.PbFieldType.OE,
        defaultOrMaker: ChatbotFeedbackType.CHATBOT_FEEDBACK_TYPE_UNSPECIFIED,
        valueOf: ChatbotFeedbackType.valueOf,
        enumValues: ChatbotFeedbackType.values)
    ..aOS(5, _omitFieldNames ? '' : 'comment')
    ..aOM<$1.Struct>(20, _omitFieldNames ? '' : 'clientContext',
        subBuilder: $1.Struct.create)
    ..hasRequiredFields = false;

  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  RecordChatbotFeedbackRequest clone() =>
      RecordChatbotFeedbackRequest()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  RecordChatbotFeedbackRequest copyWith(
          void Function(RecordChatbotFeedbackRequest) updates) =>
      super.copyWith(
              (message) => updates(message as RecordChatbotFeedbackRequest))
          as RecordChatbotFeedbackRequest;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static RecordChatbotFeedbackRequest create() =>
      RecordChatbotFeedbackRequest._();
  RecordChatbotFeedbackRequest createEmptyInstance() => create();
  static $pb.PbList<RecordChatbotFeedbackRequest> createRepeated() =>
      $pb.PbList<RecordChatbotFeedbackRequest>();
  @$core.pragma('dart2js:noInline')
  static RecordChatbotFeedbackRequest getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<RecordChatbotFeedbackRequest>(create);
  static RecordChatbotFeedbackRequest? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get idempotencyKey => $_getSZ(0);
  @$pb.TagNumber(1)
  set idempotencyKey($core.String v) {
    $_setString(0, v);
  }

  @$pb.TagNumber(1)
  $core.bool hasIdempotencyKey() => $_has(0);
  @$pb.TagNumber(1)
  void clearIdempotencyKey() => clearField(1);

  @$pb.TagNumber(2)
  $core.String get conversationId => $_getSZ(1);
  @$pb.TagNumber(2)
  set conversationId($core.String v) {
    $_setString(1, v);
  }

  @$pb.TagNumber(2)
  $core.bool hasConversationId() => $_has(1);
  @$pb.TagNumber(2)
  void clearConversationId() => clearField(2);

  @$pb.TagNumber(3)
  $core.String get messageId => $_getSZ(2);
  @$pb.TagNumber(3)
  set messageId($core.String v) {
    $_setString(2, v);
  }

  @$pb.TagNumber(3)
  $core.bool hasMessageId() => $_has(2);
  @$pb.TagNumber(3)
  void clearMessageId() => clearField(3);

  @$pb.TagNumber(4)
  ChatbotFeedbackType get feedbackType => $_getN(3);
  @$pb.TagNumber(4)
  set feedbackType(ChatbotFeedbackType v) {
    setField(4, v);
  }

  @$pb.TagNumber(4)
  $core.bool hasFeedbackType() => $_has(3);
  @$pb.TagNumber(4)
  void clearFeedbackType() => clearField(4);

  @$pb.TagNumber(5)
  $core.String get comment => $_getSZ(4);
  @$pb.TagNumber(5)
  set comment($core.String v) {
    $_setString(4, v);
  }

  @$pb.TagNumber(5)
  $core.bool hasComment() => $_has(4);
  @$pb.TagNumber(5)
  void clearComment() => clearField(5);

  @$pb.TagNumber(20)
  $1.Struct get clientContext => $_getN(5);
  @$pb.TagNumber(20)
  set clientContext($1.Struct v) {
    setField(20, v);
  }

  @$pb.TagNumber(20)
  $core.bool hasClientContext() => $_has(5);
  @$pb.TagNumber(20)
  void clearClientContext() => clearField(20);
  @$pb.TagNumber(20)
  $1.Struct ensureClientContext() => $_ensure(5);
}

class RecordChatbotFeedbackResponse extends $pb.GeneratedMessage {
  factory RecordChatbotFeedbackResponse({
    $core.bool? accepted,
    $core.String? feedbackId,
  }) {
    final $result = create();
    if (accepted != null) {
      $result.accepted = accepted;
    }
    if (feedbackId != null) {
      $result.feedbackId = feedbackId;
    }
    return $result;
  }
  RecordChatbotFeedbackResponse._() : super();
  factory RecordChatbotFeedbackResponse.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory RecordChatbotFeedbackResponse.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'RecordChatbotFeedbackResponse',
      package: const $pb.PackageName(
          _omitMessageNames ? '' : 'ontheblock.appgateway.v1'),
      createEmptyInstance: create)
    ..aOB(1, _omitFieldNames ? '' : 'accepted')
    ..aOS(2, _omitFieldNames ? '' : 'feedbackId')
    ..hasRequiredFields = false;

  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  RecordChatbotFeedbackResponse clone() =>
      RecordChatbotFeedbackResponse()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  RecordChatbotFeedbackResponse copyWith(
          void Function(RecordChatbotFeedbackResponse) updates) =>
      super.copyWith(
              (message) => updates(message as RecordChatbotFeedbackResponse))
          as RecordChatbotFeedbackResponse;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static RecordChatbotFeedbackResponse create() =>
      RecordChatbotFeedbackResponse._();
  RecordChatbotFeedbackResponse createEmptyInstance() => create();
  static $pb.PbList<RecordChatbotFeedbackResponse> createRepeated() =>
      $pb.PbList<RecordChatbotFeedbackResponse>();
  @$core.pragma('dart2js:noInline')
  static RecordChatbotFeedbackResponse getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<RecordChatbotFeedbackResponse>(create);
  static RecordChatbotFeedbackResponse? _defaultInstance;

  @$pb.TagNumber(1)
  $core.bool get accepted => $_getBF(0);
  @$pb.TagNumber(1)
  set accepted($core.bool v) {
    $_setBool(0, v);
  }

  @$pb.TagNumber(1)
  $core.bool hasAccepted() => $_has(0);
  @$pb.TagNumber(1)
  void clearAccepted() => clearField(1);

  @$pb.TagNumber(2)
  $core.String get feedbackId => $_getSZ(1);
  @$pb.TagNumber(2)
  set feedbackId($core.String v) {
    $_setString(1, v);
  }

  @$pb.TagNumber(2)
  $core.bool hasFeedbackId() => $_has(1);
  @$pb.TagNumber(2)
  void clearFeedbackId() => clearField(2);
}

class GetRecommendationProfileStatusRequest extends $pb.GeneratedMessage {
  factory GetRecommendationProfileStatusRequest() => create();
  GetRecommendationProfileStatusRequest._() : super();
  factory GetRecommendationProfileStatusRequest.fromBuffer(
          $core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory GetRecommendationProfileStatusRequest.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'GetRecommendationProfileStatusRequest',
      package: const $pb.PackageName(
          _omitMessageNames ? '' : 'ontheblock.appgateway.v1'),
      createEmptyInstance: create)
    ..hasRequiredFields = false;

  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  GetRecommendationProfileStatusRequest clone() =>
      GetRecommendationProfileStatusRequest()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  GetRecommendationProfileStatusRequest copyWith(
          void Function(GetRecommendationProfileStatusRequest) updates) =>
      super.copyWith((message) =>
              updates(message as GetRecommendationProfileStatusRequest))
          as GetRecommendationProfileStatusRequest;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static GetRecommendationProfileStatusRequest create() =>
      GetRecommendationProfileStatusRequest._();
  GetRecommendationProfileStatusRequest createEmptyInstance() => create();
  static $pb.PbList<GetRecommendationProfileStatusRequest> createRepeated() =>
      $pb.PbList<GetRecommendationProfileStatusRequest>();
  @$core.pragma('dart2js:noInline')
  static GetRecommendationProfileStatusRequest getDefault() =>
      _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<
          GetRecommendationProfileStatusRequest>(create);
  static GetRecommendationProfileStatusRequest? _defaultInstance;
}

class GetRecommendationProfileStatusResponse extends $pb.GeneratedMessage {
  factory GetRecommendationProfileStatusResponse({
    RecommendationProfileStatus? status,
    $core.String? statusMessage,
    $2.Timestamp? updatedAt,
    $1.Struct? servicePayload,
  }) {
    final $result = create();
    if (status != null) {
      $result.status = status;
    }
    if (statusMessage != null) {
      $result.statusMessage = statusMessage;
    }
    if (updatedAt != null) {
      $result.updatedAt = updatedAt;
    }
    if (servicePayload != null) {
      $result.servicePayload = servicePayload;
    }
    return $result;
  }
  GetRecommendationProfileStatusResponse._() : super();
  factory GetRecommendationProfileStatusResponse.fromBuffer(
          $core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory GetRecommendationProfileStatusResponse.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'GetRecommendationProfileStatusResponse',
      package: const $pb.PackageName(
          _omitMessageNames ? '' : 'ontheblock.appgateway.v1'),
      createEmptyInstance: create)
    ..e<RecommendationProfileStatus>(
        1, _omitFieldNames ? '' : 'status', $pb.PbFieldType.OE,
        defaultOrMaker: RecommendationProfileStatus
            .RECOMMENDATION_PROFILE_STATUS_UNSPECIFIED,
        valueOf: RecommendationProfileStatus.valueOf,
        enumValues: RecommendationProfileStatus.values)
    ..aOS(2, _omitFieldNames ? '' : 'statusMessage')
    ..aOM<$2.Timestamp>(3, _omitFieldNames ? '' : 'updatedAt',
        subBuilder: $2.Timestamp.create)
    ..aOM<$1.Struct>(20, _omitFieldNames ? '' : 'servicePayload',
        subBuilder: $1.Struct.create)
    ..hasRequiredFields = false;

  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  GetRecommendationProfileStatusResponse clone() =>
      GetRecommendationProfileStatusResponse()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  GetRecommendationProfileStatusResponse copyWith(
          void Function(GetRecommendationProfileStatusResponse) updates) =>
      super.copyWith((message) =>
              updates(message as GetRecommendationProfileStatusResponse))
          as GetRecommendationProfileStatusResponse;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static GetRecommendationProfileStatusResponse create() =>
      GetRecommendationProfileStatusResponse._();
  GetRecommendationProfileStatusResponse createEmptyInstance() => create();
  static $pb.PbList<GetRecommendationProfileStatusResponse> createRepeated() =>
      $pb.PbList<GetRecommendationProfileStatusResponse>();
  @$core.pragma('dart2js:noInline')
  static GetRecommendationProfileStatusResponse getDefault() =>
      _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<
          GetRecommendationProfileStatusResponse>(create);
  static GetRecommendationProfileStatusResponse? _defaultInstance;

  @$pb.TagNumber(1)
  RecommendationProfileStatus get status => $_getN(0);
  @$pb.TagNumber(1)
  set status(RecommendationProfileStatus v) {
    setField(1, v);
  }

  @$pb.TagNumber(1)
  $core.bool hasStatus() => $_has(0);
  @$pb.TagNumber(1)
  void clearStatus() => clearField(1);

  @$pb.TagNumber(2)
  $core.String get statusMessage => $_getSZ(1);
  @$pb.TagNumber(2)
  set statusMessage($core.String v) {
    $_setString(1, v);
  }

  @$pb.TagNumber(2)
  $core.bool hasStatusMessage() => $_has(1);
  @$pb.TagNumber(2)
  void clearStatusMessage() => clearField(2);

  @$pb.TagNumber(3)
  $2.Timestamp get updatedAt => $_getN(2);
  @$pb.TagNumber(3)
  set updatedAt($2.Timestamp v) {
    setField(3, v);
  }

  @$pb.TagNumber(3)
  $core.bool hasUpdatedAt() => $_has(2);
  @$pb.TagNumber(3)
  void clearUpdatedAt() => clearField(3);
  @$pb.TagNumber(3)
  $2.Timestamp ensureUpdatedAt() => $_ensure(2);

  @$pb.TagNumber(20)
  $1.Struct get servicePayload => $_getN(3);
  @$pb.TagNumber(20)
  set servicePayload($1.Struct v) {
    setField(20, v);
  }

  @$pb.TagNumber(20)
  $core.bool hasServicePayload() => $_has(3);
  @$pb.TagNumber(20)
  void clearServicePayload() => clearField(20);
  @$pb.TagNumber(20)
  $1.Struct ensureServicePayload() => $_ensure(3);
}

class GetBeverageRecommendationsRequest extends $pb.GeneratedMessage {
  factory GetBeverageRecommendationsRequest({
    $core.int? limit,
    $core.String? pageToken,
    $1.Struct? screenContext,
    $core.String? category,
    BudgetMode? budgetMode,
    $1.Struct? clientContext,
  }) {
    final $result = create();
    if (limit != null) {
      $result.limit = limit;
    }
    if (pageToken != null) {
      $result.pageToken = pageToken;
    }
    if (screenContext != null) {
      $result.screenContext = screenContext;
    }
    if (category != null) {
      $result.category = category;
    }
    if (budgetMode != null) {
      $result.budgetMode = budgetMode;
    }
    if (clientContext != null) {
      $result.clientContext = clientContext;
    }
    return $result;
  }
  GetBeverageRecommendationsRequest._() : super();
  factory GetBeverageRecommendationsRequest.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory GetBeverageRecommendationsRequest.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'GetBeverageRecommendationsRequest',
      package: const $pb.PackageName(
          _omitMessageNames ? '' : 'ontheblock.appgateway.v1'),
      createEmptyInstance: create)
    ..a<$core.int>(1, _omitFieldNames ? '' : 'limit', $pb.PbFieldType.O3)
    ..aOS(2, _omitFieldNames ? '' : 'pageToken')
    ..aOM<$1.Struct>(3, _omitFieldNames ? '' : 'screenContext',
        subBuilder: $1.Struct.create)
    ..aOS(4, _omitFieldNames ? '' : 'category')
    ..e<BudgetMode>(5, _omitFieldNames ? '' : 'budgetMode', $pb.PbFieldType.OE,
        defaultOrMaker: BudgetMode.BUDGET_MODE_UNSPECIFIED,
        valueOf: BudgetMode.valueOf,
        enumValues: BudgetMode.values)
    ..aOM<$1.Struct>(20, _omitFieldNames ? '' : 'clientContext',
        subBuilder: $1.Struct.create)
    ..hasRequiredFields = false;

  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  GetBeverageRecommendationsRequest clone() =>
      GetBeverageRecommendationsRequest()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  GetBeverageRecommendationsRequest copyWith(
          void Function(GetBeverageRecommendationsRequest) updates) =>
      super.copyWith((message) =>
              updates(message as GetBeverageRecommendationsRequest))
          as GetBeverageRecommendationsRequest;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static GetBeverageRecommendationsRequest create() =>
      GetBeverageRecommendationsRequest._();
  GetBeverageRecommendationsRequest createEmptyInstance() => create();
  static $pb.PbList<GetBeverageRecommendationsRequest> createRepeated() =>
      $pb.PbList<GetBeverageRecommendationsRequest>();
  @$core.pragma('dart2js:noInline')
  static GetBeverageRecommendationsRequest getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<GetBeverageRecommendationsRequest>(
          create);
  static GetBeverageRecommendationsRequest? _defaultInstance;

  @$pb.TagNumber(1)
  $core.int get limit => $_getIZ(0);
  @$pb.TagNumber(1)
  set limit($core.int v) {
    $_setSignedInt32(0, v);
  }

  @$pb.TagNumber(1)
  $core.bool hasLimit() => $_has(0);
  @$pb.TagNumber(1)
  void clearLimit() => clearField(1);

  @$pb.TagNumber(2)
  $core.String get pageToken => $_getSZ(1);
  @$pb.TagNumber(2)
  set pageToken($core.String v) {
    $_setString(1, v);
  }

  @$pb.TagNumber(2)
  $core.bool hasPageToken() => $_has(1);
  @$pb.TagNumber(2)
  void clearPageToken() => clearField(2);

  @$pb.TagNumber(3)
  $1.Struct get screenContext => $_getN(2);
  @$pb.TagNumber(3)
  set screenContext($1.Struct v) {
    setField(3, v);
  }

  @$pb.TagNumber(3)
  $core.bool hasScreenContext() => $_has(2);
  @$pb.TagNumber(3)
  void clearScreenContext() => clearField(3);
  @$pb.TagNumber(3)
  $1.Struct ensureScreenContext() => $_ensure(2);

  @$pb.TagNumber(4)
  $core.String get category => $_getSZ(3);
  @$pb.TagNumber(4)
  set category($core.String v) {
    $_setString(3, v);
  }

  @$pb.TagNumber(4)
  $core.bool hasCategory() => $_has(3);
  @$pb.TagNumber(4)
  void clearCategory() => clearField(4);

  @$pb.TagNumber(5)
  BudgetMode get budgetMode => $_getN(4);
  @$pb.TagNumber(5)
  set budgetMode(BudgetMode v) {
    setField(5, v);
  }

  @$pb.TagNumber(5)
  $core.bool hasBudgetMode() => $_has(4);
  @$pb.TagNumber(5)
  void clearBudgetMode() => clearField(5);

  @$pb.TagNumber(20)
  $1.Struct get clientContext => $_getN(5);
  @$pb.TagNumber(20)
  set clientContext($1.Struct v) {
    setField(20, v);
  }

  @$pb.TagNumber(20)
  $core.bool hasClientContext() => $_has(5);
  @$pb.TagNumber(20)
  void clearClientContext() => clearField(20);
  @$pb.TagNumber(20)
  $1.Struct ensureClientContext() => $_ensure(5);
}

class GetBeverageRecommendationsResponse extends $pb.GeneratedMessage {
  factory GetBeverageRecommendationsResponse({
    $core.Iterable<BeverageRecommendation>? recommendations,
    $core.String? nextPageToken,
    $2.Timestamp? generatedAt,
    $1.Struct? servicePayload,
  }) {
    final $result = create();
    if (recommendations != null) {
      $result.recommendations.addAll(recommendations);
    }
    if (nextPageToken != null) {
      $result.nextPageToken = nextPageToken;
    }
    if (generatedAt != null) {
      $result.generatedAt = generatedAt;
    }
    if (servicePayload != null) {
      $result.servicePayload = servicePayload;
    }
    return $result;
  }
  GetBeverageRecommendationsResponse._() : super();
  factory GetBeverageRecommendationsResponse.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory GetBeverageRecommendationsResponse.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'GetBeverageRecommendationsResponse',
      package: const $pb.PackageName(
          _omitMessageNames ? '' : 'ontheblock.appgateway.v1'),
      createEmptyInstance: create)
    ..pc<BeverageRecommendation>(
        1, _omitFieldNames ? '' : 'recommendations', $pb.PbFieldType.PM,
        subBuilder: BeverageRecommendation.create)
    ..aOS(2, _omitFieldNames ? '' : 'nextPageToken')
    ..aOM<$2.Timestamp>(3, _omitFieldNames ? '' : 'generatedAt',
        subBuilder: $2.Timestamp.create)
    ..aOM<$1.Struct>(20, _omitFieldNames ? '' : 'servicePayload',
        subBuilder: $1.Struct.create)
    ..hasRequiredFields = false;

  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  GetBeverageRecommendationsResponse clone() =>
      GetBeverageRecommendationsResponse()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  GetBeverageRecommendationsResponse copyWith(
          void Function(GetBeverageRecommendationsResponse) updates) =>
      super.copyWith((message) =>
              updates(message as GetBeverageRecommendationsResponse))
          as GetBeverageRecommendationsResponse;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static GetBeverageRecommendationsResponse create() =>
      GetBeverageRecommendationsResponse._();
  GetBeverageRecommendationsResponse createEmptyInstance() => create();
  static $pb.PbList<GetBeverageRecommendationsResponse> createRepeated() =>
      $pb.PbList<GetBeverageRecommendationsResponse>();
  @$core.pragma('dart2js:noInline')
  static GetBeverageRecommendationsResponse getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<GetBeverageRecommendationsResponse>(
          create);
  static GetBeverageRecommendationsResponse? _defaultInstance;

  @$pb.TagNumber(1)
  $core.List<BeverageRecommendation> get recommendations => $_getList(0);

  @$pb.TagNumber(2)
  $core.String get nextPageToken => $_getSZ(1);
  @$pb.TagNumber(2)
  set nextPageToken($core.String v) {
    $_setString(1, v);
  }

  @$pb.TagNumber(2)
  $core.bool hasNextPageToken() => $_has(1);
  @$pb.TagNumber(2)
  void clearNextPageToken() => clearField(2);

  @$pb.TagNumber(3)
  $2.Timestamp get generatedAt => $_getN(2);
  @$pb.TagNumber(3)
  set generatedAt($2.Timestamp v) {
    setField(3, v);
  }

  @$pb.TagNumber(3)
  $core.bool hasGeneratedAt() => $_has(2);
  @$pb.TagNumber(3)
  void clearGeneratedAt() => clearField(3);
  @$pb.TagNumber(3)
  $2.Timestamp ensureGeneratedAt() => $_ensure(2);

  @$pb.TagNumber(20)
  $1.Struct get servicePayload => $_getN(3);
  @$pb.TagNumber(20)
  set servicePayload($1.Struct v) {
    setField(20, v);
  }

  @$pb.TagNumber(20)
  $core.bool hasServicePayload() => $_has(3);
  @$pb.TagNumber(20)
  void clearServicePayload() => clearField(20);
  @$pb.TagNumber(20)
  $1.Struct ensureServicePayload() => $_ensure(3);
}

class GetVenueRecommendationsRequest extends $pb.GeneratedMessage {
  factory GetVenueRecommendationsRequest({
    $core.double? lat,
    $core.double? lng,
    $core.int? radiusM,
    $core.String? selectedBeverageId,
    $core.String? category,
    $core.int? limit,
    $core.String? pageToken,
    $1.Struct? screenContext,
    BudgetMode? budgetMode,
    $1.Struct? clientContext,
  }) {
    final $result = create();
    if (lat != null) {
      $result.lat = lat;
    }
    if (lng != null) {
      $result.lng = lng;
    }
    if (radiusM != null) {
      $result.radiusM = radiusM;
    }
    if (selectedBeverageId != null) {
      $result.selectedBeverageId = selectedBeverageId;
    }
    if (category != null) {
      $result.category = category;
    }
    if (limit != null) {
      $result.limit = limit;
    }
    if (pageToken != null) {
      $result.pageToken = pageToken;
    }
    if (screenContext != null) {
      $result.screenContext = screenContext;
    }
    if (budgetMode != null) {
      $result.budgetMode = budgetMode;
    }
    if (clientContext != null) {
      $result.clientContext = clientContext;
    }
    return $result;
  }
  GetVenueRecommendationsRequest._() : super();
  factory GetVenueRecommendationsRequest.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory GetVenueRecommendationsRequest.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'GetVenueRecommendationsRequest',
      package: const $pb.PackageName(
          _omitMessageNames ? '' : 'ontheblock.appgateway.v1'),
      createEmptyInstance: create)
    ..a<$core.double>(1, _omitFieldNames ? '' : 'lat', $pb.PbFieldType.OD)
    ..a<$core.double>(2, _omitFieldNames ? '' : 'lng', $pb.PbFieldType.OD)
    ..a<$core.int>(3, _omitFieldNames ? '' : 'radiusM', $pb.PbFieldType.O3)
    ..aOS(4, _omitFieldNames ? '' : 'selectedBeverageId')
    ..aOS(5, _omitFieldNames ? '' : 'category')
    ..a<$core.int>(6, _omitFieldNames ? '' : 'limit', $pb.PbFieldType.O3)
    ..aOS(7, _omitFieldNames ? '' : 'pageToken')
    ..aOM<$1.Struct>(8, _omitFieldNames ? '' : 'screenContext',
        subBuilder: $1.Struct.create)
    ..e<BudgetMode>(9, _omitFieldNames ? '' : 'budgetMode', $pb.PbFieldType.OE,
        defaultOrMaker: BudgetMode.BUDGET_MODE_UNSPECIFIED,
        valueOf: BudgetMode.valueOf,
        enumValues: BudgetMode.values)
    ..aOM<$1.Struct>(20, _omitFieldNames ? '' : 'clientContext',
        subBuilder: $1.Struct.create)
    ..hasRequiredFields = false;

  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  GetVenueRecommendationsRequest clone() =>
      GetVenueRecommendationsRequest()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  GetVenueRecommendationsRequest copyWith(
          void Function(GetVenueRecommendationsRequest) updates) =>
      super.copyWith(
              (message) => updates(message as GetVenueRecommendationsRequest))
          as GetVenueRecommendationsRequest;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static GetVenueRecommendationsRequest create() =>
      GetVenueRecommendationsRequest._();
  GetVenueRecommendationsRequest createEmptyInstance() => create();
  static $pb.PbList<GetVenueRecommendationsRequest> createRepeated() =>
      $pb.PbList<GetVenueRecommendationsRequest>();
  @$core.pragma('dart2js:noInline')
  static GetVenueRecommendationsRequest getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<GetVenueRecommendationsRequest>(create);
  static GetVenueRecommendationsRequest? _defaultInstance;

  @$pb.TagNumber(1)
  $core.double get lat => $_getN(0);
  @$pb.TagNumber(1)
  set lat($core.double v) {
    $_setDouble(0, v);
  }

  @$pb.TagNumber(1)
  $core.bool hasLat() => $_has(0);
  @$pb.TagNumber(1)
  void clearLat() => clearField(1);

  @$pb.TagNumber(2)
  $core.double get lng => $_getN(1);
  @$pb.TagNumber(2)
  set lng($core.double v) {
    $_setDouble(1, v);
  }

  @$pb.TagNumber(2)
  $core.bool hasLng() => $_has(1);
  @$pb.TagNumber(2)
  void clearLng() => clearField(2);

  @$pb.TagNumber(3)
  $core.int get radiusM => $_getIZ(2);
  @$pb.TagNumber(3)
  set radiusM($core.int v) {
    $_setSignedInt32(2, v);
  }

  @$pb.TagNumber(3)
  $core.bool hasRadiusM() => $_has(2);
  @$pb.TagNumber(3)
  void clearRadiusM() => clearField(3);

  @$pb.TagNumber(4)
  $core.String get selectedBeverageId => $_getSZ(3);
  @$pb.TagNumber(4)
  set selectedBeverageId($core.String v) {
    $_setString(3, v);
  }

  @$pb.TagNumber(4)
  $core.bool hasSelectedBeverageId() => $_has(3);
  @$pb.TagNumber(4)
  void clearSelectedBeverageId() => clearField(4);

  @$pb.TagNumber(5)
  $core.String get category => $_getSZ(4);
  @$pb.TagNumber(5)
  set category($core.String v) {
    $_setString(4, v);
  }

  @$pb.TagNumber(5)
  $core.bool hasCategory() => $_has(4);
  @$pb.TagNumber(5)
  void clearCategory() => clearField(5);

  @$pb.TagNumber(6)
  $core.int get limit => $_getIZ(5);
  @$pb.TagNumber(6)
  set limit($core.int v) {
    $_setSignedInt32(5, v);
  }

  @$pb.TagNumber(6)
  $core.bool hasLimit() => $_has(5);
  @$pb.TagNumber(6)
  void clearLimit() => clearField(6);

  @$pb.TagNumber(7)
  $core.String get pageToken => $_getSZ(6);
  @$pb.TagNumber(7)
  set pageToken($core.String v) {
    $_setString(6, v);
  }

  @$pb.TagNumber(7)
  $core.bool hasPageToken() => $_has(6);
  @$pb.TagNumber(7)
  void clearPageToken() => clearField(7);

  @$pb.TagNumber(8)
  $1.Struct get screenContext => $_getN(7);
  @$pb.TagNumber(8)
  set screenContext($1.Struct v) {
    setField(8, v);
  }

  @$pb.TagNumber(8)
  $core.bool hasScreenContext() => $_has(7);
  @$pb.TagNumber(8)
  void clearScreenContext() => clearField(8);
  @$pb.TagNumber(8)
  $1.Struct ensureScreenContext() => $_ensure(7);

  @$pb.TagNumber(9)
  BudgetMode get budgetMode => $_getN(8);
  @$pb.TagNumber(9)
  set budgetMode(BudgetMode v) {
    setField(9, v);
  }

  @$pb.TagNumber(9)
  $core.bool hasBudgetMode() => $_has(8);
  @$pb.TagNumber(9)
  void clearBudgetMode() => clearField(9);

  @$pb.TagNumber(20)
  $1.Struct get clientContext => $_getN(9);
  @$pb.TagNumber(20)
  set clientContext($1.Struct v) {
    setField(20, v);
  }

  @$pb.TagNumber(20)
  $core.bool hasClientContext() => $_has(9);
  @$pb.TagNumber(20)
  void clearClientContext() => clearField(20);
  @$pb.TagNumber(20)
  $1.Struct ensureClientContext() => $_ensure(9);
}

class GetVenueRecommendationsResponse extends $pb.GeneratedMessage {
  factory GetVenueRecommendationsResponse({
    $core.Iterable<VenueRecommendation>? recommendations,
    $core.String? nextPageToken,
    $2.Timestamp? generatedAt,
    $1.Struct? servicePayload,
  }) {
    final $result = create();
    if (recommendations != null) {
      $result.recommendations.addAll(recommendations);
    }
    if (nextPageToken != null) {
      $result.nextPageToken = nextPageToken;
    }
    if (generatedAt != null) {
      $result.generatedAt = generatedAt;
    }
    if (servicePayload != null) {
      $result.servicePayload = servicePayload;
    }
    return $result;
  }
  GetVenueRecommendationsResponse._() : super();
  factory GetVenueRecommendationsResponse.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory GetVenueRecommendationsResponse.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'GetVenueRecommendationsResponse',
      package: const $pb.PackageName(
          _omitMessageNames ? '' : 'ontheblock.appgateway.v1'),
      createEmptyInstance: create)
    ..pc<VenueRecommendation>(
        1, _omitFieldNames ? '' : 'recommendations', $pb.PbFieldType.PM,
        subBuilder: VenueRecommendation.create)
    ..aOS(2, _omitFieldNames ? '' : 'nextPageToken')
    ..aOM<$2.Timestamp>(3, _omitFieldNames ? '' : 'generatedAt',
        subBuilder: $2.Timestamp.create)
    ..aOM<$1.Struct>(20, _omitFieldNames ? '' : 'servicePayload',
        subBuilder: $1.Struct.create)
    ..hasRequiredFields = false;

  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  GetVenueRecommendationsResponse clone() =>
      GetVenueRecommendationsResponse()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  GetVenueRecommendationsResponse copyWith(
          void Function(GetVenueRecommendationsResponse) updates) =>
      super.copyWith(
              (message) => updates(message as GetVenueRecommendationsResponse))
          as GetVenueRecommendationsResponse;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static GetVenueRecommendationsResponse create() =>
      GetVenueRecommendationsResponse._();
  GetVenueRecommendationsResponse createEmptyInstance() => create();
  static $pb.PbList<GetVenueRecommendationsResponse> createRepeated() =>
      $pb.PbList<GetVenueRecommendationsResponse>();
  @$core.pragma('dart2js:noInline')
  static GetVenueRecommendationsResponse getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<GetVenueRecommendationsResponse>(
          create);
  static GetVenueRecommendationsResponse? _defaultInstance;

  @$pb.TagNumber(1)
  $core.List<VenueRecommendation> get recommendations => $_getList(0);

  @$pb.TagNumber(2)
  $core.String get nextPageToken => $_getSZ(1);
  @$pb.TagNumber(2)
  set nextPageToken($core.String v) {
    $_setString(1, v);
  }

  @$pb.TagNumber(2)
  $core.bool hasNextPageToken() => $_has(1);
  @$pb.TagNumber(2)
  void clearNextPageToken() => clearField(2);

  @$pb.TagNumber(3)
  $2.Timestamp get generatedAt => $_getN(2);
  @$pb.TagNumber(3)
  set generatedAt($2.Timestamp v) {
    setField(3, v);
  }

  @$pb.TagNumber(3)
  $core.bool hasGeneratedAt() => $_has(2);
  @$pb.TagNumber(3)
  void clearGeneratedAt() => clearField(3);
  @$pb.TagNumber(3)
  $2.Timestamp ensureGeneratedAt() => $_ensure(2);

  @$pb.TagNumber(20)
  $1.Struct get servicePayload => $_getN(3);
  @$pb.TagNumber(20)
  set servicePayload($1.Struct v) {
    setField(20, v);
  }

  @$pb.TagNumber(20)
  $core.bool hasServicePayload() => $_has(3);
  @$pb.TagNumber(20)
  void clearServicePayload() => clearField(20);
  @$pb.TagNumber(20)
  $1.Struct ensureServicePayload() => $_ensure(3);
}

class RecordRecommendationEventRequest extends $pb.GeneratedMessage {
  factory RecordRecommendationEventRequest({
    $core.String? idempotencyKey,
    RecommendationEventType? eventType,
    $core.String? requestId,
    $core.String? resultId,
    $core.String? beverageId,
    $core.String? venueId,
    $1.Struct? eventContext,
    $1.Struct? clientContext,
  }) {
    final $result = create();
    if (idempotencyKey != null) {
      $result.idempotencyKey = idempotencyKey;
    }
    if (eventType != null) {
      $result.eventType = eventType;
    }
    if (requestId != null) {
      $result.requestId = requestId;
    }
    if (resultId != null) {
      $result.resultId = resultId;
    }
    if (beverageId != null) {
      $result.beverageId = beverageId;
    }
    if (venueId != null) {
      $result.venueId = venueId;
    }
    if (eventContext != null) {
      $result.eventContext = eventContext;
    }
    if (clientContext != null) {
      $result.clientContext = clientContext;
    }
    return $result;
  }
  RecordRecommendationEventRequest._() : super();
  factory RecordRecommendationEventRequest.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory RecordRecommendationEventRequest.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'RecordRecommendationEventRequest',
      package: const $pb.PackageName(
          _omitMessageNames ? '' : 'ontheblock.appgateway.v1'),
      createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'idempotencyKey')
    ..e<RecommendationEventType>(
        2, _omitFieldNames ? '' : 'eventType', $pb.PbFieldType.OE,
        defaultOrMaker:
            RecommendationEventType.RECOMMENDATION_EVENT_TYPE_UNSPECIFIED,
        valueOf: RecommendationEventType.valueOf,
        enumValues: RecommendationEventType.values)
    ..aOS(3, _omitFieldNames ? '' : 'requestId')
    ..aOS(4, _omitFieldNames ? '' : 'resultId')
    ..aOS(5, _omitFieldNames ? '' : 'beverageId')
    ..aOS(6, _omitFieldNames ? '' : 'venueId')
    ..aOM<$1.Struct>(7, _omitFieldNames ? '' : 'eventContext',
        subBuilder: $1.Struct.create)
    ..aOM<$1.Struct>(20, _omitFieldNames ? '' : 'clientContext',
        subBuilder: $1.Struct.create)
    ..hasRequiredFields = false;

  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  RecordRecommendationEventRequest clone() =>
      RecordRecommendationEventRequest()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  RecordRecommendationEventRequest copyWith(
          void Function(RecordRecommendationEventRequest) updates) =>
      super.copyWith(
              (message) => updates(message as RecordRecommendationEventRequest))
          as RecordRecommendationEventRequest;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static RecordRecommendationEventRequest create() =>
      RecordRecommendationEventRequest._();
  RecordRecommendationEventRequest createEmptyInstance() => create();
  static $pb.PbList<RecordRecommendationEventRequest> createRepeated() =>
      $pb.PbList<RecordRecommendationEventRequest>();
  @$core.pragma('dart2js:noInline')
  static RecordRecommendationEventRequest getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<RecordRecommendationEventRequest>(
          create);
  static RecordRecommendationEventRequest? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get idempotencyKey => $_getSZ(0);
  @$pb.TagNumber(1)
  set idempotencyKey($core.String v) {
    $_setString(0, v);
  }

  @$pb.TagNumber(1)
  $core.bool hasIdempotencyKey() => $_has(0);
  @$pb.TagNumber(1)
  void clearIdempotencyKey() => clearField(1);

  @$pb.TagNumber(2)
  RecommendationEventType get eventType => $_getN(1);
  @$pb.TagNumber(2)
  set eventType(RecommendationEventType v) {
    setField(2, v);
  }

  @$pb.TagNumber(2)
  $core.bool hasEventType() => $_has(1);
  @$pb.TagNumber(2)
  void clearEventType() => clearField(2);

  @$pb.TagNumber(3)
  $core.String get requestId => $_getSZ(2);
  @$pb.TagNumber(3)
  set requestId($core.String v) {
    $_setString(2, v);
  }

  @$pb.TagNumber(3)
  $core.bool hasRequestId() => $_has(2);
  @$pb.TagNumber(3)
  void clearRequestId() => clearField(3);

  @$pb.TagNumber(4)
  $core.String get resultId => $_getSZ(3);
  @$pb.TagNumber(4)
  set resultId($core.String v) {
    $_setString(3, v);
  }

  @$pb.TagNumber(4)
  $core.bool hasResultId() => $_has(3);
  @$pb.TagNumber(4)
  void clearResultId() => clearField(4);

  @$pb.TagNumber(5)
  $core.String get beverageId => $_getSZ(4);
  @$pb.TagNumber(5)
  set beverageId($core.String v) {
    $_setString(4, v);
  }

  @$pb.TagNumber(5)
  $core.bool hasBeverageId() => $_has(4);
  @$pb.TagNumber(5)
  void clearBeverageId() => clearField(5);

  @$pb.TagNumber(6)
  $core.String get venueId => $_getSZ(5);
  @$pb.TagNumber(6)
  set venueId($core.String v) {
    $_setString(5, v);
  }

  @$pb.TagNumber(6)
  $core.bool hasVenueId() => $_has(5);
  @$pb.TagNumber(6)
  void clearVenueId() => clearField(6);

  @$pb.TagNumber(7)
  $1.Struct get eventContext => $_getN(6);
  @$pb.TagNumber(7)
  set eventContext($1.Struct v) {
    setField(7, v);
  }

  @$pb.TagNumber(7)
  $core.bool hasEventContext() => $_has(6);
  @$pb.TagNumber(7)
  void clearEventContext() => clearField(7);
  @$pb.TagNumber(7)
  $1.Struct ensureEventContext() => $_ensure(6);

  @$pb.TagNumber(20)
  $1.Struct get clientContext => $_getN(7);
  @$pb.TagNumber(20)
  set clientContext($1.Struct v) {
    setField(20, v);
  }

  @$pb.TagNumber(20)
  $core.bool hasClientContext() => $_has(7);
  @$pb.TagNumber(20)
  void clearClientContext() => clearField(20);
  @$pb.TagNumber(20)
  $1.Struct ensureClientContext() => $_ensure(7);
}

class RecordRecommendationEventResponse extends $pb.GeneratedMessage {
  factory RecordRecommendationEventResponse({
    $core.bool? accepted,
    $core.String? eventId,
  }) {
    final $result = create();
    if (accepted != null) {
      $result.accepted = accepted;
    }
    if (eventId != null) {
      $result.eventId = eventId;
    }
    return $result;
  }
  RecordRecommendationEventResponse._() : super();
  factory RecordRecommendationEventResponse.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory RecordRecommendationEventResponse.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'RecordRecommendationEventResponse',
      package: const $pb.PackageName(
          _omitMessageNames ? '' : 'ontheblock.appgateway.v1'),
      createEmptyInstance: create)
    ..aOB(1, _omitFieldNames ? '' : 'accepted')
    ..aOS(2, _omitFieldNames ? '' : 'eventId')
    ..hasRequiredFields = false;

  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  RecordRecommendationEventResponse clone() =>
      RecordRecommendationEventResponse()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  RecordRecommendationEventResponse copyWith(
          void Function(RecordRecommendationEventResponse) updates) =>
      super.copyWith((message) =>
              updates(message as RecordRecommendationEventResponse))
          as RecordRecommendationEventResponse;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static RecordRecommendationEventResponse create() =>
      RecordRecommendationEventResponse._();
  RecordRecommendationEventResponse createEmptyInstance() => create();
  static $pb.PbList<RecordRecommendationEventResponse> createRepeated() =>
      $pb.PbList<RecordRecommendationEventResponse>();
  @$core.pragma('dart2js:noInline')
  static RecordRecommendationEventResponse getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<RecordRecommendationEventResponse>(
          create);
  static RecordRecommendationEventResponse? _defaultInstance;

  @$pb.TagNumber(1)
  $core.bool get accepted => $_getBF(0);
  @$pb.TagNumber(1)
  set accepted($core.bool v) {
    $_setBool(0, v);
  }

  @$pb.TagNumber(1)
  $core.bool hasAccepted() => $_has(0);
  @$pb.TagNumber(1)
  void clearAccepted() => clearField(1);

  @$pb.TagNumber(2)
  $core.String get eventId => $_getSZ(1);
  @$pb.TagNumber(2)
  set eventId($core.String v) {
    $_setString(1, v);
  }

  @$pb.TagNumber(2)
  $core.bool hasEventId() => $_has(1);
  @$pb.TagNumber(2)
  void clearEventId() => clearField(2);
}

class ChatbotConversationMessage extends $pb.GeneratedMessage {
  factory ChatbotConversationMessage({
    $core.String? messageId,
    ChatbotMessageRole? role,
    $core.String? message,
    $2.Timestamp? createdAt,
    $1.Struct? servicePayload,
  }) {
    final $result = create();
    if (messageId != null) {
      $result.messageId = messageId;
    }
    if (role != null) {
      $result.role = role;
    }
    if (message != null) {
      $result.message = message;
    }
    if (createdAt != null) {
      $result.createdAt = createdAt;
    }
    if (servicePayload != null) {
      $result.servicePayload = servicePayload;
    }
    return $result;
  }
  ChatbotConversationMessage._() : super();
  factory ChatbotConversationMessage.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory ChatbotConversationMessage.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'ChatbotConversationMessage',
      package: const $pb.PackageName(
          _omitMessageNames ? '' : 'ontheblock.appgateway.v1'),
      createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'messageId')
    ..e<ChatbotMessageRole>(
        2, _omitFieldNames ? '' : 'role', $pb.PbFieldType.OE,
        defaultOrMaker: ChatbotMessageRole.CHATBOT_MESSAGE_ROLE_UNSPECIFIED,
        valueOf: ChatbotMessageRole.valueOf,
        enumValues: ChatbotMessageRole.values)
    ..aOS(3, _omitFieldNames ? '' : 'message')
    ..aOM<$2.Timestamp>(4, _omitFieldNames ? '' : 'createdAt',
        subBuilder: $2.Timestamp.create)
    ..aOM<$1.Struct>(20, _omitFieldNames ? '' : 'servicePayload',
        subBuilder: $1.Struct.create)
    ..hasRequiredFields = false;

  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  ChatbotConversationMessage clone() =>
      ChatbotConversationMessage()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  ChatbotConversationMessage copyWith(
          void Function(ChatbotConversationMessage) updates) =>
      super.copyWith(
              (message) => updates(message as ChatbotConversationMessage))
          as ChatbotConversationMessage;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static ChatbotConversationMessage create() => ChatbotConversationMessage._();
  ChatbotConversationMessage createEmptyInstance() => create();
  static $pb.PbList<ChatbotConversationMessage> createRepeated() =>
      $pb.PbList<ChatbotConversationMessage>();
  @$core.pragma('dart2js:noInline')
  static ChatbotConversationMessage getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<ChatbotConversationMessage>(create);
  static ChatbotConversationMessage? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get messageId => $_getSZ(0);
  @$pb.TagNumber(1)
  set messageId($core.String v) {
    $_setString(0, v);
  }

  @$pb.TagNumber(1)
  $core.bool hasMessageId() => $_has(0);
  @$pb.TagNumber(1)
  void clearMessageId() => clearField(1);

  @$pb.TagNumber(2)
  ChatbotMessageRole get role => $_getN(1);
  @$pb.TagNumber(2)
  set role(ChatbotMessageRole v) {
    setField(2, v);
  }

  @$pb.TagNumber(2)
  $core.bool hasRole() => $_has(1);
  @$pb.TagNumber(2)
  void clearRole() => clearField(2);

  @$pb.TagNumber(3)
  $core.String get message => $_getSZ(2);
  @$pb.TagNumber(3)
  set message($core.String v) {
    $_setString(2, v);
  }

  @$pb.TagNumber(3)
  $core.bool hasMessage() => $_has(2);
  @$pb.TagNumber(3)
  void clearMessage() => clearField(3);

  @$pb.TagNumber(4)
  $2.Timestamp get createdAt => $_getN(3);
  @$pb.TagNumber(4)
  set createdAt($2.Timestamp v) {
    setField(4, v);
  }

  @$pb.TagNumber(4)
  $core.bool hasCreatedAt() => $_has(3);
  @$pb.TagNumber(4)
  void clearCreatedAt() => clearField(4);
  @$pb.TagNumber(4)
  $2.Timestamp ensureCreatedAt() => $_ensure(3);

  @$pb.TagNumber(20)
  $1.Struct get servicePayload => $_getN(4);
  @$pb.TagNumber(20)
  set servicePayload($1.Struct v) {
    setField(20, v);
  }

  @$pb.TagNumber(20)
  $core.bool hasServicePayload() => $_has(4);
  @$pb.TagNumber(20)
  void clearServicePayload() => clearField(20);
  @$pb.TagNumber(20)
  $1.Struct ensureServicePayload() => $_ensure(4);
}

class RecommendationReference extends $pb.GeneratedMessage {
  factory RecommendationReference({
    $core.String? recommendationId,
    $core.String? beverageId,
    $core.String? venueId,
    $core.String? title,
    $1.Struct? servicePayload,
  }) {
    final $result = create();
    if (recommendationId != null) {
      $result.recommendationId = recommendationId;
    }
    if (beverageId != null) {
      $result.beverageId = beverageId;
    }
    if (venueId != null) {
      $result.venueId = venueId;
    }
    if (title != null) {
      $result.title = title;
    }
    if (servicePayload != null) {
      $result.servicePayload = servicePayload;
    }
    return $result;
  }
  RecommendationReference._() : super();
  factory RecommendationReference.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory RecommendationReference.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'RecommendationReference',
      package: const $pb.PackageName(
          _omitMessageNames ? '' : 'ontheblock.appgateway.v1'),
      createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'recommendationId')
    ..aOS(2, _omitFieldNames ? '' : 'beverageId')
    ..aOS(3, _omitFieldNames ? '' : 'venueId')
    ..aOS(4, _omitFieldNames ? '' : 'title')
    ..aOM<$1.Struct>(20, _omitFieldNames ? '' : 'servicePayload',
        subBuilder: $1.Struct.create)
    ..hasRequiredFields = false;

  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  RecommendationReference clone() =>
      RecommendationReference()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  RecommendationReference copyWith(
          void Function(RecommendationReference) updates) =>
      super.copyWith((message) => updates(message as RecommendationReference))
          as RecommendationReference;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static RecommendationReference create() => RecommendationReference._();
  RecommendationReference createEmptyInstance() => create();
  static $pb.PbList<RecommendationReference> createRepeated() =>
      $pb.PbList<RecommendationReference>();
  @$core.pragma('dart2js:noInline')
  static RecommendationReference getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<RecommendationReference>(create);
  static RecommendationReference? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get recommendationId => $_getSZ(0);
  @$pb.TagNumber(1)
  set recommendationId($core.String v) {
    $_setString(0, v);
  }

  @$pb.TagNumber(1)
  $core.bool hasRecommendationId() => $_has(0);
  @$pb.TagNumber(1)
  void clearRecommendationId() => clearField(1);

  @$pb.TagNumber(2)
  $core.String get beverageId => $_getSZ(1);
  @$pb.TagNumber(2)
  set beverageId($core.String v) {
    $_setString(1, v);
  }

  @$pb.TagNumber(2)
  $core.bool hasBeverageId() => $_has(1);
  @$pb.TagNumber(2)
  void clearBeverageId() => clearField(2);

  @$pb.TagNumber(3)
  $core.String get venueId => $_getSZ(2);
  @$pb.TagNumber(3)
  set venueId($core.String v) {
    $_setString(2, v);
  }

  @$pb.TagNumber(3)
  $core.bool hasVenueId() => $_has(2);
  @$pb.TagNumber(3)
  void clearVenueId() => clearField(3);

  @$pb.TagNumber(4)
  $core.String get title => $_getSZ(3);
  @$pb.TagNumber(4)
  set title($core.String v) {
    $_setString(3, v);
  }

  @$pb.TagNumber(4)
  $core.bool hasTitle() => $_has(3);
  @$pb.TagNumber(4)
  void clearTitle() => clearField(4);

  @$pb.TagNumber(20)
  $1.Struct get servicePayload => $_getN(4);
  @$pb.TagNumber(20)
  set servicePayload($1.Struct v) {
    setField(20, v);
  }

  @$pb.TagNumber(20)
  $core.bool hasServicePayload() => $_has(4);
  @$pb.TagNumber(20)
  void clearServicePayload() => clearField(20);
  @$pb.TagNumber(20)
  $1.Struct ensureServicePayload() => $_ensure(4);
}

class VenueReference extends $pb.GeneratedMessage {
  factory VenueReference({
    $core.String? venueId,
    $core.String? name,
    $core.double? lat,
    $core.double? lng,
    $1.Struct? servicePayload,
  }) {
    final $result = create();
    if (venueId != null) {
      $result.venueId = venueId;
    }
    if (name != null) {
      $result.name = name;
    }
    if (lat != null) {
      $result.lat = lat;
    }
    if (lng != null) {
      $result.lng = lng;
    }
    if (servicePayload != null) {
      $result.servicePayload = servicePayload;
    }
    return $result;
  }
  VenueReference._() : super();
  factory VenueReference.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory VenueReference.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'VenueReference',
      package: const $pb.PackageName(
          _omitMessageNames ? '' : 'ontheblock.appgateway.v1'),
      createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'venueId')
    ..aOS(2, _omitFieldNames ? '' : 'name')
    ..a<$core.double>(3, _omitFieldNames ? '' : 'lat', $pb.PbFieldType.OD)
    ..a<$core.double>(4, _omitFieldNames ? '' : 'lng', $pb.PbFieldType.OD)
    ..aOM<$1.Struct>(20, _omitFieldNames ? '' : 'servicePayload',
        subBuilder: $1.Struct.create)
    ..hasRequiredFields = false;

  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  VenueReference clone() => VenueReference()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  VenueReference copyWith(void Function(VenueReference) updates) =>
      super.copyWith((message) => updates(message as VenueReference))
          as VenueReference;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static VenueReference create() => VenueReference._();
  VenueReference createEmptyInstance() => create();
  static $pb.PbList<VenueReference> createRepeated() =>
      $pb.PbList<VenueReference>();
  @$core.pragma('dart2js:noInline')
  static VenueReference getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<VenueReference>(create);
  static VenueReference? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get venueId => $_getSZ(0);
  @$pb.TagNumber(1)
  set venueId($core.String v) {
    $_setString(0, v);
  }

  @$pb.TagNumber(1)
  $core.bool hasVenueId() => $_has(0);
  @$pb.TagNumber(1)
  void clearVenueId() => clearField(1);

  @$pb.TagNumber(2)
  $core.String get name => $_getSZ(1);
  @$pb.TagNumber(2)
  set name($core.String v) {
    $_setString(1, v);
  }

  @$pb.TagNumber(2)
  $core.bool hasName() => $_has(1);
  @$pb.TagNumber(2)
  void clearName() => clearField(2);

  @$pb.TagNumber(3)
  $core.double get lat => $_getN(2);
  @$pb.TagNumber(3)
  set lat($core.double v) {
    $_setDouble(2, v);
  }

  @$pb.TagNumber(3)
  $core.bool hasLat() => $_has(2);
  @$pb.TagNumber(3)
  void clearLat() => clearField(3);

  @$pb.TagNumber(4)
  $core.double get lng => $_getN(3);
  @$pb.TagNumber(4)
  set lng($core.double v) {
    $_setDouble(3, v);
  }

  @$pb.TagNumber(4)
  $core.bool hasLng() => $_has(3);
  @$pb.TagNumber(4)
  void clearLng() => clearField(4);

  @$pb.TagNumber(20)
  $1.Struct get servicePayload => $_getN(4);
  @$pb.TagNumber(20)
  set servicePayload($1.Struct v) {
    setField(20, v);
  }

  @$pb.TagNumber(20)
  $core.bool hasServicePayload() => $_has(4);
  @$pb.TagNumber(20)
  void clearServicePayload() => clearField(20);
  @$pb.TagNumber(20)
  $1.Struct ensureServicePayload() => $_ensure(4);
}

class BeverageRecommendation extends $pb.GeneratedMessage {
  factory BeverageRecommendation({
    $core.String? recommendationId,
    $core.String? beverageId,
    $core.String? displayName,
    $core.int? rank,
    $core.double? score,
    $core.String? reason,
    $core.Iterable<$core.String>? tags,
    $1.Struct? servicePayload,
  }) {
    final $result = create();
    if (recommendationId != null) {
      $result.recommendationId = recommendationId;
    }
    if (beverageId != null) {
      $result.beverageId = beverageId;
    }
    if (displayName != null) {
      $result.displayName = displayName;
    }
    if (rank != null) {
      $result.rank = rank;
    }
    if (score != null) {
      $result.score = score;
    }
    if (reason != null) {
      $result.reason = reason;
    }
    if (tags != null) {
      $result.tags.addAll(tags);
    }
    if (servicePayload != null) {
      $result.servicePayload = servicePayload;
    }
    return $result;
  }
  BeverageRecommendation._() : super();
  factory BeverageRecommendation.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory BeverageRecommendation.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'BeverageRecommendation',
      package: const $pb.PackageName(
          _omitMessageNames ? '' : 'ontheblock.appgateway.v1'),
      createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'recommendationId')
    ..aOS(2, _omitFieldNames ? '' : 'beverageId')
    ..aOS(3, _omitFieldNames ? '' : 'displayName')
    ..a<$core.int>(4, _omitFieldNames ? '' : 'rank', $pb.PbFieldType.O3)
    ..a<$core.double>(5, _omitFieldNames ? '' : 'score', $pb.PbFieldType.OD)
    ..aOS(6, _omitFieldNames ? '' : 'reason')
    ..pPS(7, _omitFieldNames ? '' : 'tags')
    ..aOM<$1.Struct>(20, _omitFieldNames ? '' : 'servicePayload',
        subBuilder: $1.Struct.create)
    ..hasRequiredFields = false;

  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  BeverageRecommendation clone() =>
      BeverageRecommendation()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  BeverageRecommendation copyWith(
          void Function(BeverageRecommendation) updates) =>
      super.copyWith((message) => updates(message as BeverageRecommendation))
          as BeverageRecommendation;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static BeverageRecommendation create() => BeverageRecommendation._();
  BeverageRecommendation createEmptyInstance() => create();
  static $pb.PbList<BeverageRecommendation> createRepeated() =>
      $pb.PbList<BeverageRecommendation>();
  @$core.pragma('dart2js:noInline')
  static BeverageRecommendation getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<BeverageRecommendation>(create);
  static BeverageRecommendation? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get recommendationId => $_getSZ(0);
  @$pb.TagNumber(1)
  set recommendationId($core.String v) {
    $_setString(0, v);
  }

  @$pb.TagNumber(1)
  $core.bool hasRecommendationId() => $_has(0);
  @$pb.TagNumber(1)
  void clearRecommendationId() => clearField(1);

  @$pb.TagNumber(2)
  $core.String get beverageId => $_getSZ(1);
  @$pb.TagNumber(2)
  set beverageId($core.String v) {
    $_setString(1, v);
  }

  @$pb.TagNumber(2)
  $core.bool hasBeverageId() => $_has(1);
  @$pb.TagNumber(2)
  void clearBeverageId() => clearField(2);

  @$pb.TagNumber(3)
  $core.String get displayName => $_getSZ(2);
  @$pb.TagNumber(3)
  set displayName($core.String v) {
    $_setString(2, v);
  }

  @$pb.TagNumber(3)
  $core.bool hasDisplayName() => $_has(2);
  @$pb.TagNumber(3)
  void clearDisplayName() => clearField(3);

  /// Pass-through value from recommendation-service. The gateway must not
  /// compute, reorder, or reinterpret ranking.
  @$pb.TagNumber(4)
  $core.int get rank => $_getIZ(3);
  @$pb.TagNumber(4)
  set rank($core.int v) {
    $_setSignedInt32(3, v);
  }

  @$pb.TagNumber(4)
  $core.bool hasRank() => $_has(3);
  @$pb.TagNumber(4)
  void clearRank() => clearField(4);

  /// Pass-through value from recommendation-service. The gateway must not score.
  @$pb.TagNumber(5)
  $core.double get score => $_getN(4);
  @$pb.TagNumber(5)
  set score($core.double v) {
    $_setDouble(4, v);
  }

  @$pb.TagNumber(5)
  $core.bool hasScore() => $_has(4);
  @$pb.TagNumber(5)
  void clearScore() => clearField(5);

  /// Pass-through value from recommendation-service. The gateway must not
  /// generate reasons.
  @$pb.TagNumber(6)
  $core.String get reason => $_getSZ(5);
  @$pb.TagNumber(6)
  set reason($core.String v) {
    $_setString(5, v);
  }

  @$pb.TagNumber(6)
  $core.bool hasReason() => $_has(5);
  @$pb.TagNumber(6)
  void clearReason() => clearField(6);

  @$pb.TagNumber(7)
  $core.List<$core.String> get tags => $_getList(6);

  @$pb.TagNumber(20)
  $1.Struct get servicePayload => $_getN(7);
  @$pb.TagNumber(20)
  set servicePayload($1.Struct v) {
    setField(20, v);
  }

  @$pb.TagNumber(20)
  $core.bool hasServicePayload() => $_has(7);
  @$pb.TagNumber(20)
  void clearServicePayload() => clearField(20);
  @$pb.TagNumber(20)
  $1.Struct ensureServicePayload() => $_ensure(7);
}

class VenueRecommendation extends $pb.GeneratedMessage {
  factory VenueRecommendation({
    $core.String? recommendationId,
    $core.String? venueId,
    $core.String? displayName,
    $core.int? rank,
    $core.double? score,
    $core.String? reason,
    $core.double? lat,
    $core.double? lng,
    $core.Iterable<$core.String>? tags,
    $1.Struct? servicePayload,
  }) {
    final $result = create();
    if (recommendationId != null) {
      $result.recommendationId = recommendationId;
    }
    if (venueId != null) {
      $result.venueId = venueId;
    }
    if (displayName != null) {
      $result.displayName = displayName;
    }
    if (rank != null) {
      $result.rank = rank;
    }
    if (score != null) {
      $result.score = score;
    }
    if (reason != null) {
      $result.reason = reason;
    }
    if (lat != null) {
      $result.lat = lat;
    }
    if (lng != null) {
      $result.lng = lng;
    }
    if (tags != null) {
      $result.tags.addAll(tags);
    }
    if (servicePayload != null) {
      $result.servicePayload = servicePayload;
    }
    return $result;
  }
  VenueRecommendation._() : super();
  factory VenueRecommendation.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory VenueRecommendation.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'VenueRecommendation',
      package: const $pb.PackageName(
          _omitMessageNames ? '' : 'ontheblock.appgateway.v1'),
      createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'recommendationId')
    ..aOS(2, _omitFieldNames ? '' : 'venueId')
    ..aOS(3, _omitFieldNames ? '' : 'displayName')
    ..a<$core.int>(4, _omitFieldNames ? '' : 'rank', $pb.PbFieldType.O3)
    ..a<$core.double>(5, _omitFieldNames ? '' : 'score', $pb.PbFieldType.OD)
    ..aOS(6, _omitFieldNames ? '' : 'reason')
    ..a<$core.double>(7, _omitFieldNames ? '' : 'lat', $pb.PbFieldType.OD)
    ..a<$core.double>(8, _omitFieldNames ? '' : 'lng', $pb.PbFieldType.OD)
    ..pPS(9, _omitFieldNames ? '' : 'tags')
    ..aOM<$1.Struct>(20, _omitFieldNames ? '' : 'servicePayload',
        subBuilder: $1.Struct.create)
    ..hasRequiredFields = false;

  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  VenueRecommendation clone() => VenueRecommendation()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  VenueRecommendation copyWith(void Function(VenueRecommendation) updates) =>
      super.copyWith((message) => updates(message as VenueRecommendation))
          as VenueRecommendation;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static VenueRecommendation create() => VenueRecommendation._();
  VenueRecommendation createEmptyInstance() => create();
  static $pb.PbList<VenueRecommendation> createRepeated() =>
      $pb.PbList<VenueRecommendation>();
  @$core.pragma('dart2js:noInline')
  static VenueRecommendation getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<VenueRecommendation>(create);
  static VenueRecommendation? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get recommendationId => $_getSZ(0);
  @$pb.TagNumber(1)
  set recommendationId($core.String v) {
    $_setString(0, v);
  }

  @$pb.TagNumber(1)
  $core.bool hasRecommendationId() => $_has(0);
  @$pb.TagNumber(1)
  void clearRecommendationId() => clearField(1);

  @$pb.TagNumber(2)
  $core.String get venueId => $_getSZ(1);
  @$pb.TagNumber(2)
  set venueId($core.String v) {
    $_setString(1, v);
  }

  @$pb.TagNumber(2)
  $core.bool hasVenueId() => $_has(1);
  @$pb.TagNumber(2)
  void clearVenueId() => clearField(2);

  @$pb.TagNumber(3)
  $core.String get displayName => $_getSZ(2);
  @$pb.TagNumber(3)
  set displayName($core.String v) {
    $_setString(2, v);
  }

  @$pb.TagNumber(3)
  $core.bool hasDisplayName() => $_has(2);
  @$pb.TagNumber(3)
  void clearDisplayName() => clearField(3);

  /// Pass-through value from recommendation-service. The gateway must not
  /// compute, reorder, or reinterpret ranking.
  @$pb.TagNumber(4)
  $core.int get rank => $_getIZ(3);
  @$pb.TagNumber(4)
  set rank($core.int v) {
    $_setSignedInt32(3, v);
  }

  @$pb.TagNumber(4)
  $core.bool hasRank() => $_has(3);
  @$pb.TagNumber(4)
  void clearRank() => clearField(4);

  /// Pass-through value from recommendation-service. The gateway must not score.
  @$pb.TagNumber(5)
  $core.double get score => $_getN(4);
  @$pb.TagNumber(5)
  set score($core.double v) {
    $_setDouble(4, v);
  }

  @$pb.TagNumber(5)
  $core.bool hasScore() => $_has(4);
  @$pb.TagNumber(5)
  void clearScore() => clearField(5);

  /// Pass-through value from recommendation-service. The gateway must not
  /// generate reasons.
  @$pb.TagNumber(6)
  $core.String get reason => $_getSZ(5);
  @$pb.TagNumber(6)
  set reason($core.String v) {
    $_setString(5, v);
  }

  @$pb.TagNumber(6)
  $core.bool hasReason() => $_has(5);
  @$pb.TagNumber(6)
  void clearReason() => clearField(6);

  @$pb.TagNumber(7)
  $core.double get lat => $_getN(6);
  @$pb.TagNumber(7)
  set lat($core.double v) {
    $_setDouble(6, v);
  }

  @$pb.TagNumber(7)
  $core.bool hasLat() => $_has(6);
  @$pb.TagNumber(7)
  void clearLat() => clearField(7);

  @$pb.TagNumber(8)
  $core.double get lng => $_getN(7);
  @$pb.TagNumber(8)
  set lng($core.double v) {
    $_setDouble(7, v);
  }

  @$pb.TagNumber(8)
  $core.bool hasLng() => $_has(7);
  @$pb.TagNumber(8)
  void clearLng() => clearField(8);

  @$pb.TagNumber(9)
  $core.List<$core.String> get tags => $_getList(8);

  @$pb.TagNumber(20)
  $1.Struct get servicePayload => $_getN(9);
  @$pb.TagNumber(20)
  set servicePayload($1.Struct v) {
    setField(20, v);
  }

  @$pb.TagNumber(20)
  $core.bool hasServicePayload() => $_has(9);
  @$pb.TagNumber(20)
  void clearServicePayload() => clearField(20);
  @$pb.TagNumber(20)
  $1.Struct ensureServicePayload() => $_ensure(9);
}

const _omitFieldNames = $core.bool.fromEnvironment('protobuf.omit_field_names');
const _omitMessageNames =
    $core.bool.fromEnvironment('protobuf.omit_message_names');
