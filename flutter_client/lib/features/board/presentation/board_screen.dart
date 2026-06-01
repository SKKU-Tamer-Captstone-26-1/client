import 'dart:async';

import 'package:flutter/material.dart';

import '../../../core/theme/app_colors.dart';
import '../../../core/theme/app_icons.dart';
import '../../../features/chatbot/presentation/chatbot_modal.dart';
import '../../../shared/widgets/app_bottom_nav_bar.dart';
import '../../../shared/widgets/app_network_image.dart';
import '../../../shared/widgets/app_top_app_bar.dart';
import '../data/board_repository.dart';
import '../data/mock_board_data.dart';
import '../models/board_models.dart';

class BoardScreen extends StatefulWidget {
  const BoardScreen({
    super.key,
    this.onBottomNavSelected,
    this.onProfileSelected,
    this.onBoardChatRequested,
    this.boardRepository,
    this.bottomNavBadgeCounts = const <AppBottomNavItem, int>{},
  });

  final ValueChanged<AppBottomNavItem>? onBottomNavSelected;
  final VoidCallback? onProfileSelected;
  final ValueChanged<BoardPost>? onBoardChatRequested;
  final BoardRepository? boardRepository;
  final Map<AppBottomNavItem, int> bottomNavBadgeCounts;

  @override
  State<BoardScreen> createState() => _BoardScreenState();
}

class _BoardScreenState extends State<BoardScreen> {
  List<BoardPost> _posts = mockBoardPosts;
  bool _isRefreshing = false;

  @override
  void initState() {
    super.initState();
    if (widget.boardRepository != null) {
      _isRefreshing = true;
      unawaited(_loadPosts());
    }
  }

  @override
  void didUpdateWidget(BoardScreen oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.boardRepository != widget.boardRepository &&
        widget.boardRepository != null) {
      unawaited(_loadPosts());
    }
  }

  Future<void> _loadPosts() async {
    final repository = widget.boardRepository;
    if (repository == null) {
      return;
    }

    if (!_isRefreshing && mounted) {
      setState(() {
        _isRefreshing = true;
      });
    }

    try {
      final page = await repository.listPosts(pageSize: 20);
      if (!mounted) {
        return;
      }
      setState(() {
        _posts = page.posts;
        _isRefreshing = false;
      });
    } catch (_) {
      if (!mounted) {
        return;
      }
      setState(() {
        _isRefreshing = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final palette = context.palette;
    final posts = _posts;

    return Scaffold(
      backgroundColor: palette.surfaceContainerLow,
      appBar: AppTopAppBar(
        onNotificationBoardSelected: () {
          widget.onBottomNavSelected?.call(AppBottomNavItem.board);
        },
        onProfileSelected: widget.onProfileSelected,
      ),
      bottomNavigationBar: AppBottomNavBar(
        currentItem: AppBottomNavItem.board,
        onItemSelected: widget.onBottomNavSelected,
        badgeCounts: widget.bottomNavBadgeCounts,
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
            onPressed: () {
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(
                  content: Text('Post writing is not available in this build.'),
                ),
              );
            },
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
        child: RefreshIndicator(
          color: AppColors.primaryContainer,
          onRefresh: _loadPosts,
          child: CustomScrollView(
            physics: const AlwaysScrollableScrollPhysics(),
            slivers: [
              if (_isRefreshing)
                const SliverToBoxAdapter(
                  child: LinearProgressIndicator(
                    minHeight: 2,
                    color: AppColors.primaryContainer,
                  ),
                ),
              const SliverToBoxAdapter(
                child: Padding(
                  padding: EdgeInsets.fromLTRB(16, 20, 16, 18),
                  child: _BoardCategoryChips(categories: mockBoardCategories),
                ),
              ),
              if (posts.isEmpty)
                const SliverFillRemaining(
                  hasScrollBody: false,
                  child: _EmptyBoardState(),
                )
              else
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
                          return _BoardPostCard(
                            post: posts[index],
                            onChatRequested: widget.onBoardChatRequested,
                          );
                        }, childCount: posts.length),
                      );
                    },
                  ),
                ),
            ],
          ),
        ),
      ),
    );
  }
}

