import 'package:flutter/material.dart';

import '../../../core/theme/app_colors.dart';
import '../data/recommendation_repository.dart';
import '../models/recommendation_models.dart';

class RecommendationHomeSection extends StatefulWidget {
  const RecommendationHomeSection({
    super.key,
    required this.repository,
    required this.authToken,
  });

  final RecommendationRepository? repository;
  final String authToken;

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
        oldWidget.authToken != widget.authToken) {
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
            title: _profileTitle(data.profile.status),
            message: _profileMessage(data.profile),
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

        return _RecommendationList(recommendations: recommendations);
      },
    );
  }

  static String _profileTitle(RecommendationProfileStatus status) {
    return switch (status) {
      RecommendationProfileStatus.missing => 'Taste profile needed',
      RecommendationProfileStatus.pendingGeneration => 'Building your picks',
      RecommendationProfileStatus.stale => 'Refreshing your taste profile',
      RecommendationProfileStatus.failedGeneration => 'Profile refresh failed',
      _ => 'Recommendations pending',
    };
  }

  static String _profileMessage(RecommendationProfile profile) {
    if (profile.staleReason.trim().isNotEmpty) {
      return profile.staleReason;
    }
    return switch (profile.status) {
      RecommendationProfileStatus.missing =>
        'Complete the survey to unlock personalized bottles.',
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

class _RecommendationList extends StatelessWidget {
  const _RecommendationList({required this.recommendations});

  final List<BeverageRecommendation> recommendations;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const _RecommendationHeader(),
        const SizedBox(height: 14),
        SizedBox(
          height: 190,
          child: ListView.separated(
            scrollDirection: Axis.horizontal,
            itemCount: recommendations.length,
            separatorBuilder: (_, _) => const SizedBox(width: 12),
            itemBuilder: (context, index) {
              return _RecommendationCard(
                recommendation: recommendations[index],
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

class _RecommendationCard extends StatelessWidget {
  const _RecommendationCard({required this.recommendation});

  final BeverageRecommendation recommendation;

  @override
  Widget build(BuildContext context) {
    final palette = context.palette;
    final scorePercent = (recommendation.score * 100).clamp(0, 100).round();
    final category = recommendation.category.trim();
    final style = recommendation.style.trim();

    return SizedBox(
      width: 236,
      child: DecoratedBox(
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
                  Text(
                    '$scorePercent%',
                    style: TextStyle(
                      color: palette.secondary,
                      fontSize: 12,
                      fontWeight: FontWeight.w800,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 12),
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
              if (category.isNotEmpty || style.isNotEmpty)
                Wrap(
                  spacing: 6,
                  runSpacing: 6,
                  children: [
                    if (category.isNotEmpty) _MiniChip(label: category),
                    if (style.isNotEmpty) _MiniChip(label: style),
                  ],
                ),
              const Spacer(),
              Text(
                recommendation.explanation.isEmpty
                    ? 'Matched to your taste profile.'
                    : recommendation.explanation,
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
                style: TextStyle(
                  color: palette.onSurfaceVariant,
                  fontSize: 12,
                  height: 1.35,
                ),
              ),
            ],
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

    return DecoratedBox(
      decoration: BoxDecoration(
        color: palette.surfaceContainerLow,
        borderRadius: BorderRadius.circular(999),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
        child: Text(
          label,
          style: TextStyle(
            color: palette.secondary,
            fontSize: 10,
            fontWeight: FontWeight.w800,
          ),
        ),
      ),
    );
  }
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
