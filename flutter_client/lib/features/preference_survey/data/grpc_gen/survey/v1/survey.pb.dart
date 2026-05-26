//
//  Generated code. Do not modify.
//  source: survey/v1/survey.proto
//
// @dart = 2.12

// ignore_for_file: annotate_overrides, camel_case_types, comment_references
// ignore_for_file: constant_identifier_names, library_prefixes
// ignore_for_file: non_constant_identifier_names, prefer_final_fields
// ignore_for_file: unnecessary_import, unnecessary_this, unused_import

import 'dart:core' as $core;

import 'package:protobuf/protobuf.dart' as $pb;

import '../../google/protobuf/timestamp.pb.dart' as $1;

class GetSurveyResultRequest extends $pb.GeneratedMessage {
  factory GetSurveyResultRequest({
    $core.String? surveyId,
  }) {
    final $result = create();
    if (surveyId != null) {
      $result.surveyId = surveyId;
    }
    return $result;
  }
  GetSurveyResultRequest._() : super();
  factory GetSurveyResultRequest.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory GetSurveyResultRequest.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'GetSurveyResultRequest', package: const $pb.PackageName(_omitMessageNames ? '' : 'ontheblock.survey.v1'), createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'surveyId')
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  GetSurveyResultRequest clone() => GetSurveyResultRequest()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  GetSurveyResultRequest copyWith(void Function(GetSurveyResultRequest) updates) => super.copyWith((message) => updates(message as GetSurveyResultRequest)) as GetSurveyResultRequest;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static GetSurveyResultRequest create() => GetSurveyResultRequest._();
  GetSurveyResultRequest createEmptyInstance() => create();
  static $pb.PbList<GetSurveyResultRequest> createRepeated() => $pb.PbList<GetSurveyResultRequest>();
  @$core.pragma('dart2js:noInline')
  static GetSurveyResultRequest getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<GetSurveyResultRequest>(create);
  static GetSurveyResultRequest? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get surveyId => $_getSZ(0);
  @$pb.TagNumber(1)
  set surveyId($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasSurveyId() => $_has(0);
  @$pb.TagNumber(1)
  void clearSurveyId() => clearField(1);
}

class GetSurveyResultByUserRequest extends $pb.GeneratedMessage {
  factory GetSurveyResultByUserRequest({
    $core.String? userId,
  }) {
    final $result = create();
    if (userId != null) {
      $result.userId = userId;
    }
    return $result;
  }
  GetSurveyResultByUserRequest._() : super();
  factory GetSurveyResultByUserRequest.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory GetSurveyResultByUserRequest.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'GetSurveyResultByUserRequest', package: const $pb.PackageName(_omitMessageNames ? '' : 'ontheblock.survey.v1'), createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'userId')
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  GetSurveyResultByUserRequest clone() => GetSurveyResultByUserRequest()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  GetSurveyResultByUserRequest copyWith(void Function(GetSurveyResultByUserRequest) updates) => super.copyWith((message) => updates(message as GetSurveyResultByUserRequest)) as GetSurveyResultByUserRequest;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static GetSurveyResultByUserRequest create() => GetSurveyResultByUserRequest._();
  GetSurveyResultByUserRequest createEmptyInstance() => create();
  static $pb.PbList<GetSurveyResultByUserRequest> createRepeated() => $pb.PbList<GetSurveyResultByUserRequest>();
  @$core.pragma('dart2js:noInline')
  static GetSurveyResultByUserRequest getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<GetSurveyResultByUserRequest>(create);
  static GetSurveyResultByUserRequest? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get userId => $_getSZ(0);
  @$pb.TagNumber(1)
  set userId($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasUserId() => $_has(0);
  @$pb.TagNumber(1)
  void clearUserId() => clearField(1);
}

