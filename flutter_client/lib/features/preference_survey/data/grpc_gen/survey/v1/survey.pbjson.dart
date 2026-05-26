// This is a generated file - do not edit.
//
// Generated from survey/v1/survey.proto.

// @dart = 3.3

// ignore_for_file: annotate_overrides, camel_case_types, comment_references
// ignore_for_file: constant_identifier_names
// ignore_for_file: curly_braces_in_flow_control_structures
// ignore_for_file: deprecated_member_use_from_same_package, library_prefixes
// ignore_for_file: non_constant_identifier_names, prefer_relative_imports
// ignore_for_file: unused_import

import 'dart:convert' as $convert;
import 'dart:core' as $core;
import 'dart:typed_data' as $typed_data;

@$core.Deprecated('Use getSurveyResultRequestDescriptor instead')
const GetSurveyResultRequest$json = {
  '1': 'GetSurveyResultRequest',
  '2': [
    {'1': 'survey_id', '3': 1, '4': 1, '5': 9, '10': 'surveyId'},
  ],
};

/// Descriptor for `GetSurveyResultRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List getSurveyResultRequestDescriptor =
    $convert.base64Decode(
        'ChZHZXRTdXJ2ZXlSZXN1bHRSZXF1ZXN0EhsKCXN1cnZleV9pZBgBIAEoCVIIc3VydmV5SWQ=');

@$core.Deprecated('Use getSurveyResultByUserRequestDescriptor instead')
const GetSurveyResultByUserRequest$json = {
  '1': 'GetSurveyResultByUserRequest',
  '2': [
    {'1': 'user_id', '3': 1, '4': 1, '5': 9, '10': 'userId'},
  ],
};

/// Descriptor for `GetSurveyResultByUserRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List getSurveyResultByUserRequestDescriptor =
    $convert.base64Decode(
        'ChxHZXRTdXJ2ZXlSZXN1bHRCeVVzZXJSZXF1ZXN0EhcKB3VzZXJfaWQYASABKAlSBnVzZXJJZA'
        '==');

@$core.Deprecated('Use getSurveyResultResponseDescriptor instead')
const GetSurveyResultResponse$json = {
  '1': 'GetSurveyResultResponse',
  '2': [
    {
      '1': 'result',
      '3': 1,
      '4': 1,
      '5': 11,
      '6': '.ontheblock.survey.v1.SurveyResult',
      '10': 'result'
    },
  ],
};

/// Descriptor for `GetSurveyResultResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List getSurveyResultResponseDescriptor =
    $convert.base64Decode(
        'ChdHZXRTdXJ2ZXlSZXN1bHRSZXNwb25zZRI6CgZyZXN1bHQYASABKAsyIi5vbnRoZWJsb2NrLn'
        'N1cnZleS52MS5TdXJ2ZXlSZXN1bHRSBnJlc3VsdA==');

@$core.Deprecated('Use surveyResultDescriptor instead')
const SurveyResult$json = {
  '1': 'SurveyResult',
  '2': [
    {'1': 'survey_id', '3': 1, '4': 1, '5': 9, '10': 'surveyId'},
    {'1': 'user_id', '3': 2, '4': 1, '5': 9, '10': 'userId'},
    {'1': 'level', '3': 3, '4': 1, '5': 9, '10': 'level'},
    {'1': 'categories', '3': 4, '4': 3, '5': 9, '10': 'categories'},
    {'1': 'whiskey', '3': 5, '4': 3, '5': 9, '10': 'whiskey'},
    {'1': 'wine', '3': 6, '4': 3, '5': 9, '10': 'wine'},
    {'1': 'cocktail', '3': 7, '4': 3, '5': 9, '10': 'cocktail'},
    {'1': 'beer', '3': 8, '4': 3, '5': 9, '10': 'beer'},
    {'1': 'flavor_keywords', '3': 9, '4': 3, '5': 9, '10': 'flavorKeywords'},
    {'1': 'budget', '3': 10, '4': 1, '5': 9, '10': 'budget'},
    {
      '1': 'submitted_at',
      '3': 11,
      '4': 1,
      '5': 11,
      '6': '.google.protobuf.Timestamp',
      '10': 'submittedAt'
    },
  ],
};

