// This is a generated file - do not edit.
//
// Generated from survey/v1/survey.proto.

// @dart = 3.3

// ignore_for_file: annotate_overrides, camel_case_types, comment_references
// ignore_for_file: constant_identifier_names
// ignore_for_file: curly_braces_in_flow_control_structures
// ignore_for_file: deprecated_member_use_from_same_package, library_prefixes
// ignore_for_file: non_constant_identifier_names, prefer_relative_imports

import 'dart:core' as $core;

import 'package:protobuf/protobuf.dart' as $pb;
import 'package:protobuf/well_known_types/google/protobuf/timestamp.pb.dart'
    as $1;

export 'package:protobuf/protobuf.dart' show GeneratedMessageGenericExtensions;

class GetSurveyResultRequest extends $pb.GeneratedMessage {
  factory GetSurveyResultRequest({
    $core.String? surveyId,
  }) {
    final result = create();
    if (surveyId != null) result.surveyId = surveyId;
    return result;
  }

  GetSurveyResultRequest._();

  factory GetSurveyResultRequest.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory GetSurveyResultRequest.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'GetSurveyResultRequest',
      package: const $pb.PackageName(
          _omitMessageNames ? '' : 'ontheblock.survey.v1'),
      createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'surveyId')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  GetSurveyResultRequest clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  GetSurveyResultRequest copyWith(
          void Function(GetSurveyResultRequest) updates) =>
      super.copyWith((message) => updates(message as GetSurveyResultRequest))
          as GetSurveyResultRequest;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static GetSurveyResultRequest create() => GetSurveyResultRequest._();
  @$core.override
  GetSurveyResultRequest createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static GetSurveyResultRequest getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<GetSurveyResultRequest>(create);
  static GetSurveyResultRequest? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get surveyId => $_getSZ(0);
  @$pb.TagNumber(1)
  set surveyId($core.String value) => $_setString(0, value);
  @$pb.TagNumber(1)
  $core.bool hasSurveyId() => $_has(0);
  @$pb.TagNumber(1)
  void clearSurveyId() => $_clearField(1);
}

class GetSurveyResultByUserRequest extends $pb.GeneratedMessage {
  factory GetSurveyResultByUserRequest({
    $core.String? userId,
  }) {
    final result = create();
    if (userId != null) result.userId = userId;
    return result;
  }

  GetSurveyResultByUserRequest._();

  factory GetSurveyResultByUserRequest.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory GetSurveyResultByUserRequest.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'GetSurveyResultByUserRequest',
      package: const $pb.PackageName(
          _omitMessageNames ? '' : 'ontheblock.survey.v1'),
      createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'userId')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  GetSurveyResultByUserRequest clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  GetSurveyResultByUserRequest copyWith(
          void Function(GetSurveyResultByUserRequest) updates) =>
      super.copyWith(
              (message) => updates(message as GetSurveyResultByUserRequest))
          as GetSurveyResultByUserRequest;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static GetSurveyResultByUserRequest create() =>
      GetSurveyResultByUserRequest._();
  @$core.override
  GetSurveyResultByUserRequest createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static GetSurveyResultByUserRequest getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<GetSurveyResultByUserRequest>(create);
  static GetSurveyResultByUserRequest? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get userId => $_getSZ(0);
  @$pb.TagNumber(1)
  set userId($core.String value) => $_setString(0, value);
  @$pb.TagNumber(1)
  $core.bool hasUserId() => $_has(0);
  @$pb.TagNumber(1)
  void clearUserId() => $_clearField(1);
}

class GetSurveyResultResponse extends $pb.GeneratedMessage {
  factory GetSurveyResultResponse({
    SurveyResult? result,
  }) {
    final result$ = create();
    if (result != null) result$.result = result;
    return result$;
  }

  GetSurveyResultResponse._();

