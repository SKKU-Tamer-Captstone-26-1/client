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
            _RecommendationHeroCarousel(recommendations: recommendations),
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
      title: 'Finding your top match',
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

class _RecommendationHeroCarousel extends StatefulWidget {
  const _RecommendationHeroCarousel({required this.recommendations});

  final List<BeverageRecommendation> recommendations;

  @override
  State<_RecommendationHeroCarousel> createState() =>
      _RecommendationHeroCarouselState();
}

class _RecommendationHeroCarouselState
    extends State<_RecommendationHeroCarousel> {
  late final PageController _controller;
  int _page = 0;

  @override
  void initState() {
    super.initState();
    _controller = PageController(viewportFraction: 0.92);
  }

  @override
  void didUpdateWidget(covariant _RecommendationHeroCarousel oldWidget) {
    super.didUpdateWidget(oldWidget);
    final pageCount = _heroRecommendations.length;
    if (_page >= pageCount && pageCount > 0) {
      _page = pageCount - 1;
    }
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  List<BeverageRecommendation> get _heroRecommendations =>
      widget.recommendations.take(5).toList(growable: false);

  @override
  Widget build(BuildContext context) {
    final recommendations = _heroRecommendations;
    if (recommendations.isEmpty) {
      return const SizedBox.shrink();
    }

    if (recommendations.length == 1) {
      return SizedBox(
        height: 212,
        child: _RecommendationHero(
          recommendation: recommendations.first,
          isTopMatch: true,
        ),
      );
    }

    return Column(
      children: [
        SizedBox(
          height: 212,
          child: PageView.builder(
            controller: _controller,
            padEnds: false,
            itemCount: recommendations.length,
            onPageChanged: (index) {
              setState(() {
                _page = index;
              });
            },
            itemBuilder: (context, index) {
              return Padding(
                padding: EdgeInsets.only(
                  right: index == recommendations.length - 1 ? 0 : 10,
                ),
                child: _RecommendationHero(
                  recommendation: recommendations[index],
                  isTopMatch: index == 0,
                ),
              );
            },
          ),
        ),
        const SizedBox(height: 10),
        _HeroPageIndicator(count: recommendations.length, activeIndex: _page),
      ],
    );
  }
}

class _HeroPageIndicator extends StatelessWidget {
  const _HeroPageIndicator({required this.count, required this.activeIndex});

  final int count;
  final int activeIndex;

  @override
  Widget build(BuildContext context) {
    final palette = context.palette;

    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        for (var index = 0; index < count; index++) ...[
          AnimatedContainer(
            duration: const Duration(milliseconds: 160),
            width: index == activeIndex ? 18 : 6,
            height: 6,
            decoration: BoxDecoration(
              color: index == activeIndex
                  ? palette.terracotta
                  : palette.outlineVariant,
              borderRadius: BorderRadius.circular(999),
            ),
          ),
          if (index != count - 1) const SizedBox(width: 6),
        ],
      ],
    );
  }
}

class _RecommendationHero extends StatelessWidget {
  const _RecommendationHero({
    required this.recommendation,
    required this.isTopMatch,
  });

  final BeverageRecommendation recommendation;
  final bool isTopMatch;

