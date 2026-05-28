enum RecommendationProfileStatus {
  unspecified,
  missing,
  pendingGeneration,
  active,
  stale,
  failedGeneration,
}

enum RecommendationBudgetMode { soft, strict }

enum RecommendationEventKind { impression, click, save, dismiss, detailView }

class RecommendationProfile {
  const RecommendationProfile({
    required this.status,
    required this.profileRevision,
    required this.surveyResponseId,
    this.generatedAt,
    this.staleReason = '',
  });

  final RecommendationProfileStatus status;
  final int profileRevision;
  final String surveyResponseId;
  final DateTime? generatedAt;
  final String staleReason;

  bool get isActive => status == RecommendationProfileStatus.active;
}

class BeverageRecommendation {
  const BeverageRecommendation({
    required this.rank,
    required this.resultId,
    required this.beverageId,
    required this.nameKo,
    required this.nameEn,
    required this.category,
    required this.score,
    required this.reasonCodes,
    required this.explanation,
    this.style = '',
  });

  final int rank;
  final String resultId;
  final String beverageId;
  final String nameKo;
  final String nameEn;
  final String category;
  final double score;
  final List<String> reasonCodes;
  final String explanation;
  final String style;

  String get displayName {
    final ko = nameKo.trim();
    if (ko.isNotEmpty) return ko;
    final en = nameEn.trim();
    if (en.isNotEmpty) return en;
    return 'Recommended bottle';
  }

  String get secondaryName {
    final en = nameEn.trim();
    if (en.isEmpty || en == displayName) return category;
    return en;
  }
}

class BeverageRecommendationPage {
  const BeverageRecommendationPage({
    required this.requestId,
    required this.profileStatus,
    required this.profileRevision,
    required this.recommendations,
  });

  final String requestId;
  final RecommendationProfileStatus profileStatus;
  final int profileRevision;
  final List<BeverageRecommendation> recommendations;
}
