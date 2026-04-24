//
//  Generated code. Do not modify.
//  source: chat/v1/chat.proto
//
// @dart = 2.12

// ignore_for_file: annotate_overrides, camel_case_types, comment_references
// ignore_for_file: constant_identifier_names, library_prefixes
// ignore_for_file: non_constant_identifier_names, prefer_final_fields
// ignore_for_file: unnecessary_import, unnecessary_this, unused_import

import 'dart:convert' as $convert;
import 'dart:core' as $core;
import 'dart:typed_data' as $typed_data;

@$core.Deprecated('Use roomTypeDescriptor instead')
const RoomType$json = {
  '1': 'RoomType',
  '2': [
    {'1': 'ROOM_TYPE_UNSPECIFIED', '2': 0},
    {'1': 'ROOM_TYPE_GENERAL_GROUP', '2': 1},
    {'1': 'ROOM_TYPE_BOARD_LINKED_GROUP', '2': 2},
  ],
};

/// Descriptor for `RoomType`. Decode as a `google.protobuf.EnumDescriptorProto`.
final $typed_data.Uint8List roomTypeDescriptor = $convert.base64Decode(
    'CghSb29tVHlwZRIZChVST09NX1RZUEVfVU5TUEVDSUZJRUQQABIbChdST09NX1RZUEVfR0VORV'
    'JBTF9HUk9VUBABEiAKHFJPT01fVFlQRV9CT0FSRF9MSU5LRURfR1JPVVAQAg==');

@$core.Deprecated('Use memberRoleDescriptor instead')
const MemberRole$json = {
  '1': 'MemberRole',
  '2': [
    {'1': 'MEMBER_ROLE_UNSPECIFIED', '2': 0},
    {'1': 'MEMBER_ROLE_OWNER', '2': 1},
    {'1': 'MEMBER_ROLE_MEMBER', '2': 2},
  ],
};

/// Descriptor for `MemberRole`. Decode as a `google.protobuf.EnumDescriptorProto`.
final $typed_data.Uint8List memberRoleDescriptor = $convert.base64Decode(
    'CgpNZW1iZXJSb2xlEhsKF01FTUJFUl9ST0xFX1VOU1BFQ0lGSUVEEAASFQoRTUVNQkVSX1JPTE'
    'VfT1dORVIQARIWChJNRU1CRVJfUk9MRV9NRU1CRVIQAg==');

@$core.Deprecated('Use memberStatusDescriptor instead')
const MemberStatus$json = {
  '1': 'MemberStatus',
  '2': [
    {'1': 'MEMBER_STATUS_UNSPECIFIED', '2': 0},
    {'1': 'MEMBER_STATUS_ACTIVE', '2': 1},
    {'1': 'MEMBER_STATUS_LEFT', '2': 2},
    {'1': 'MEMBER_STATUS_REMOVED', '2': 3},
  ],
};

/// Descriptor for `MemberStatus`. Decode as a `google.protobuf.EnumDescriptorProto`.
final $typed_data.Uint8List memberStatusDescriptor = $convert.base64Decode(
    'CgxNZW1iZXJTdGF0dXMSHQoZTUVNQkVSX1NUQVRVU19VTlNQRUNJRklFRBAAEhgKFE1FTUJFUl'
    '9TVEFUVVNfQUNUSVZFEAESFgoSTUVNQkVSX1NUQVRVU19MRUZUEAISGQoVTUVNQkVSX1NUQVRV'
    'U19SRU1PVkVEEAM=');

@$core.Deprecated('Use messageTypeDescriptor instead')
const MessageType$json = {
  '1': 'MessageType',
  '2': [
    {'1': 'MESSAGE_TYPE_UNSPECIFIED', '2': 0},
    {'1': 'MESSAGE_TYPE_TEXT', '2': 1},
    {'1': 'MESSAGE_TYPE_SYSTEM', '2': 2},
    {'1': 'MESSAGE_TYPE_IMAGE', '2': 3},
  ],
};

/// Descriptor for `MessageType`. Decode as a `google.protobuf.EnumDescriptorProto`.
final $typed_data.Uint8List messageTypeDescriptor = $convert.base64Decode(
    'CgtNZXNzYWdlVHlwZRIcChhNRVNTQUdFX1RZUEVfVU5TUEVDSUZJRUQQABIVChFNRVNTQUdFX1'
    'RZUEVfVEVYVBABEhcKE01FU1NBR0VfVFlQRV9TWVNURU0QAhIWChJNRVNTQUdFX1RZUEVfSU1B'
    'R0UQAw==');

@$core.Deprecated('Use createRoomRequestDescriptor instead')
const CreateRoomRequest$json = {
  '1': 'CreateRoomRequest',
  '2': [
    {'1': 'creator_user_id', '3': 1, '4': 1, '5': 9, '10': 'creatorUserId'},
    {'1': 'title', '3': 2, '4': 1, '5': 9, '10': 'title'},
  ],
};

/// Descriptor for `CreateRoomRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List createRoomRequestDescriptor = $convert.base64Decode(
    'ChFDcmVhdGVSb29tUmVxdWVzdBImCg9jcmVhdG9yX3VzZXJfaWQYASABKAlSDWNyZWF0b3JVc2'
    'VySWQSFAoFdGl0bGUYAiABKAlSBXRpdGxl');