  factory GetSurveyResultResponse.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory GetSurveyResultResponse.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'GetSurveyResultResponse',
      package: const $pb.PackageName(
          _omitMessageNames ? '' : 'ontheblock.survey.v1'),
      createEmptyInstance: create)
    ..aOM<SurveyResult>(1, _omitFieldNames ? '' : 'result',
        subBuilder: SurveyResult.create)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  GetSurveyResultResponse clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  GetSurveyResultResponse copyWith(
          void Function(GetSurveyResultResponse) updates) =>
      super.copyWith((message) => updates(message as GetSurveyResultResponse))
          as GetSurveyResultResponse;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static GetSurveyResultResponse create() => GetSurveyResultResponse._();
  @$core.override
  GetSurveyResultResponse createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static GetSurveyResultResponse getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<GetSurveyResultResponse>(create);
  static GetSurveyResultResponse? _defaultInstance;

  @$pb.TagNumber(1)
  SurveyResult get result => $_getN(0);
  @$pb.TagNumber(1)
  set result(SurveyResult value) => $_setField(1, value);
  @$pb.TagNumber(1)
  $core.bool hasResult() => $_has(0);
  @$pb.TagNumber(1)
  void clearResult() => $_clearField(1);
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
    final result = create();
    if (surveyId != null) result.surveyId = surveyId;
    if (userId != null) result.userId = userId;
    if (level != null) result.level = level;
    if (categories != null) result.categories.addAll(categories);
    if (whiskey != null) result.whiskey.addAll(whiskey);
    if (wine != null) result.wine.addAll(wine);
    if (cocktail != null) result.cocktail.addAll(cocktail);
    if (beer != null) result.beer.addAll(beer);
    if (flavorKeywords != null) result.flavorKeywords.addAll(flavorKeywords);
    if (budget != null) result.budget = budget;
    if (submittedAt != null) result.submittedAt = submittedAt;
    return result;
  }

  SurveyResult._();

  factory SurveyResult.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory SurveyResult.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'SurveyResult',
      package: const $pb.PackageName(
          _omitMessageNames ? '' : 'ontheblock.survey.v1'),
      createEmptyInstance: create)
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
    ..aOM<$1.Timestamp>(11, _omitFieldNames ? '' : 'submittedAt',
        subBuilder: $1.Timestamp.create)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  SurveyResult clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  SurveyResult copyWith(void Function(SurveyResult) updates) =>
      super.copyWith((message) => updates(message as SurveyResult))
          as SurveyResult;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static SurveyResult create() => SurveyResult._();
  @$core.override
  SurveyResult createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static SurveyResult getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<SurveyResult>(create);
  static SurveyResult? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get surveyId => $_getSZ(0);
  @$pb.TagNumber(1)
  set surveyId($core.String value) => $_setString(0, value);
  @$pb.TagNumber(1)
  $core.bool hasSurveyId() => $_has(0);
  @$pb.TagNumber(1)
  void clearSurveyId() => $_clearField(1);

  @$pb.TagNumber(2)
  $core.String get userId => $_getSZ(1);
  @$pb.TagNumber(2)
  set userId($core.String value) => $_setString(1, value);
  @$pb.TagNumber(2)
  $core.bool hasUserId() => $_has(1);
  @$pb.TagNumber(2)
  void clearUserId() => $_clearField(2);

  /// level: beginner | enthusiast | expert
  @$pb.TagNumber(3)
  $core.String get level => $_getSZ(2);
  @$pb.TagNumber(3)
  set level($core.String value) => $_setString(2, value);
  @$pb.TagNumber(3)
  $core.bool hasLevel() => $_has(2);
  @$pb.TagNumber(3)
  void clearLevel() => $_clearField(3);

  /// categories selected by user: whiskey | wine | cognac | cocktail | beer
  @$pb.TagNumber(4)
  $pb.PbList<$core.String> get categories => $_getList(3);

  /// drink-category preferences (empty = not selected or skipped)
  /// values: bourbon_character | sherry_character | peat_character | floral_citrus | american_whiskey
  @$pb.TagNumber(5)
  $pb.PbList<$core.String> get whiskey => $_getList(4);

  /// values: full_red | light_red_rose | white | sparkling | fortified
  @$pb.TagNumber(6)
  $pb.PbList<$core.String> get wine => $_getList(5);

  /// values: tropical_tiki | tart_balanced | refreshing_long | dessert_cream | bold_spirit_fwd
  @$pb.TagNumber(7)
  $pb.PbList<$core.String> get cocktail => $_getList(6);

  /// values: lager_pilsner | weizen_white | pale_ale_ipa | stout_porter | sour_wild
  @$pb.TagNumber(8)
  $pb.PbList<$core.String> get beer => $_getList(7);

  /// flavor keywords (up to 3)
  /// values: vanilla_caramel | citrus_berry | dried_choco | oak_woody |
  ///         smoky_peated | almond_nutty | floral | spicy | herb_mint
  @$pb.TagNumber(9)
  $pb.PbList<$core.String> get flavorKeywords => $_getList(8);

  /// budget: under_30k | 30k_100k | 100k_200k | over_200k
  @$pb.TagNumber(10)
  $core.String get budget => $_getSZ(9);
  @$pb.TagNumber(10)
  set budget($core.String value) => $_setString(9, value);
  @$pb.TagNumber(10)
  $core.bool hasBudget() => $_has(9);
  @$pb.TagNumber(10)
  void clearBudget() => $_clearField(10);

  @$pb.TagNumber(11)
  $1.Timestamp get submittedAt => $_getN(10);
  @$pb.TagNumber(11)
  set submittedAt($1.Timestamp value) => $_setField(11, value);
  @$pb.TagNumber(11)
  $core.bool hasSubmittedAt() => $_has(10);
  @$pb.TagNumber(11)
  void clearSubmittedAt() => $_clearField(11);
  @$pb.TagNumber(11)
  $1.Timestamp ensureSubmittedAt() => $_ensure(10);
}

