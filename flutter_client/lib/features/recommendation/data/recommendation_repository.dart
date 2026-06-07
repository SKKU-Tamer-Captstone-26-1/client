import '../../../core/gateway/app_gateway_struct.dart';
import '../../../core/gateway/grpc_gen/appgateway/v1/app_gateway.pbgrpc.dart'
    as pb;
import '../../../core/gateway/grpc_gen/google/protobuf/struct.pb.dart'
    as structpb;
import '../../../core/gateway/grpc_gen/google/protobuf/timestamp.pb.dart'
    as timestamppb;
import '../models/recommendation_models.dart';
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
    List<String> excludeBeverageIds = const <String>[],
    List<String> excludeResultIds = const <String>[],
    RecommendationDiversityMode diversityMode =
        RecommendationDiversityMode.unspecified,
  });

  Future<VenueRecommendationPage> getVenueRecommendations({
    required String authToken,
    double? lat,
    double? lng,
    int radiusM = 0,
    String selectedBeverageId = '',
    String category = '',
    int limit = 10,
    String pageToken = '',
    RecommendationBudgetMode budgetMode = RecommendationBudgetMode.soft,
  });

  Future<void> recordEvent({
    required String authToken,
    required String requestId,
    required String resultId,
    required RecommendationEventKind eventType,
    required String idempotencyKey,
    String beverageId = '',
    String venueId = '',
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
    final payload = response.servicePayload;
    return RecommendationProfile(
      status: _profileStatusFromProto(response.status),
      profileRevision: structInt(payload, 'profile_revision'),
      surveyResponseId: structString(payload, 'survey_response_id'),
      generatedAt: response.hasUpdatedAt()
          ? _timestampToDateTime(response.updatedAt)
          : null,
      staleReason: response.statusMessage,
    );
  }

  @override
  Future<BeverageRecommendationPage> getBeverageRecommendations({
    required String authToken,
    String category = '',
    int limit = 10,
    RecommendationBudgetMode budgetMode = RecommendationBudgetMode.soft,
    List<String> excludeBeverageIds = const <String>[],
    List<String> excludeResultIds = const <String>[],
    RecommendationDiversityMode diversityMode =
        RecommendationDiversityMode.unspecified,
  }) async {
    final response = await _remote.getBeverageRecommendations(
      authToken: authToken,
      category: category,
      limit: limit,
      budgetMode: _budgetModeToProto(budgetMode),
      excludeBeverageIds: excludeBeverageIds,
      excludeResultIds: excludeResultIds,
      diversityMode: _diversityModeToProto(diversityMode),
      screenContext: const <String, Object>{'surface': 'home_recommendations'},
      clientContext: const <String, Object>{'client_platform': 'flutter'},
    );
    final payload = response.servicePayload;

    return BeverageRecommendationPage(
      requestId: structString(payload, 'request_id'),
      profileStatus: _profileStatusFromString(
        structString(payload, 'profile_status'),
      ),
      profileRevision: structInt(payload, 'profile_revision'),
      recommendations: response.recommendations
          .map(_beverageRecommendationFromProto)
          .toList(),
    );
  }

  @override
  Future<VenueRecommendationPage> getVenueRecommendations({
    required String authToken,
    double? lat,
    double? lng,
    int radiusM = 0,
    String selectedBeverageId = '',
    String category = '',
    int limit = 10,
    String pageToken = '',
    RecommendationBudgetMode budgetMode = RecommendationBudgetMode.soft,
  }) async {
    final response = await _remote.getVenueRecommendations(
      authToken: authToken,
      lat: lat,
      lng: lng,
      radiusM: radiusM,
      selectedBeverageId: selectedBeverageId,
      category: category,
      limit: limit,
      pageToken: pageToken,
      budgetMode: _budgetModeToProto(budgetMode),
      screenContext: const <String, Object>{'surface': 'venue_recommendations'},
      clientContext: const <String, Object>{'client_platform': 'flutter'},
    );
    final payload = response.servicePayload;

    return VenueRecommendationPage(
      requestId: structString(payload, 'request_id'),
      profileStatus: _profileStatusFromString(
        structString(payload, 'profile_status'),
      ),
      profileRevision: structInt(payload, 'profile_revision'),
      nextPageToken: response.nextPageToken,
      recommendations: response.recommendations
          .map(_venueRecommendationFromProto)
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
    String beverageId = '',
    String venueId = '',
    Map<String, Object> metadata = const <String, Object>{},
  }) async {
    final eventContext = _filterEventMetadata(metadata);
    await _remote.recordRecommendationEvent(
      authToken: authToken,
      requestId: requestId,
      resultId: resultId,
      beverageId: beverageId,
      venueId: venueId,
      eventType: _eventTypeToProto(eventType),
      idempotencyKey: idempotencyKey,
      eventContext: eventContext,
    );
  }

  @override
  Future<void> dispose() {
    return _remote.dispose();
  }

  static BeverageRecommendation _beverageRecommendationFromProto(
    pb.BeverageRecommendation recommendation,
  ) {
    final payload = recommendation.servicePayload;
    return BeverageRecommendation(
      rank: recommendation.rank,
      resultId: recommendation.recommendationId,
      beverageId: recommendation.beverageId,
      nameKo: recommendation.displayName,
      nameEn: structString(payload, 'name_en'),
      category: structString(payload, 'category'),
      score: recommendation.score,
      reasonCodes: List<String>.unmodifiable(recommendation.tags),
      explanation: recommendation.reason,
      style: structString(payload, 'style'),
    );
  }

  static VenueRecommendation _venueRecommendationFromProto(
    pb.VenueRecommendation recommendation,
  ) {
    final payload = recommendation.servicePayload;
    return VenueRecommendation(
      rank: recommendation.rank,
      resultId: recommendation.recommendationId,
      venueId: recommendation.venueId,
      displayName: recommendation.displayName,
      score: recommendation.score,
      reason: recommendation.reason,
      tags: List<String>.unmodifiable(recommendation.tags),
      lat: recommendation.hasLat() ? recommendation.lat : null,
      lng: recommendation.hasLng() ? recommendation.lng : null,
      address: structString(payload, 'address'),
      placeType: structString(payload, 'place_type'),
      distanceM: structDoubleOrNull(payload, 'distance_m'),
      priceKrw: _positiveIntOrNull(payload, 'price_krw'),
    );
  }

  static RecommendationProfileStatus _profileStatusFromProto(
    pb.RecommendationProfileStatus status,
  ) {
    return switch (status) {
      pb.RecommendationProfileStatus.RECOMMENDATION_PROFILE_STATUS_MISSING =>
        RecommendationProfileStatus.missing,
      pb.RecommendationProfileStatus.RECOMMENDATION_PROFILE_STATUS_PENDING =>
        RecommendationProfileStatus.pendingGeneration,
      pb.RecommendationProfileStatus.RECOMMENDATION_PROFILE_STATUS_ACTIVE =>
        RecommendationProfileStatus.active,
      pb.RecommendationProfileStatus.RECOMMENDATION_PROFILE_STATUS_STALE =>
        RecommendationProfileStatus.stale,
      pb.RecommendationProfileStatus.RECOMMENDATION_PROFILE_STATUS_FAILED =>
        RecommendationProfileStatus.failedGeneration,
      _ => RecommendationProfileStatus.unspecified,
    };
  }

  static RecommendationProfileStatus _profileStatusFromString(String status) {
    if (status.endsWith('MISSING')) {
      return RecommendationProfileStatus.missing;
    }
    if (status.endsWith('PENDING_GENERATION') || status.endsWith('PENDING')) {
      return RecommendationProfileStatus.pendingGeneration;
    }
    if (status.endsWith('ACTIVE')) {
      return RecommendationProfileStatus.active;
    }
    if (status.endsWith('STALE')) {
      return RecommendationProfileStatus.stale;
    }
    if (status.endsWith('FAILED_GENERATION') || status.endsWith('FAILED')) {
      return RecommendationProfileStatus.failedGeneration;
    }
    return RecommendationProfileStatus.unspecified;
  }

  static pb.BudgetMode _budgetModeToProto(RecommendationBudgetMode mode) {
    return switch (mode) {
      RecommendationBudgetMode.strict => pb.BudgetMode.BUDGET_MODE_STRICT,
      RecommendationBudgetMode.soft => pb.BudgetMode.BUDGET_MODE_SOFT,
    };
  }

  static pb.BeverageDiversityMode _diversityModeToProto(
    RecommendationDiversityMode mode,
  ) {
    return switch (mode) {
      RecommendationDiversityMode.standard =>
        pb.BeverageDiversityMode.BEVERAGE_DIVERSITY_MODE_STANDARD,
      RecommendationDiversityMode.different =>
        pb.BeverageDiversityMode.BEVERAGE_DIVERSITY_MODE_DIFFERENT,
      RecommendationDiversityMode.adjacent =>
        pb.BeverageDiversityMode.BEVERAGE_DIVERSITY_MODE_ADJACENT,
      RecommendationDiversityMode.unspecified =>
        pb.BeverageDiversityMode.BEVERAGE_DIVERSITY_MODE_UNSPECIFIED,
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

  static Map<String, Object> _filterEventMetadata(
    Map<String, Object> metadata,
  ) {
    return <String, Object>{
      for (final entry in metadata.entries)
        if (_recommendationEventMetadataAllowlist.contains(entry.key))
          entry.key: entry.value,
    };
  }

  static int? _positiveIntOrNull(structpb.Struct payload, String key) {
    final value = structInt(payload, key);
    return value > 0 ? value : null;
  }

  static DateTime _timestampToDateTime(timestamppb.Timestamp timestamp) {
    final seconds = timestamp.seconds.toInt();
    final milliseconds = seconds * 1000 + timestamp.nanos ~/ 1000000;
    return DateTime.fromMillisecondsSinceEpoch(milliseconds, isUtc: true);
  }
}