// TODO(chat): when Board detail is added, put the Chat action there and route it
// through ChatRepository.getOrCreateBoardChatRoom with board_id plus auth metadata.
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
  const _BoardPostCard({required this.post, this.onChatRequested});

  final BoardPost post;
  final ValueChanged<BoardPost>? onChatRequested;

  @override
  Widget build(BuildContext context) {
    final palette = context.palette;
    final imageUrl = _primaryImageUrl(post);
    final hasImage = imageUrl != null;

    return DecoratedBox(
      decoration: BoxDecoration(
        color: palette.surfaceContainerLowest,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(
          color: palette.outlineVariant.withValues(alpha: 0.52),
        ),
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
                    AppNetworkImage(url: imageUrl),
                    Positioned(
                      top: 16,
                      left: 16,
                      child: _CategoryBadge(label: _categoryLabel(post)),
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
                      _CategoryBadge(label: _categoryLabel(post)),
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
                      post.body ?? post.content,
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
                              post.location!.name,
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
                    Divider(
                      height: 24,
                      color: palette.outlineVariant.withValues(alpha: 0.48),
                    ),
                    _PostMetaRow(post: post, onChatRequested: onChatRequested),
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

class _EmptyBoardState extends StatelessWidget {
  const _EmptyBoardState();

  @override
  Widget build(BuildContext context) {
    final palette = context.palette;

    return Center(
      child: Padding(
        padding: const EdgeInsets.all(32),
        child: Text(
          'No board posts yet.',
          textAlign: TextAlign.center,
          style: TextStyle(
            color: palette.secondary,
            fontSize: 14,
            fontWeight: FontWeight.w600,
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
  const _PostMetaRow({required this.post, this.onChatRequested});

  final BoardPost post;
  final ValueChanged<BoardPost>? onChatRequested;

  @override
  Widget build(BuildContext context) {
    final palette = context.palette;
    final timeLabel = post.timeAgo ?? _relativeTimeLabel(post.createdAt);

    return Row(
      children: [
        ClipOval(
          child: AppNetworkImage(
            url: post.authorAvatarUrl ?? post.authorProfileImageUrl,
            width: 24,
            height: 24,
          ),
        ),
        const SizedBox(width: 8),
        Expanded(
          child: Text(
            '${post.author ?? post.authorNickname}  •  $timeLabel',
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
        _PostMetric(
          icon: Icons.favorite,
          value: post.favoriteCount ?? post.likeCount,
        ),
        const SizedBox(width: 8),
        _BoardChatButton(
          onPressed: onChatRequested == null
              ? null
              : () => onChatRequested!(post),
        ),
      ],
    );
  }
}

String? _primaryImageUrl(BoardPost post) {
  if (post.imageUrl != null && post.imageUrl!.trim().isNotEmpty) {
    return post.imageUrl;
  }
  if (post.imageUrls.isEmpty) {
    return null;
  }
  final firstImageUrl = post.imageUrls.first.trim();
  return firstImageUrl.isEmpty ? null : firstImageUrl;
}

String _categoryLabel(BoardPost post) {
  final category = post.category;
  if (category != null && category.trim().isNotEmpty) {
    return category;
  }

  return switch (post.boardType) {
    'free' => 'Question',
    'BOARD_TYPE_FREE' => 'Question',
    'flash_meetup' => 'Nearby Drop',
    'BOARD_TYPE_FLASH_MEETUP' => 'Nearby Drop',
    'info' => 'Tasting Note',
    'BOARD_TYPE_INFO' => 'Tasting Note',
    _ => 'Board',
  };
}

String _relativeTimeLabel(DateTime createdAt) {
  final elapsed = DateTime.now().difference(createdAt);
  if (elapsed.inMinutes < 1) {
    return 'now';
  }
  if (elapsed.inHours < 1) {
    return '${elapsed.inMinutes}m ago';
  }
  if (elapsed.inDays < 1) {
    return '${elapsed.inHours}h ago';
  }
  if (elapsed.inDays < 7) {
    return '${elapsed.inDays}d ago';
  }
  return '${createdAt.month}/${createdAt.day}/${createdAt.year}';
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
