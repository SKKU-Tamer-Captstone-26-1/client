# AppGateway Integration

Flutter chatbot and recommendation UI now use the mobile-facing gRPC BFF:

```text
Flutter -> gateway-service AppGatewayService
```

Generated Dart bindings come from:

```text
/Users/jeonghun/app-gateway-service/gateway-service/proto/appgateway/v1/app_gateway.proto
```

The generated files live under:

```text
lib/core/gateway/grpc_gen/
```

Runtime configuration uses only the gateway gRPC endpoint:

```text
APP_GATEWAY_GRPC_HOST=
APP_GATEWAY_GRPC_PORT=443
APP_GATEWAY_GRPC_TLS=true
```

Flutter must not configure or call chatbot-service, recommendation-service, or
llm-serving-service directly for the migrated chatbot/recommendation features.

Auth metadata remains:

```text
authorization: Bearer <access_token>
```

Flutter does not send trusted `user_id` fields. The gateway derives trusted user
identity from the bearer token.
