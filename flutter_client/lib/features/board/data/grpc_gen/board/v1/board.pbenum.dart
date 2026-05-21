//
//  Generated code. Do not modify.
//  source: board/v1/board.proto
//
// @dart = 2.12

// ignore_for_file: annotate_overrides, camel_case_types, comment_references
// ignore_for_file: constant_identifier_names, library_prefixes
// ignore_for_file: non_constant_identifier_names, prefer_final_fields
// ignore_for_file: unnecessary_import, unnecessary_this, unused_import

import 'dart:core' as $core;

import 'package:protobuf/protobuf.dart' as $pb;

class BoardType extends $pb.ProtobufEnum {
  static const BoardType BOARD_TYPE_UNSPECIFIED = BoardType._(0, _omitEnumNames ? '' : 'BOARD_TYPE_UNSPECIFIED');
  static const BoardType BOARD_TYPE_FREE = BoardType._(1, _omitEnumNames ? '' : 'BOARD_TYPE_FREE');
  static const BoardType BOARD_TYPE_FLASH_MEETUP = BoardType._(2, _omitEnumNames ? '' : 'BOARD_TYPE_FLASH_MEETUP');
  static const BoardType BOARD_TYPE_INFO = BoardType._(3, _omitEnumNames ? '' : 'BOARD_TYPE_INFO');

  static const $core.List<BoardType> values = <BoardType> [
    BOARD_TYPE_UNSPECIFIED,
    BOARD_TYPE_FREE,
    BOARD_TYPE_FLASH_MEETUP,
    BOARD_TYPE_INFO,
  ];

  static final $core.Map<$core.int, BoardType> _byValue = $pb.ProtobufEnum.initByValue(values);
  static BoardType? valueOf($core.int value) => _byValue[value];

  const BoardType._($core.int v, $core.String n) : super(v, n);
}

class ReportReason extends $pb.ProtobufEnum {
  static const ReportReason REPORT_REASON_UNSPECIFIED = ReportReason._(0, _omitEnumNames ? '' : 'REPORT_REASON_UNSPECIFIED');
  static const ReportReason REPORT_REASON_SPAM = ReportReason._(1, _omitEnumNames ? '' : 'REPORT_REASON_SPAM');
  static const ReportReason REPORT_REASON_INAPPROPRIATE = ReportReason._(2, _omitEnumNames ? '' : 'REPORT_REASON_INAPPROPRIATE');
  static const ReportReason REPORT_REASON_MISINFORMATION = ReportReason._(3, _omitEnumNames ? '' : 'REPORT_REASON_MISINFORMATION');
  static const ReportReason REPORT_REASON_OTHER = ReportReason._(4, _omitEnumNames ? '' : 'REPORT_REASON_OTHER');

  static const $core.List<ReportReason> values = <ReportReason> [
    REPORT_REASON_UNSPECIFIED,
    REPORT_REASON_SPAM,
    REPORT_REASON_INAPPROPRIATE,
    REPORT_REASON_MISINFORMATION,
    REPORT_REASON_OTHER,
  ];

  static final $core.Map<$core.int, ReportReason> _byValue = $pb.ProtobufEnum.initByValue(values);
  static ReportReason? valueOf($core.int value) => _byValue[value];

  const ReportReason._($core.int v, $core.String n) : super(v, n);
}


const _omitEnumNames = $core.bool.fromEnvironment('protobuf.omit_enum_names');
