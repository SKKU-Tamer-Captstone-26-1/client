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

## Google Sign-In configuration

Android Google Sign-In uses `android/app/google-services.json` as the source of
truth. Do not hardcode OAuth client IDs in Dart source. The Google Services
Gradle plugin must generate `default_web_client_id` from the web OAuth client
(`client_type: 3`) in `google-services.json`; `google_sign_in` uses that value
when `GoogleSignIn()` is initialized without `clientId` or `serverClientId`.

After replacing `google-services.json`, verify the generated release resource:

```bash
cd android
./gradlew :app:processReleaseGoogleServices
grep -R "default_web_client_id" ../build/app/generated -n
```

For release builds, also compare `./gradlew :app:signingReport` with
`android/app/google-services.json`: the release SHA-1/SHA-256 must be registered
for the Android app package, and the downloaded JSON should include an Android
OAuth client for the installed build signature.

For release-device verification, run from `flutter_client` with the normal auth
service endpoint defines for the environment being tested:

```bash
flutter run --release \
  --dart-define=AUTH_GRPC_HOST=<auth-service-host> \
  --dart-define=AUTH_GRPC_PORT=443 \
  --dart-define=AUTH_GRPC_TLS=true
```