@$core.Deprecated('Use createRoomResponseDescriptor instead')
const CreateRoomResponse$json = {
  '1': 'CreateRoomResponse',
  '2': [
    {'1': 'room', '3': 1, '4': 1, '5': 11, '6': '.ontheblock.chat.v1.ChatRoom', '10': 'room'},
  ],
};

/// Descriptor for `CreateRoomResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List createRoomResponseDescriptor = $convert.base64Decode(
    'ChJDcmVhdGVSb29tUmVzcG9uc2USMAoEcm9vbRgBIAEoCzIcLm9udGhlYmxvY2suY2hhdC52MS'
    '5DaGF0Um9vbVIEcm9vbQ==');

@$core.Deprecated('Use createBoardLinkedRoomRequestDescriptor instead')
const CreateBoardLinkedRoomRequest$json = {
  '1': 'CreateBoardLinkedRoomRequest',
  '2': [
    {'1': 'creator_user_id', '3': 1, '4': 1, '5': 9, '10': 'creatorUserId'},
    {'1': 'board_id', '3': 2, '4': 1, '5': 9, '10': 'boardId'},
    {'1': 'title', '3': 3, '4': 1, '5': 9, '10': 'title'},
  ],
};

/// Descriptor for `CreateBoardLinkedRoomRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List createBoardLinkedRoomRequestDescriptor = $convert.base64Decode(
    'ChxDcmVhdGVCb2FyZExpbmtlZFJvb21SZXF1ZXN0EiYKD2NyZWF0b3JfdXNlcl9pZBgBIAEoCV'
    'INY3JlYXRvclVzZXJJZBIZCghib2FyZF9pZBgCIAEoCVIHYm9hcmRJZBIUCgV0aXRsZRgDIAEo'
    'CVIFdGl0bGU=');

@$core.Deprecated('Use createBoardLinkedRoomResponseDescriptor instead')
const CreateBoardLinkedRoomResponse$json = {
  '1': 'CreateBoardLinkedRoomResponse',
  '2': [
    {'1': 'room', '3': 1, '4': 1, '5': 11, '6': '.ontheblock.chat.v1.ChatRoom', '10': 'room'},
    {'1': 'already_exists', '3': 2, '4': 1, '5': 8, '10': 'alreadyExists'},
  ],
};

/// Descriptor for `CreateBoardLinkedRoomResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List createBoardLinkedRoomResponseDescriptor = $convert.base64Decode(
    'Ch1DcmVhdGVCb2FyZExpbmtlZFJvb21SZXNwb25zZRIwCgRyb29tGAEgASgLMhwub250aGVibG'
    '9jay5jaGF0LnYxLkNoYXRSb29tUgRyb29tEiUKDmFscmVhZHlfZXhpc3RzGAIgASgIUg1hbHJl'
    'YWR5RXhpc3Rz');

@$core.Deprecated('Use joinRoomRequestDescriptor instead')
const JoinRoomRequest$json = {
  '1': 'JoinRoomRequest',
  '2': [
    {'1': 'room_id', '3': 1, '4': 1, '5': 9, '10': 'roomId'},
    {'1': 'user_id', '3': 2, '4': 1, '5': 9, '10': 'userId'},
  ],
};

/// Descriptor for `JoinRoomRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List joinRoomRequestDescriptor = $convert.base64Decode(
    'Cg9Kb2luUm9vbVJlcXVlc3QSFwoHcm9vbV9pZBgBIAEoCVIGcm9vbUlkEhcKB3VzZXJfaWQYAi'
    'ABKAlSBnVzZXJJZA==');

@$core.Deprecated('Use joinRoomResponseDescriptor instead')
const JoinRoomResponse$json = {
  '1': 'JoinRoomResponse',
  '2': [
    {'1': 'member', '3': 1, '4': 1, '5': 11, '6': '.ontheblock.chat.v1.ChatRoomMember', '10': 'member'},
  ],
};

/// Descriptor for `JoinRoomResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List joinRoomResponseDescriptor = $convert.base64Decode(
    'ChBKb2luUm9vbVJlc3BvbnNlEjoKBm1lbWJlchgBIAEoCzIiLm9udGhlYmxvY2suY2hhdC52MS'
    '5DaGF0Um9vbU1lbWJlclIGbWVtYmVy');

@$core.Deprecated('Use leaveRoomRequestDescriptor instead')
const LeaveRoomRequest$json = {
  '1': 'LeaveRoomRequest',
  '2': [
    {'1': 'room_id', '3': 1, '4': 1, '5': 9, '10': 'roomId'},
    {'1': 'user_id', '3': 2, '4': 1, '5': 9, '10': 'userId'},
  ],
};

/// Descriptor for `LeaveRoomRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List leaveRoomRequestDescriptor = $convert.base64Decode(
    'ChBMZWF2ZVJvb21SZXF1ZXN0EhcKB3Jvb21faWQYASABKAlSBnJvb21JZBIXCgd1c2VyX2lkGA'
    'IgASgJUgZ1c2VySWQ=');

@$core.Deprecated('Use leaveRoomResponseDescriptor instead')
const LeaveRoomResponse$json = {
  '1': 'LeaveRoomResponse',
  '2': [
    {'1': 'member', '3': 1, '4': 1, '5': 11, '6': '.ontheblock.chat.v1.ChatRoomMember', '10': 'member'},
    {'1': 'room', '3': 2, '4': 1, '5': 11, '6': '.ontheblock.chat.v1.ChatRoom', '10': 'room'},
  ],
};

