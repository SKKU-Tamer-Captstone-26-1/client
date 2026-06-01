import '../models/recommendation_models.dart';
import 'grpc_gen/google/protobuf/struct.pb.dart' as structpb;
import 'grpc_gen/google/protobuf/timestamp.pb.dart' as timestamppb;
import 'grpc_gen/recommendation/v1/recommendation.pb.dart' as pb;
import 'recommendation_remote_data_source.dart';

const Set<String> _recommendationEventMetadataAllowlist = <String>{
  'client_platform',
  'app_version',
  'surface',
  'session_id_hash',
  'list_position',
  'visible_ms',
  'source',
};

abstract class RecommendationRepository {
  Future<RecommendationProfile> getProfileStatus({required String authToken});

  Future<BeverageRecommendationPage> getBeverageRecommendations({
    required String authToken,
    String category = '',
    int limit = 10,
    RecommendationBudgetMode budgetMode = RecommendationBudgetMode.soft,
  });

  Future<void> recordEvent({
    required String authToken,
    required String requestId,
    required String resultId,
    required RecommendationEventKind eventType,
    required String idempotencyKey,
    Map<String, Object> metadata = const <String, Object>{},
  });

  Future<void> dispose();
}

class GrpcRecommendationRepository implements RecommendationRepository {
  const GrpcRecommendationRepository(this._remote);

  final RecommendationRemoteDataSource _remote;

  @override
  Future<RecommendationProfile> getProfileStatus({
    required String authToken,
  }) async {
    final response = await _remote.getProfileStatus(authToken: authToken);
    return RecommendationProfile(
      status: _profileStatusFromProto(response.status),
      profileRevision: response.profileRevision,
      surveyResponseId: response.surveyResponseId,
      generatedAt: response.hasGeneratedAt()
          ? _timestampToDateTime(response.generatedAt)
          : null,
      staleReason: response.staleReason,
    );
  }

  @override
  Future<BeverageRecommendationPage> getBeverageRecommendations({
    required String authToken,
    String category = '',
    int limit = 10,
    RecommendationBudgetMode budgetMode = RecommendationBudgetMode.soft,
  }) async {
    final response = await _remote.getBeverageRecommendations(
      authToken: authToken,
      category: category,
      limit: limit,
      budgetMode: _budgetModeToProto(budgetMode),
    );

    return BeverageRecommendationPage(
      requestId: response.requestId,
      profileStatus: _profileStatusFromProto(response.profileStatus),
      profileRevision: response.profileRevision,
      recommendations: response.recommendations
          .map(_beverageRecommendationFromProto)
          .toList(),
    );
  }

  @override
  Future<void> recordEvent({
    required String authToken,
    required String requestId,
    required String resultId,
    required RecommendationEventKind eventType,
    required String idempotencyKey,
    Map<String, Object> metadata = const <String, Object>{},
  }) async {
    await _remote.recordRecommendationEvent(
      authToken: authToken,
      requestId: requestId,
      resultId: resultId,
      eventType: _eventTypeToProto(eventType),
      idempotencyKey: idempotencyKey,
      metadata: _metadataToProto(metadata),
    );
  }

  @override
  Future<void> dispose() {
    return _remote.dispose();
  }

  static BeverageRecommendation _beverageRecommendationFromProto(
    pb.BeverageRecommendation recommendation,
  ) {
    return BeverageRecommendation(
      rank: recommendation.rank,
      resultId: recommendation.resultId,
      beverageId: recommendation.beverageId,
      nameKo: recommendation.nameKo,
      nameEn: recommendation.nameEn,
      category: recommendation.category,
      score: recommendation.score,
      reasonCodes: List<String>.unmodifiable(recommendation.reasonCodes),
      explanation: recommendation.explanation,
      style: _metadataString(recommendation, 'style'),
    );
  }

  static RecommendationProfileStatus _profileStatusFromProto(
    pb.ProfileStatus status,
  ) {
    return switch (status) {
      pb.ProfileStatus.PROFILE_STATUS_MISSING =>
        RecommendationProfileStatus.missing,
      pb.ProfileStatus.PROFILE_STATUS_PENDING_GENERATION =>
        RecommendationProfileStatus.pendingGeneration,
      pb.ProfileStatus.PROFILE_STATUS_ACTIVE =>
        RecommendationProfileStatus.active,
      pb.ProfileStatus.PROFILE_STATUS_STALE =>
        RecommendationProfileStatus.stale,
      pb.ProfileStatus.PROFILE_STATUS_FAILED_GENERATION =>
        RecommendationProfileStatus.failedGeneration,
      _ => RecommendationProfileStatus.unspecified,
    };
  }

  static pb.BudgetMode _budgetModeToProto(RecommendationBudgetMode mode) {
    return switch (mode) {
      RecommendationBudgetMode.strict => pb.BudgetMode.BUDGET_MODE_STRICT,
      RecommendationBudgetMode.soft => pb.BudgetMode.BUDGET_MODE_SOFT,
    };
  }

  static pb.RecommendationEventType _eventTypeToProto(
    RecommendationEventKind type,
  ) {
    return switch (type) {
      RecommendationEventKind.impression =>
        pb.RecommendationEventType.RECOMMENDATION_EVENT_TYPE_IMPRESSION,
      RecommendationEventKind.click =>
        pb.RecommendationEventType.RECOMMENDATION_EVENT_TYPE_CLICK,
      RecommendationEventKind.save =>
        pb.RecommendationEventType.RECOMMENDATION_EVENT_TYPE_SAVE,
      RecommendationEventKind.dismiss =>
        pb.RecommendationEventType.RECOMMENDATION_EVENT_TYPE_DISMISS,
      RecommendationEventKind.detailView =>
        pb.RecommendationEventType.RECOMMENDATION_EVENT_TYPE_DETAIL_VIEW,
    };
  }

  static structpb.Struct _metadataToProto(Map<String, Object> metadata) {
    final struct = structpb.Struct();
    for (final entry in metadata.entries) {
      if (!_recommendationEventMetadataAllowlist.contains(entry.key)) {
        continue;
      }
      final value = entry.value;
      if (value is String) {
        struct.fields[entry.key] = structpb.Value()..stringValue = value;
      } else if (value is int) {
        struct.fields[entry.key] = structpb.Value()
          ..numberValue = value.toDouble();
      } else if (value is double) {
        struct.fields[entry.key] = structpb.Value()..numberValue = value;
      } else if (value is bool) {
        struct.fields[entry.key] = structpb.Value()..boolValue = value;
      }
    }
    return struct;
  }

  static String _metadataString(
    pb.BeverageRecommendation recommendation,
    String key,
  ) {
    if (!recommendation.hasMetadata()) {
      return '';
    }
    final value = recommendation.metadata.fields[key];
    if (value == null || !value.hasStringValue()) {
      return '';
    }
    return value.stringValue;
  }

  static DateTime _timestampToDateTime(timestamppb.Timestamp timestamp) {
    final seconds = timestamp.seconds.toInt();
    final milliseconds = seconds * 1000 + timestamp.nanos ~/ 1000000;
    return DateTime.fromMillisecondsSinceEpoch(milliseconds, isUtc: true);
  }
}