class GetSurveyResultResponse extends $pb.GeneratedMessage {
  factory GetSurveyResultResponse({
    SurveyResult? result,
  }) {
    final $result = create();
    if (result != null) {
      $result.result = result;
    }
    return $result;
  }
  GetSurveyResultResponse._() : super();
  factory GetSurveyResultResponse.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory GetSurveyResultResponse.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'GetSurveyResultResponse', package: const $pb.PackageName(_omitMessageNames ? '' : 'ontheblock.survey.v1'), createEmptyInstance: create)
    ..aOM<SurveyResult>(1, _omitFieldNames ? '' : 'result', subBuilder: SurveyResult.create)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  GetSurveyResultResponse clone() => GetSurveyResultResponse()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  GetSurveyResultResponse copyWith(void Function(GetSurveyResultResponse) updates) => super.copyWith((message) => updates(message as GetSurveyResultResponse)) as GetSurveyResultResponse;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static GetSurveyResultResponse create() => GetSurveyResultResponse._();
  GetSurveyResultResponse createEmptyInstance() => create();
  static $pb.PbList<GetSurveyResultResponse> createRepeated() => $pb.PbList<GetSurveyResultResponse>();
  @$core.pragma('dart2js:noInline')
  static GetSurveyResultResponse getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<GetSurveyResultResponse>(create);
  static GetSurveyResultResponse? _defaultInstance;

  @$pb.TagNumber(1)
  SurveyResult get result => $_getN(0);
  @$pb.TagNumber(1)
  set result(SurveyResult v) { setField(1, v); }
  @$pb.TagNumber(1)
  $core.bool hasResult() => $_has(0);
  @$pb.TagNumber(1)
  void clearResult() => clearField(1);
  @$pb.TagNumber(1)
  SurveyResult ensureResult() => $_ensure(0);
}