/// Descriptor for `LeaveRoomResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List leaveRoomResponseDescriptor = $convert.base64Decode(
    'ChFMZWF2ZVJvb21SZXNwb25zZRI6CgZtZW1iZXIYASABKAsyIi5vbnRoZWJsb2NrLmNoYXQudj'
    'EuQ2hhdFJvb21NZW1iZXJSBm1lbWJlchIwCgRyb29tGAIgASgLMhwub250aGVibG9jay5jaGF0'
    'LnYxLkNoYXRSb29tUgRyb29t');

@$core.Deprecated('Use listMyRoomsRequestDescriptor instead')
const ListMyRoomsRequest$json = {
  '1': 'ListMyRoomsRequest',
  '2': [
    {'1': 'user_id', '3': 1, '4': 1, '5': 9, '10': 'userId'},
    {'1': 'pagination', '3': 2, '4': 1, '5': 11, '6': '.ontheblock.chat.v1.PaginationRequest', '10': 'pagination'},
  ],
};

/// Descriptor for `ListMyRoomsRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List listMyRoomsRequestDescriptor = $convert.base64Decode(
    'ChJMaXN0TXlSb29tc1JlcXVlc3QSFwoHdXNlcl9pZBgBIAEoCVIGdXNlcklkEkUKCnBhZ2luYX'
    'Rpb24YAiABKAsyJS5vbnRoZWJsb2NrLmNoYXQudjEuUGFnaW5hdGlvblJlcXVlc3RSCnBhZ2lu'
    'YXRpb24=');

@$core.Deprecated('Use listMyRoomsResponseDescriptor instead')
const ListMyRoomsResponse$json = {
  '1': 'ListMyRoomsResponse',
  '2': [
    {'1': 'rooms', '3': 1, '4': 3, '5': 11, '6': '.ontheblock.chat.v1.ChatRoomSummary', '10': 'rooms'},
    {'1': 'pagination', '3': 2, '4': 1, '5': 11, '6': '.ontheblock.chat.v1.PaginationResponse', '10': 'pagination'},
  ],
};

/// Descriptor for `ListMyRoomsResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List listMyRoomsResponseDescriptor = $convert.base64Decode(
    'ChNMaXN0TXlSb29tc1Jlc3BvbnNlEjkKBXJvb21zGAEgAygLMiMub250aGVibG9jay5jaGF0Ln'
    'YxLkNoYXRSb29tU3VtbWFyeVIFcm9vbXMSRgoKcGFnaW5hdGlvbhgCIAEoCzImLm9udGhlYmxv'
    'Y2suY2hhdC52MS5QYWdpbmF0aW9uUmVzcG9uc2VSCnBhZ2luYXRpb24=');

@$core.Deprecated('Use chatRoomDescriptor instead')
const ChatRoom$json = {
  '1': 'ChatRoom',
  '2': [
    {'1': 'room_id', '3': 1, '4': 1, '5': 9, '10': 'roomId'},
    {'1': 'room_type', '3': 2, '4': 1, '5': 14, '6': '.ontheblock.chat.v1.RoomType', '10': 'roomType'},
    {'1': 'title', '3': 3, '4': 1, '5': 9, '10': 'title'},
    {'1': 'linked_board_id', '3': 4, '4': 1, '5': 9, '10': 'linkedBoardId'},
    {'1': 'owner_user_id', '3': 5, '4': 1, '5': 9, '10': 'ownerUserId'},
    {'1': 'is_active', '3': 6, '4': 1, '5': 8, '10': 'isActive'},
    {'1': 'created_at', '3': 7, '4': 1, '5': 11, '6': '.google.protobuf.Timestamp', '10': 'createdAt'},
    {'1': 'updated_at', '3': 8, '4': 1, '5': 11, '6': '.google.protobuf.Timestamp', '10': 'updatedAt'},
    {'1': 'deleted_at', '3': 9, '4': 1, '5': 11, '6': '.google.protobuf.Timestamp', '10': 'deletedAt'},
  ],
};

/// Descriptor for `ChatRoom`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List chatRoomDescriptor = $convert.base64Decode(
    'CghDaGF0Um9vbRIXCgdyb29tX2lkGAEgASgJUgZyb29tSWQSOQoJcm9vbV90eXBlGAIgASgOMh'
    'wub250aGVibG9jay5jaGF0LnYxLlJvb21UeXBlUghyb29tVHlwZRIUCgV0aXRsZRgDIAEoCVIF'
    'dGl0bGUSJgoPbGlua2VkX2JvYXJkX2lkGAQgASgJUg1saW5rZWRCb2FyZElkEiIKDW93bmVyX3'
    'VzZXJfaWQYBSABKAlSC293bmVyVXNlcklkEhsKCWlzX2FjdGl2ZRgGIAEoCFIIaXNBY3RpdmUS'
    'OQoKY3JlYXRlZF9hdBgHIAEoCzIaLmdvb2dsZS5wcm90b2J1Zi5UaW1lc3RhbXBSCWNyZWF0ZW'
    'RBdBI5Cgp1cGRhdGVkX2F0GAggASgLMhouZ29vZ2xlLnByb3RvYnVmLlRpbWVzdGFtcFIJdXBk'
    'YXRlZEF0EjkKCmRlbGV0ZWRfYXQYCSABKAsyGi5nb29nbGUucHJvdG9idWYuVGltZXN0YW1wUg'
    'lkZWxldGVkQXQ=');

