import 'dart:async';
import 'dart:ui' as ui;

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../core/theme/app_colors.dart';
import '../../../shared/widgets/app_network_image.dart';
import '../../auth/providers/auth_provider.dart';
import '../models/board_models.dart';
import '../providers/board_repository_provider.dart';

int _countAllComments(List<BoardComment> comments) =>
    comments.fold(0, (sum, c) => sum + 1 + _countAllComments(c.replies));

class BoardDetailScreen extends ConsumerStatefulWidget {
  const BoardDetailScreen({
    super.key,
    required this.post,
    required this.onBack,
    required this.onJoinChat,
  });

  final BoardPost post;
  final VoidCallback onBack;
  final Future<void> Function() onJoinChat;

  @override
  ConsumerState<BoardDetailScreen> createState() => _BoardDetailScreenState();
}

class _BoardDetailScreenState extends ConsumerState<BoardDetailScreen> {
  final _commentController = TextEditingController();
  BoardComment? _replyingTo;
  bool _submitting = false;

  @override
  void dispose() {
    _commentController.dispose();
    super.dispose();
  }

  Future<void> _submitComment() async {
    final text = _commentController.text.trim();
    if (text.isEmpty || _submitting) return;

    final authToken = ref.read(authProvider).accessToken ?? '';
    if (authToken.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Login required to comment.')),
      );
      return;
    }

    setState(() => _submitting = true);
    try {
      final repo = ref.read(boardRepositoryProvider);
      await repo.createComment(
        authToken: authToken,
        postId: widget.post.boardId,
        content: text,
        parentCommentId: _replyingTo?.commentId ?? '',
      );
      _commentController.clear();
      setState(() => _replyingTo = null);
      ref.invalidate(boardCommentsProvider(widget.post.boardId));
      ref.invalidate(boardPostsProvider);
    } catch (e) {
      if (kDebugMode) debugPrint('COMMENT_CREATE_FAILED: $e');
      if (!mounted) return;
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Failed to post comment: $e')),
      );
    } finally {
      if (mounted) setState(() => _submitting = false);
    }
  }

  @override
  Widget build(BuildContext context) {
    final palette = context.palette;
    final commentsAsync = ref.watch(boardCommentsProvider(widget.post.boardId));
    final post = widget.post;
    final hasImage = post.imageUrls.isNotEmpty;
    final liveCommentCount = commentsAsync.maybeWhen(
      data: (comments) => _countAllComments(comments),
      orElse: () => post.commentCount,
    );

    return Scaffold(
      backgroundColor: palette.surfaceContainerLow,
      resizeToAvoidBottomInset: true,
      appBar: AppBar(
        backgroundColor: palette.surfaceContainerLowest,
        foregroundColor: palette.onSurface,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: widget.onBack,
        ),
        titleSpacing: 0,
        title: _CategoryBadge(label: post.category),
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView(
              padding: const EdgeInsets.only(bottom: 24),
              children: [
                if (hasImage) _PostImagesView(imageUrls: post.imageUrls),
                _PostContentCard(
                  post: post,
                  hasImage: hasImage,
                  palette: palette,
                  liveCommentCount: liveCommentCount,
                  onJoinChat: widget.onJoinChat,
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(20, 8, 20, 12),
                  child: commentsAsync.maybeWhen(
                    data: (comments) {
                      final total = _countAllComments(comments);
                      return Text(
                        'Comments ($total)',
                        style: TextStyle(
                          color: palette.onSurface,
                          fontSize: 16,
                          fontWeight: FontWeight.w700,
                        ),
                      );
                    },
                    orElse: () => Text(
                      'Comments',
                      style: TextStyle(
                        color: palette.onSurface,
                        fontSize: 16,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ),
                ),
                commentsAsync.when(
                  loading: () => const Padding(
                    padding: EdgeInsets.symmetric(vertical: 32),
                    child: Center(child: CircularProgressIndicator()),
                  ),
                  error: (_, __) => Padding(
                    padding: const EdgeInsets.all(24),
                    child: Center(
                      child: Text(
                        'Failed to load comments',
                        style: TextStyle(color: palette.secondary),
                      ),
                    ),
                  ),
                  data: (comments) {
                    if (comments.isEmpty) {
                      return Padding(
                        padding: const EdgeInsets.symmetric(vertical: 32),
                        child: Column(
                          children: [
                            Icon(
                              Icons.chat_bubble_outline,
                              size: 36,
                              color: palette.outlineVariant,
                            ),
                            const SizedBox(height: 10),
                            Text(
                              'Be the first to comment',
                              style: TextStyle(
                                color: palette.secondary,
                                fontSize: 14,
                              ),
                            ),
                          ],
                        ),
                      );
                    }
                    return Column(
                      children: comments
                          .map((c) => _CommentThread(
                                comment: c,
                                palette: palette,
                                onReply: (c) =>
                                    setState(() => _replyingTo = c),
                              ))
                          .toList(),
                    );
                  },
                ),
              ],
            ),
          ),
          _CommentInputBar(
            controller: _commentController,
            replyingTo: _replyingTo,
            submitting: _submitting,
            palette: palette,
            onSend: _submitComment,
            onCancelReply: () => setState(() => _replyingTo = null),
          ),
        ],
      ),
    );
  }
}

