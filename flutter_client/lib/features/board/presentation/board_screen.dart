import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../core/theme/app_colors.dart';
import '../../../core/theme/app_icons.dart';
import '../../../features/chatbot/data/chatbot_repository.dart';
import '../../../features/chatbot/models/chatbot_models.dart';
import '../../../features/chatbot/presentation/chatbot_modal.dart';
import '../../../shared/widgets/app_bottom_nav_bar.dart';
import '../../../shared/widgets/app_network_image.dart';
import '../../../shared/widgets/app_top_app_bar.dart';
import '../models/board_models.dart';
import '../providers/board_repository_provider.dart';

const _kBoardCategories = [
  '#AllPosts',
  '#TastingNotes',
  '#Questions',
  '#NearbyDrops',
  '#Events',
  '#TradeBoard',
];

class BoardScreen extends ConsumerWidget {
  const BoardScreen({
    super.key,
    this.onBottomNavSelected,
    this.onProfileSelected,
    this.onBoardChatRequested,
    this.onCreatePostRequested,
    this.onPostSelected,
    this.chatbotRepository,
    this.chatbotAuthToken = '',
    this.bottomNavBadgeCounts = const <AppBottomNavItem, int>{},
  });

  final ValueChanged<AppBottomNavItem>? onBottomNavSelected;
  final VoidCallback? onProfileSelected;
  final ValueChanged<BoardPost>? onBoardChatRequested;
  final VoidCallback? onCreatePostRequested;
  final ValueChanged<BoardPost>? onPostSelected;
  final ChatbotRepository? chatbotRepository;
  final String chatbotAuthToken;
  final Map<AppBottomNavItem, int> bottomNavBadgeCounts;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final postsAsync = ref.watch(boardPostsProvider);
    final palette = context.palette;
    final postCount = postsAsync.maybeWhen(
      data: (posts) => posts.length,
      orElse: () => 0,
    );

