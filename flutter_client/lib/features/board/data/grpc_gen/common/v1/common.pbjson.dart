//
//  Generated code. Do not modify.
//  source: common/v1/common.proto
//
// @dart = 2.12

// ignore_for_file: annotate_overrides, camel_case_types, comment_references
// ignore_for_file: constant_identifier_names, library_prefixes
// ignore_for_file: non_constant_identifier_names, prefer_final_fields
// ignore_for_file: unnecessary_import, unnecessary_this, unused_import

import 'dart:convert' as $convert;
import 'dart:core' as $core;
import 'dart:typed_data' as $typed_data;

@$core.Deprecated('Use paginationRequestDescriptor instead')
const PaginationRequest$json = {
  '1': 'PaginationRequest',
  '2': [
    {'1': 'page', '3': 1, '4': 1, '5': 5, '10': 'page'},
    {'1': 'page_size', '3': 2, '4': 1, '5': 5, '10': 'pageSize'},
  ],
};

/// Descriptor for `PaginationRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List paginationRequestDescriptor = $convert.base64Decode(
    'ChFQYWdpbmF0aW9uUmVxdWVzdBISCgRwYWdlGAEgASgFUgRwYWdlEhsKCXBhZ2Vfc2l6ZRgCIA'
    'EoBVIIcGFnZVNpemU=');

@$core.Deprecated('Use paginationResponseDescriptor instead')
const PaginationResponse$json = {
  '1': 'PaginationResponse',
  '2': [
    {'1': 'total_count', '3': 1, '4': 1, '5': 5, '10': 'totalCount'},
    {'1': 'page', '3': 2, '4': 1, '5': 5, '10': 'page'},
    {'1': 'page_size', '3': 3, '4': 1, '5': 5, '10': 'pageSize'},
    {'1': 'has_next', '3': 4, '4': 1, '5': 8, '10': 'hasNext'},
  ],
};

/// Descriptor for `PaginationResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List paginationResponseDescriptor = $convert.base64Decode(
    'ChJQYWdpbmF0aW9uUmVzcG9uc2USHwoLdG90YWxfY291bnQYASABKAVSCnRvdGFsQ291bnQSEg'
    'oEcGFnZRgCIAEoBVIEcGFnZRIbCglwYWdlX3NpemUYAyABKAVSCHBhZ2VTaXplEhkKCGhhc19u'
    'ZXh0GAQgASgIUgdoYXNOZXh0');

