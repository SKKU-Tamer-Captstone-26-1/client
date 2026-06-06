import 'package:flutter_test/flutter_test.dart';

import 'package:flutter_client/core/gateway/app_gateway_grpc_endpoint.dart';
import 'package:flutter_client/core/gateway/grpc_gen/appgateway/v1/app_gateway.pbgrpc.dart'
    as pb;
import 'package:flutter_client/features/recommendation/data/recommendation_remote_data_source.dart';
import 'package:flutter_client/features/recommendation/data/recommendation_repository.dart';
import 'package:flutter_client/features/recommendation/models/recommendation_models.dart';

void main() {
  test('uses the appgateway gRPC endpoint config by default', () {
    final endpoint = AppGatewayGrpcEndpoint.fromEnvironment();

    expect(endpoint.host, '');
    expect(endpoint.port, 443);
    expect(endpoint.useTls, isTrue);
  });

  test(
    'recordEvent forwards only allowlisted metadata through appgateway',
    () async {
      final remote = _FakeRecommendationRemoteDataSource();
      final repository = GrpcRecommendationRepository(remote);

      await repository.recordEvent(
        authToken: 'access-token',
        requestId: 'request-1',
        resultId: 'result-1',
        eventType: RecommendationEventKind.click,
        idempotencyKey: 'session-hash:result-1:click',
        beverageId: 'bev-1',
        metadata: const <String, Object>{
          'client_platform': 'ios',
          'app_version': '1.2.3+4',
          'surface': 'home_recommendations',
          'session_id_hash': 'session-hash',
          'list_position': 2,
          'visible_ms': 1250,
          'source': 'recommendation_service',
          'user_id': 'must-not-send',
          'raw_token': 'must-not-send',
        },
      );

      expect(remote.lastAuthToken, 'access-token');
      expect(remote.lastRequestId, 'request-1');
      expect(remote.lastResultId, 'result-1');
      expect(remote.lastBeverageId, 'bev-1');
      expect(
        remote.lastEventType,
        pb.RecommendationEventType.RECOMMENDATION_EVENT_TYPE_CLICK,
      );
      expect(remote.lastIdempotencyKey, 'session-hash:result-1:click');
      expect(
        remote.lastEventContext.keys,
        unorderedEquals([
          'client_platform',
          'app_version',
          'surface',
          'session_id_hash',
          'list_position',
          'visible_ms',
          'source',
        ]),
      );
      expect(remote.lastEventContext['client_platform'], 'ios');
      expect(remote.lastEventContext['list_position'], 2);
      expect(remote.lastEventContext['visible_ms'], 1250);
      expect(remote.lastEventContext.containsKey('user_id'), isFalse);
      expect(remote.lastEventContext.containsKey('raw_token'), isFalse);
    },
  );
}

class _FakeRecommendationRemoteDataSource
    implements RecommendationRemoteDataSource {
  String lastAuthToken = '';
  String lastRequestId = '';
  String lastResultId = '';
  String lastBeverageId = '';
  String lastVenueId = '';
  pb.RecommendationEventType? lastEventType;
  String lastIdempotencyKey = '';
  Map<String, Object> lastEventContext = const <String, Object>{};

  @override
  Future<pb.GetRecommendationProfileStatusResponse> getProfileStatus({
    required String authToken,
  }) {
    throw UnimplementedError();
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
    throw UnimplementedError();
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
    throw UnimplementedError();
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
  }) async {
    lastAuthToken = authToken;
    lastRequestId = requestId;
    lastResultId = resultId;
    lastBeverageId = beverageId;
    lastVenueId = venueId;
    lastEventType = eventType;
    lastIdempotencyKey = idempotencyKey;
    lastEventContext = Map<String, Object>.unmodifiable(eventContext);
    return pb.RecordRecommendationEventResponse(accepted: true);
  }

  @override
  Future<void> dispose() async {}
}