  @override
  Widget build(BuildContext context) {
    final palette = context.palette;
    final title = recommendation.displayName;
    final secondaryName = recommendation.secondaryName.trim();
    final metaLabel = _recommendationMetaLabel(recommendation);
    final reasonLabels = recommendation.reasonCodes
        .map(_formatReasonCode)
        .where((label) => label.trim().isNotEmpty)
        .toList(growable: false);

    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: palette.surfaceContainerLowest,
        borderRadius: BorderRadius.circular(22),
        border: Border.all(
          color: palette.outlineVariant.withValues(alpha: 0.7),
        ),
        boxShadow: const [
          BoxShadow(
            color: Color(0x10000000),
            blurRadius: 14,
            offset: Offset(0, 6),
          ),
        ],
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: Padding(
              padding: const EdgeInsets.fromLTRB(4, 4, 4, 4),
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
                            horizontal: 10,
                            vertical: 6,
                          ),
                          child: Text(
                            isTopMatch ? 'TOP MATCH' : 'CURATED',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 10,
                              fontWeight: FontWeight.w900,
                              letterSpacing: 0.6,
                            ),
                          ),
                        ),
                      ),
                      const Spacer(),
                      _RankBadge(rank: recommendation.rank),
                      const SizedBox(width: 6),
                      _RecommendationInfoButton(recommendation: recommendation),
                    ],
                  ),
                  const SizedBox(height: 10),
                  Text(
                    title,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                      color: palette.onSurface,
                      fontSize: 22,
                      fontWeight: FontWeight.w900,
                      height: 1.06,
                    ),
                  ),
                  if (secondaryName.isNotEmpty && secondaryName != title) ...[
                    const SizedBox(height: 4),
                    Text(
                      secondaryName,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                        color: palette.onSurfaceVariant,
                        fontSize: 12,
                        fontWeight: FontWeight.w800,
                      ),
                    ),
                  ],
                  if (metaLabel.isNotEmpty) ...[
                    const SizedBox(height: 5),
                    Text(
                      metaLabel,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                        color: palette.onSurfaceVariant,
                        fontSize: 11,
                        fontWeight: FontWeight.w800,
                      ),
                    ),
                  ],
                  if (reasonLabels.isNotEmpty) ...[
                    const SizedBox(height: 8),
                    Wrap(
                      spacing: 8,
                      runSpacing: 8,
                      children: [
                        for (final label in reasonLabels.take(1))
                          _MiniChip(label: label),
                      ],
                    ),
                  ],
                ],
              ),
            ),
          ),
          const SizedBox(width: 14),
          _BottleVisual(
            label: recommendation.category.trim().isEmpty
                ? 'Pick'
                : recommendation.category.trim(),
          ),
        ],
      ),
    );
  }
}

class _RankBadge extends StatelessWidget {
  const _RankBadge({required this.rank});

  final int rank;

  @override
  Widget build(BuildContext context) {
    final palette = context.palette;

    return DecoratedBox(
      decoration: BoxDecoration(
        color: palette.surfaceContainerLow,
        borderRadius: BorderRadius.circular(999),
        border: Border.all(
          color: palette.outlineVariant.withValues(alpha: 0.7),
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
        child: Text(
          '#$rank pick',
          style: TextStyle(
            color: palette.onSurfaceVariant,
            fontSize: 11,
            fontWeight: FontWeight.w900,
            height: 1,
          ),
        ),
      ),
    );
  }
}

class _BottleVisual extends StatelessWidget {
  const _BottleVisual({required this.label});

  final String label;