class GetSurveyQuestionsRequest extends $pb.GeneratedMessage {
  factory GetSurveyQuestionsRequest() => create();

  GetSurveyQuestionsRequest._();

  factory GetSurveyQuestionsRequest.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory GetSurveyQuestionsRequest.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'GetSurveyQuestionsRequest',
      package: const $pb.PackageName(
          _omitMessageNames ? '' : 'ontheblock.survey.v1'),
      createEmptyInstance: create)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  GetSurveyQuestionsRequest clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  GetSurveyQuestionsRequest copyWith(
          void Function(GetSurveyQuestionsRequest) updates) =>
      super.copyWith((message) => updates(message as GetSurveyQuestionsRequest))
          as GetSurveyQuestionsRequest;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static GetSurveyQuestionsRequest create() => GetSurveyQuestionsRequest._();
  @$core.override
  GetSurveyQuestionsRequest createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static GetSurveyQuestionsRequest getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<GetSurveyQuestionsRequest>(create);
  static GetSurveyQuestionsRequest? _defaultInstance;
}

class GetSurveyQuestionsResponse extends $pb.GeneratedMessage {
  factory GetSurveyQuestionsResponse({
    $core.Iterable<SurveyQuestion>? questions,
  }) {
    final result = create();
    if (questions != null) result.questions.addAll(questions);
    return result;
  }

  GetSurveyQuestionsResponse._();