    return Scaffold(
      backgroundColor: palette.surfaceContainerLow,
      appBar: AppTopAppBar(
        onNotificationBoardSelected: () {
          onBottomNavSelected?.call(AppBottomNavItem.board);
        },
        onProfileSelected: onProfileSelected,
      ),
      bottomNavigationBar: AppBottomNavBar(
        currentItem: AppBottomNavItem.board,
        onItemSelected: onBottomNavSelected,
        badgeCounts: bottomNavBadgeCounts,
      ),
      floatingActionButton: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          FloatingActionButton.small(
            heroTag: 'board-chatbot',
            onPressed: () => showChatbotModal(
              context,
              repository: chatbotRepository,
              authToken: chatbotAuthToken,
              screenContext: ChatbotScreenContext.board,
            ),
            tooltip: 'Chat with Neighborhood Guide',
            backgroundColor: palette.surfaceContainerLowest,
            foregroundColor: AppColors.primaryContainer,
            shape: const CircleBorder(),
            child: const Icon(Icons.chat),
          ),
          const SizedBox(height: 12),
          FloatingActionButton(
            heroTag: 'board-create-post',
            onPressed: onCreatePostRequested,
            tooltip: 'Write post',
            backgroundColor: AppColors.primaryContainer,
            foregroundColor: Colors.white,
            shape: const CircleBorder(),
            child: const Icon(Icons.add, size: 30),
          ),
        ],
      ),
      body: SafeArea(
        top: false,
        child: CustomScrollView(
          slivers: [
            SliverToBoxAdapter(
              child: Padding(
                padding: const EdgeInsets.fromLTRB(16, 18, 16, 12),
                child: _BoardFeedHeader(postCount: postCount),
              ),
            ),
            const SliverToBoxAdapter(
              child: Padding(
                padding: EdgeInsets.fromLTRB(16, 0, 16, 18),
                child: _BoardCategoryChips(categories: _kBoardCategories),
              ),
            ),
            postsAsync.when(
              loading: () => const SliverFillRemaining(
                child: Center(child: CircularProgressIndicator()),
              ),
              error: (e, _) => SliverFillRemaining(
                child: Center(
                  child: Padding(
                    padding: const EdgeInsets.all(24),
                    child: Text(
                      'Failed to load posts',
                      style: TextStyle(color: palette.secondary),
                    ),
                  ),
                ),
              ),
              data: (posts) => SliverPadding(
                padding: const EdgeInsets.fromLTRB(16, 0, 16, 96),
                sliver: SliverToBoxAdapter(
                  child: LayoutBuilder(
                    builder: (context, constraints) {
                      final crossAxisCount = constraints.maxWidth >= 900
                          ? 3
                          : constraints.maxWidth >= 620
                          ? 2
                          : 1;
                      const spacing = 20.0;
                      final cardWidth = crossAxisCount == 1
                          ? constraints.maxWidth
                          : (constraints.maxWidth -
                                    spacing * (crossAxisCount - 1)) /
                                crossAxisCount;

                      return Wrap(
                        spacing: spacing,
                        runSpacing: spacing,
                        children: posts
                            .map(
                              (post) => SizedBox(
                                width: cardWidth,
                                child: _BoardPostCard(
                                  post: post,
                                  onChatRequested: onBoardChatRequested,
                                  onTap: onPostSelected != null
                                      ? () => onPostSelected!(post)
                                      : null,
                                ),
                              ),
                            )
                            .toList(),
                      );
                    },
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// TODO(chat): when Board detail is added, put the Chat action there and route it
// through ChatRepository.getOrCreateBoardChatRoom with board_id plus auth metadata.
class _BoardFeedHeader extends StatelessWidget {
  const _BoardFeedHeader({required this.postCount});

  final int postCount;

  @override
  Widget build(BuildContext context) {
    final palette = context.palette;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Neighborhood Board',
          style: TextStyle(
            color: palette.onSurface,
            fontSize: 28,
            fontWeight: FontWeight.w900,
            height: 1.05,
          ),
        ),
        const SizedBox(height: 8),
        Row(
          children: [
            Expanded(
              child: Text(
                'Bottle drops, tasting notes, and local questions around your block.',
                style: TextStyle(
                  color: palette.secondary,
                  fontSize: 13,
                  fontWeight: FontWeight.w600,
                  height: 1.35,
                ),
              ),
            ),
            const SizedBox(width: 12),
            DecoratedBox(
              decoration: BoxDecoration(
                color: palette.surfaceContainerLowest,
                borderRadius: BorderRadius.circular(999),
                border: Border.all(
                  color: palette.outlineVariant.withValues(alpha: 0.62),
                ),
              ),
              child: Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 12,
                  vertical: 7,
                ),
                child: Text(
                  '$postCount live',
                  style: TextStyle(
                    color: palette.onSurface,
                    fontSize: 12,
                    fontWeight: FontWeight.w800,
                  ),
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}

class _BoardCategoryChips extends StatelessWidget {
  const _BoardCategoryChips({required this.categories});

  final List<String> categories;

  @override
  Widget build(BuildContext context) {
    final palette = context.palette;

    return SizedBox(
      height: 38,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        itemCount: categories.length,
        separatorBuilder: (_, _) => const SizedBox(width: 8),
        itemBuilder: (context, index) {
          final isSelected = index == 0;
          return DecoratedBox(
            decoration: BoxDecoration(
              color: isSelected
                  ? AppColors.primaryContainer
                  : palette.surfaceContainerLowest,
              borderRadius: BorderRadius.circular(999),
              border: isSelected
                  ? null
                  : Border.all(
                      color: palette.outlineVariant.withValues(alpha: 0.72),
                    ),
            ),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Center(
                child: Text(
                  categories[index],
                  style: TextStyle(
                    color: isSelected ? Colors.white : palette.secondary,
                    fontSize: 14,
                    fontWeight: isSelected ? FontWeight.w700 : FontWeight.w500,
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

class _BoardPostCard extends StatelessWidget {
  const _BoardPostCard({required this.post, this.onChatRequested, this.onTap});

  final BoardPost post;
  final ValueChanged<BoardPost>? onChatRequested;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    final palette = context.palette;
    final imageUrl = post.imageUrl;
    final hasImage = imageUrl != null && imageUrl.trim().isNotEmpty;
    final bodyPreview = post.body.length > 100
        ? '${post.body.substring(0, 100)}...'
        : post.body;

    return GestureDetector(
      onTap: onTap,
      child: DecoratedBox(
        decoration: BoxDecoration(
          color: palette.surfaceContainerLowest,
          borderRadius: BorderRadius.circular(22),
          border: Border.all(
            color: palette.outlineVariant.withValues(alpha: 0.52),
          ),
        ),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(22),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            mainAxisSize: MainAxisSize.min,
            children: [
              if (hasImage)
                SizedBox(
                  height: 164,
                  child: Stack(
                    fit: StackFit.expand,
                    children: [
                      AppNetworkImage(url: post.imageUrl!),
                      DecoratedBox(
                        decoration: BoxDecoration(
                          gradient: LinearGradient(
                            begin: Alignment.topCenter,
                            end: Alignment.bottomCenter,
                            colors: [
                              Colors.black.withValues(alpha: 0.02),
                              Colors.black.withValues(alpha: 0.18),
                            ],
                          ),
                        ),
                      ),
                      Positioned(
                        top: 16,
                        left: 16,
                        child: _CategoryBadge(label: post.category),
                      ),
                      if (onChatRequested != null)
                        Positioned(
                          top: 14,
                          right: 14,
                          child: _BoardChatButton(
                            onPressed: () => onChatRequested!(post),
                          ),
                        ),
                    ],
                  ),
                ),
              Padding(
                padding: EdgeInsets.fromLTRB(20, hasImage ? 18 : 24, 20, 18),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    if (!hasImage) ...[
                      _CategoryBadge(label: post.category),
                      const SizedBox(height: 16),
                    ],
                    Text(
                      post.title,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                        color: palette.onSurface,
                        fontSize: 20,
                        fontWeight: FontWeight.w800,
                        height: 1.18,
                      ),
                    ),
                    const SizedBox(height: 10),
                    Text(
                      bodyPreview,
                      style: TextStyle(
                        color: palette.secondary,
                        fontSize: 14,
                        height: 1.45,
                      ),
                    ),
                    if (post.location != null) ...[
                      const SizedBox(height: 14),
                      Row(
                        children: [
                          const Icon(
                            Icons.location_on,
                            color: AppColors.primaryContainer,
                            size: 16,
                          ),
                          const SizedBox(width: 4),
                          Flexible(
                            child: Text(
                              post.location!,
                              overflow: TextOverflow.ellipsis,
                              style: const TextStyle(
                                color: AppColors.primaryContainer,
                                fontSize: 12,
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                    const SizedBox(height: 14),
                    Divider(
                      height: 1,
                      color: palette.outlineVariant.withValues(alpha: 0.48),
                    ),
                    const SizedBox(height: 14),
                    _PostMetaRow(
                      post: post,
                      onChatRequested: onChatRequested,
                      showChatButton: !hasImage,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _CategoryBadge extends StatelessWidget {
  const _CategoryBadge({required this.label});

  final String label;

  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
      decoration: BoxDecoration(
        color: AppColors.primaryContainer,
        borderRadius: BorderRadius.circular(999),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 5),
        child: Text(
          label.toUpperCase(),
          style: const TextStyle(
            color: Colors.white,
            fontSize: 10,
            fontWeight: FontWeight.w800,
            letterSpacing: 0.8,
          ),
        ),
      ),
    );
  }
}

class _PostMetaRow extends StatelessWidget {
  const _PostMetaRow({
    required this.post,
    this.onChatRequested,
    this.showChatButton = true,
  });

  final BoardPost post;
  final ValueChanged<BoardPost>? onChatRequested;
  final bool showChatButton;

  @override
  Widget build(BuildContext context) {
    final palette = context.palette;

    return Row(
      children: [
        ClipOval(
          child: AppNetworkImage(
            url: post.authorAvatarUrl,
            width: 24,
            height: 24,
          ),
        ),
        const SizedBox(width: 8),
        Expanded(
          child: Text(
            '${post.author}  •  ${post.timeAgo}',
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            style: TextStyle(
              color: palette.secondary,
              fontSize: 12,
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
        _PostMetric(icon: Icons.forum, value: post.commentCount),
        const SizedBox(width: 10),
        _PostMetric(icon: Icons.favorite, value: post.favoriteCount),
        if (showChatButton) ...[
          const SizedBox(width: 8),
          _BoardChatButton(
            onPressed: onChatRequested == null
                ? null
                : () => onChatRequested!(post),
          ),
        ],
      ],
    );
  }
}

class _BoardChatButton extends StatelessWidget {
  const _BoardChatButton({this.onPressed});

  final VoidCallback? onPressed;

  @override
  Widget build(BuildContext context) {
    return Tooltip(
      message: 'Open board chat',
      child: IconButton.filled(
        onPressed: onPressed,
        icon: const Icon(Icons.chat_bubble_outline, size: 16),
        style: IconButton.styleFrom(
          backgroundColor: AppColors.primaryContainer,
          disabledBackgroundColor: context.palette.outlineVariant,
          foregroundColor: Colors.white,
          disabledForegroundColor: context.palette.secondary,
          minimumSize: const Size.square(32),
          fixedSize: const Size.square(32),
          padding: EdgeInsets.zero,
          tapTargetSize: MaterialTapTargetSize.shrinkWrap,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
        ),
      ),
    );
  }
}

class _PostMetric extends StatelessWidget {
  const _PostMetric({required this.icon, required this.value});

  final IconData icon;
  final int value;

  @override
  Widget build(BuildContext context) {
    final palette = context.palette;

    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Icon(icon, size: 14, color: palette.secondary),
        const SizedBox(width: 3),
        Text(
          '$value',
          style: TextStyle(
            color: palette.secondary,
            fontSize: 12,
            fontWeight: FontWeight.w600,
          ),
        ),
      ],
    );
  }
}
