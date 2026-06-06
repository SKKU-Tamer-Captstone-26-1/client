import 'grpc_gen/google/protobuf/struct.pb.dart' as structpb;

structpb.Struct mapToStruct(Map<String, Object> metadata) {
  final struct = structpb.Struct();
  for (final entry in metadata.entries) {
    final value = valueToProto(entry.value);
    if (value != null) {
      struct.fields[entry.key] = value;
    }
  }
  return struct;
}

structpb.Value? valueToProto(Object value) {
  if (value is String) {
    return structpb.Value()..stringValue = value;
  }
  if (value is int) {
    return structpb.Value()..numberValue = value.toDouble();
  }
  if (value is double) {
    return structpb.Value()..numberValue = value;
  }
  if (value is bool) {
    return structpb.Value()..boolValue = value;
  }
  if (value is List<String>) {
    return structpb.Value(
      listValue: structpb.ListValue(
        values: value.map((item) => structpb.Value(stringValue: item)),
      ),
    );
  }
  return null;
}

String structString(structpb.Struct struct, String key) {
  final value = struct.fields[key];
  if (value == null || !value.hasStringValue()) {
    return '';
  }
  return value.stringValue;
}

int structInt(structpb.Struct struct, String key) {
  final value = struct.fields[key];
  if (value == null) {
    return 0;
  }
  if (value.hasNumberValue()) {
    return value.numberValue.toInt();
  }
  if (value.hasStringValue()) {
    return int.tryParse(value.stringValue) ?? 0;
  }
  return 0;
}

double? structDoubleOrNull(structpb.Struct struct, String key) {
  final value = struct.fields[key];
  if (value == null) {
    return null;
  }
  if (value.hasNumberValue()) {
    return value.numberValue;
  }
  if (value.hasStringValue()) {
    return double.tryParse(value.stringValue);
  }
  return null;
}

bool structBool(structpb.Struct struct, String key) {
  final value = struct.fields[key];
  if (value == null) {
    return false;
  }
  if (value.hasBoolValue()) {
    return value.boolValue;
  }
  if (value.hasStringValue()) {
    return value.stringValue.toLowerCase() == 'true';
  }
  return false;
}

List<String> structStringList(structpb.Struct struct, String key) {
  final value = struct.fields[key];
  if (value == null || !value.hasListValue()) {
    return const <String>[];
  }
  return value.listValue.values
      .where((item) => item.hasStringValue())
      .map((item) => item.stringValue)
      .toList();
}