  factory GetSurveyQuestionsResponse.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory GetSurveyQuestionsResponse.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'GetSurveyQuestionsResponse',
      package: const $pb.PackageName(
          _omitMessageNames ? '' : 'ontheblock.survey.v1'),
      createEmptyInstance: create)
    ..pPM<SurveyQuestion>(1, _omitFieldNames ? '' : 'questions',
        subBuilder: SurveyQuestion.create)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  GetSurveyQuestionsResponse clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  GetSurveyQuestionsResponse copyWith(
          void Function(GetSurveyQuestionsResponse) updates) =>
      super.copyWith(
              (message) => updates(message as GetSurveyQuestionsResponse))
          as GetSurveyQuestionsResponse;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static GetSurveyQuestionsResponse create() => GetSurveyQuestionsResponse._();
  @$core.override
  GetSurveyQuestionsResponse createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static GetSurveyQuestionsResponse getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<GetSurveyQuestionsResponse>(create);
  static GetSurveyQuestionsResponse? _defaultInstance;

  @$pb.TagNumber(1)
  $pb.PbList<SurveyQuestion> get questions => $_getList(0);
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
    final result = create();
    if (questionKey != null) result.questionKey = questionKey;
    if (questionText != null) result.questionText = questionText;
    if (questionType != null) result.questionType = questionType;
    if (maxSelections != null) result.maxSelections = maxSelections;
    if (questionOrder != null) result.questionOrder = questionOrder;
    if (options != null) result.options.addAll(options);
    if (condition != null) result.condition = condition;
    return result;
  }

  SurveyQuestion._();

  factory SurveyQuestion.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory SurveyQuestion.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'SurveyQuestion',
      package: const $pb.PackageName(
          _omitMessageNames ? '' : 'ontheblock.survey.v1'),
      createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'questionKey')
    ..aOS(2, _omitFieldNames ? '' : 'questionText')
    ..aOS(3, _omitFieldNames ? '' : 'questionType')
    ..aI(4, _omitFieldNames ? '' : 'maxSelections')
    ..aI(5, _omitFieldNames ? '' : 'questionOrder')
    ..pPM<AnswerOption>(6, _omitFieldNames ? '' : 'options',
        subBuilder: AnswerOption.create)
    ..aOM<QuestionCondition>(7, _omitFieldNames ? '' : 'condition',
        subBuilder: QuestionCondition.create)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  SurveyQuestion clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  SurveyQuestion copyWith(void Function(SurveyQuestion) updates) =>
      super.copyWith((message) => updates(message as SurveyQuestion))
          as SurveyQuestion;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static SurveyQuestion create() => SurveyQuestion._();
  @$core.override
  SurveyQuestion createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static SurveyQuestion getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<SurveyQuestion>(create);
  static SurveyQuestion? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get questionKey => $_getSZ(0);
  @$pb.TagNumber(1)
  set questionKey($core.String value) => $_setString(0, value);
  @$pb.TagNumber(1)
  $core.bool hasQuestionKey() => $_has(0);
  @$pb.TagNumber(1)
  void clearQuestionKey() => $_clearField(1);

  @$pb.TagNumber(2)
  $core.String get questionText => $_getSZ(1);
  @$pb.TagNumber(2)
  set questionText($core.String value) => $_setString(1, value);
  @$pb.TagNumber(2)
  $core.bool hasQuestionText() => $_has(1);
  @$pb.TagNumber(2)
  void clearQuestionText() => $_clearField(2);

  @$pb.TagNumber(3)
  $core.String get questionType => $_getSZ(2);
  @$pb.TagNumber(3)
  set questionType($core.String value) => $_setString(2, value);
  @$pb.TagNumber(3)
  $core.bool hasQuestionType() => $_has(2);
  @$pb.TagNumber(3)
  void clearQuestionType() => $_clearField(3);

  @$pb.TagNumber(4)
  $core.int get maxSelections => $_getIZ(3);
  @$pb.TagNumber(4)
  set maxSelections($core.int value) => $_setSignedInt32(3, value);
  @$pb.TagNumber(4)
  $core.bool hasMaxSelections() => $_has(3);
  @$pb.TagNumber(4)
  void clearMaxSelections() => $_clearField(4);

  @$pb.TagNumber(5)
  $core.int get questionOrder => $_getIZ(4);
  @$pb.TagNumber(5)
  set questionOrder($core.int value) => $_setSignedInt32(4, value);
  @$pb.TagNumber(5)
  $core.bool hasQuestionOrder() => $_has(4);
  @$pb.TagNumber(5)
  void clearQuestionOrder() => $_clearField(5);

  @$pb.TagNumber(6)
  $pb.PbList<AnswerOption> get options => $_getList(5);

  @$pb.TagNumber(7)
  QuestionCondition get condition => $_getN(6);
  @$pb.TagNumber(7)
  set condition(QuestionCondition value) => $_setField(7, value);
  @$pb.TagNumber(7)
  $core.bool hasCondition() => $_has(6);
  @$pb.TagNumber(7)
  void clearCondition() => $_clearField(7);
  @$pb.TagNumber(7)
  QuestionCondition ensureCondition() => $_ensure(6);
}

class AnswerOption extends $pb.GeneratedMessage {
  factory AnswerOption({
    $core.String? value,
    $core.String? label,
    $core.int? order,
  }) {
    final result = create();
    if (value != null) result.value = value;
    if (label != null) result.label = label;
    if (order != null) result.order = order;
    return result;
  }

  AnswerOption._();

