//
//  Generated code. Do not modify.
//  source: auth.proto
//
// @dart = 2.12

// ignore_for_file: annotate_overrides, camel_case_types, comment_references
// ignore_for_file: constant_identifier_names, library_prefixes
// ignore_for_file: non_constant_identifier_names, prefer_final_fields
// ignore_for_file: unnecessary_import, unnecessary_this, unused_import

import 'dart:core' as $core;

import 'package:protobuf/protobuf.dart' as $pb;

class Role extends $pb.ProtobufEnum {
  static const Role ROLE_UNSPECIFIED = Role._(0, _omitEnumNames ? '' : 'ROLE_UNSPECIFIED');
  static const Role ROLE_NORMAL = Role._(1, _omitEnumNames ? '' : 'ROLE_NORMAL');
  static const Role ROLE_ADMIN = Role._(2, _omitEnumNames ? '' : 'ROLE_ADMIN');
  static const Role ROLE_BAR = Role._(3, _omitEnumNames ? '' : 'ROLE_BAR');
  static const Role ROLE_REQUE = Role._(4, _omitEnumNames ? '' : 'ROLE_REQUE');

  static const $core.List<Role> values = <Role>[
    ROLE_UNSPECIFIED,
    ROLE_NORMAL,
    ROLE_ADMIN,
    ROLE_BAR,
    ROLE_REQUE,
  ];

  static final $core.Map<$core.int, Role> _byValue = $pb.ProtobufEnum.initByValue(values);
  static Role? valueOf($core.int value) => _byValue[value];

  const Role._($core.int v, $core.String n) : super(v, n);
}

class Provider extends $pb.ProtobufEnum {
  static const Provider PROVIDER_UNSPECIFIED = Provider._(0, _omitEnumNames ? '' : 'PROVIDER_UNSPECIFIED');
  static const Provider PROVIDER_GOOGLE = Provider._(1, _omitEnumNames ? '' : 'PROVIDER_GOOGLE');

  static const $core.List<Provider> values = <Provider>[
    PROVIDER_UNSPECIFIED,
    PROVIDER_GOOGLE,
  ];

  static final $core.Map<$core.int, Provider> _byValue = $pb.ProtobufEnum.initByValue(values);
  static Provider? valueOf($core.int value) => _byValue[value];

  const Provider._($core.int v, $core.String n) : super(v, n);
}

const _omitEnumNames = $core.bool.fromEnvironment('protobuf.omit_enum_names');