class _PostContentCard extends ConsumerStatefulWidget {
  const _PostContentCard({
    required this.post,
    required this.hasImage,
    required this.palette,
    required this.liveCommentCount,
    required this.onJoinChat,
  });

  final BoardPost post;
  final bool hasImage;
  final AppPalette palette;
  final int liveCommentCount;
  final Future<void> Function() onJoinChat;

  @override
  ConsumerState<_PostContentCard> createState() => _PostContentCardState();
}

class _PostContentCardState extends ConsumerState<_PostContentCard> {
  late bool _liked;
  late int _likeCount;
  bool _liking = false;
  bool _joiningChat = false;

  @override
  void initState() {
    super.initState();
    _liked = widget.post.isLiked;
    _likeCount = widget.post.favoriteCount;
  }

  Future<void> _joinChat() async {
    if (_joiningChat) return;
    setState(() => _joiningChat = true);
    try {
      await widget.onJoinChat();
    } catch (e) {
      if (!mounted) return;
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Failed to join chat: $e')),
      );
    } finally {
      if (mounted) setState(() => _joiningChat = false);
    }
  }

  Future<void> _toggleLike() async {
    if (_liking) return;
    final authToken = ref.read(authProvider).accessToken ?? '';
    if (authToken.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Login required to like.')),
      );
      return;
    }
    final wasLiked = _liked;
    setState(() {
      _liking = true;
      _liked = !_liked;
      _likeCount += _liked ? 1 : -1;
    });
    try {
      final result = await ref.read(boardRepositoryProvider).likePost(
            authToken: authToken,
            postId: widget.post.boardId,
          );
      if (mounted) setState(() { _liked = result.liked; _likeCount = result.likeCount; });
    } catch (_) {
      if (mounted) setState(() { _liked = wasLiked; _likeCount += wasLiked ? 1 : -1; });
    } finally {
      if (mounted) setState(() => _liking = false);
    }
  }

  @override
  Widget build(BuildContext context) {
    final palette = widget.palette;
    final post = widget.post;

    return Container(
      margin: const EdgeInsets.fromLTRB(16, 16, 16, 8),
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
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            if (!widget.hasImage) ...[
              _CategoryBadge(label: post.category),
              const SizedBox(height: 16),
            ],
            Text(
              post.title,
              style: TextStyle(
                color: palette.onSurface,
                fontSize: 22,
                fontWeight: FontWeight.w800,
                height: 1.2,
              ),
            ),
            const SizedBox(height: 14),
            _AuthorRow(post: post, palette: palette),
            const Divider(height: 24, color: Color(0xFFF4F4F5)),
            Text(
              post.body,
              style: TextStyle(
                color: palette.onSurface,
                fontSize: 15,
                height: 1.6,
              ),
            ),
            if (post.location != null) ...[
              const SizedBox(height: 16),
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
                      style: const TextStyle(
                        color: AppColors.primaryContainer,
                        fontSize: 13,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ),
                ],
              ),
            ],
            const Divider(height: 28, color: Color(0xFFF4F4F5)),
            Row(
              children: [
                GestureDetector(
                  onTap: _toggleLike,
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Icon(
                        _liked ? Icons.favorite : Icons.favorite_border,
                        size: 16,
                        color: _liked
                            ? AppColors.primaryContainer
                            : palette.secondary,
                      ),
                      const SizedBox(width: 4),
                      Text(
                        '$_likeCount',
                        style: TextStyle(
                          color: _liked
                              ? AppColors.primaryContainer
                              : palette.secondary,
                          fontSize: 13,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(width: 16),
                Icon(Icons.forum_outlined, size: 16, color: palette.secondary),
                const SizedBox(width: 4),
                Text(
                  '${widget.liveCommentCount}',
                  style: TextStyle(
                    color: palette.secondary,
                    fontSize: 13,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 14),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton.icon(
                onPressed: _joiningChat ? null : _joinChat,
                icon: _joiningChat
                    ? const SizedBox(
                        width: 16,
                        height: 16,
                        child: CircularProgressIndicator(
                          strokeWidth: 2,
                          color: Colors.white,
                        ),
                      )
                    : const Icon(Icons.chat_bubble_outline, size: 16),
                label: Text(_joiningChat ? 'Joining...' : 'Join Chat Room'),
                style: ElevatedButton.styleFrom(
                  backgroundColor: AppColors.primaryContainer,
                  foregroundColor: Colors.white,
                  disabledBackgroundColor:
                      AppColors.primaryContainer.withValues(alpha: 0.6),
                  disabledForegroundColor: Colors.white,
                  padding: const EdgeInsets.symmetric(vertical: 12),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                  textStyle: const TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w700,
                  ),
                  elevation: 0,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _AuthorRow extends StatelessWidget {
  const _AuthorRow({required this.post, required this.palette});

  final BoardPost post;
  final AppPalette palette;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        ClipOval(
          child: AppNetworkImage(
            url: post.authorAvatarUrl,
            width: 32,
            height: 32,
          ),
        ),
        const SizedBox(width: 10),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                post.author,
                style: TextStyle(
                  color: palette.onSurface,
                  fontSize: 14,
                  fontWeight: FontWeight.w600,
                ),
              ),
              Text(
                post.timeAgo,
                style: TextStyle(
                  color: palette.footerText,
                  fontSize: 12,
                ),
              ),
            ],
          ),
        ),
      ],
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

class _CommentThread extends StatelessWidget {
  const _CommentThread({
    required this.comment,
    required this.palette,
    required this.onReply,
    this.depth = 0,
  });

  final BoardComment comment;
  final AppPalette palette;
  final ValueChanged<BoardComment> onReply;
  final int depth;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: depth == 0
          ? const EdgeInsets.fromLTRB(16, 0, 16, 8)
          : const EdgeInsets.only(bottom: 4),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          _CommentItem(
            comment: comment,
            palette: palette,
            onReply: onReply,
            depth: depth,
          ),
          if (comment.replies.isNotEmpty)
            Padding(
              padding: const EdgeInsets.only(left: 20, top: 4),
              child: Column(
                children: comment.replies
                    .map((r) => _CommentThread(
                          comment: r,
                          palette: palette,
                          onReply: onReply,
                          depth: depth + 1,
                        ))
                    .toList(),
              ),
            ),
        ],
      ),
    );
  }
}

