import 'package:flutter/material.dart';

import '../../../core/theme/app_colors.dart';
import '../../../shared/widgets/app_network_image.dart';

class SearchScreen extends StatelessWidget {
  const SearchScreen({super.key});

  static const _suggestions = [
    'Bourbon near me',
    'Japanese whisky',
    'Outdoor tasting',
    'Mezcal pickup',
  ];

  static const _results = [
    _SearchResult(
      title: 'The Oak & Barrel',
      subtitle: 'Bottle shop - 0.8 mi',
      detail: 'Rare bourbon drops, local pickup, tasting notes',
      imageUrl:
          'https://lh3.googleusercontent.com/aida-public/AB6AXuBXiTFz9CD2Ky3v_x976b85EAO18wu2IUr3cmjv26JDfcPp5NBeJunO37o4LuuFvPLJmn1XIL68fNp9qX-CDgFAk7vGv8TXVNOqpgQPK_Qng6WZjRQlzaUTSK5uad0DvsfiHoE_sCm1L4kIAxzAIQYq_IQXuNofgJkHuYSt3wHKVwESqT25tLaXpBCKnfNoFoTJeFia5ILAuJ5mIQt3Ge2CN0zXulLcFge_UR-m-giFV4yxwdeKSE7aNPC5fBuLepf5380HjWNcMrg',
    ),
    _SearchResult(
      title: 'Kyoto Botanical Gin',
      subtitle: 'Heritage Gin Co. - 0.6 mi',
      detail: 'Bright citrus, yuzu peel, green tea finish',
      imageUrl:
          'https://lh3.googleusercontent.com/aida-public/AB6AXuB7YJBtCBhhsaLLLCzxNpaGKKtF3V_YL4YW6U_Ggpdz3XJin4b9vBN7dsUNkiNElqSXvFsIJnqgBhciRTfX9ol0N1ysd7aN0L4rt8NWcIXfju4ZKX49xYSz16kDOsOfsYZ8OecY8kqTtDns71Rg6B25BIejE2q52hDWW5krtsvxLJjGj2M8wJrQHPAuaoYkfw8RhrVSILjnWwoALuWbcyZYKiC_oK4r09cFBVm1qnea6S5c7yYvgCjTasb9XWA-gWq83YdrysKoz8k',
    ),
    _SearchResult(
      title: 'Westside Bourbon Enthusiasts',
      subtitle: 'Active Board - 18 members',
      detail: 'Local drops, tasting meetups, bottle questions',
      imageUrl:
          'https://lh3.googleusercontent.com/aida-public/AB6AXuCN8fcmv-DZ2iysYFLwdRI3kZxxE306yXQwBD589xO5n98K_0zlgOGzSvO_syRy9qc2nSMz_zngHlJps63y3HbVIQN2m7Zi4vRKMK0X36kXMkIBcI89AiLr7jKX6iMg8kluE303ShrvuiskXMZqvviyHHanhklQrZm-9cehFnp8LxEn3FY_2QQxlfw2l9Mik7ea67milicTBfq1BCD5i34cWRZ2cV--UCbbT_10ZMZnyL4ko-M8aWGAUc-Qpl26UcDqvGIX4byyoIs',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    final palette = context.palette;

    return Scaffold(
      backgroundColor: palette.surfaceContainerLow,
      body: SafeArea(
        child: Center(
          child: ConstrainedBox(
            constraints: const BoxConstraints(maxWidth: 720),
            child: CustomScrollView(
              slivers: [
                SliverToBoxAdapter(
                  child: Padding(
                    padding: const EdgeInsets.fromLTRB(12, 10, 12, 18),
                    child: _SearchHeader(palette: palette),
                  ),
                ),
                SliverToBoxAdapter(
                  child: Padding(
                    padding: const EdgeInsets.fromLTRB(16, 0, 16, 18),
                    child: _SuggestionSection(suggestions: _suggestions),
                  ),
                ),
                SliverToBoxAdapter(
                  child: Padding(
                    padding: const EdgeInsets.fromLTRB(16, 0, 16, 12),
                    child: Text(
                      'Quick results',
                      style: TextStyle(
                        color: palette.onSurface,
                        fontSize: 20,
                        fontWeight: FontWeight.w900,
                      ),
                    ),
                  ),
                ),
                SliverPadding(
                  padding: const EdgeInsets.fromLTRB(16, 0, 16, 24),
                  sliver: SliverList.separated(
                    itemCount: _results.length,
                    separatorBuilder: (_, _) => const SizedBox(height: 12),
                    itemBuilder: (context, index) {
                      return _SearchResultCard(result: _results[index]);
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class _SearchHeader extends StatelessWidget {
  const _SearchHeader({required this.palette});

  final AppPalette palette;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        IconButton(
          onPressed: () => Navigator.of(context).pop(),
          tooltip: 'Back',
          icon: Icon(Icons.arrow_back, color: palette.onSurface),
        ),
        const SizedBox(width: 4),
        Expanded(
          child: Container(
            height: 48,
            decoration: BoxDecoration(
              color: palette.surfaceContainerLowest,
              borderRadius: BorderRadius.circular(12),
              border: Border.all(color: palette.outlineVariant),
            ),
            child: Row(
              children: [
                const SizedBox(width: 14),
                const Icon(Icons.search, color: AppColors.primaryContainer),
                const SizedBox(width: 10),
                Expanded(
                  child: Text(
                    'Search bottles, stores, boards',
                    style: TextStyle(
                      color: palette.secondary,
                      fontSize: 15,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}

class _SuggestionSection extends StatelessWidget {
  const _SuggestionSection({required this.suggestions});

  final List<String> suggestions;

  @override
  Widget build(BuildContext context) {
    final palette = context.palette;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Suggested searches',
          style: TextStyle(
            color: palette.onSurface,
            fontSize: 20,
            fontWeight: FontWeight.w900,
          ),
        ),
        const SizedBox(height: 12),
        Wrap(
          spacing: 8,
          runSpacing: 8,
          children: [
            for (final suggestion in suggestions)
              ActionChip(
                onPressed: () {},
                label: Text(suggestion),
                labelStyle: const TextStyle(
                  color: AppColors.primaryContainer,
                  fontSize: 13,
                  fontWeight: FontWeight.w800,
                ),
                backgroundColor: palette.surfaceContainerLowest,
                side: BorderSide(
                  color: AppColors.primaryContainer.withValues(alpha: 0.26),
                ),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(999),
                ),
              ),
          ],
        ),
      ],
    );
  }
}

class _SearchResultCard extends StatelessWidget {
  const _SearchResultCard({required this.result});

  final _SearchResult result;

  @override
  Widget build(BuildContext context) {
    final palette = context.palette;

    return DecoratedBox(
      decoration: BoxDecoration(
        color: palette.surfaceContainerLowest,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(
          color: palette.outlineVariant.withValues(alpha: 0.46),
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.all(12),
        child: Row(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(12),
              child: AppNetworkImage(
                url: result.imageUrl,
                width: 72,
                height: 72,
              ),
            ),
            const SizedBox(width: 14),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    result.title,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                      color: palette.onSurface,
                      fontSize: 16,
                      fontWeight: FontWeight.w900,
                    ),
                  ),
                  const SizedBox(height: 5),
                  Text(
                    result.subtitle,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: const TextStyle(
                      color: AppColors.primaryContainer,
                      fontSize: 12,
                      fontWeight: FontWeight.w800,
                    ),
                  ),
                  const SizedBox(height: 7),
                  Text(
                    result.detail,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                      color: palette.onSurfaceVariant,
                      fontSize: 13,
                      height: 1.3,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(width: 8),
            Icon(Icons.chevron_right, color: palette.secondary),
          ],
        ),
      ),
    );
  }
}

class _SearchResult {
  const _SearchResult({
    required this.title,
    required this.subtitle,
    required this.detail,
    required this.imageUrl,
  });

  final String title;
  final String subtitle;
  final String detail;
  final String imageUrl;
}
