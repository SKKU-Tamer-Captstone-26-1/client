#!/usr/bin/env bash
set -euo pipefail

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
ROOT_DIR="$(cd "$SCRIPT_DIR/.." && pwd)"
APPGATEWAY_PROTO_ROOT="${1:-$HOME/app-gateway-service/gateway-service/proto}"
PROTOC_INCLUDE_DIR="${PROTOC_INCLUDE_DIR:-/opt/homebrew/include}"
OUT_DIR="$ROOT_DIR/lib/core/gateway/grpc_gen"

if ! command -v protoc >/dev/null 2>&1; then
  echo "protoc not found" >&2
  exit 1
fi

if ! command -v protoc-gen-dart >/dev/null 2>&1; then
  echo "protoc-gen-dart not found. run: dart pub global activate protoc_plugin" >&2
  exit 1
fi

mkdir -p "$OUT_DIR"

protoc \
  -I "$APPGATEWAY_PROTO_ROOT" \
  -I "$PROTOC_INCLUDE_DIR" \
  --dart_out=grpc:"$OUT_DIR" \
  "$APPGATEWAY_PROTO_ROOT/appgateway/v1/app_gateway.proto" \
  "$PROTOC_INCLUDE_DIR/google/protobuf/struct.proto" \
  "$PROTOC_INCLUDE_DIR/google/protobuf/timestamp.proto"

echo "Generated appgateway stubs under $OUT_DIR"
