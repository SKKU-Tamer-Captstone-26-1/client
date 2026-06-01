import 'package:flutter/material.dart';

import '../../../core/theme/app_colors.dart';
import '../../../core/theme/app_icons.dart';
import '../../../features/chatbot/presentation/chatbot_modal.dart';
import '../../../shared/widgets/app_bottom_nav_bar.dart';
import '../../../shared/widgets/app_network_image.dart';
import '../../../shared/widgets/app_top_app_bar.dart';
import '../../recommendation/data/recommendation_repository.dart';
import '../../recommendation/presentation/recommendation_home_section.dart';
import '../data/mock_home_data.dart';
import '../models/home_models.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({
    super.key,
    this.onBottomNavSelected,
    this.onProfileSelected,
    this.recommendationRepository,
    this.recommendationAuthToken = '',
    this.hasCompletedSurvey = false,
    this.bottomNavBadgeCounts = const <AppBottomNavItem, int>{},
  });

  final ValueChanged<AppBottomNavItem>? onBottomNavSelected;
  final VoidCallback? onProfileSelected;
  final RecommendationRepository? recommendationRepository;
  final String recommendationAuthToken;
  final bool hasCompletedSurvey;
  final Map<AppBottomNavItem, int> bottomNavBadgeCounts;

  @override
  Widget build(BuildContext context) {
    final palette = context.palette;

    return Scaffold(
      backgroundColor: palette.surfaceContainerLow,
      appBar: AppTopAppBar(
        onNotificationBoardSelected: () {
          onBottomNavSelected?.call(AppBottomNavItem.board);
        },
        onProfileSelected: onProfileSelected,
      ),
      bottomNavigationBar: AppBottomNavBar(
        onItemSelected: onBottomNavSelected,
        badgeCounts: bottomNavBadgeCounts,
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => showChatbotModal(context),
        backgroundColor: AppColors.primaryContainer,
        foregroundColor: Colors.white,
        shape: const CircleBorder(),
        child: const Icon(Icons.chat),
      ),
      body: SafeArea(
        top: false,
        child: ListView(
          padding: const EdgeInsets.fromLTRB(16, 16, 16, 32),
          children: [
            if (recommendationRepository != null &&
                recommendationAuthToken.trim().isNotEmpty)
              RecommendationHomeSection(
                repository: recommendationRepository,
                authToken: recommendationAuthToken,
                hasCompletedSurvey: hasCompletedSurvey,
              )
            else
              const _HeroCard(
                badge: 'Taste profile',
                title: 'Personalized picks start with your survey',
                body:
                    'Complete onboarding to unlock your recommendation engine.',
                icon: Icons.auto_awesome,
              ),
            const SizedBox(height: 24),
            const _CategoryChips(categories: mockHomeCategories),
            const SizedBox(height: 28),
            const _LocalEstablishmentsSection(items: mockLocalEstablishments),
            const SizedBox(height: 28),
            const _OutdoorVaultsSection(items: mockOutdoorVaults),
            const SizedBox(height: 28),
            const _NeighborhoodBuzzSection(post: mockNeighborhoodPost),
          ],
        ),
      ),
    );
  }
}

class _HeroCard extends StatelessWidget {
  const _HeroCard({
    required this.badge,
    required this.title,
    required this.body,
    required this.icon,
  });

  final String badge;
  final String title;
  final String body;
  final IconData icon;

  @override
  Widget build(BuildContext context) {
    final palette = context.palette;

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
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                    horizontal: 12,
                    vertical: 6,
                  ),
                  child: Text(
                    badge.toUpperCase(),
                    style: const TextStyle(
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
                child: Icon(icon, color: palette.secondary, size: 22),
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
            body,
            style: TextStyle(
              color: palette.secondary,
              fontSize: 14,
              fontWeight: FontWeight.w500,
              height: 1.35,
            ),
          ),
        ],
      ),
    );
  }
}

class _CategoryChips extends StatelessWidget {
  const _CategoryChips({required this.categories});

  final List<String> categories;