class SurveyResult extends $pb.GeneratedMessage {
  factory SurveyResult({
    $core.String? surveyId,
    $core.String? userId,
    $core.String? level,
    $core.Iterable<$core.String>? categories,
    $core.Iterable<$core.String>? whiskey,
    $core.Iterable<$core.String>? wine,
    $core.Iterable<$core.String>? cocktail,
    $core.Iterable<$core.String>? beer,
    $core.Iterable<$core.String>? flavorKeywords,
    $core.String? budget,
    $1.Timestamp? submittedAt,
  }) {
    final $result = create();
    if (surveyId != null) {
      $result.surveyId = surveyId;
    }
    if (userId != null) {
      $result.userId = userId;
    }
    if (level != null) {
      $result.level = level;
    }
    if (categories != null) {
      $result.categories.addAll(categories);
    }
    if (whiskey != null) {
      $result.whiskey.addAll(whiskey);
    }
    if (wine != null) {
      $result.wine.addAll(wine);
    }
    if (cocktail != null) {
      $result.cocktail.addAll(cocktail);
    }
    if (beer != null) {
      $result.beer.addAll(beer);
    }
    if (flavorKeywords != null) {
      $result.flavorKeywords.addAll(flavorKeywords);
    }
    if (budget != null) {
      $result.budget = budget;
    }
    if (submittedAt != null) {
      $result.submittedAt = submittedAt;
    }
    return $result;
  }
  SurveyResult._() : super();
  factory SurveyResult.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory SurveyResult.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'SurveyResult', package: const $pb.PackageName(_omitMessageNames ? '' : 'ontheblock.survey.v1'), createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'surveyId')
    ..aOS(2, _omitFieldNames ? '' : 'userId')
    ..aOS(3, _omitFieldNames ? '' : 'level')
    ..pPS(4, _omitFieldNames ? '' : 'categories')
    ..pPS(5, _omitFieldNames ? '' : 'whiskey')
    ..pPS(6, _omitFieldNames ? '' : 'wine')
    ..pPS(7, _omitFieldNames ? '' : 'cocktail')
    ..pPS(8, _omitFieldNames ? '' : 'beer')
    ..pPS(9, _omitFieldNames ? '' : 'flavorKeywords')
    ..aOS(10, _omitFieldNames ? '' : 'budget')
    ..aOM<$1.Timestamp>(11, _omitFieldNames ? '' : 'submittedAt', subBuilder: $1.Timestamp.create)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  SurveyResult clone() => SurveyResult()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  SurveyResult copyWith(void Function(SurveyResult) updates) => super.copyWith((message) => updates(message as SurveyResult)) as SurveyResult;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static SurveyResult create() => SurveyResult._();
  SurveyResult createEmptyInstance() => create();
  static $pb.PbList<SurveyResult> createRepeated() => $pb.PbList<SurveyResult>();
  @$core.pragma('dart2js:noInline')
  static SurveyResult getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<SurveyResult>(create);
  static SurveyResult? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get surveyId => $_getSZ(0);
  @$pb.TagNumber(1)
  set surveyId($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasSurveyId() => $_has(0);
  @$pb.TagNumber(1)
  void clearSurveyId() => clearField(1);

  @$pb.TagNumber(2)
  $core.String get userId => $_getSZ(1);
  @$pb.TagNumber(2)
  set userId($core.String v) { $_setString(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasUserId() => $_has(1);
  @$pb.TagNumber(2)
  void clearUserId() => clearField(2);

  /// level: beginner | enthusiast | expert
  @$pb.TagNumber(3)
  $core.String get level => $_getSZ(2);
  @$pb.TagNumber(3)
  set level($core.String v) { $_setString(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasLevel() => $_has(2);
  @$pb.TagNumber(3)
  void clearLevel() => clearField(3);

  /// categories selected by user: whiskey | wine | cognac | cocktail | beer
  @$pb.TagNumber(4)
  $core.List<$core.String> get categories => $_getList(3);

  /// drink-category preferences (empty = not selected or skipped)
  /// values: bourbon_character | sherry_character | peat_character | floral_citrus | american_whiskey
  @$pb.TagNumber(5)
  $core.List<$core.String> get whiskey => $_getList(4);

  /// values: full_red | light_red_rose | white | sparkling | fortified
  @$pb.TagNumber(6)
  $core.List<$core.String> get wine => $_getList(5);

  /// values: tropical_tiki | tart_balanced | refreshing_long | dessert_cream | bold_spirit_fwd
  @$pb.TagNumber(7)
  $core.List<$core.String> get cocktail => $_getList(6);

  /// values: lager_pilsner | weizen_white | pale_ale_ipa | stout_porter | sour_wild
  @$pb.TagNumber(8)
  $core.List<$core.String> get beer => $_getList(7);

  /// flavor keywords (up to 3)
  /// values: vanilla_caramel | citrus_berry | dried_choco | oak_woody |
  ///         smoky_peated | almond_nutty | floral | spicy | herb_mint
  @$pb.TagNumber(9)
  $core.List<$core.String> get flavorKeywords => $_getList(8);

  /// budget: under_30k | 30k_100k | 100k_200k | over_200k
  @$pb.TagNumber(10)
  $core.String get budget => $_getSZ(9);
  @$pb.TagNumber(10)
  set budget($core.String v) { $_setString(9, v); }
  @$pb.TagNumber(10)
  $core.bool hasBudget() => $_has(9);
  @$pb.TagNumber(10)
  void clearBudget() => clearField(10);

  @$pb.TagNumber(11)
  $1.Timestamp get submittedAt => $_getN(10);
  @$pb.TagNumber(11)
  set submittedAt($1.Timestamp v) { setField(11, v); }
  @$pb.TagNumber(11)
  $core.bool hasSubmittedAt() => $_has(10);
  @$pb.TagNumber(11)
  void clearSubmittedAt() => clearField(11);
  @$pb.TagNumber(11)
  $1.Timestamp ensureSubmittedAt() => $_ensure(10);
}

class GetSurveyQuestionsRequest extends $pb.GeneratedMessage {
  factory GetSurveyQuestionsRequest() => create();
  GetSurveyQuestionsRequest._() : super();
  factory GetSurveyQuestionsRequest.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory GetSurveyQuestionsRequest.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'GetSurveyQuestionsRequest', package: const $pb.PackageName(_omitMessageNames ? '' : 'ontheblock.survey.v1'), createEmptyInstance: create)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  GetSurveyQuestionsRequest clone() => GetSurveyQuestionsRequest()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  GetSurveyQuestionsRequest copyWith(void Function(GetSurveyQuestionsRequest) updates) => super.copyWith((message) => updates(message as GetSurveyQuestionsRequest)) as GetSurveyQuestionsRequest;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static GetSurveyQuestionsRequest create() => GetSurveyQuestionsRequest._();
  GetSurveyQuestionsRequest createEmptyInstance() => create();
  static $pb.PbList<GetSurveyQuestionsRequest> createRepeated() => $pb.PbList<GetSurveyQuestionsRequest>();
  @$core.pragma('dart2js:noInline')
  static GetSurveyQuestionsRequest getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<GetSurveyQuestionsRequest>(create);
  static GetSurveyQuestionsRequest? _defaultInstance;
}

class GetSurveyQuestionsResponse extends $pb.GeneratedMessage {
  factory GetSurveyQuestionsResponse({
    $core.Iterable<SurveyQuestion>? questions,
  }) {
    final $result = create();
    if (questions != null) {
      $result.questions.addAll(questions);
    }
    return $result;
  }
  GetSurveyQuestionsResponse._() : super();
  factory GetSurveyQuestionsResponse.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory GetSurveyQuestionsResponse.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'GetSurveyQuestionsResponse', package: const $pb.PackageName(_omitMessageNames ? '' : 'ontheblock.survey.v1'), createEmptyInstance: create)
    ..pc<SurveyQuestion>(1, _omitFieldNames ? '' : 'questions', $pb.PbFieldType.PM, subBuilder: SurveyQuestion.create)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  GetSurveyQuestionsResponse clone() => GetSurveyQuestionsResponse()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  GetSurveyQuestionsResponse copyWith(void Function(GetSurveyQuestionsResponse) updates) => super.copyWith((message) => updates(message as GetSurveyQuestionsResponse)) as GetSurveyQuestionsResponse;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static GetSurveyQuestionsResponse create() => GetSurveyQuestionsResponse._();
  GetSurveyQuestionsResponse createEmptyInstance() => create();
  static $pb.PbList<GetSurveyQuestionsResponse> createRepeated() => $pb.PbList<GetSurveyQuestionsResponse>();
  @$core.pragma('dart2js:noInline')
  static GetSurveyQuestionsResponse getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<GetSurveyQuestionsResponse>(create);
  static GetSurveyQuestionsResponse? _defaultInstance;

  @$pb.TagNumber(1)
  $core.List<SurveyQuestion> get questions => $_getList(0);
}

class SurveyQuestion extends $pb.GeneratedMessage {
  factory SurveyQuestion({
    $core.String? questionKey,
    $core.String? questionText,
    $core.String? questionType,
    $core.int? maxSelections,
    $core.int? questionOrder,
    $core.Iterable<AnswerOption>? options,
    QuestionCondition? condition,
  }) {
    final $result = create();
    if (questionKey != null) {
      $result.questionKey = questionKey;
    }
    if (questionText != null) {
      $result.questionText = questionText;
    }
    if (questionType != null) {
      $result.questionType = questionType;
    }
    if (maxSelections != null) {
      $result.maxSelections = maxSelections;
    }
    if (questionOrder != null) {
      $result.questionOrder = questionOrder;
    }
    if (options != null) {
      $result.options.addAll(options);
    }
    if (condition != null) {
      $result.condition = condition;
    }
    return $result;
  }
  SurveyQuestion._() : super();
  factory SurveyQuestion.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory SurveyQuestion.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'SurveyQuestion', package: const $pb.PackageName(_omitMessageNames ? '' : 'ontheblock.survey.v1'), createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'questionKey')
    ..aOS(2, _omitFieldNames ? '' : 'questionText')
    ..aOS(3, _omitFieldNames ? '' : 'questionType')
    ..a<$core.int>(4, _omitFieldNames ? '' : 'maxSelections', $pb.PbFieldType.O3)
    ..a<$core.int>(5, _omitFieldNames ? '' : 'questionOrder', $pb.PbFieldType.O3)
    ..pc<AnswerOption>(6, _omitFieldNames ? '' : 'options', $pb.PbFieldType.PM, subBuilder: AnswerOption.create)
    ..aOM<QuestionCondition>(7, _omitFieldNames ? '' : 'condition', subBuilder: QuestionCondition.create)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  SurveyQuestion clone() => SurveyQuestion()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  SurveyQuestion copyWith(void Function(SurveyQuestion) updates) => super.copyWith((message) => updates(message as SurveyQuestion)) as SurveyQuestion;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static SurveyQuestion create() => SurveyQuestion._();
  SurveyQuestion createEmptyInstance() => create();
  static $pb.PbList<SurveyQuestion> createRepeated() => $pb.PbList<SurveyQuestion>();
  @$core.pragma('dart2js:noInline')
  static SurveyQuestion getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<SurveyQuestion>(create);
  static SurveyQuestion? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get questionKey => $_getSZ(0);
  @$pb.TagNumber(1)
  set questionKey($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasQuestionKey() => $_has(0);
  @$pb.TagNumber(1)
  void clearQuestionKey() => clearField(1);

  @$pb.TagNumber(2)
  $core.String get questionText => $_getSZ(1);
  @$pb.TagNumber(2)
  set questionText($core.String v) { $_setString(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasQuestionText() => $_has(1);
  @$pb.TagNumber(2)
  void clearQuestionText() => clearField(2);

  @$pb.TagNumber(3)
  $core.String get questionType => $_getSZ(2);
  @$pb.TagNumber(3)
  set questionType($core.String v) { $_setString(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasQuestionType() => $_has(2);
  @$pb.TagNumber(3)
  void clearQuestionType() => clearField(3);

  @$pb.TagNumber(4)
  $core.int get maxSelections => $_getIZ(3);
  @$pb.TagNumber(4)
  set maxSelections($core.int v) { $_setSignedInt32(3, v); }
  @$pb.TagNumber(4)
  $core.bool hasMaxSelections() => $_has(3);
  @$pb.TagNumber(4)
  void clearMaxSelections() => clearField(4);

  @$pb.TagNumber(5)
  $core.int get questionOrder => $_getIZ(4);
  @$pb.TagNumber(5)
  set questionOrder($core.int v) { $_setSignedInt32(4, v); }
  @$pb.TagNumber(5)
  $core.bool hasQuestionOrder() => $_has(4);
  @$pb.TagNumber(5)
  void clearQuestionOrder() => clearField(5);

  @$pb.TagNumber(6)
  $core.List<AnswerOption> get options => $_getList(5);

  @$pb.TagNumber(7)
  QuestionCondition get condition => $_getN(6);
  @$pb.TagNumber(7)
  set condition(QuestionCondition v) { setField(7, v); }
  @$pb.TagNumber(7)
  $core.bool hasCondition() => $_has(6);
  @$pb.TagNumber(7)
  void clearCondition() => clearField(7);
  @$pb.TagNumber(7)
  QuestionCondition ensureCondition() => $_ensure(6);
}

class AnswerOption extends $pb.GeneratedMessage {
  factory AnswerOption({
    $core.String? value,
    $core.String? label,
    $core.int? order,
  }) {
    final $result = create();
    if (value != null) {
      $result.value = value;
    }
    if (label != null) {
      $result.label = label;
    }
    if (order != null) {
      $result.order = order;
    }
    return $result;
  }
  AnswerOption._() : super();
  factory AnswerOption.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory AnswerOption.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'AnswerOption', package: const $pb.PackageName(_omitMessageNames ? '' : 'ontheblock.survey.v1'), createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'value')
    ..aOS(2, _omitFieldNames ? '' : 'label')
    ..a<$core.int>(3, _omitFieldNames ? '' : 'order', $pb.PbFieldType.O3)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  AnswerOption clone() => AnswerOption()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  AnswerOption copyWith(void Function(AnswerOption) updates) => super.copyWith((message) => updates(message as AnswerOption)) as AnswerOption;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static AnswerOption create() => AnswerOption._();
  AnswerOption createEmptyInstance() => create();
  static $pb.PbList<AnswerOption> createRepeated() => $pb.PbList<AnswerOption>();
  @$core.pragma('dart2js:noInline')
  static AnswerOption getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<AnswerOption>(create);
  static AnswerOption? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get value => $_getSZ(0);
  @$pb.TagNumber(1)
  set value($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasValue() => $_has(0);
  @$pb.TagNumber(1)
  void clearValue() => clearField(1);

  @$pb.TagNumber(2)
  $core.String get label => $_getSZ(1);
  @$pb.TagNumber(2)
  set label($core.String v) { $_setString(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasLabel() => $_has(1);
  @$pb.TagNumber(2)
  void clearLabel() => clearField(2);

  @$pb.TagNumber(3)
  $core.int get order => $_getIZ(2);
  @$pb.TagNumber(3)
  set order($core.int v) { $_setSignedInt32(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasOrder() => $_has(2);
  @$pb.TagNumber(3)
  void clearOrder() => clearField(3);
}

/// Both fields empty means the question is always shown.
class QuestionCondition extends $pb.GeneratedMessage {
  factory QuestionCondition({
    $core.Iterable<$core.String>? q1In,
    $core.String? q2Includes,
  }) {
    final $result = create();
    if (q1In != null) {
      $result.q1In.addAll(q1In);
    }
    if (q2Includes != null) {
      $result.q2Includes = q2Includes;
    }
    return $result;
  }
  QuestionCondition._() : super();
  factory QuestionCondition.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory QuestionCondition.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'QuestionCondition', package: const $pb.PackageName(_omitMessageNames ? '' : 'ontheblock.survey.v1'), createEmptyInstance: create)
    ..pPS(1, _omitFieldNames ? '' : 'q1In')
    ..aOS(2, _omitFieldNames ? '' : 'q2Includes')
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  QuestionCondition clone() => QuestionCondition()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  QuestionCondition copyWith(void Function(QuestionCondition) updates) => super.copyWith((message) => updates(message as QuestionCondition)) as QuestionCondition;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static QuestionCondition create() => QuestionCondition._();
  QuestionCondition createEmptyInstance() => create();
  static $pb.PbList<QuestionCondition> createRepeated() => $pb.PbList<QuestionCondition>();
  @$core.pragma('dart2js:noInline')
  static QuestionCondition getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<QuestionCondition>(create);
  static QuestionCondition? _defaultInstance;

  @$pb.TagNumber(1)
  $core.List<$core.String> get q1In => $_getList(0);

  @$pb.TagNumber(2)
  $core.String get q2Includes => $_getSZ(1);
  @$pb.TagNumber(2)
  set q2Includes($core.String v) { $_setString(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasQ2Includes() => $_has(1);
  @$pb.TagNumber(2)
  void clearQ2Includes() => clearField(2);
}

class SubmitSurveyRequest extends $pb.GeneratedMessage {
  factory SubmitSurveyRequest({
    $core.String? userId,
    $core.String? level,
    $core.Iterable<$core.String>? categories,
    $core.Iterable<$core.String>? whiskey,
    $core.Iterable<$core.String>? wine,
    $core.Iterable<$core.String>? cocktail,
    $core.Iterable<$core.String>? beer,
    $core.Iterable<$core.String>? flavorKeywords,
    $core.String? budget,
  }) {
    final $result = create();
    if (userId != null) {
      $result.userId = userId;
    }
    if (level != null) {
      $result.level = level;
    }
    if (categories != null) {
      $result.categories.addAll(categories);
    }
    if (whiskey != null) {
      $result.whiskey.addAll(whiskey);
    }
    if (wine != null) {
      $result.wine.addAll(wine);
    }
    if (cocktail != null) {
      $result.cocktail.addAll(cocktail);
    }
    if (beer != null) {
      $result.beer.addAll(beer);
    }
    if (flavorKeywords != null) {
      $result.flavorKeywords.addAll(flavorKeywords);
    }
    if (budget != null) {
      $result.budget = budget;
    }
    return $result;
  }
  SubmitSurveyRequest._() : super();
  factory SubmitSurveyRequest.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory SubmitSurveyRequest.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'SubmitSurveyRequest', package: const $pb.PackageName(_omitMessageNames ? '' : 'ontheblock.survey.v1'), createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'userId')
    ..aOS(2, _omitFieldNames ? '' : 'level')
    ..pPS(3, _omitFieldNames ? '' : 'categories')
    ..pPS(4, _omitFieldNames ? '' : 'whiskey')
    ..pPS(5, _omitFieldNames ? '' : 'wine')
    ..pPS(6, _omitFieldNames ? '' : 'cocktail')
    ..pPS(7, _omitFieldNames ? '' : 'beer')
    ..pPS(8, _omitFieldNames ? '' : 'flavorKeywords')
    ..aOS(9, _omitFieldNames ? '' : 'budget')
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  SubmitSurveyRequest clone() => SubmitSurveyRequest()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  SubmitSurveyRequest copyWith(void Function(SubmitSurveyRequest) updates) => super.copyWith((message) => updates(message as SubmitSurveyRequest)) as SubmitSurveyRequest;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static SubmitSurveyRequest create() => SubmitSurveyRequest._();
  SubmitSurveyRequest createEmptyInstance() => create();
  static $pb.PbList<SubmitSurveyRequest> createRepeated() => $pb.PbList<SubmitSurveyRequest>();
  @$core.pragma('dart2js:noInline')
  static SubmitSurveyRequest getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<SubmitSurveyRequest>(create);
  static SubmitSurveyRequest? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get userId => $_getSZ(0);
  @$pb.TagNumber(1)
  set userId($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasUserId() => $_has(0);
  @$pb.TagNumber(1)
  void clearUserId() => clearField(1);

  @$pb.TagNumber(2)
  $core.String get level => $_getSZ(1);
  @$pb.TagNumber(2)
  set level($core.String v) { $_setString(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasLevel() => $_has(1);
  @$pb.TagNumber(2)
  void clearLevel() => clearField(2);

  @$pb.TagNumber(3)
  $core.List<$core.String> get categories => $_getList(2);

  @$pb.TagNumber(4)
  $core.List<$core.String> get whiskey => $_getList(3);

  @$pb.TagNumber(5)
  $core.List<$core.String> get wine => $_getList(4);

  @$pb.TagNumber(6)
  $core.List<$core.String> get cocktail => $_getList(5);

  @$pb.TagNumber(7)
  $core.List<$core.String> get beer => $_getList(6);

  @$pb.TagNumber(8)
  $core.List<$core.String> get flavorKeywords => $_getList(7);

  @$pb.TagNumber(9)
  $core.String get budget => $_getSZ(8);
  @$pb.TagNumber(9)
  set budget($core.String v) { $_setString(8, v); }
  @$pb.TagNumber(9)
  $core.bool hasBudget() => $_has(8);
  @$pb.TagNumber(9)
  void clearBudget() => clearField(9);
}

class SubmitSurveyResponse extends $pb.GeneratedMessage {
  factory SubmitSurveyResponse({
    $core.String? surveyId,
  }) {
    final $result = create();
    if (surveyId != null) {
      $result.surveyId = surveyId;
    }
    return $result;
  }
  SubmitSurveyResponse._() : super();
  factory SubmitSurveyResponse.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory SubmitSurveyResponse.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'SubmitSurveyResponse', package: const $pb.PackageName(_omitMessageNames ? '' : 'ontheblock.survey.v1'), createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'surveyId')
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  SubmitSurveyResponse clone() => SubmitSurveyResponse()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  SubmitSurveyResponse copyWith(void Function(SubmitSurveyResponse) updates) => super.copyWith((message) => updates(message as SubmitSurveyResponse)) as SubmitSurveyResponse;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static SubmitSurveyResponse create() => SubmitSurveyResponse._();
  SubmitSurveyResponse createEmptyInstance() => create();
  static $pb.PbList<SubmitSurveyResponse> createRepeated() => $pb.PbList<SubmitSurveyResponse>();
  @$core.pragma('dart2js:noInline')
  static SubmitSurveyResponse getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<SubmitSurveyResponse>(create);
  static SubmitSurveyResponse? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get surveyId => $_getSZ(0);
  @$pb.TagNumber(1)
  set surveyId($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasSurveyId() => $_has(0);
  @$pb.TagNumber(1)
  void clearSurveyId() => clearField(1);
}


const _omitFieldNames = $core.bool.fromEnvironment('protobuf.omit_field_names');
const _omitMessageNames = $core.bool.fromEnvironment('protobuf.omit_message_names');
