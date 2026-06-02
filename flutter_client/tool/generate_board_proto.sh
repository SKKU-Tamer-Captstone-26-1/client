#!/usr/bin/env bash
set -euo pipefail

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
ROOT_DIR="$(cd "$SCRIPT_DIR/.." && pwd)"
INFRA_PROTO_ROOT="${1:-$HOME/on-the-block-infra/proto}"
OUT_DIR="$ROOT_DIR/lib/features/board/data/grpc_gen"

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

# Windows: protoc include dir may differ; detect from protoc location
PROTOC_BIN="$(command -v protoc)"
PROTOC_DIR="$(dirname "$PROTOC_BIN")"
# Try conda-style layout first, then fallback to /opt/homebrew/include (macOS)
if [ -d "$PROTOC_DIR/../include/google/protobuf" ]; then
  PROTOC_INCLUDE_DIR="$(cd "$PROTOC_DIR/.." && pwd)/include"
else
  PROTOC_INCLUDE_DIR="${PROTOC_INCLUDE_DIR:-/opt/homebrew/include}"
fi

# Add pub cache bin to PATH so protoc-gen-dart.bat is found on Windows
export PATH="$HOME/AppData/Local/Pub/Cache/bin:$HOME/.pub-cache/bin:$PATH"

protoc \
  -I "$INFRA_PROTO_ROOT" \
  -I "$PROTOC_INCLUDE_DIR" \
  --dart_out=grpc:"$OUT_DIR" \
  "$INFRA_PROTO_ROOT/board/v1/board.proto" \
  "$INFRA_PROTO_ROOT/common/v1/common.proto" \
  "$PROTOC_INCLUDE_DIR/google/protobuf/timestamp.proto"

echo "Generated board stubs under $OUT_DIR"