  @override
  Widget build(BuildContext context) {
    final palette = context.palette;

    return SizedBox(
      height: 42,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        itemCount: categories.length,
        separatorBuilder: (_, _) => const SizedBox(width: 12),
        itemBuilder: (context, index) {
          final isSelected = index == 0;

          return DecoratedBox(
            decoration: BoxDecoration(
              color: isSelected
                  ? AppColors.primaryContainer
                  : palette.surfaceContainerLowest,
              borderRadius: BorderRadius.circular(999),
              boxShadow: isSelected
                  ? const [
                      BoxShadow(
                        color: Color(0x24000000),
                        blurRadius: 8,
                        offset: Offset(0, 3),
                      ),
                    ]
                  : null,
            ),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Center(
                child: Text(
                  categories[index],
                  style: TextStyle(
                    color: isSelected ? Colors.white : palette.onSurfaceVariant,
                    fontSize: 14,
                    fontWeight: isSelected ? FontWeight.w800 : FontWeight.w600,
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}

class _SectionHeader extends StatelessWidget {
  const _SectionHeader({
    required this.title,
    required this.subtitle,
    this.action,
  });

  final String title;
  final String subtitle;
  final Widget? action;

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
                title,
                style: TextStyle(
                  color: palette.onSurface,
                  fontSize: 20,
                  fontWeight: FontWeight.w800,
                  height: 1.2,
                ),
              ),
              const SizedBox(height: 3),
              Text(
                subtitle,
                style: TextStyle(
                  color: palette.secondary,
                  fontSize: 12,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ],
          ),
        ),
        ?action,
      ],
    );
  }
}

class _LocalEstablishmentsSection extends StatelessWidget {
  const _LocalEstablishmentsSection({required this.items});

  final List<LocalEstablishment> items;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        _SectionHeader(
          title: 'Local Establishments',
          subtitle: 'Highly rated spots in your area',
          action: TextButton(
            onPressed: () {},
            child: const Text(
              'See all',
              style: TextStyle(fontWeight: FontWeight.w800),
            ),
          ),
        ),
        const SizedBox(height: 16),
        for (final item in items) ...[
          _LocalEstablishmentCard(item: item),
          const SizedBox(height: 12),
        ],
      ],
    );
  }
}

class _LocalEstablishmentCard extends StatelessWidget {
  const _LocalEstablishmentCard({required this.item});

  final LocalEstablishment item;

