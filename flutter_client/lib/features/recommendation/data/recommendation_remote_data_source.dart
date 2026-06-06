import 'package:grpc/grpc.dart';

import '../../../core/gateway/app_gateway_grpc_endpoint.dart';
import '../../../core/gateway/app_gateway_struct.dart';
import '../../../core/gateway/grpc_gen/appgateway/v1/app_gateway.pbgrpc.dart'
    as pb;

abstract class RecommendationRemoteDataSource {
  Future<pb.GetRecommendationProfileStatusResponse> getProfileStatus({
    required String authToken,
  });

  Future<pb.GetBeverageRecommendationsResponse> getBeverageRecommendations({
    required String authToken,
    required String category,
    required int limit,
    required pb.BudgetMode budgetMode,
    String pageToken = '',
    Map<String, Object> screenContext = const <String, Object>{},
    Map<String, Object> clientContext = const <String, Object>{},
  });

  Future<pb.GetVenueRecommendationsResponse> getVenueRecommendations({
    required String authToken,
    double? lat,
    double? lng,
    int radiusM = 0,
    String selectedBeverageId = '',
    String category = '',
    int limit = 10,
    String pageToken = '',
    required pb.BudgetMode budgetMode,
    Map<String, Object> screenContext = const <String, Object>{},
    Map<String, Object> clientContext = const <String, Object>{},
  });

  Future<pb.RecordRecommendationEventResponse> recordRecommendationEvent({
    required String authToken,
    required String requestId,
    required String resultId,
    required String beverageId,
    required String venueId,
    required pb.RecommendationEventType eventType,
    required String idempotencyKey,
    required Map<String, Object> eventContext,
    Map<String, Object> clientContext = const <String, Object>{},
  });

  Future<void> dispose();
}

class GrpcRecommendationRemoteDataSource
    implements RecommendationRemoteDataSource {
  factory GrpcRecommendationRemoteDataSource({
    AppGatewayGrpcEndpoint? endpoint,
  }) {
    final resolvedEndpoint =
        endpoint ?? AppGatewayGrpcEndpoint.fromEnvironment();
    final channel = ClientChannel(
      resolvedEndpoint.host,
      port: resolvedEndpoint.port,
      options: ChannelOptions(
        credentials: resolvedEndpoint.useTls
            ? const ChannelCredentials.secure()
            : const ChannelCredentials.insecure(),
      ),
    );

    return GrpcRecommendationRemoteDataSource._(
      resolvedEndpoint,
      channel,
      pb.AppGatewayServiceClient(channel),
    );
  }

  GrpcRecommendationRemoteDataSource._(
    this._endpoint,
    this._channel,
    this._client,
  );

  final AppGatewayGrpcEndpoint _endpoint;
  final ClientChannel _channel;
  final pb.AppGatewayServiceClient _client;

  @override
  Future<pb.GetRecommendationProfileStatusResponse> getProfileStatus({
    required String authToken,
  }) {
    return _client.getRecommendationProfileStatus(
      pb.GetRecommendationProfileStatusRequest(),
      options: _authenticatedOptions(authToken),
    );
  }

  @override
  Future<pb.GetBeverageRecommendationsResponse> getBeverageRecommendations({
    required String authToken,
    required String category,
    required int limit,
    required pb.BudgetMode budgetMode,
    String pageToken = '',
    Map<String, Object> screenContext = const <String, Object>{},
    Map<String, Object> clientContext = const <String, Object>{},
  }) {
    return _client.getBeverageRecommendations(
      pb.GetBeverageRecommendationsRequest(
        category: category,
        limit: limit,
        pageToken: pageToken,
        budgetMode: budgetMode,
        screenContext: mapToStruct(screenContext),
        clientContext: mapToStruct(clientContext),
      ),
      options: _authenticatedOptions(authToken),
    );
  }

  @override
  Future<pb.GetVenueRecommendationsResponse> getVenueRecommendations({
    required String authToken,
    double? lat,
    double? lng,
    int radiusM = 0,
    String selectedBeverageId = '',
    String category = '',
    int limit = 10,
    String pageToken = '',
    required pb.BudgetMode budgetMode,
    Map<String, Object> screenContext = const <String, Object>{},
    Map<String, Object> clientContext = const <String, Object>{},
  }) {
    final request = pb.GetVenueRecommendationsRequest(
      radiusM: radiusM,
      selectedBeverageId: selectedBeverageId,
      category: category,
      limit: limit,
      pageToken: pageToken,
      budgetMode: budgetMode,
      screenContext: mapToStruct(screenContext),
      clientContext: mapToStruct(clientContext),
    );
    if (lat != null && lng != null) {
      request.lat = lat;
      request.lng = lng;
    }

    return _client.getVenueRecommendations(
      request,
      options: _authenticatedOptions(authToken),
    );
  }

  @override
  Future<pb.RecordRecommendationEventResponse> recordRecommendationEvent({
    required String authToken,
    required String requestId,
    required String resultId,
    required String beverageId,
    required String venueId,
    required pb.RecommendationEventType eventType,
    required String idempotencyKey,
    required Map<String, Object> eventContext,
    Map<String, Object> clientContext = const <String, Object>{},
  }) {
    return _client.recordRecommendationEvent(
      pb.RecordRecommendationEventRequest(
        idempotencyKey: idempotencyKey,
        eventType: eventType,
        requestId: requestId,
        resultId: resultId,
        beverageId: beverageId,
        venueId: venueId,
        eventContext: mapToStruct(eventContext),
        clientContext: mapToStruct(clientContext),
      ),
      options: _authenticatedOptions(authToken),
    );
  }

  @override
  Future<void> dispose() {
    return _channel.shutdown();
  }

  CallOptions _authenticatedOptions(String authToken) {
    final token = authToken.trim();
    return CallOptions(
      timeout: const Duration(seconds: 10),
      metadata: token.isEmpty
          ? const <String, String>{}
          : <String, String>{'authorization': 'Bearer $token'},
    );
  }

  @override
  String toString() =>
      'GrpcRecommendationRemoteDataSource(${_endpoint.host}:${_endpoint.port}, tls=${_endpoint.useTls})';
}
