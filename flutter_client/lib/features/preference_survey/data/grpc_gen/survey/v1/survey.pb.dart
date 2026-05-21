//
//  Generated code. Do not modify.
//  source: survey.proto
//
// @dart = 2.12

// ignore_for_file: annotate_overrides, camel_case_types, comment_references
// ignore_for_file: constant_identifier_names, library_prefixes
// ignore_for_file: non_constant_identifier_names, prefer_final_fields
// ignore_for_file: unnecessary_import, unnecessary_this, unused_import

import 'dart:core' as $core;

import 'package:protobuf/protobuf.dart' as $pb;

class GetSurveyQuestionsRequest extends $pb.GeneratedMessage {
  factory GetSurveyQuestionsRequest() => create();
  GetSurveyQuestionsRequest._() : super();
  factory GetSurveyQuestionsRequest.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory GetSurveyQuestionsRequest.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'GetSurveyQuestionsRequest', package: const $pb.PackageName(_omitMessageNames ? '' : 'ontheblock.survey.v1'), createEmptyInstance: create)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated('Using this can add significant overhead to your binary. Use [GeneratedMessageGenericExtensions.deepCopy] instead. Will be removed in next major version')
  GetSurveyQuestionsRequest clone() => GetSurveyQuestionsRequest()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. Use [GeneratedMessageGenericExtensions.rebuild] instead. Will be removed in next major version')
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

class AnswerOption extends $pb.GeneratedMessage {
  factory AnswerOption({
    $core.String? value,
    $core.String? label,
    $core.int? order,
  }) {
    final $result = create();
    if (value != null) $result.value = value;
    if (label != null) $result.label = label;
    if (order != null) $result.order = order;
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

  @$core.Deprecated('Using this can add significant overhead to your binary. Use [GeneratedMessageGenericExtensions.deepCopy] instead. Will be removed in next major version')
  AnswerOption clone() => AnswerOption()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. Use [GeneratedMessageGenericExtensions.rebuild] instead. Will be removed in next major version')
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

class QuestionCondition extends $pb.GeneratedMessage {
  factory QuestionCondition({
    $core.Iterable<$core.String>? q1In,
    $core.String? q2Includes,
  }) {
    final $result = create();
    if (q1In != null) $result.q1In.addAll(q1In);
    if (q2Includes != null) $result.q2Includes = q2Includes;
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

  @$core.Deprecated('Using this can add significant overhead to your binary. Use [GeneratedMessageGenericExtensions.deepCopy] instead. Will be removed in next major version')
  QuestionCondition clone() => QuestionCondition()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. Use [GeneratedMessageGenericExtensions.rebuild] instead. Will be removed in next major version')
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
    if (questionKey != null) $result.questionKey = questionKey;
    if (questionText != null) $result.questionText = questionText;
    if (questionType != null) $result.questionType = questionType;
    if (maxSelections != null) $result.maxSelections = maxSelections;
    if (questionOrder != null) $result.questionOrder = questionOrder;
    if (options != null) $result.options.addAll(options);
    if (condition != null) $result.condition = condition;
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

  @$core.Deprecated('Using this can add significant overhead to your binary. Use [GeneratedMessageGenericExtensions.deepCopy] instead. Will be removed in next major version')
  SurveyQuestion clone() => SurveyQuestion()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. Use [GeneratedMessageGenericExtensions.rebuild] instead. Will be removed in next major version')
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

class GetSurveyQuestionsResponse extends $pb.GeneratedMessage {
  factory GetSurveyQuestionsResponse({
    $core.Iterable<SurveyQuestion>? questions,
  }) {
    final $result = create();
    if (questions != null) $result.questions.addAll(questions);
    return $result;
  }
  GetSurveyQuestionsResponse._() : super();
  factory GetSurveyQuestionsResponse.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory GetSurveyQuestionsResponse.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'GetSurveyQuestionsResponse', package: const $pb.PackageName(_omitMessageNames ? '' : 'ontheblock.survey.v1'), createEmptyInstance: create)
    ..pc<SurveyQuestion>(1, _omitFieldNames ? '' : 'questions', $pb.PbFieldType.PM, subBuilder: SurveyQuestion.create)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated('Using this can add significant overhead to your binary. Use [GeneratedMessageGenericExtensions.deepCopy] instead. Will be removed in next major version')
  GetSurveyQuestionsResponse clone() => GetSurveyQuestionsResponse()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. Use [GeneratedMessageGenericExtensions.rebuild] instead. Will be removed in next major version')
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

const _omitFieldNames = $core.bool.fromEnvironment('protobuf.omit_field_names');
const _omitMessageNames = $core.bool.fromEnvironment('protobuf.omit_message_names');