  factory AnswerOption.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory AnswerOption.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'AnswerOption',
      package: const $pb.PackageName(
          _omitMessageNames ? '' : 'ontheblock.survey.v1'),
      createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'value')
    ..aOS(2, _omitFieldNames ? '' : 'label')
    ..aI(3, _omitFieldNames ? '' : 'order')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  AnswerOption clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  AnswerOption copyWith(void Function(AnswerOption) updates) =>
      super.copyWith((message) => updates(message as AnswerOption))
          as AnswerOption;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static AnswerOption create() => AnswerOption._();
  @$core.override
  AnswerOption createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static AnswerOption getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<AnswerOption>(create);
  static AnswerOption? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get value => $_getSZ(0);
  @$pb.TagNumber(1)
  set value($core.String value) => $_setString(0, value);
  @$pb.TagNumber(1)
  $core.bool hasValue() => $_has(0);
  @$pb.TagNumber(1)
  void clearValue() => $_clearField(1);

  @$pb.TagNumber(2)
  $core.String get label => $_getSZ(1);
  @$pb.TagNumber(2)
  set label($core.String value) => $_setString(1, value);
  @$pb.TagNumber(2)
  $core.bool hasLabel() => $_has(1);
  @$pb.TagNumber(2)
  void clearLabel() => $_clearField(2);

  @$pb.TagNumber(3)
  $core.int get order => $_getIZ(2);
  @$pb.TagNumber(3)
  set order($core.int value) => $_setSignedInt32(2, value);
  @$pb.TagNumber(3)
  $core.bool hasOrder() => $_has(2);
  @$pb.TagNumber(3)
  void clearOrder() => $_clearField(3);
}

/// Both fields empty means the question is always shown.
class QuestionCondition extends $pb.GeneratedMessage {
  factory QuestionCondition({
    $core.Iterable<$core.String>? q1In,
    $core.String? q2Includes,
  }) {
    final result = create();
    if (q1In != null) result.q1In.addAll(q1In);
    if (q2Includes != null) result.q2Includes = q2Includes;
    return result;
  }

  QuestionCondition._();

