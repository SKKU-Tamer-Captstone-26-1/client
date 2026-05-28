import 'package:grpc/grpc.dart';

import 'grpc_gen/google/protobuf/struct.pb.dart' as structpb;
import 'grpc_gen/recommendation/v1/recommendation.pbgrpc.dart' as pb;
import 'recommendation_grpc_endpoint.dart';

abstract class RecommendationRemoteDataSource {
  Future<pb.GetProfileStatusResponse> getProfileStatus({
    required String authToken,
  });

  Future<pb.GetBeverageRecommendationsResponse> getBeverageRecommendations({
    required String authToken,
    required String category,
    required int limit,
    required pb.BudgetMode budgetMode,
  });

  Future<pb.RecordRecommendationEventResponse> recordRecommendationEvent({
    required String authToken,
    required String requestId,
    required String resultId,
    required pb.RecommendationEventType eventType,
    required String idempotencyKey,
    required structpb.Struct metadata,
  });

  Future<void> dispose();
}

class GrpcRecommendationRemoteDataSource
    implements RecommendationRemoteDataSource {
  factory GrpcRecommendationRemoteDataSource({
    RecommendationGrpcEndpoint? endpoint,
  }) {
    final resolvedEndpoint =
        endpoint ?? RecommendationGrpcEndpoint.fromEnvironment();
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
      pb.RecommendationServiceClient(channel),
    );
  }

  GrpcRecommendationRemoteDataSource._(
    this._endpoint,
    this._channel,
    this._client,
  );

  final RecommendationGrpcEndpoint _endpoint;
  final ClientChannel _channel;
  final pb.RecommendationServiceClient _client;

  @override
  Future<pb.GetProfileStatusResponse> getProfileStatus({
    required String authToken,
  }) {
    return _client.getProfileStatus(
      pb.GetProfileStatusRequest(),
      options: _authenticatedOptions(authToken),
    );
  }

  @override
  Future<pb.GetBeverageRecommendationsResponse> getBeverageRecommendations({
    required String authToken,
    required String category,
    required int limit,
    required pb.BudgetMode budgetMode,
  }) {
    return _client.getBeverageRecommendations(
      pb.GetBeverageRecommendationsRequest(
        category: category,
        limit: limit,
        budgetMode: budgetMode,
      ),
      options: _authenticatedOptions(authToken),
    );
  }

  @override
  Future<pb.RecordRecommendationEventResponse> recordRecommendationEvent({
    required String authToken,
    required String requestId,
    required String resultId,
    required pb.RecommendationEventType eventType,
    required String idempotencyKey,
    required structpb.Struct metadata,
  }) {
    return _client.recordRecommendationEvent(
      pb.RecordRecommendationEventRequest(
        requestId: requestId,
        resultId: resultId,
        eventType: eventType,
        idempotencyKey: idempotencyKey,
        metadata: metadata,
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