class _CommentItem extends ConsumerStatefulWidget {
  const _CommentItem({
    required this.comment,
    required this.palette,
    required this.onReply,
    this.depth = 0,
  });

  final BoardComment comment;
  final AppPalette palette;
  final ValueChanged<BoardComment> onReply;
  final int depth;

  @override
  ConsumerState<_CommentItem> createState() => _CommentItemState();
}

class _CommentItemState extends ConsumerState<_CommentItem> {
  late bool _liked;
  late int _likeCount;
  bool _liking = false;

  @override
  void initState() {
    super.initState();
    _liked = widget.comment.isLiked;
    _likeCount = widget.comment.likeCount;
  }

  Future<void> _toggleLike() async {
    if (_liking) return;
    final authToken = ref.read(authProvider).accessToken ?? '';
    if (authToken.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Login required to like.')),
      );
      return;
    }
    final wasLiked = _liked;
    setState(() {
      _liking = true;
      _liked = !_liked;
      _likeCount += _liked ? 1 : -1;
    });
    try {
      final result = await ref.read(boardRepositoryProvider).likeComment(
            authToken: authToken,
            commentId: widget.comment.commentId,
          );
      if (mounted) setState(() { _liked = result.liked; _likeCount = result.likeCount; });
    } catch (_) {
      if (mounted) setState(() { _liked = wasLiked; _likeCount += wasLiked ? 1 : -1; });
    } finally {
      if (mounted) setState(() => _liking = false);
    }
  }

  @override
  Widget build(BuildContext context) {
    final palette = widget.palette;
    final comment = widget.comment;
    final isDeleted = comment.isDeleted;

    return DecoratedBox(
      decoration: BoxDecoration(
        color: widget.depth > 0
            ? palette.surfaceContainerLow
            : palette.surfaceContainerLowest,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: const Color(0xFFE9ECEF)),
      ),
      child: Padding(
        padding: const EdgeInsets.all(14),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                ClipOval(
                  child: AppNetworkImage(
                    url: comment.authorProfileImageUrl,
                    width: 28,
                    height: 28,
                  ),
                ),
                const SizedBox(width: 8),
                Expanded(
                  child: Text(
                    comment.authorNickname,
                    style: TextStyle(
                      color: palette.onSurface,
                      fontSize: 13,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
                Text(
                  comment.timeAgo,
                  style: TextStyle(
                    color: palette.footerText,
                    fontSize: 11,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 8),
            Text(
              isDeleted ? 'This comment has been deleted.' : comment.content,
              style: TextStyle(
                color: isDeleted ? palette.footerText : palette.onSurface,
                fontSize: 14,
                height: 1.45,
                fontStyle: isDeleted ? FontStyle.italic : FontStyle.normal,
              ),
            ),
            if (!isDeleted) ...[
              const SizedBox(height: 10),
              Row(
                children: [
                  GestureDetector(
                    onTap: _toggleLike,
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Icon(
                          _liked ? Icons.favorite : Icons.favorite_border,
                          size: 14,
                          color: _liked
                              ? AppColors.primaryContainer
                              : palette.secondary,
                        ),
                        const SizedBox(width: 3),
                        Text(
                          '$_likeCount',
                          style: TextStyle(
                            color: _liked
                                ? AppColors.primaryContainer
                                : palette.secondary,
                            fontSize: 12,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ],
                    ),
                  ),
                  if (widget.depth < 2) ...[
                    const SizedBox(width: 14),
                    GestureDetector(
                      onTap: () => widget.onReply(comment),
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Icon(Icons.reply, size: 14, color: palette.secondary),
                          const SizedBox(width: 3),
                          Text(
                            'Reply',
                            style: TextStyle(
                              color: palette.secondary,
                              fontSize: 12,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ],
              ),
            ],
          ],
        ),
      ),
    );
  }
}

class _PostImagesView extends StatefulWidget {
  const _PostImagesView({required this.imageUrls});

  final List<String> imageUrls;

  @override
  State<_PostImagesView> createState() => _PostImagesViewState();
}

class _PostImagesViewState extends State<_PostImagesView> {
  int _current = 0;

  void _openViewer(int initialIndex) {
    Navigator.of(context).push(
      PageRouteBuilder(
        opaque: false,
        barrierColor: Colors.black,
        pageBuilder: (_, __, ___) => _FullScreenImageViewer(
          imageUrls: widget.imageUrls,
          initialIndex: initialIndex,
        ),
        transitionsBuilder: (_, anim, __, child) =>
            FadeTransition(opacity: anim, child: child),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    if (widget.imageUrls.length == 1) {
      return GestureDetector(
        onTap: () => _openViewer(0),
        child: SizedBox(
          height: 240,
          child: AppNetworkImage(url: widget.imageUrls.first),
        ),
      );
    }
    return SizedBox(
      height: 240,
      child: Stack(
        alignment: Alignment.bottomCenter,
        children: [
          PageView.builder(
            itemCount: widget.imageUrls.length,
            onPageChanged: (i) => setState(() => _current = i),
            itemBuilder: (_, i) => GestureDetector(
              onTap: () => _openViewer(i),
              child: AppNetworkImage(url: widget.imageUrls[i]),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(bottom: 12),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: List.generate(
                widget.imageUrls.length,
                (i) => AnimatedContainer(
                  duration: const Duration(milliseconds: 200),
                  margin: const EdgeInsets.symmetric(horizontal: 3),
                  width: _current == i ? 16 : 6,
                  height: 6,
                  decoration: BoxDecoration(
                    color: _current == i ? Colors.white : Colors.white54,
                    borderRadius: BorderRadius.circular(3),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _FullScreenImageViewer extends StatefulWidget {
  const _FullScreenImageViewer({
    required this.imageUrls,
    required this.initialIndex,
  });

  final List<String> imageUrls;
  final int initialIndex;

  @override
  State<_FullScreenImageViewer> createState() => _FullScreenImageViewerState();
}

class _FullScreenImageViewerState extends State<_FullScreenImageViewer> {
  late final PageController _pageController;
  late int _current;
  Color _uiColor = Colors.white;

  @override
  void initState() {
    super.initState();
    _current = widget.initialIndex;
    _pageController = PageController(initialPage: widget.initialIndex);
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (mounted) _analyzeImageColor(widget.initialIndex);
    });
  }

  Future<void> _analyzeImageColor(int index) async {
    final imageUrl = widget.imageUrls[index];
    Color color;
    try {
      final provider = NetworkImage(imageUrl);
      final stream = provider.resolve(ImageConfiguration.empty);
      final completer = Completer<ui.Image?>();
      late ImageStreamListener listener;
      listener = ImageStreamListener(
        (info, _) {
          if (!completer.isCompleted) completer.complete(info.image);
          stream.removeListener(listener);
        },
        onError: (_, _) {
          if (!completer.isCompleted) completer.complete(null);
          stream.removeListener(listener);
        },
      );
      stream.addListener(listener);
      final image = await completer.future.timeout(
        const Duration(seconds: 3),
        onTimeout: () => null,
      );
      if (image == null) {
        color = Colors.white;
      } else {
        final size = mounted ? MediaQuery.sizeOf(context) : const Size(400, 800);
        final imgAspect = image.width / image.height;
        final vpAspect = size.width / size.height;
        if (imgAspect > vpAspect) {
          // Landscape image: AppBar overlaps black letterbox at top
          color = Colors.white;
        } else {
          final byteData = await image.toByteData(format: ui.ImageByteFormat.rawRgba);
          if (byteData == null) {
            color = Colors.white;
          } else {
            final width = image.width;
            final height = image.height;
            final sampleRows = (height * 0.15).ceil();
            double totalLum = 0.0;
            int count = 0;
            const step = 12;
            for (int y = 0; y < sampleRows; y += step) {
              for (int x = 0; x < width; x += step) {
                final offset = (y * width + x) * 4;
                if (offset + 2 >= byteData.lengthInBytes) continue;
                final r = byteData.getUint8(offset);
                final g = byteData.getUint8(offset + 1);
                final b = byteData.getUint8(offset + 2);
                totalLum += (0.299 * r + 0.587 * g + 0.114 * b) / 255.0;
                count++;
              }
            }
            color = (count > 0 && totalLum / count > 0.5)
                ? Colors.black
                : Colors.white;
          }
        }
      }
    } catch (_) {
      color = Colors.white;
    }
    if (mounted) setState(() => _uiColor = color);
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final hasMultiple = widget.imageUrls.length > 1;
    return Scaffold(
      backgroundColor: Colors.black,
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          icon: Icon(Icons.close, color: _uiColor),
          onPressed: () => Navigator.of(context).pop(),
        ),
        actions: hasMultiple
            ? [
                Padding(
                  padding: const EdgeInsets.only(right: 16),
                  child: Center(
                    child: Text(
                      '${_current + 1} / ${widget.imageUrls.length}',
                      style: TextStyle(
                        color: _uiColor,
                        fontSize: 14,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ),
              ]
            : null,
      ),
      body: Stack(
        children: [
          PageView.builder(
            controller: _pageController,
            itemCount: widget.imageUrls.length,
            onPageChanged: (i) {
              setState(() => _current = i);
              _analyzeImageColor(i);
            },
            itemBuilder: (_, i) => Center(
              child: InteractiveViewer(
                minScale: 0.5,
                maxScale: 4.0,
                child: AppNetworkImage(
                  url: widget.imageUrls[i],
                  fit: BoxFit.contain,
                ),
              ),
            ),
          ),
          if (hasMultiple)
            Positioned(
              bottom: 32,
              left: 0,
              right: 0,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: List.generate(
                  widget.imageUrls.length,
                  (i) => AnimatedContainer(
                    duration: const Duration(milliseconds: 200),
                    margin: const EdgeInsets.symmetric(horizontal: 3),
                    width: _current == i ? 16 : 6,
                    height: 6,
                    decoration: BoxDecoration(
                      color: _current == i ? Colors.white : Colors.white54,
                      borderRadius: BorderRadius.circular(3),
                    ),
                  ),
                ),
              ),
            ),
        ],
      ),
    );
  }
}

class _CommentInputBar extends StatelessWidget {
  const _CommentInputBar({
    required this.controller,
    required this.replyingTo,
    required this.submitting,
    required this.palette,
    required this.onSend,
    required this.onCancelReply,
  });

  final TextEditingController controller;
  final BoardComment? replyingTo;
  final bool submitting;
  final AppPalette palette;
  final VoidCallback onSend;
  final VoidCallback onCancelReply;

  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
      decoration: BoxDecoration(
        color: palette.surfaceContainerLowest,
        border: Border(
          top: BorderSide(color: palette.outlineVariant),
        ),
      ),
      child: SafeArea(
        top: false,
        child: Padding(
          padding: const EdgeInsets.fromLTRB(16, 10, 16, 10),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              if (replyingTo != null) ...[
                Row(
                  children: [
                    Expanded(
                      child: Text(
                        'Replying to @${replyingTo!.authorNickname}',
                        style: TextStyle(
                          color: palette.secondary,
                          fontSize: 12,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                    GestureDetector(
                      onTap: onCancelReply,
                      child: Icon(
                        Icons.close,
                        size: 16,
                        color: palette.secondary,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 6),
              ],
              Row(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Expanded(
                    child: TextField(
                      controller: controller,
                      decoration: InputDecoration(
                        hintText: 'Add a comment...',
                        filled: true,
                        fillColor: palette.surfaceContainerLow,
                        contentPadding: const EdgeInsets.symmetric(
                          horizontal: 16,
                          vertical: 10,
                        ),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(24),
                          borderSide: BorderSide.none,
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(24),
                          borderSide: BorderSide.none,
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(24),
                          borderSide: BorderSide.none,
                        ),
                      ),
                      maxLines: 4,
                      minLines: 1,
                      style: const TextStyle(fontSize: 14, color: Colors.black),
                    ),
                  ),
                  const SizedBox(width: 10),
                  SizedBox(
                    width: 44,
                    height: 44,
                    child: submitting
                        ? const Center(
                            child: SizedBox(
                              width: 24,
                              height: 24,
                              child: CircularProgressIndicator(strokeWidth: 2),
                            ),
                          )
                        : ElevatedButton(
                            onPressed: onSend,
                            style: ElevatedButton.styleFrom(
                              backgroundColor: AppColors.primaryContainer,
                              foregroundColor: Colors.white,
                              padding: EdgeInsets.zero,
                              shape: const CircleBorder(),
                            ),
                            child: const Icon(Icons.send, size: 18),
                          ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