@$core.Deprecated('Use chatRoomSummaryDescriptor instead')
const ChatRoomSummary$json = {
  '1': 'ChatRoomSummary',
  '2': [
    {'1': 'room_id', '3': 1, '4': 1, '5': 9, '10': 'roomId'},
    {'1': 'room_type', '3': 2, '4': 1, '5': 14, '6': '.ontheblock.chat.v1.RoomType', '10': 'roomType'},
    {'1': 'title', '3': 3, '4': 1, '5': 9, '10': 'title'},
    {'1': 'linked_board_id', '3': 4, '4': 1, '5': 9, '10': 'linkedBoardId'},
    {'1': 'owner_user_id', '3': 5, '4': 1, '5': 9, '10': 'ownerUserId'},
    {'1': 'last_message', '3': 6, '4': 1, '5': 11, '6': '.ontheblock.chat.v1.LastMessagePreview', '10': 'lastMessage'},
    {'1': 'unread_count', '3': 7, '4': 1, '5': 3, '10': 'unreadCount'},
    {'1': 'updated_at', '3': 8, '4': 1, '5': 11, '6': '.google.protobuf.Timestamp', '10': 'updatedAt'},
  ],
};

/// Descriptor for `ChatRoomSummary`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List chatRoomSummaryDescriptor = $convert.base64Decode(
    'Cg9DaGF0Um9vbVN1bW1hcnkSFwoHcm9vbV9pZBgBIAEoCVIGcm9vbUlkEjkKCXJvb21fdHlwZR'
    'gCIAEoDjIcLm9udGhlYmxvY2suY2hhdC52MS5Sb29tVHlwZVIIcm9vbVR5cGUSFAoFdGl0bGUY'
    'AyABKAlSBXRpdGxlEiYKD2xpbmtlZF9ib2FyZF9pZBgEIAEoCVINbGlua2VkQm9hcmRJZBIiCg'
    '1vd25lcl91c2VyX2lkGAUgASgJUgtvd25lclVzZXJJZBJJCgxsYXN0X21lc3NhZ2UYBiABKAsy'
    'Ji5vbnRoZWJsb2NrLmNoYXQudjEuTGFzdE1lc3NhZ2VQcmV2aWV3UgtsYXN0TWVzc2FnZRIhCg'
    'x1bnJlYWRfY291bnQYByABKANSC3VucmVhZENvdW50EjkKCnVwZGF0ZWRfYXQYCCABKAsyGi5n'
    'b29nbGUucHJvdG9idWYuVGltZXN0YW1wUgl1cGRhdGVkQXQ=');

@$core.Deprecated('Use lastMessagePreviewDescriptor instead')
const LastMessagePreview$json = {
  '1': 'LastMessagePreview',
  '2': [
    {'1': 'message_id', '3': 1, '4': 1, '5': 9, '10': 'messageId'},
    {'1': 'message_type', '3': 2, '4': 1, '5': 14, '6': '.ontheblock.chat.v1.MessageType', '10': 'messageType'},
    {'1': 'content_preview', '3': 3, '4': 1, '5': 9, '10': 'contentPreview'},
    {'1': 'sender_user_id', '3': 4, '4': 1, '5': 9, '10': 'senderUserId'},
    {'1': 'sequence_no', '3': 5, '4': 1, '5': 3, '10': 'sequenceNo'},
    {'1': 'sent_at', '3': 6, '4': 1, '5': 11, '6': '.google.protobuf.Timestamp', '10': 'sentAt'},
  ],
};

/// Descriptor for `LastMessagePreview`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List lastMessagePreviewDescriptor = $convert.base64Decode(
    'ChJMYXN0TWVzc2FnZVByZXZpZXcSHQoKbWVzc2FnZV9pZBgBIAEoCVIJbWVzc2FnZUlkEkIKDG'
    '1lc3NhZ2VfdHlwZRgCIAEoDjIfLm9udGhlYmxvY2suY2hhdC52MS5NZXNzYWdlVHlwZVILbWVz'
    'c2FnZVR5cGUSJwoPY29udGVudF9wcmV2aWV3GAMgASgJUg5jb250ZW50UHJldmlldxIkCg5zZW'
    '5kZXJfdXNlcl9pZBgEIAEoCVIMc2VuZGVyVXNlcklkEh8KC3NlcXVlbmNlX25vGAUgASgDUgpz'
    'ZXF1ZW5jZU5vEjMKB3NlbnRfYXQYBiABKAsyGi5nb29nbGUucHJvdG9idWYuVGltZXN0YW1wUg'
    'ZzZW50QXQ=');

@$core.Deprecated('Use chatRoomMemberDescriptor instead')
const ChatRoomMember$json = {
  '1': 'ChatRoomMember',
  '2': [
    {'1': 'member_id', '3': 1, '4': 1, '5': 9, '10': 'memberId'},
    {'1': 'room_id', '3': 2, '4': 1, '5': 9, '10': 'roomId'},
    {'1': 'user_id', '3': 3, '4': 1, '5': 9, '10': 'userId'},
    {'1': 'role', '3': 4, '4': 1, '5': 14, '6': '.ontheblock.chat.v1.MemberRole', '10': 'role'},
    {'1': 'status', '3': 5, '4': 1, '5': 14, '6': '.ontheblock.chat.v1.MemberStatus', '10': 'status'},
    {'1': 'last_read_sequence_no', '3': 6, '4': 1, '5': 3, '10': 'lastReadSequenceNo'},
    {'1': 'joined_at', '3': 7, '4': 1, '5': 11, '6': '.google.protobuf.Timestamp', '10': 'joinedAt'},
    {'1': 'left_at', '3': 8, '4': 1, '5': 11, '6': '.google.protobuf.Timestamp', '10': 'leftAt'},
    {'1': 'removed_at', '3': 9, '4': 1, '5': 11, '6': '.google.protobuf.Timestamp', '10': 'removedAt'},
    {'1': 'removed_by_user_id', '3': 10, '4': 1, '5': 9, '10': 'removedByUserId'},
  ],
};