  @override
  Widget build(BuildContext context) {
    final palette = context.palette;

    return DecoratedBox(
      decoration: BoxDecoration(
        color: palette.surfaceContainerLowest,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(
          color: palette.outlineVariant.withValues(alpha: 0.5),
        ),
        boxShadow: const [
          BoxShadow(
            color: Color(0x0F000000),
            blurRadius: 10,
            offset: Offset(0, 2),
          ),
        ],
      ),
      child: Padding(
        padding: const EdgeInsets.all(12),
        child: Row(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(12),
              child: AppNetworkImage(url: item.imageUrl, width: 96, height: 96),
            ),
            const SizedBox(width: 14),
            Expanded(
              child: SizedBox(
                height: 96,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Expanded(
                              child: Text(
                                item.name,
                                style: TextStyle(
                                  color: palette.onSurface,
                                  fontSize: 16,
                                  fontWeight: FontWeight.w800,
                                ),
                              ),
                            ),
                            const Icon(
                              Icons.star,
                              size: 16,
                              color: AppColors.primaryContainer,
                            ),
                            const SizedBox(width: 3),
                            Text(
                              item.rating,
                              style: const TextStyle(
                                color: AppColors.primaryContainer,
                                fontSize: 12,
                                fontWeight: FontWeight.w800,
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 3),
                        Text(
                          '${item.distance} - ${item.category}',
                          style: TextStyle(
                            color: palette.secondary,
                            fontSize: 12,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ],
                    ),
                    Wrap(
                      spacing: 8,
                      crossAxisAlignment: WrapCrossAlignment.center,
                      children: [
                        DecoratedBox(
                          decoration: BoxDecoration(
                            border: Border.all(
                              color: AppColors.primaryContainer,
                            ),
                            borderRadius: BorderRadius.circular(999),
                          ),
                          child: const Padding(
                            padding: EdgeInsets.symmetric(
                              horizontal: 10,
                              vertical: 3,
                            ),
                            child: Text(
                              'OPEN NOW',
                              style: TextStyle(
                                color: AppColors.primaryContainer,
                                fontSize: 10,
                                fontWeight: FontWeight.w800,
                              ),
                            ),
                          ),
                        ),
                        Text(
                          item.closingTime.toUpperCase(),
                          style: TextStyle(
                            color: palette.secondary,
                            fontSize: 10,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _OutdoorVaultsSection extends StatelessWidget {
  const _OutdoorVaultsSection({required this.items});

  final List<OutdoorVault> items;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        _SectionHeader(
          title: 'Outdoor Vaults',
          subtitle: 'Curated outdoor tasting experiences',
          action: IconButton(
            onPressed: () {},
            icon: const Icon(Icons.arrow_forward),
          ),
        ),
        const SizedBox(height: 16),
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            for (var index = 0; index < items.length; index++) ...[
              Expanded(child: _OutdoorVaultCard(item: items[index])),
              if (index != items.length - 1) const SizedBox(width: 14),
            ],
          ],
        ),
      ],
    );
  }
}

class _OutdoorVaultCard extends StatelessWidget {
  const _OutdoorVaultCard({required this.item});

  final OutdoorVault item;

  @override
  Widget build(BuildContext context) {
    final palette = context.palette;

    return DecoratedBox(
      decoration: BoxDecoration(
        color: palette.surfaceContainerLowest,
        borderRadius: BorderRadius.circular(24),
        border: Border.all(
          color: palette.outlineVariant.withValues(alpha: 0.5),
        ),
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            SizedBox(
              height: 128,
              child: Stack(
                fit: StackFit.expand,
                children: [
                  AppNetworkImage(url: item.imageUrl),
                  Positioned(
                    top: 8,
                    right: 8,
                    child: DecoratedBox(
                      decoration: BoxDecoration(
                        color: const Color(0x99000000),
                        borderRadius: BorderRadius.circular(999),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 8,
                          vertical: 4,
                        ),
                        child: Text(
                          item.status,
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 10,
                            fontWeight: FontWeight.w800,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(14),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    item.name,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                      color: palette.onSurface,
                      fontSize: 14,
                      fontWeight: FontWeight.w800,
                    ),
                  ),
                  const SizedBox(height: 6),
                  Row(
                    children: [
                      Icon(
                        Icons.location_on,
                        size: 13,
                        color: palette.secondary,
                      ),
                      const SizedBox(width: 3),
                      Expanded(
                        child: Text(
                          item.location,
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(
                            color: palette.secondary,
                            fontSize: 10,
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 12),
                  SizedBox(
                    width: double.infinity,
                    height: 34,
                    child: FilledButton(
                      onPressed: () {},
                      style: FilledButton.styleFrom(
                        backgroundColor: item.isPrimaryAction
                            ? AppColors.primaryContainer
                            : palette.surfaceContainerLow,
                        foregroundColor: item.isPrimaryAction
                            ? Colors.white
                            : palette.secondary,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(999),
                        ),
                        padding: EdgeInsets.zero,
                      ),
                      child: Text(
                        item.actionLabel,
                        style: const TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.w800,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _NeighborhoodBuzzSection extends StatelessWidget {
  const _NeighborhoodBuzzSection({required this.post});

  final NeighborhoodPost post;

  @override
  Widget build(BuildContext context) {
    final palette = context.palette;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const _SectionHeader(
          title: 'Neighborhood Buzz',
          subtitle: "What's being poured right now",
        ),
        const SizedBox(height: 16),
        DecoratedBox(
          decoration: BoxDecoration(
            color: palette.surfaceContainerLowest,
            borderRadius: BorderRadius.circular(24),
            border: Border.all(
              color: palette.outlineVariant.withValues(alpha: 0.5),
            ),
          ),
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    ClipOval(
                      child: AppNetworkImage(
                        url: post.avatarUrl,
                        width: 40,
                        height: 40,
                      ),
                    ),
                    const SizedBox(width: 12),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          post.author,
                          style: TextStyle(
                            color: palette.onSurface,
                            fontSize: 14,
                            fontWeight: FontWeight.w800,
                          ),
                        ),
                        Text(
                          post.meta,
                          style: TextStyle(
                            color: palette.secondary,
                            fontSize: 10,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                const SizedBox(height: 14),
                Text(
                  post.body,
                  style: TextStyle(
                    color: palette.onSurfaceVariant,
                    fontSize: 14,
                    fontStyle: FontStyle.italic,
                    height: 1.45,
                  ),
                ),
                const SizedBox(height: 14),
                Wrap(
                  spacing: 8,
                  runSpacing: 8,
                  children: [
                    for (final tag in post.tags)
                      DecoratedBox(
                        decoration: BoxDecoration(
                          color: palette.decorativeTertiary.withValues(
                            alpha: 0.16,
                          ),
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 12,
                            vertical: 6,
                          ),
                          child: Text(
                            tag,
                            style: TextStyle(
                              color: palette.decorativeTertiary,
                              fontSize: 10,
                              fontWeight: FontWeight.w800,
                            ),
                          ),
                        ),
                      ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
