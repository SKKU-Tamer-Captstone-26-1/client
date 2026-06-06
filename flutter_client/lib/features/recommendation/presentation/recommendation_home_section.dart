import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import '../../../core/theme/app_colors.dart';
import '../data/recommendation_repository.dart';
import '../models/recommendation_models.dart';

class RecommendationHomeSection extends StatefulWidget {
  const RecommendationHomeSection({
    super.key,
    required this.repository,
    required this.authToken,
    this.hasCompletedSurvey = false,
  });

  final RecommendationRepository? repository;
  final String authToken;
  final bool hasCompletedSurvey;

  @override
  State<RecommendationHomeSection> createState() =>
      _RecommendationHomeSectionState();
}

class _RecommendationHomeSectionState extends State<RecommendationHomeSection> {
  static const _appVersion = String.fromEnvironment(
    'APP_VERSION',
    defaultValue: '1.0.0+1',
  );

  Future<_RecommendationHomeData>? _future;

  @override
  void initState() {
    super.initState();
    _resetFuture();
  }

  @override
  void didUpdateWidget(RecommendationHomeSection oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.repository != widget.repository ||
        oldWidget.authToken != widget.authToken ||
        oldWidget.hasCompletedSurvey != widget.hasCompletedSurvey) {
      _resetFuture();
    }
  }

  void _resetFuture() {
    final repository = widget.repository;
    final token = widget.authToken.trim();
    _future = repository == null || token.isEmpty
        ? null
        : _load(repository: repository, authToken: token);
  }

  Future<_RecommendationHomeData> _load({
    required RecommendationRepository repository,
    required String authToken,
  }) async {
    final profile = await repository.getProfileStatus(authToken: authToken);
    if (!profile.isActive) {
      return _RecommendationHomeData(profile: profile);
    }

    final page = await repository.getBeverageRecommendations(
      authToken: authToken,
      limit: 10,
      budgetMode: RecommendationBudgetMode.soft,
    );
    return _RecommendationHomeData(profile: profile, page: page);
  }

  void _retry() {
    setState(_resetFuture);
  }

  @override
  Widget build(BuildContext context) {
    final future = _future;
    if (future == null) {
      return const SizedBox.shrink();
    }

    return FutureBuilder<_RecommendationHomeData>(
      future: future,
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const _RecommendationLoading();
        }
        if (snapshot.hasError) {
          return _RecommendationStatusCard(
            title: 'Recommendations unavailable',
            message: 'We could not refresh your picks right now.',
            icon: Icons.wifi_off,
            action: IconButton(
              onPressed: _retry,
              tooltip: 'Retry recommendations',
              icon: const Icon(Icons.refresh),
            ),
          );
        }

        final data = snapshot.data;
        if (data == null) {
          return const SizedBox.shrink();
        }
        if (!data.profile.isActive) {
          return _RecommendationStatusCard(
            title: _profileTitle(
              data.profile.status,
              hasCompletedSurvey: widget.hasCompletedSurvey,
            ),
            message: _profileMessage(
              data.profile,
              hasCompletedSurvey: widget.hasCompletedSurvey,
            ),
            icon: Icons.auto_awesome,
            action: IconButton(
              onPressed: _retry,
              tooltip: 'Refresh recommendations',
              icon: const Icon(Icons.refresh),
            ),
          );
        }

        final recommendations = data.page?.recommendations ?? const [];
        if (recommendations.isEmpty) {
          return const _RecommendationStatusCard(
            title: 'No recommendations yet',
            message: 'Your profile is ready, but there are no bottles to show.',
            icon: Icons.local_bar,
          );
        }

        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _RecommendationHero(recommendation: recommendations.first),
            const SizedBox(height: 24),
            _RecommendationList(
              recommendations: recommendations,
              repository: widget.repository!,
              authToken: widget.authToken.trim(),
              requestId: data.page?.requestId ?? '',
              sessionIdHash: _sessionIdHash(widget.authToken),
              appVersion: _appVersion,
            ),
          ],
        );
      },
    );
  }

  static String _profileTitle(
    RecommendationProfileStatus status, {
    required bool hasCompletedSurvey,
  }) {
    return switch (status) {
      RecommendationProfileStatus.missing =>
        hasCompletedSurvey
            ? 'Recommendation profile not ready'
            : 'Taste profile needed',
      RecommendationProfileStatus.pendingGeneration => 'Building your picks',
      RecommendationProfileStatus.stale => 'Refreshing your taste profile',
      RecommendationProfileStatus.failedGeneration => 'Profile refresh failed',
      _ => 'Recommendations pending',
    };
  }

  static String _profileMessage(
    RecommendationProfile profile, {
    required bool hasCompletedSurvey,
  }) {
    if (profile.staleReason.trim().isNotEmpty) {
      return profile.staleReason;
    }
    return switch (profile.status) {
      RecommendationProfileStatus.missing =>
        hasCompletedSurvey
            ? 'Your survey is saved, but the recommendation profile has not been generated yet.'
            : 'Complete the survey to unlock personalized bottles.',
      RecommendationProfileStatus.pendingGeneration =>
        'Your recommendations are being prepared.',
      RecommendationProfileStatus.stale =>
        'Your older profile is being updated.',
      RecommendationProfileStatus.failedGeneration =>
        'Your recommendation profile could not be generated.',
      _ => 'Your recommendation profile is not active yet.',
    };
  }
}

