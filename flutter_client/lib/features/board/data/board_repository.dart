import '../models/board_models.dart';
import 'board_remote_data_source.dart';
import 'grpc_gen/board/v1/board.pb.dart';

abstract class BoardRepository {
  Future<List<BoardPost>> listPosts({
    String authToken = '',
    BoardType boardType = BoardType.BOARD_TYPE_UNSPECIFIED,
    String query = '',
    int page = 1,
    int pageSize = 20,
  });

  Future<BoardPost> getPost({required String postId, String authToken = ''});

  Future<BoardPost> createPost({
    required String authToken,
    required BoardType boardType,
    required String title,
    required String content,
    List<String> imageUrls = const [],
  });

  Future<void> deletePost({required String authToken, required String postId});

  Future<({bool liked, int likeCount})> likePost({
    required String authToken,
    required String postId,
  });

  Future<({bool liked, int likeCount})> likeComment({
    required String authToken,
    required String commentId,
  });

  Future<List<BoardComment>> listComments({
    required String postId,
    String authToken = '',
    int page = 1,
    int pageSize = 50,
  });

  Future<BoardComment> createComment({
    required String authToken,
    required String postId,
    required String content,
    String parentCommentId = '',
  });

  Future<void> dispose();
}

class GrpcBoardRepository implements BoardRepository {
  GrpcBoardRepository(this._remote);

  final BoardRemoteDataSource _remote;

  @override
  Future<List<BoardPost>> listPosts({
    String authToken = '',
    BoardType boardType = BoardType.BOARD_TYPE_UNSPECIFIED,
    String query = '',
    int page = 1,
    int pageSize = 20,
  }) async {
    final res = await _remote.listPosts(
      authToken: authToken,
      boardType: boardType,
      query: query,
      page: page,
      pageSize: pageSize,
    );
    return res.posts.map(_toPost).toList();
  }

  @override
  Future<BoardPost> getPost({
    required String postId,
    String authToken = '',
  }) async {
    final res = await _remote.getPost(postId: postId, authToken: authToken);
    return _toPost(res.post);
  }

  @override
  Future<BoardPost> createPost({
    required String authToken,
    required BoardType boardType,
    required String title,
    required String content,
    List<String> imageUrls = const [],
  }) async {
    final res = await _remote.createPost(
      authToken: authToken,
      boardType: boardType,
      title: title,
      content: content,
      imageUrls: imageUrls,
    );
    return _toPost(res.post);
  }

  @override
  Future<void> deletePost({
    required String authToken,
    required String postId,
  }) {
    return _remote.deletePost(authToken: authToken, postId: postId);
  }

  @override
  Future<({bool liked, int likeCount})> likePost({
    required String authToken,
    required String postId,
  }) async {
    final res = await _remote.likePost(authToken: authToken, postId: postId);
    return (liked: res.liked, likeCount: res.likeCount);
  }

  @override
  Future<({bool liked, int likeCount})> likeComment({
    required String authToken,
    required String commentId,
  }) async {
    final res =
        await _remote.likeComment(authToken: authToken, commentId: commentId);
    return (liked: res.liked, likeCount: res.likeCount);
  }

  @override
  Future<List<BoardComment>> listComments({
    required String postId,
    String authToken = '',
    int page = 1,
    int pageSize = 50,
  }) async {
    final res = await _remote.listComments(
      postId: postId,
      authToken: authToken,
      page: page,
      pageSize: pageSize,
    );
    return res.comments.map(_toComment).toList();
  }

  @override
  Future<BoardComment> createComment({
    required String authToken,
    required String postId,
    required String content,
    String parentCommentId = '',
  }) async {
    final res = await _remote.createComment(
      authToken: authToken,
      postId: postId,
      content: content,
      parentCommentId: parentCommentId,
    );
    return _toComment(res.comment);
  }

  @override
  Future<void> dispose() => _remote.dispose();

  static BoardPost _toPost(PostResponse p) {
    return BoardPost(
      boardId: p.postId,
      boardOwnerUserId: p.authorId,
      category: _boardTypeLabel(p.boardType),
      title: p.title,
      body: p.content,
      author: p.authorNickname.isNotEmpty ? p.authorNickname : 'Unknown',
      timeAgo: p.hasCreatedAt() ? _timeAgo(p.createdAt.toDateTime()) : '',
      commentCount: p.commentCount,
      favoriteCount: p.likeCount,
      isLiked: p.isLiked,
      authorAvatarUrl: p.authorProfileImageUrl,
      imageUrls: p.imageUrls,
      location: p.hasLocation() && p.location.name.isNotEmpty
          ? p.location.name
          : null,
    );
  }

  static BoardComment _toComment(CommentResponse c) {
    return BoardComment(
      commentId: c.commentId,
      postId: c.postId,
      parentCommentId: c.parentCommentId,
      authorId: c.authorId,
      authorNickname: c.authorNickname.isNotEmpty ? c.authorNickname : 'Unknown',
      authorProfileImageUrl: c.authorProfileImageUrl,
      content: c.content,
      likeCount: c.likeCount,
      isLiked: c.isLiked,
      isDeleted: c.isDeleted,
      timeAgo: c.hasCreatedAt() ? _timeAgo(c.createdAt.toDateTime()) : '',
      replies: c.replies.map(_toComment).toList(),
    );
  }

  static String _boardTypeLabel(BoardType type) {
    switch (type) {
      case BoardType.BOARD_TYPE_FREE:
        return 'Free';
      case BoardType.BOARD_TYPE_FLASH_MEETUP:
        return 'Flash Meetup';
      case BoardType.BOARD_TYPE_INFO:
        return 'Info';
      default:
        return 'General';
    }
  }

  static String _timeAgo(DateTime createdAt) {
    final diff = DateTime.now().difference(createdAt.toLocal());
    if (diff.inDays >= 365) return '${diff.inDays ~/ 365}y ago';
    if (diff.inDays >= 30) return '${diff.inDays ~/ 30}mo ago';
    if (diff.inDays >= 1) return '${diff.inDays}d ago';
    if (diff.inHours >= 1) return '${diff.inHours}h ago';
    if (diff.inMinutes >= 1) return '${diff.inMinutes}m ago';
    return 'just now';
  }
}
