# flutter_client

Flutter client for On The Block.

## Chat gRPC Integration (Current Stage)

This app keeps existing UI mocks but now includes a replaceable chat gRPC adapter layer under:

- `lib/features/chat/data/grpc_gen/`
- `lib/features/chat/data/chat_grpc_endpoint.dart`
- `lib/features/chat/data/chat_remote_data_source.dart`
- `lib/features/chat/data/chat_repository.dart`

## 1) Install dependencies

```bash
flutter pub get
```

## 2) Generate chat Dart stubs from infra proto

Default infra proto root: `$HOME/on-the-block-infra/proto`

```bash
./tool/generate_chat_proto.sh
```

Or pass explicit proto root:

```bash
./tool/generate_chat_proto.sh /absolute/path/to/on-the-block-infra/proto
```

## 3) Run app against local chat-service

When your chat-service is running on `localhost:9090`, run Flutter with endpoint defines.

### iOS simulator / macOS

```bash
flutter run \
  --dart-define=CHAT_GRPC_HOST=localhost \
  --dart-define=CHAT_GRPC_PORT=9090 \
  --dart-define=CHAT_GRPC_TLS=false
```

### Android emulator

```bash
flutter run \
  --dart-define=CHAT_GRPC_HOST=10.0.2.2 \
  --dart-define=CHAT_GRPC_PORT=9090 \
  --dart-define=CHAT_GRPC_TLS=false
```

## Notes

- Backend currently expects UUID-formatted user IDs.
- Current chat screens remain mock-driven by design; repository layer is ready for incremental wiring.