class _RecommendationHomeData {
  const _RecommendationHomeData({required this.profile, this.page});

  final RecommendationProfile profile;
  final BeverageRecommendationPage? page;
}

class _RecommendationLoading extends StatelessWidget {
  const _RecommendationLoading();

  @override
  Widget build(BuildContext context) {
    return const _RecommendationStatusCard(
      title: 'Recommended for you',
      message: 'Refreshing your personalized picks.',
      icon: Icons.auto_awesome,
      trailing: SizedBox(
        width: 18,
        height: 18,
        child: CircularProgressIndicator(strokeWidth: 2),
      ),
    );
  }
}

class _RecommendationHero extends StatelessWidget {
  const _RecommendationHero({required this.recommendation});

  final BeverageRecommendation recommendation;

  @override
  Widget build(BuildContext context) {
    final palette = context.palette;
    final title = recommendation.nameKo.trim().isEmpty
        ? recommendation.displayName
        : recommendation.nameKo.trim();
    final explanation = recommendation.explanation.trim().isEmpty
        ? 'Matched from your taste profile.'
        : recommendation.explanation.trim();

    return Container(
      constraints: const BoxConstraints(minHeight: 184),
      padding: const EdgeInsets.all(22),
      decoration: BoxDecoration(
        color: palette.surfaceContainerLowest,
        borderRadius: BorderRadius.circular(24),
        border: Border.all(
          color: palette.outlineVariant.withValues(alpha: 0.7),
        ),
        boxShadow: const [
          BoxShadow(
            color: Color(0x14000000),
            blurRadius: 16,
            offset: Offset(0, 8),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              DecoratedBox(
                decoration: BoxDecoration(
                  color: AppColors.primaryContainer,
                  borderRadius: BorderRadius.circular(999),
                ),
                child: const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                  child: Text(
                    'TOP MATCH',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 12,
                      fontWeight: FontWeight.w800,
                      letterSpacing: 0.8,
                    ),
                  ),
                ),
              ),
              const Spacer(),
              Container(
                width: 38,
                height: 38,
                decoration: BoxDecoration(
                  color: palette.surfaceContainerLow,
                  shape: BoxShape.circle,
                ),
                child: Icon(
                  Icons.local_bar,
                  color: palette.secondary,
                  size: 22,
                ),
              ),
            ],
          ),
          const SizedBox(height: 18),
          Text(
            title,
            style: TextStyle(
              color: palette.onSurface,
              fontSize: 26,
              fontWeight: FontWeight.w900,
              height: 1.08,
            ),
          ),
          const SizedBox(height: 8),
          Text(
            explanation,
            style: TextStyle(
              color: palette.secondary,
              fontSize: 14,
              fontWeight: FontWeight.w500,
              height: 1.35,
            ),
          ),
          if (recommendation.reasonCodes.isNotEmpty) ...[
            const SizedBox(height: 14),
            Wrap(
              spacing: 8,
              runSpacing: 8,
              children: [
                for (final reasonCode in recommendation.reasonCodes)
                  _MiniChip(label: _formatReasonCode(reasonCode)),
              ],
            ),
          ],
        ],
      ),
    );
  }
}

class _RecommendationList extends StatelessWidget {
  const _RecommendationList({
    required this.recommendations,
    required this.repository,
    required this.authToken,
    required this.requestId,
    required this.sessionIdHash,
    required this.appVersion,
  });

  final List<BeverageRecommendation> recommendations;
  final RecommendationRepository repository;
  final String authToken;
  final String requestId;
  final String sessionIdHash;
  final String appVersion;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const _RecommendationHeader(),
        const SizedBox(height: 14),
        SizedBox(
          height: 286,
          child: ListView.separated(
            scrollDirection: Axis.horizontal,
            itemCount: recommendations.length,
            separatorBuilder: (_, _) => const SizedBox(width: 12),
            itemBuilder: (context, index) {
              return _RecommendationCard(
                recommendation: recommendations[index],
                repository: repository,
                authToken: authToken,
                requestId: requestId,
                sessionIdHash: sessionIdHash,
                appVersion: appVersion,
                listPosition: index,
              );
            },
          ),
        ),
      ],
    );
  }
}