/// Descriptor for `ChatRoomMember`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List chatRoomMemberDescriptor = $convert.base64Decode(
    'Cg5DaGF0Um9vbU1lbWJlchIbCgltZW1iZXJfaWQYASABKAlSCG1lbWJlcklkEhcKB3Jvb21faW'
    'QYAiABKAlSBnJvb21JZBIXCgd1c2VyX2lkGAMgASgJUgZ1c2VySWQSMgoEcm9sZRgEIAEoDjIe'
    'Lm9udGhlYmxvY2suY2hhdC52MS5NZW1iZXJSb2xlUgRyb2xlEjgKBnN0YXR1cxgFIAEoDjIgLm'
    '9udGhlYmxvY2suY2hhdC52MS5NZW1iZXJTdGF0dXNSBnN0YXR1cxIxChVsYXN0X3JlYWRfc2Vx'
    'dWVuY2Vfbm8YBiABKANSEmxhc3RSZWFkU2VxdWVuY2VObxI3Cglqb2luZWRfYXQYByABKAsyGi'
    '5nb29nbGUucHJvdG9idWYuVGltZXN0YW1wUghqb2luZWRBdBIzCgdsZWZ0X2F0GAggASgLMhou'
    'Z29vZ2xlLnByb3RvYnVmLlRpbWVzdGFtcFIGbGVmdEF0EjkKCnJlbW92ZWRfYXQYCSABKAsyGi'
    '5nb29nbGUucHJvdG9idWYuVGltZXN0YW1wUglyZW1vdmVkQXQSKwoScmVtb3ZlZF9ieV91c2Vy'
    'X2lkGAogASgJUg9yZW1vdmVkQnlVc2VySWQ=');

@$core.Deprecated('Use removeMemberRequestDescriptor instead')
const RemoveMemberRequest$json = {
  '1': 'RemoveMemberRequest',
  '2': [
    {'1': 'room_id', '3': 1, '4': 1, '5': 9, '10': 'roomId'},
    {'1': 'owner_user_id', '3': 2, '4': 1, '5': 9, '10': 'ownerUserId'},
    {'1': 'target_user_id', '3': 3, '4': 1, '5': 9, '10': 'targetUserId'},
  ],
};

/// Descriptor for `RemoveMemberRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List removeMemberRequestDescriptor = $convert.base64Decode(
    'ChNSZW1vdmVNZW1iZXJSZXF1ZXN0EhcKB3Jvb21faWQYASABKAlSBnJvb21JZBIiCg1vd25lcl'
    '91c2VyX2lkGAIgASgJUgtvd25lclVzZXJJZBIkCg50YXJnZXRfdXNlcl9pZBgDIAEoCVIMdGFy'
    'Z2V0VXNlcklk');

@$core.Deprecated('Use removeMemberResponseDescriptor instead')
const RemoveMemberResponse$json = {
  '1': 'RemoveMemberResponse',
  '2': [
    {'1': 'member', '3': 1, '4': 1, '5': 11, '6': '.ontheblock.chat.v1.ChatRoomMember', '10': 'member'},
  ],
};

/// Descriptor for `RemoveMemberResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List removeMemberResponseDescriptor = $convert.base64Decode(
    'ChRSZW1vdmVNZW1iZXJSZXNwb25zZRI6CgZtZW1iZXIYASABKAsyIi5vbnRoZWJsb2NrLmNoYX'
    'QudjEuQ2hhdFJvb21NZW1iZXJSBm1lbWJlcg==');

@$core.Deprecated('Use getMessagesRequestDescriptor instead')
const GetMessagesRequest$json = {
  '1': 'GetMessagesRequest',
  '2': [
    {'1': 'room_id', '3': 1, '4': 1, '5': 9, '10': 'roomId'},
    {'1': 'user_id', '3': 2, '4': 1, '5': 9, '10': 'userId'},
    {'1': 'limit', '3': 3, '4': 1, '5': 5, '10': 'limit'},
    {'1': 'before_sequence_no', '3': 4, '4': 1, '5': 3, '10': 'beforeSequenceNo'},
  ],
};

/// Descriptor for `GetMessagesRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List getMessagesRequestDescriptor = $convert.base64Decode(
    'ChJHZXRNZXNzYWdlc1JlcXVlc3QSFwoHcm9vbV9pZBgBIAEoCVIGcm9vbUlkEhcKB3VzZXJfaW'
    'QYAiABKAlSBnVzZXJJZBIUCgVsaW1pdBgDIAEoBVIFbGltaXQSLAoSYmVmb3JlX3NlcXVlbmNl'
    'X25vGAQgASgDUhBiZWZvcmVTZXF1ZW5jZU5v');