  @override
  Widget build(BuildContext context) {
    final palette = context.palette;
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return Container(
      width: 74,
      height: 142,
      decoration: BoxDecoration(
        color: palette.surfaceContainerLow.withValues(alpha: isDark ? 0.7 : 1),
        borderRadius: BorderRadius.circular(18),
        border: Border.all(
          color: palette.outlineVariant.withValues(alpha: 0.7),
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.all(10),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              width: 44,
              height: 66,
              decoration: BoxDecoration(
                color: palette.terracotta.withValues(
                  alpha: isDark ? 0.1 : 0.05,
                ),
                borderRadius: const BorderRadius.vertical(
                  top: Radius.circular(16),
                  bottom: Radius.circular(12),
                ),
                border: Border.all(
                  color: palette.terracotta.withValues(alpha: 0.38),
                ),
              ),
              child: Icon(Icons.local_bar, color: palette.terracotta, size: 23),
            ),
            const SizedBox(height: 9),
            Text(
              label.toUpperCase(),
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              textAlign: TextAlign.center,
              style: TextStyle(
                color: palette.onSurfaceVariant,
                fontSize: 9,
                fontWeight: FontWeight.w900,
                height: 1.1,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _RecommendationInfoButton extends StatelessWidget {
  const _RecommendationInfoButton({required this.recommendation});

  final BeverageRecommendation recommendation;

  @override
  Widget build(BuildContext context) {
    return _RecommendationActionButton(
      tooltip: 'Why recommended',
      icon: Icons.info_outline,
      onPressed: () {
        _showRecommendationExplanation(context, recommendation);
      },
    );
  }
}

class _RecommendationActionButton extends StatelessWidget {
  const _RecommendationActionButton({
    required this.tooltip,
    required this.icon,
    required this.onPressed,
  });

  final String tooltip;
  final IconData icon;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    final palette = context.palette;

    return Tooltip(
      message: tooltip,
      child: Material(
        color: palette.surfaceContainerLow,
        borderRadius: BorderRadius.circular(999),
        clipBehavior: Clip.antiAlias,
        child: InkWell(
          onTap: onPressed,
          child: SizedBox.square(
            dimension: 26,
            child: Icon(icon, color: palette.secondary, size: 16),
          ),
        ),
      ),
    );
  }
}

void _showRecommendationExplanation(
  BuildContext context,
  BeverageRecommendation recommendation,
) {
  final explanation = recommendation.explanation.trim().isEmpty
      ? 'Matched from your taste profile.'
      : recommendation.explanation.trim();
  final reasonLabels = recommendation.reasonCodes
      .map(_formatReasonCode)
      .where((label) => label.trim().isNotEmpty)
      .toList(growable: false);

  showDialog<void>(
    context: context,
    builder: (dialogContext) {
      final palette = dialogContext.palette;

      return AlertDialog(
        title: Text(
          'Why this pick?',
          style: TextStyle(
            color: palette.onSurface,
            fontSize: 20,
            fontWeight: FontWeight.w900,
          ),
        ),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              recommendation.displayName,
              style: TextStyle(
                color: palette.onSurface,
                fontSize: 16,
                fontWeight: FontWeight.w900,
              ),
            ),
            const SizedBox(height: 10),
            Text(
              explanation,
              style: TextStyle(
                color: palette.onSurfaceVariant,
                fontSize: 13,
                height: 1.45,
              ),
            ),
            if (reasonLabels.isNotEmpty) ...[
              const SizedBox(height: 14),
              Wrap(
                spacing: 7,
                runSpacing: 7,
                children: [
                  for (final label in reasonLabels.take(4))
                    _MiniChip(label: label),
                ],
              ),
            ],
          ],
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(dialogContext).pop(),
            child: const Text('Close'),
          ),
        ],
      );
    },
  );
}

class _MiniChip extends StatelessWidget {
  const _MiniChip({required this.label});

  final String label;

  @override
  Widget build(BuildContext context) {
    final palette = context.palette;

    return ConstrainedBox(
      constraints: const BoxConstraints(maxWidth: 156),
      child: DecoratedBox(
        decoration: BoxDecoration(
          color: palette.surfaceContainerLow,
          borderRadius: BorderRadius.circular(999),
          border: Border.all(
            color: palette.outlineVariant.withValues(alpha: 0.35),
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 3),
          child: Text(
            label,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            style: TextStyle(
              color: palette.secondary,
              fontSize: 9.5,
              fontWeight: FontWeight.w800,
            ),
          ),
        ),
      ),
    );
  }
}

String _recommendationMetaLabel(BeverageRecommendation recommendation) {
  return <String>[
    recommendation.category.trim(),
    recommendation.style.trim(),
  ].where((value) => value.isNotEmpty).map(_formatReasonCode).join(' - ');
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
        borderRadius: BorderRadius.circular(20),
        border: Border.all(
          color: palette.outlineVariant.withValues(alpha: 0.62),
        ),
        boxShadow: const [
          BoxShadow(
            color: Color(0x0D000000),
            blurRadius: 12,
            offset: Offset(0, 4),
          ),
        ],
      ),
      child: Padding(
        padding: const EdgeInsets.all(18),
        child: Row(
          children: [
            DecoratedBox(
              decoration: BoxDecoration(
                color: palette.premiumGold.withValues(alpha: 0.16),
                borderRadius: BorderRadius.circular(16),
              ),
              child: Padding(
                padding: const EdgeInsets.all(11),
                child: Icon(icon, color: palette.premiumGold, size: 22),
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