/// Descriptor for `SurveyResult`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List surveyResultDescriptor = $convert.base64Decode(
    'CgxTdXJ2ZXlSZXN1bHQSGwoJc3VydmV5X2lkGAEgASgJUghzdXJ2ZXlJZBIXCgd1c2VyX2lkGA'
    'IgASgJUgZ1c2VySWQSFAoFbGV2ZWwYAyABKAlSBWxldmVsEh4KCmNhdGVnb3JpZXMYBCADKAlS'
    'CmNhdGVnb3JpZXMSGAoHd2hpc2tleRgFIAMoCVIHd2hpc2tleRISCgR3aW5lGAYgAygJUgR3aW'
    '5lEhoKCGNvY2t0YWlsGAcgAygJUghjb2NrdGFpbBISCgRiZWVyGAggAygJUgRiZWVyEicKD2Zs'
    'YXZvcl9rZXl3b3JkcxgJIAMoCVIOZmxhdm9yS2V5d29yZHMSFgoGYnVkZ2V0GAogASgJUgZidW'
    'RnZXQSPQoMc3VibWl0dGVkX2F0GAsgASgLMhouZ29vZ2xlLnByb3RvYnVmLlRpbWVzdGFtcFIL'
    'c3VibWl0dGVkQXQ=');

@$core.Deprecated('Use getSurveyQuestionsRequestDescriptor instead')
const GetSurveyQuestionsRequest$json = {
  '1': 'GetSurveyQuestionsRequest',
};

/// Descriptor for `GetSurveyQuestionsRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List getSurveyQuestionsRequestDescriptor =
    $convert.base64Decode('ChlHZXRTdXJ2ZXlRdWVzdGlvbnNSZXF1ZXN0');

@$core.Deprecated('Use getSurveyQuestionsResponseDescriptor instead')
const GetSurveyQuestionsResponse$json = {
  '1': 'GetSurveyQuestionsResponse',
  '2': [
    {
      '1': 'questions',
      '3': 1,
      '4': 3,
      '5': 11,
      '6': '.ontheblock.survey.v1.SurveyQuestion',
      '10': 'questions'
    },
  ],
};

/// Descriptor for `GetSurveyQuestionsResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List getSurveyQuestionsResponseDescriptor =
    $convert.base64Decode(
        'ChpHZXRTdXJ2ZXlRdWVzdGlvbnNSZXNwb25zZRJCCglxdWVzdGlvbnMYASADKAsyJC5vbnRoZW'
        'Jsb2NrLnN1cnZleS52MS5TdXJ2ZXlRdWVzdGlvblIJcXVlc3Rpb25z');

@$core.Deprecated('Use surveyQuestionDescriptor instead')
const SurveyQuestion$json = {
  '1': 'SurveyQuestion',
  '2': [
    {'1': 'question_key', '3': 1, '4': 1, '5': 9, '10': 'questionKey'},
    {'1': 'question_text', '3': 2, '4': 1, '5': 9, '10': 'questionText'},
    {'1': 'question_type', '3': 3, '4': 1, '5': 9, '10': 'questionType'},
    {'1': 'max_selections', '3': 4, '4': 1, '5': 5, '10': 'maxSelections'},
    {'1': 'question_order', '3': 5, '4': 1, '5': 5, '10': 'questionOrder'},
    {
      '1': 'options',
      '3': 6,
      '4': 3,
      '5': 11,
      '6': '.ontheblock.survey.v1.AnswerOption',
      '10': 'options'
    },
    {
      '1': 'condition',
      '3': 7,
      '4': 1,
      '5': 11,
      '6': '.ontheblock.survey.v1.QuestionCondition',
      '10': 'condition'
    },
  ],
};

/// Descriptor for `SurveyQuestion`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List surveyQuestionDescriptor = $convert.base64Decode(
    'Cg5TdXJ2ZXlRdWVzdGlvbhIhCgxxdWVzdGlvbl9rZXkYASABKAlSC3F1ZXN0aW9uS2V5EiMKDX'
    'F1ZXN0aW9uX3RleHQYAiABKAlSDHF1ZXN0aW9uVGV4dBIjCg1xdWVzdGlvbl90eXBlGAMgASgJ'
    'UgxxdWVzdGlvblR5cGUSJQoObWF4X3NlbGVjdGlvbnMYBCABKAVSDW1heFNlbGVjdGlvbnMSJQ'
    'oOcXVlc3Rpb25fb3JkZXIYBSABKAVSDXF1ZXN0aW9uT3JkZXISPAoHb3B0aW9ucxgGIAMoCzIi'
    'Lm9udGhlYmxvY2suc3VydmV5LnYxLkFuc3dlck9wdGlvblIHb3B0aW9ucxJFCgljb25kaXRpb2'
    '4YByABKAsyJy5vbnRoZWJsb2NrLnN1cnZleS52MS5RdWVzdGlvbkNvbmRpdGlvblIJY29uZGl0'
    'aW9u');