@$core.Deprecated('Use getMessagesResponseDescriptor instead')
const GetMessagesResponse$json = {
  '1': 'GetMessagesResponse',
  '2': [
    {'1': 'messages', '3': 1, '4': 3, '5': 11, '6': '.ontheblock.chat.v1.ChatMessage', '10': 'messages'},
    {'1': 'next_before_sequence_no', '3': 2, '4': 1, '5': 3, '10': 'nextBeforeSequenceNo'},
  ],
};

/// Descriptor for `GetMessagesResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List getMessagesResponseDescriptor = $convert.base64Decode(
    'ChNHZXRNZXNzYWdlc1Jlc3BvbnNlEjsKCG1lc3NhZ2VzGAEgAygLMh8ub250aGVibG9jay5jaG'
    'F0LnYxLkNoYXRNZXNzYWdlUghtZXNzYWdlcxI1ChduZXh0X2JlZm9yZV9zZXF1ZW5jZV9ubxgC'
    'IAEoA1IUbmV4dEJlZm9yZVNlcXVlbmNlTm8=');

@$core.Deprecated('Use sendMessageRequestDescriptor instead')
const SendMessageRequest$json = {
  '1': 'SendMessageRequest',
  '2': [
    {'1': 'room_id', '3': 1, '4': 1, '5': 9, '10': 'roomId'},
    {'1': 'sender_user_id', '3': 2, '4': 1, '5': 9, '10': 'senderUserId'},
    {'1': 'message_type', '3': 3, '4': 1, '5': 14, '6': '.ontheblock.chat.v1.MessageType', '10': 'messageType'},
    {'1': 'content', '3': 4, '4': 1, '5': 9, '10': 'content'},
    {'1': 'image_url', '3': 5, '4': 1, '5': 9, '10': 'imageUrl'},
    {'1': 'metadata', '3': 6, '4': 1, '5': 11, '6': '.google.protobuf.Struct', '10': 'metadata'},
  ],
};

/// Descriptor for `SendMessageRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List sendMessageRequestDescriptor = $convert.base64Decode(
    'ChJTZW5kTWVzc2FnZVJlcXVlc3QSFwoHcm9vbV9pZBgBIAEoCVIGcm9vbUlkEiQKDnNlbmRlcl'
    '91c2VyX2lkGAIgASgJUgxzZW5kZXJVc2VySWQSQgoMbWVzc2FnZV90eXBlGAMgASgOMh8ub250'
    'aGVibG9jay5jaGF0LnYxLk1lc3NhZ2VUeXBlUgttZXNzYWdlVHlwZRIYCgdjb250ZW50GAQgAS'
    'gJUgdjb250ZW50EhsKCWltYWdlX3VybBgFIAEoCVIIaW1hZ2VVcmwSMwoIbWV0YWRhdGEYBiAB'
    'KAsyFy5nb29nbGUucHJvdG9idWYuU3RydWN0UghtZXRhZGF0YQ==');

@$core.Deprecated('Use sendMessageResponseDescriptor instead')
const SendMessageResponse$json = {
  '1': 'SendMessageResponse',
  '2': [
    {'1': 'message', '3': 1, '4': 1, '5': 11, '6': '.ontheblock.chat.v1.ChatMessage', '10': 'message'},
  ],
};

/// Descriptor for `SendMessageResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List sendMessageResponseDescriptor = $convert.base64Decode(
    'ChNTZW5kTWVzc2FnZVJlc3BvbnNlEjkKB21lc3NhZ2UYASABKAsyHy5vbnRoZWJsb2NrLmNoYX'
    'QudjEuQ2hhdE1lc3NhZ2VSB21lc3NhZ2U=');

@$core.Deprecated('Use deleteMessageRequestDescriptor instead')
const DeleteMessageRequest$json = {
  '1': 'DeleteMessageRequest',
  '2': [
    {'1': 'room_id', '3': 1, '4': 1, '5': 9, '10': 'roomId'},
    {'1': 'message_id', '3': 2, '4': 1, '5': 9, '10': 'messageId'},
    {'1': 'owner_user_id', '3': 3, '4': 1, '5': 9, '10': 'ownerUserId'},
  ],
};

/// Descriptor for `DeleteMessageRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List deleteMessageRequestDescriptor = $convert.base64Decode(
    'ChREZWxldGVNZXNzYWdlUmVxdWVzdBIXCgdyb29tX2lkGAEgASgJUgZyb29tSWQSHQoKbWVzc2'
    'FnZV9pZBgCIAEoCVIJbWVzc2FnZUlkEiIKDW93bmVyX3VzZXJfaWQYAyABKAlSC293bmVyVXNl'
    'cklk');

@$core.Deprecated('Use deleteMessageResponseDescriptor instead')
const DeleteMessageResponse$json = {
  '1': 'DeleteMessageResponse',
  '2': [
    {'1': 'message', '3': 1, '4': 1, '5': 11, '6': '.ontheblock.chat.v1.ChatMessage', '10': 'message'},
  ],
};

/// Descriptor for `DeleteMessageResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List deleteMessageResponseDescriptor = $convert.base64Decode(
    'ChVEZWxldGVNZXNzYWdlUmVzcG9uc2USOQoHbWVzc2FnZRgBIAEoCzIfLm9udGhlYmxvY2suY2'
    'hhdC52MS5DaGF0TWVzc2FnZVIHbWVzc2FnZQ==');

