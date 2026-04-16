import 'package:flutter/material.dart';

import '../../../core/theme/app_colors.dart';
import '../../../core/theme/app_icons.dart';
import '../../../features/chatbot/presentation/chatbot_modal.dart';
import '../../../shared/widgets/app_bottom_nav_bar.dart';
import '../../../shared/widgets/app_network_image.dart';
import '../../../shared/widgets/app_top_app_bar.dart';
import '../data/mock_board_data.dart';
import '../models/board_models.dart';

class BoardScreen extends StatelessWidget {
  const BoardScreen({super.key, this.onBottomNavSelected});

  final ValueChanged<AppBottomNavItem>? onBottomNavSelected;

  @override
  Widget build(BuildContext context) {
    final palette = context.palette;

    return Scaffold(
      backgroundColor: palette.surfaceContainerLow,
      appBar: const AppTopAppBar(),
      bottomNavigationBar: AppBottomNavBar(
        currentItem: AppBottomNavItem.board,
        onItemSelected: onBottomNavSelected,
      ),
      floatingActionButton: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          FloatingActionButton.small(
            heroTag: 'board-chatbot',
            onPressed: () => showChatbotModal(context),
            tooltip: 'Chat with Neighborhood Guide',
            backgroundColor: palette.surfaceContainerLowest,
            foregroundColor: AppColors.primaryContainer,
            shape: const CircleBorder(),
            child: const Icon(Icons.chat),
          ),
          const SizedBox(height: 12),
          FloatingActionButton(
            heroTag: 'board-create-post',
            onPressed: () {},
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
            const SliverToBoxAdapter(
              child: Padding(
                padding: EdgeInsets.fromLTRB(16, 20, 16, 18),
                child: _BoardCategoryChips(categories: mockBoardCategories),
              ),
            ),
            SliverPadding(
              padding: const EdgeInsets.fromLTRB(16, 0, 16, 96),
              sliver: SliverLayoutBuilder(
                builder: (context, constraints) {
                  final crossAxisCount = constraints.crossAxisExtent >= 900
                      ? 3
                      : constraints.crossAxisExtent >= 620
                      ? 2
                      : 1;

                  return SliverGrid(
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: crossAxisCount,
                      crossAxisSpacing: 20,
                      mainAxisSpacing: 20,
                      mainAxisExtent: 392,
                    ),
                    delegate: SliverChildBuilderDelegate((context, index) {
                      return _BoardPostCard(post: mockBoardPosts[index]);
                    }, childCount: mockBoardPosts.length),
                  );
                },
              ),
            ),
          ],
        ),
      ),
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
              borderRadius: BorderRadius.circular(8),
              border: isSelected
                  ? null
                  : Border.all(color: palette.outlineVariant),
              boxShadow: isSelected
                  ? const [
                      BoxShadow(
                        color: Color(0x14000000),
                        blurRadius: 8,
                        offset: Offset(0, 2),
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
  const _BoardPostCard({required this.post});

  final BoardPost post;

  @override
  Widget build(BuildContext context) {
    final palette = context.palette;
    final hasImage = post.imageUrl != null;

    return DecoratedBox(
      decoration: BoxDecoration(
        color: palette.surfaceContainerLowest,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: const Color(0xFFE9ECEF)),
        boxShadow: const [
          BoxShadow(
            color: Color(0x08000000),
            blurRadius: 10,
            offset: Offset(0, 2),
          ),
        ],
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            if (hasImage)
              SizedBox(
                height: 164,
                child: Stack(
                  fit: StackFit.expand,
                  children: [
                    AppNetworkImage(url: post.imageUrl!),
                    Positioned(
                      top: 16,
                      left: 16,
                      child: _CategoryBadge(label: post.category),
                    ),
                  ],
                ),
              ),
            Expanded(
              child: Padding(
                padding: EdgeInsets.fromLTRB(20, hasImage ? 18 : 24, 20, 18),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
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
                      post.body,
                      maxLines: hasImage ? 3 : 5,
                      overflow: TextOverflow.ellipsis,
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
                    const Spacer(),
                    const Divider(height: 24, color: Color(0xFFF4F4F5)),
                    _PostMetaRow(post: post),
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
  const _PostMetaRow({required this.post});

  final BoardPost post;

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
      ],
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
