import 'package:flutter_test/flutter_test.dart';

import 'package:flutter_client/features/recommendation/data/grpc_gen/google/protobuf/struct.pb.dart'
    as structpb;
import 'package:flutter_client/features/recommendation/data/grpc_gen/recommendation/v1/recommendation.pbgrpc.dart'
    as pb;
import 'package:flutter_client/features/recommendation/data/recommendation_grpc_endpoint.dart';
import 'package:flutter_client/features/recommendation/data/recommendation_remote_data_source.dart';
import 'package:flutter_client/features/recommendation/data/recommendation_repository.dart';
import 'package:flutter_client/features/recommendation/models/recommendation_models.dart';

void main() {
  test('uses the production recommendation gRPC endpoint by default', () {
    final endpoint = RecommendationGrpcEndpoint.fromEnvironment();

    expect(endpoint.host, 'recommendation-service-vcuepibcwq-du.a.run.app');
    expect(endpoint.port, 443);
    expect(endpoint.useTls, isTrue);
  });

  test(
    'recordEvent forwards only allowlisted metadata to the remote',
    () async {
      final remote = _FakeRecommendationRemoteDataSource();
      final repository = GrpcRecommendationRepository(remote);

      await repository.recordEvent(
        authToken: 'access-token',
        requestId: 'request-1',
        resultId: 'result-1',
        eventType: RecommendationEventKind.click,
        idempotencyKey: 'session-hash:result-1:click',
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

      final fields =
          remote.lastMetadata?.fields ?? const <String, structpb.Value>{};
      expect(remote.lastAuthToken, 'access-token');
      expect(remote.lastRequestId, 'request-1');
      expect(remote.lastResultId, 'result-1');
      expect(
        remote.lastEventType,
        pb.RecommendationEventType.RECOMMENDATION_EVENT_TYPE_CLICK,
      );
      expect(remote.lastIdempotencyKey, 'session-hash:result-1:click');
      expect(
        fields.keys,
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
      expect(fields['client_platform']?.stringValue, 'ios');
      expect(fields['list_position']?.numberValue, 2);
      expect(fields['visible_ms']?.numberValue, 1250);
      expect(fields.containsKey('user_id'), isFalse);
      expect(fields.containsKey('raw_token'), isFalse);
    },
  );
}

class _FakeRecommendationRemoteDataSource
    implements RecommendationRemoteDataSource {
  String lastAuthToken = '';
  String lastRequestId = '';
  String lastResultId = '';
  pb.RecommendationEventType? lastEventType;
  String lastIdempotencyKey = '';
  structpb.Struct? lastMetadata;

  @override
  Future<pb.GetProfileStatusResponse> getProfileStatus({
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
  }) {
    throw UnimplementedError();
  }

  @override
  Future<pb.RecordRecommendationEventResponse> recordRecommendationEvent({
    required String authToken,
    required String requestId,
    required String resultId,
    required pb.RecommendationEventType eventType,
    required String idempotencyKey,
    required structpb.Struct metadata,
  }) async {
    lastAuthToken = authToken;
    lastRequestId = requestId;
    lastResultId = resultId;
    lastEventType = eventType;
    lastIdempotencyKey = idempotencyKey;
    lastMetadata = metadata;
    return pb.RecordRecommendationEventResponse();
  }

  @override
  Future<void> dispose() async {}
}