class _RecommendationHeader extends StatelessWidget {
  const _RecommendationHeader();

  @override
  Widget build(BuildContext context) {
    final palette = context.palette;

    return Row(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Recommended for you',
                style: TextStyle(
                  color: palette.onSurface,
                  fontSize: 20,
                  fontWeight: FontWeight.w800,
                  height: 1.2,
                ),
              ),
              const SizedBox(height: 3),
              Text(
                'Bottles matched from your taste profile',
                style: TextStyle(
                  color: palette.secondary,
                  fontSize: 12,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ],
          ),
        ),
        Icon(Icons.auto_awesome, color: palette.secondary, size: 20),
      ],
    );
  }
}

class _RecommendationCard extends StatefulWidget {
  const _RecommendationCard({
    required this.recommendation,
    required this.repository,
    required this.authToken,
    required this.requestId,
    required this.sessionIdHash,
    required this.appVersion,
    required this.listPosition,
  });

  final BeverageRecommendation recommendation;
  final RecommendationRepository repository;
  final String authToken;
  final String requestId;
  final String sessionIdHash;
  final String appVersion;
  final int listPosition;

  @override
  State<_RecommendationCard> createState() => _RecommendationCardState();
}

class _RecommendationCardState extends State<_RecommendationCard> {
  bool _impressionRecorded = false;
  final Stopwatch _visibleStopwatch = Stopwatch();