@$core.Deprecated('Use chatMessageDescriptor instead')
const ChatMessage$json = {
  '1': 'ChatMessage',
  '2': [
    {'1': 'message_id', '3': 1, '4': 1, '5': 9, '10': 'messageId'},
    {'1': 'room_id', '3': 2, '4': 1, '5': 9, '10': 'roomId'},
    {'1': 'sender_user_id', '3': 3, '4': 1, '5': 9, '10': 'senderUserId'},
    {'1': 'message_type', '3': 4, '4': 1, '5': 14, '6': '.ontheblock.chat.v1.MessageType', '10': 'messageType'},
    {'1': 'sequence_no', '3': 5, '4': 1, '5': 3, '10': 'sequenceNo'},
    {'1': 'content', '3': 6, '4': 1, '5': 9, '10': 'content'},
    {'1': 'image_url', '3': 7, '4': 1, '5': 9, '10': 'imageUrl'},
    {'1': 'metadata', '3': 8, '4': 1, '5': 11, '6': '.google.protobuf.Struct', '10': 'metadata'},
    {'1': 'is_deleted', '3': 9, '4': 1, '5': 8, '10': 'isDeleted'},
    {'1': 'deleted_by_user_id', '3': 10, '4': 1, '5': 9, '10': 'deletedByUserId'},
    {'1': 'sent_at', '3': 11, '4': 1, '5': 11, '6': '.google.protobuf.Timestamp', '10': 'sentAt'},
    {'1': 'deleted_at', '3': 12, '4': 1, '5': 11, '6': '.google.protobuf.Timestamp', '10': 'deletedAt'},
    {'1': 'updated_at', '3': 13, '4': 1, '5': 11, '6': '.google.protobuf.Timestamp', '10': 'updatedAt'},
  ],
};

/// Descriptor for `ChatMessage`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List chatMessageDescriptor = $convert.base64Decode(
    'CgtDaGF0TWVzc2FnZRIdCgptZXNzYWdlX2lkGAEgASgJUgltZXNzYWdlSWQSFwoHcm9vbV9pZB'
    'gCIAEoCVIGcm9vbUlkEiQKDnNlbmRlcl91c2VyX2lkGAMgASgJUgxzZW5kZXJVc2VySWQSQgoM'
    'bWVzc2FnZV90eXBlGAQgASgOMh8ub250aGVibG9jay5jaGF0LnYxLk1lc3NhZ2VUeXBlUgttZX'
    'NzYWdlVHlwZRIfCgtzZXF1ZW5jZV9ubxgFIAEoA1IKc2VxdWVuY2VObxIYCgdjb250ZW50GAYg'
    'ASgJUgdjb250ZW50EhsKCWltYWdlX3VybBgHIAEoCVIIaW1hZ2VVcmwSMwoIbWV0YWRhdGEYCC'
    'ABKAsyFy5nb29nbGUucHJvdG9idWYuU3RydWN0UghtZXRhZGF0YRIdCgppc19kZWxldGVkGAkg'
    'ASgIUglpc0RlbGV0ZWQSKwoSZGVsZXRlZF9ieV91c2VyX2lkGAogASgJUg9kZWxldGVkQnlVc2'
    'VySWQSMwoHc2VudF9hdBgLIAEoCzIaLmdvb2dsZS5wcm90b2J1Zi5UaW1lc3RhbXBSBnNlbnRB'
    'dBI5CgpkZWxldGVkX2F0GAwgASgLMhouZ29vZ2xlLnByb3RvYnVmLlRpbWVzdGFtcFIJZGVsZX'
    'RlZEF0EjkKCnVwZGF0ZWRfYXQYDSABKAsyGi5nb29nbGUucHJvdG9idWYuVGltZXN0YW1wUgl1'
    'cGRhdGVkQXQ=');

@$core.Deprecated('Use markAsReadRequestDescriptor instead')
const MarkAsReadRequest$json = {
  '1': 'MarkAsReadRequest',
  '2': [
    {'1': 'room_id', '3': 1, '4': 1, '5': 9, '10': 'roomId'},
    {'1': 'user_id', '3': 2, '4': 1, '5': 9, '10': 'userId'},
    {'1': 'last_read_sequence_no', '3': 3, '4': 1, '5': 3, '10': 'lastReadSequenceNo'},
  ],
};

/// Descriptor for `MarkAsReadRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List markAsReadRequestDescriptor = $convert.base64Decode(
    'ChFNYXJrQXNSZWFkUmVxdWVzdBIXCgdyb29tX2lkGAEgASgJUgZyb29tSWQSFwoHdXNlcl9pZB'
    'gCIAEoCVIGdXNlcklkEjEKFWxhc3RfcmVhZF9zZXF1ZW5jZV9ubxgDIAEoA1ISbGFzdFJlYWRT'
    'ZXF1ZW5jZU5v');

@$core.Deprecated('Use markAsReadResponseDescriptor instead')
const MarkAsReadResponse$json = {
  '1': 'MarkAsReadResponse',
  '2': [
    {'1': 'room_id', '3': 1, '4': 1, '5': 9, '10': 'roomId'},
    {'1': 'user_id', '3': 2, '4': 1, '5': 9, '10': 'userId'},
    {'1': 'last_read_sequence_no', '3': 3, '4': 1, '5': 3, '10': 'lastReadSequenceNo'},
    {'1': 'updated_at', '3': 4, '4': 1, '5': 11, '6': '.google.protobuf.Timestamp', '10': 'updatedAt'},
  ],
};

