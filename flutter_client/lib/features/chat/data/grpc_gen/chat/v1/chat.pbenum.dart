//
//  Generated code. Do not modify.
//  source: chat/v1/chat.proto
//
// @dart = 2.12

// ignore_for_file: annotate_overrides, camel_case_types, comment_references
// ignore_for_file: constant_identifier_names, library_prefixes
// ignore_for_file: non_constant_identifier_names, prefer_final_fields
// ignore_for_file: unnecessary_import, unnecessary_this, unused_import

import 'dart:core' as $core;

import 'package:protobuf/protobuf.dart' as $pb;

class RoomType extends $pb.ProtobufEnum {
  static const RoomType ROOM_TYPE_UNSPECIFIED = RoomType._(0, _omitEnumNames ? '' : 'ROOM_TYPE_UNSPECIFIED');
  static const RoomType ROOM_TYPE_GENERAL_GROUP = RoomType._(1, _omitEnumNames ? '' : 'ROOM_TYPE_GENERAL_GROUP');
  static const RoomType ROOM_TYPE_BOARD_LINKED_GROUP = RoomType._(2, _omitEnumNames ? '' : 'ROOM_TYPE_BOARD_LINKED_GROUP');

  static const $core.List<RoomType> values = <RoomType> [
    ROOM_TYPE_UNSPECIFIED,
    ROOM_TYPE_GENERAL_GROUP,
    ROOM_TYPE_BOARD_LINKED_GROUP,
  ];

  static final $core.Map<$core.int, RoomType> _byValue = $pb.ProtobufEnum.initByValue(values);
  static RoomType? valueOf($core.int value) => _byValue[value];

  const RoomType._($core.int v, $core.String n) : super(v, n);
}

class MemberRole extends $pb.ProtobufEnum {
  static const MemberRole MEMBER_ROLE_UNSPECIFIED = MemberRole._(0, _omitEnumNames ? '' : 'MEMBER_ROLE_UNSPECIFIED');
  static const MemberRole MEMBER_ROLE_OWNER = MemberRole._(1, _omitEnumNames ? '' : 'MEMBER_ROLE_OWNER');
  static const MemberRole MEMBER_ROLE_MEMBER = MemberRole._(2, _omitEnumNames ? '' : 'MEMBER_ROLE_MEMBER');

  static const $core.List<MemberRole> values = <MemberRole> [
    MEMBER_ROLE_UNSPECIFIED,
    MEMBER_ROLE_OWNER,
    MEMBER_ROLE_MEMBER,
  ];

  static final $core.Map<$core.int, MemberRole> _byValue = $pb.ProtobufEnum.initByValue(values);
  static MemberRole? valueOf($core.int value) => _byValue[value];

  const MemberRole._($core.int v, $core.String n) : super(v, n);
}

class MemberStatus extends $pb.ProtobufEnum {
  static const MemberStatus MEMBER_STATUS_UNSPECIFIED = MemberStatus._(0, _omitEnumNames ? '' : 'MEMBER_STATUS_UNSPECIFIED');
  static const MemberStatus MEMBER_STATUS_ACTIVE = MemberStatus._(1, _omitEnumNames ? '' : 'MEMBER_STATUS_ACTIVE');
  static const MemberStatus MEMBER_STATUS_LEFT = MemberStatus._(2, _omitEnumNames ? '' : 'MEMBER_STATUS_LEFT');
  static const MemberStatus MEMBER_STATUS_REMOVED = MemberStatus._(3, _omitEnumNames ? '' : 'MEMBER_STATUS_REMOVED');

  static const $core.List<MemberStatus> values = <MemberStatus> [
    MEMBER_STATUS_UNSPECIFIED,
    MEMBER_STATUS_ACTIVE,
    MEMBER_STATUS_LEFT,
    MEMBER_STATUS_REMOVED,
  ];

  static final $core.Map<$core.int, MemberStatus> _byValue = $pb.ProtobufEnum.initByValue(values);
  static MemberStatus? valueOf($core.int value) => _byValue[value];

  const MemberStatus._($core.int v, $core.String n) : super(v, n);
}

class MessageType extends $pb.ProtobufEnum {
  static const MessageType MESSAGE_TYPE_UNSPECIFIED = MessageType._(0, _omitEnumNames ? '' : 'MESSAGE_TYPE_UNSPECIFIED');
  static const MessageType MESSAGE_TYPE_TEXT = MessageType._(1, _omitEnumNames ? '' : 'MESSAGE_TYPE_TEXT');
  static const MessageType MESSAGE_TYPE_SYSTEM = MessageType._(2, _omitEnumNames ? '' : 'MESSAGE_TYPE_SYSTEM');
  static const MessageType MESSAGE_TYPE_IMAGE = MessageType._(3, _omitEnumNames ? '' : 'MESSAGE_TYPE_IMAGE');

  static const $core.List<MessageType> values = <MessageType> [
    MESSAGE_TYPE_UNSPECIFIED,
    MESSAGE_TYPE_TEXT,
    MESSAGE_TYPE_SYSTEM,
    MESSAGE_TYPE_IMAGE,
  ];

  static final $core.Map<$core.int, MessageType> _byValue = $pb.ProtobufEnum.initByValue(values);
  static MessageType? valueOf($core.int value) => _byValue[value];

  const MessageType._($core.int v, $core.String n) : super(v, n);
}


const _omitEnumNames = $core.bool.fromEnvironment('protobuf.omit_enum_names');