  @override
  void initState() {
    super.initState();
    _visibleStopwatch.start();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (mounted) {
        _recordEvent(RecommendationEventKind.impression);
      }
    });
  }

  void _recordEvent(RecommendationEventKind eventType) {
    if (eventType == RecommendationEventKind.impression) {
      if (_impressionRecorded) return;
      _impressionRecorded = true;
    }

    final recommendation = widget.recommendation;
    if (widget.requestId.trim().isEmpty ||
        recommendation.resultId.trim().isEmpty ||
        widget.authToken.trim().isEmpty) {
      return;
    }

    unawaited(
      widget.repository.recordEvent(
        authToken: widget.authToken,
        requestId: widget.requestId,
        resultId: recommendation.resultId,
        beverageId: recommendation.beverageId,
        eventType: eventType,
        idempotencyKey:
            '${widget.sessionIdHash}:${recommendation.resultId}:${_eventKey(eventType)}',
        metadata: <String, Object>{
          'client_platform': defaultTargetPlatform.name,
          'app_version': widget.appVersion,
          'surface': 'home_recommendations',
          'session_id_hash': widget.sessionIdHash,
          'list_position': widget.listPosition,
          'visible_ms': _visibleStopwatch.elapsedMilliseconds,
          'source': 'recommendation_service',
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final palette = context.palette;
    final recommendation = widget.recommendation;
    final chipLabels = _recommendationChipLabels(recommendation);
    final explanation = recommendation.explanation.trim().isEmpty
        ? 'Matched to your taste profile.'
        : recommendation.explanation.trim();

    return SizedBox(
      width: 236,
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          borderRadius: BorderRadius.circular(16),
          onTap: () {
            _recordEvent(RecommendationEventKind.click);
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text(
                  '${recommendation.displayName} detail is not available yet.',
                ),
              ),
            );
          },
          child: Ink(
            decoration: BoxDecoration(
              color: palette.surfaceContainerLowest,
              borderRadius: BorderRadius.circular(16),
              border: Border.all(
                color: palette.outlineVariant.withValues(alpha: 0.55),
              ),
            ),
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      DecoratedBox(
                        decoration: BoxDecoration(
                          color: AppColors.primaryContainer,
                          borderRadius: BorderRadius.circular(999),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 9,
                            vertical: 4,
                          ),
                          child: Text(
                            '#${recommendation.rank}',
                            style: const TextStyle(
                              color: Colors.white,
                              fontSize: 11,
                              fontWeight: FontWeight.w900,
                            ),
                          ),
                        ),
                      ),
                      const Spacer(),
                      IconButton(
                        tooltip: 'Save recommendation',
                        constraints: const BoxConstraints.tightFor(
                          width: 34,
                          height: 34,
                        ),
                        padding: EdgeInsets.zero,
                        visualDensity: VisualDensity.compact,
                        onPressed: () =>
                            _recordEvent(RecommendationEventKind.save),
                        icon: Icon(
                          Icons.bookmark_border,
                          color: palette.secondary,
                          size: 20,
                        ),
                      ),
                      IconButton(
                        tooltip: 'Dismiss recommendation',
                        constraints: const BoxConstraints.tightFor(
                          width: 34,
                          height: 34,
                        ),
                        padding: EdgeInsets.zero,
                        visualDensity: VisualDensity.compact,
                        onPressed: () =>
                            _recordEvent(RecommendationEventKind.dismiss),
                        icon: Icon(
                          Icons.close,
                          color: palette.secondary,
                          size: 20,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 8),
                  Text(
                    recommendation.displayName,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                      color: palette.onSurface,
                      fontSize: 17,
                      fontWeight: FontWeight.w900,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    recommendation.secondaryName,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                      color: palette.secondary,
                      fontSize: 12,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  const SizedBox(height: 10),
                  if (chipLabels.isNotEmpty)
                    Wrap(
                      spacing: 6,
                      runSpacing: 6,
                      children: [
                        for (final label in chipLabels) _MiniChip(label: label),
                      ],
                    ),
                  const SizedBox(height: 10),
                  Expanded(
                    child: Align(
                      alignment: Alignment.bottomLeft,
                      child: Text(
                        explanation,
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                          color: palette.onSurfaceVariant,
                          fontSize: 12,
                          height: 1.35,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class _MiniChip extends StatelessWidget {
  const _MiniChip({required this.label});

  final String label;

  @override
  Widget build(BuildContext context) {
    final palette = context.palette;

    return ConstrainedBox(
      constraints: const BoxConstraints(maxWidth: 184),
      child: DecoratedBox(
        decoration: BoxDecoration(
          color: palette.surfaceContainerLow,
          borderRadius: BorderRadius.circular(999),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
          child: Text(
            label,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            style: TextStyle(
              color: palette.secondary,
              fontSize: 10,
              fontWeight: FontWeight.w800,
            ),
          ),
        ),
      ),
    );
  }
}

List<String> _recommendationChipLabels(BeverageRecommendation recommendation) {
  final labels = <String>[
    recommendation.category.trim(),
    recommendation.style.trim(),
    for (final reasonCode in recommendation.reasonCodes)
      _formatReasonCode(reasonCode),
  ].where((label) => label.trim().isNotEmpty).toList(growable: false);

  return labels.take(3).toList(growable: false);
}

String _sessionIdHash(String authToken) {
  var hash = 0xcbf29ce484222325;
  for (final codeUnit in authToken.codeUnits) {
    hash ^= codeUnit;
    hash = (hash * 0x100000001b3) & 0x7fffffffffffffff;
  }
  return hash.toRadixString(16).padLeft(16, '0');
}

String _eventKey(RecommendationEventKind eventType) {
  return switch (eventType) {
    RecommendationEventKind.impression => 'impression',
    RecommendationEventKind.click => 'click',
    RecommendationEventKind.save => 'save',
    RecommendationEventKind.dismiss => 'dismiss',
    RecommendationEventKind.detailView => 'detail_view',
  };
}

String _formatReasonCode(String rawValue) {
  final value = rawValue.trim();
  if (value.isEmpty) return '';

  return value
      .split(RegExp(r'[_\-\s]+'))
      .where((part) => part.isNotEmpty)
      .map((part) => part[0].toUpperCase() + part.substring(1).toLowerCase())
      .join(' ');
}

class _RecommendationStatusCard extends StatelessWidget {
  const _RecommendationStatusCard({
    required this.title,
    required this.message,
    required this.icon,
    this.action,
    this.trailing,
  });

  final String title;
  final String message;
  final IconData icon;
  final Widget? action;
  final Widget? trailing;

  @override
  Widget build(BuildContext context) {
    final palette = context.palette;

    return DecoratedBox(
      decoration: BoxDecoration(
        color: palette.surfaceContainerLowest,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(
          color: palette.outlineVariant.withValues(alpha: 0.55),
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Row(
          children: [
            DecoratedBox(
              decoration: BoxDecoration(
                color: AppColors.primaryContainer.withValues(alpha: 0.14),
                shape: BoxShape.circle,
              ),
              child: Padding(
                padding: const EdgeInsets.all(10),
                child: Icon(icon, color: AppColors.primaryContainer, size: 22),
              ),
            ),
            const SizedBox(width: 12),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: TextStyle(
                      color: palette.onSurface,
                      fontSize: 15,
                      fontWeight: FontWeight.w800,
                    ),
                  ),
                  const SizedBox(height: 3),
                  Text(
                    message,
                    style: TextStyle(
                      color: palette.secondary,
                      fontSize: 12,
                      height: 1.35,
                    ),
                  ),
                ],
              ),
            ),
            if (trailing != null) ...[const SizedBox(width: 12), trailing!],
            if (action != null) ...[const SizedBox(width: 4), action!],
          ],
        ),
      ),
    );
  }
}