/// Descriptor for `MarkAsReadResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List markAsReadResponseDescriptor = $convert.base64Decode(
    'ChJNYXJrQXNSZWFkUmVzcG9uc2USFwoHcm9vbV9pZBgBIAEoCVIGcm9vbUlkEhcKB3VzZXJfaW'
    'QYAiABKAlSBnVzZXJJZBIxChVsYXN0X3JlYWRfc2VxdWVuY2Vfbm8YAyABKANSEmxhc3RSZWFk'
    'U2VxdWVuY2VObxI5Cgp1cGRhdGVkX2F0GAQgASgLMhouZ29vZ2xlLnByb3RvYnVmLlRpbWVzdG'
    'FtcFIJdXBkYXRlZEF0');

@$core.Deprecated('Use deactivateRoomRequestDescriptor instead')
const DeactivateRoomRequest$json = {
  '1': 'DeactivateRoomRequest',
  '2': [
    {'1': 'room_id', '3': 1, '4': 1, '5': 9, '10': 'roomId'},
    {'1': 'owner_user_id', '3': 2, '4': 1, '5': 9, '10': 'ownerUserId'},
  ],
};

/// Descriptor for `DeactivateRoomRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List deactivateRoomRequestDescriptor = $convert.base64Decode(
    'ChVEZWFjdGl2YXRlUm9vbVJlcXVlc3QSFwoHcm9vbV9pZBgBIAEoCVIGcm9vbUlkEiIKDW93bm'
    'VyX3VzZXJfaWQYAiABKAlSC293bmVyVXNlcklk');

@$core.Deprecated('Use deactivateRoomResponseDescriptor instead')
const DeactivateRoomResponse$json = {
  '1': 'DeactivateRoomResponse',
  '2': [
    {'1': 'room', '3': 1, '4': 1, '5': 11, '6': '.ontheblock.chat.v1.ChatRoom', '10': 'room'},
  ],
};

/// Descriptor for `DeactivateRoomResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List deactivateRoomResponseDescriptor = $convert.base64Decode(
    'ChZEZWFjdGl2YXRlUm9vbVJlc3BvbnNlEjAKBHJvb20YASABKAsyHC5vbnRoZWJsb2NrLmNoYX'
    'QudjEuQ2hhdFJvb21SBHJvb20=');

@$core.Deprecated('Use streamMessagesRequestDescriptor instead')
const StreamMessagesRequest$json = {
  '1': 'StreamMessagesRequest',
  '2': [
    {'1': 'room_id', '3': 1, '4': 1, '5': 9, '10': 'roomId'},
    {'1': 'user_id', '3': 2, '4': 1, '5': 9, '10': 'userId'},
    {'1': 'after_sequence_no', '3': 3, '4': 1, '5': 3, '10': 'afterSequenceNo'},
  ],
};

/// Descriptor for `StreamMessagesRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List streamMessagesRequestDescriptor = $convert.base64Decode(
    'ChVTdHJlYW1NZXNzYWdlc1JlcXVlc3QSFwoHcm9vbV9pZBgBIAEoCVIGcm9vbUlkEhcKB3VzZX'
    'JfaWQYAiABKAlSBnVzZXJJZBIqChFhZnRlcl9zZXF1ZW5jZV9ubxgDIAEoA1IPYWZ0ZXJTZXF1'
    'ZW5jZU5v');

@$core.Deprecated('Use streamMessagesResponseDescriptor instead')
const StreamMessagesResponse$json = {
  '1': 'StreamMessagesResponse',
  '2': [
    {'1': 'message', '3': 1, '4': 1, '5': 11, '6': '.ontheblock.chat.v1.ChatMessage', '10': 'message'},
  ],
};

/// Descriptor for `StreamMessagesResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List streamMessagesResponseDescriptor = $convert.base64Decode(
    'ChZTdHJlYW1NZXNzYWdlc1Jlc3BvbnNlEjkKB21lc3NhZ2UYASABKAsyHy5vbnRoZWJsb2NrLm'
    'NoYXQudjEuQ2hhdE1lc3NhZ2VSB21lc3NhZ2U=');

@$core.Deprecated('Use paginationRequestDescriptor instead')
const PaginationRequest$json = {
  '1': 'PaginationRequest',
  '2': [
    {'1': 'page_size', '3': 1, '4': 1, '5': 5, '10': 'pageSize'},
    {'1': 'page_token', '3': 2, '4': 1, '5': 9, '10': 'pageToken'},
  ],
};

/// Descriptor for `PaginationRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List paginationRequestDescriptor = $convert.base64Decode(
    'ChFQYWdpbmF0aW9uUmVxdWVzdBIbCglwYWdlX3NpemUYASABKAVSCHBhZ2VTaXplEh0KCnBhZ2'
    'VfdG9rZW4YAiABKAlSCXBhZ2VUb2tlbg==');

@$core.Deprecated('Use paginationResponseDescriptor instead')
const PaginationResponse$json = {
  '1': 'PaginationResponse',
  '2': [
    {'1': 'next_page_token', '3': 1, '4': 1, '5': 9, '10': 'nextPageToken'},
  ],
};

/// Descriptor for `PaginationResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List paginationResponseDescriptor = $convert.base64Decode(
    'ChJQYWdpbmF0aW9uUmVzcG9uc2USJgoPbmV4dF9wYWdlX3Rva2VuGAEgASgJUg1uZXh0UGFnZV'
    'Rva2Vu');