@$core.Deprecated('Use answerOptionDescriptor instead')
const AnswerOption$json = {
  '1': 'AnswerOption',
  '2': [
    {'1': 'value', '3': 1, '4': 1, '5': 9, '10': 'value'},
    {'1': 'label', '3': 2, '4': 1, '5': 9, '10': 'label'},
    {'1': 'order', '3': 3, '4': 1, '5': 5, '10': 'order'},
  ],
};

/// Descriptor for `AnswerOption`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List answerOptionDescriptor = $convert.base64Decode(
    'CgxBbnN3ZXJPcHRpb24SFAoFdmFsdWUYASABKAlSBXZhbHVlEhQKBWxhYmVsGAIgASgJUgVsYW'
    'JlbBIUCgVvcmRlchgDIAEoBVIFb3JkZXI=');

@$core.Deprecated('Use questionConditionDescriptor instead')
const QuestionCondition$json = {
  '1': 'QuestionCondition',
  '2': [
    {'1': 'q1_in', '3': 1, '4': 3, '5': 9, '10': 'q1In'},
    {'1': 'q2_includes', '3': 2, '4': 1, '5': 9, '10': 'q2Includes'},
  ],
};

/// Descriptor for `QuestionCondition`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List questionConditionDescriptor = $convert.base64Decode(
    'ChFRdWVzdGlvbkNvbmRpdGlvbhITCgVxMV9pbhgBIAMoCVIEcTFJbhIfCgtxMl9pbmNsdWRlcx'
    'gCIAEoCVIKcTJJbmNsdWRlcw==');

@$core.Deprecated('Use submitSurveyRequestDescriptor instead')
const SubmitSurveyRequest$json = {
  '1': 'SubmitSurveyRequest',
  '2': [
    {'1': 'user_id', '3': 1, '4': 1, '5': 9, '10': 'userId'},
    {'1': 'level', '3': 2, '4': 1, '5': 9, '10': 'level'},
    {'1': 'categories', '3': 3, '4': 3, '5': 9, '10': 'categories'},
    {'1': 'whiskey', '3': 4, '4': 3, '5': 9, '10': 'whiskey'},
    {'1': 'wine', '3': 5, '4': 3, '5': 9, '10': 'wine'},
    {'1': 'cocktail', '3': 6, '4': 3, '5': 9, '10': 'cocktail'},
    {'1': 'beer', '3': 7, '4': 3, '5': 9, '10': 'beer'},
    {'1': 'flavor_keywords', '3': 8, '4': 3, '5': 9, '10': 'flavorKeywords'},
    {'1': 'budget', '3': 9, '4': 1, '5': 9, '10': 'budget'},
  ],
};

/// Descriptor for `SubmitSurveyRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List submitSurveyRequestDescriptor = $convert.base64Decode(
    'ChNTdWJtaXRTdXJ2ZXlSZXF1ZXN0EhcKB3VzZXJfaWQYASABKAlSBnVzZXJJZBIUCgVsZXZlbB'
    'gCIAEoCVIFbGV2ZWwSHgoKY2F0ZWdvcmllcxgDIAMoCVIKY2F0ZWdvcmllcxIYCgd3aGlza2V5'
    'GAQgAygJUgd3aGlza2V5EhIKBHdpbmUYBSADKAlSBHdpbmUSGgoIY29ja3RhaWwYBiADKAlSCG'
    'NvY2t0YWlsEhIKBGJlZXIYByADKAlSBGJlZXISJwoPZmxhdm9yX2tleXdvcmRzGAggAygJUg5m'
    'bGF2b3JLZXl3b3JkcxIWCgZidWRnZXQYCSABKAlSBmJ1ZGdldA==');

@$core.Deprecated('Use submitSurveyResponseDescriptor instead')
const SubmitSurveyResponse$json = {
  '1': 'SubmitSurveyResponse',
  '2': [
    {'1': 'survey_id', '3': 1, '4': 1, '5': 9, '10': 'surveyId'},
  ],
};

/// Descriptor for `SubmitSurveyResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List submitSurveyResponseDescriptor =
    $convert.base64Decode(
        'ChRTdWJtaXRTdXJ2ZXlSZXNwb25zZRIbCglzdXJ2ZXlfaWQYASABKAlSCHN1cnZleUlk');
