#!/usr/bin/env bash
set -euo pipefail

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
ROOT_DIR="$(cd "$SCRIPT_DIR/.." && pwd)"
INFRA_PROTO_ROOT="${1:-$HOME/on-the-block-infra/proto}"
PROTOC_INCLUDE_DIR="${PROTOC_INCLUDE_DIR:-/opt/homebrew/include}"
OUT_DIR="$ROOT_DIR/lib/features/auth/data/grpc_gen"

if ! command -v protoc >/dev/null 2>&1; then
  echo "protoc not found" >&2
  exit 1
fi

if ! command -v protoc-gen-dart >/dev/null 2>&1; then
  # Note: use protoc_plugin 21.x for compatibility with protobuf ^3.1.0
  # dart pub global activate protoc_plugin 21.1.2
  echo "protoc-gen-dart not found. run: dart pub global activate protoc_plugin 21.1.2" >&2
  exit 1
fi

mkdir -p "$OUT_DIR"

protoc \
  -I "$INFRA_PROTO_ROOT" \
  -I "$PROTOC_INCLUDE_DIR" \
  --dart_out=grpc:"$OUT_DIR" \
  "$INFRA_PROTO_ROOT/auth/v1/auth.proto" \
  "$PROTOC_INCLUDE_DIR/google/protobuf/timestamp.proto"

echo "Generated auth stubs under $OUT_DIR"