  factory QuestionCondition.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory QuestionCondition.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'QuestionCondition',
      package: const $pb.PackageName(
          _omitMessageNames ? '' : 'ontheblock.survey.v1'),
      createEmptyInstance: create)
    ..pPS(1, _omitFieldNames ? '' : 'q1In')
    ..aOS(2, _omitFieldNames ? '' : 'q2Includes')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  QuestionCondition clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  QuestionCondition copyWith(void Function(QuestionCondition) updates) =>
      super.copyWith((message) => updates(message as QuestionCondition))
          as QuestionCondition;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static QuestionCondition create() => QuestionCondition._();
  @$core.override
  QuestionCondition createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static QuestionCondition getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<QuestionCondition>(create);
  static QuestionCondition? _defaultInstance;

  @$pb.TagNumber(1)
  $pb.PbList<$core.String> get q1In => $_getList(0);

  @$pb.TagNumber(2)
  $core.String get q2Includes => $_getSZ(1);
  @$pb.TagNumber(2)
  set q2Includes($core.String value) => $_setString(1, value);
  @$pb.TagNumber(2)
  $core.bool hasQ2Includes() => $_has(1);
  @$pb.TagNumber(2)
  void clearQ2Includes() => $_clearField(2);
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
    final result = create();
    if (userId != null) result.userId = userId;
    if (level != null) result.level = level;
    if (categories != null) result.categories.addAll(categories);
    if (whiskey != null) result.whiskey.addAll(whiskey);
    if (wine != null) result.wine.addAll(wine);
    if (cocktail != null) result.cocktail.addAll(cocktail);
    if (beer != null) result.beer.addAll(beer);
    if (flavorKeywords != null) result.flavorKeywords.addAll(flavorKeywords);
    if (budget != null) result.budget = budget;
    return result;
  }

  SubmitSurveyRequest._();

  factory SubmitSurveyRequest.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory SubmitSurveyRequest.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'SubmitSurveyRequest',
      package: const $pb.PackageName(
          _omitMessageNames ? '' : 'ontheblock.survey.v1'),
      createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'userId')
    ..aOS(2, _omitFieldNames ? '' : 'level')
    ..pPS(3, _omitFieldNames ? '' : 'categories')
    ..pPS(4, _omitFieldNames ? '' : 'whiskey')
    ..pPS(5, _omitFieldNames ? '' : 'wine')
    ..pPS(6, _omitFieldNames ? '' : 'cocktail')
    ..pPS(7, _omitFieldNames ? '' : 'beer')
    ..pPS(8, _omitFieldNames ? '' : 'flavorKeywords')
    ..aOS(9, _omitFieldNames ? '' : 'budget')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  SubmitSurveyRequest clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  SubmitSurveyRequest copyWith(void Function(SubmitSurveyRequest) updates) =>
      super.copyWith((message) => updates(message as SubmitSurveyRequest))
          as SubmitSurveyRequest;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static SubmitSurveyRequest create() => SubmitSurveyRequest._();
  @$core.override
  SubmitSurveyRequest createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static SubmitSurveyRequest getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<SubmitSurveyRequest>(create);
  static SubmitSurveyRequest? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get userId => $_getSZ(0);
  @$pb.TagNumber(1)
  set userId($core.String value) => $_setString(0, value);
  @$pb.TagNumber(1)
  $core.bool hasUserId() => $_has(0);
  @$pb.TagNumber(1)
  void clearUserId() => $_clearField(1);

  @$pb.TagNumber(2)
  $core.String get level => $_getSZ(1);
  @$pb.TagNumber(2)
  set level($core.String value) => $_setString(1, value);
  @$pb.TagNumber(2)
  $core.bool hasLevel() => $_has(1);
  @$pb.TagNumber(2)
  void clearLevel() => $_clearField(2);

  @$pb.TagNumber(3)
  $pb.PbList<$core.String> get categories => $_getList(2);

  @$pb.TagNumber(4)
  $pb.PbList<$core.String> get whiskey => $_getList(3);

  @$pb.TagNumber(5)
  $pb.PbList<$core.String> get wine => $_getList(4);

  @$pb.TagNumber(6)
  $pb.PbList<$core.String> get cocktail => $_getList(5);

  @$pb.TagNumber(7)
  $pb.PbList<$core.String> get beer => $_getList(6);

  @$pb.TagNumber(8)
  $pb.PbList<$core.String> get flavorKeywords => $_getList(7);

  @$pb.TagNumber(9)
  $core.String get budget => $_getSZ(8);
  @$pb.TagNumber(9)
  set budget($core.String value) => $_setString(8, value);
  @$pb.TagNumber(9)
  $core.bool hasBudget() => $_has(8);
  @$pb.TagNumber(9)
  void clearBudget() => $_clearField(9);
}

class SubmitSurveyResponse extends $pb.GeneratedMessage {
  factory SubmitSurveyResponse({
    $core.String? surveyId,
  }) {
    final result = create();
    if (surveyId != null) result.surveyId = surveyId;
    return result;
  }

  SubmitSurveyResponse._();

  factory SubmitSurveyResponse.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory SubmitSurveyResponse.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'SubmitSurveyResponse',
      package: const $pb.PackageName(
          _omitMessageNames ? '' : 'ontheblock.survey.v1'),
      createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'surveyId')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  SubmitSurveyResponse clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  SubmitSurveyResponse copyWith(void Function(SubmitSurveyResponse) updates) =>
      super.copyWith((message) => updates(message as SubmitSurveyResponse))
          as SubmitSurveyResponse;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static SubmitSurveyResponse create() => SubmitSurveyResponse._();
  @$core.override
  SubmitSurveyResponse createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static SubmitSurveyResponse getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<SubmitSurveyResponse>(create);
  static SubmitSurveyResponse? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get surveyId => $_getSZ(0);
  @$pb.TagNumber(1)
  set surveyId($core.String value) => $_setString(0, value);
  @$pb.TagNumber(1)
  $core.bool hasSurveyId() => $_has(0);
  @$pb.TagNumber(1)
  void clearSurveyId() => $_clearField(1);
}

const $core.bool _omitFieldNames =
    $core.bool.fromEnvironment('protobuf.omit_field_names');
const $core.bool _omitMessageNames =
    $core.bool.fromEnvironment('protobuf.omit_message_names');
