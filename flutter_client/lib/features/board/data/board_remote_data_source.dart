import 'package:grpc/grpc.dart';

import 'board_grpc_endpoint.dart';
import 'grpc_gen/board/v1/board.pbgrpc.dart';
import 'grpc_gen/common/v1/common.pb.dart';
import '../models/board_models.dart';

abstract class BoardRemoteDataSource {
  Future<BoardPostPage> listPosts({
    String boardType = '',
    String query = '',
    String userId = '',
    int page = 1,
    int pageSize = 20,
  });

  Future<BoardPost> getPost({required String postId, String userId = ''});

  Future<BoardPost> createPost({
    required String userId,
    required String boardType,
    required String title,
    required String content,
    List<String> imageUrls = const [],
    String? locationName,
    String? locationAddress,
    double? latitude,
    double? longitude,
    required String accessToken,
  });

  Future<BoardPost> updatePost({
    required String postId,
    required String userId,
    String? title,
    String? content,
    bool updateImages = false,
    List<String> imageUrls = const [],
    required String accessToken,
  });

  Future<void> deletePost({
    required String postId,
    required String accessToken,
  });

  Future<({bool liked, int likeCount})> likePost({
    required String postId,
    required String accessToken,
  });

  Future<BoardCommentPage> listComments({
    required String postId,
    String userId = '',
    int page = 1,
    int pageSize = 20,
  });

  Future<BoardComment> createComment({
    required String postId,
    required String content,
    String parentCommentId = '',
    required String accessToken,
  });

  Future<BoardComment> updateComment({
    required String commentId,
    required String content,
    required String accessToken,
  });

  Future<void> deleteComment({
    required String commentId,
    required String accessToken,
  });

  Future<({bool liked, int likeCount})> likeComment({
    required String commentId,
    required String accessToken,
  });

  Future<void> dispose();
}

class GrpcBoardRemoteDataSource implements BoardRemoteDataSource {
  factory GrpcBoardRemoteDataSource({BoardGrpcEndpoint? endpoint}) {
    final e = endpoint ?? BoardGrpcEndpoint.fromEnvironment();
    final channel = ClientChannel(
      e.host,
      port: e.port,
      options: ChannelOptions(
        credentials: e.useTls
            ? const ChannelCredentials.secure()
            : const ChannelCredentials.insecure(),
      ),
    );
    return GrpcBoardRemoteDataSource._(e, channel, BoardServiceClient(channel));
  }

  GrpcBoardRemoteDataSource._(this._endpoint, this._channel, this._client);

  final BoardGrpcEndpoint _endpoint;
  final ClientChannel _channel;
  final BoardServiceClient _client;

  static const _timeout = Duration(seconds: 10);

  CallOptions _authOptions(String accessToken) => CallOptions(
    metadata: {'authorization': 'Bearer $accessToken'},
    timeout: _timeout,
  );

  static final _defaultOptions = CallOptions(timeout: _timeout);

  // --- conversion helpers ---

  BoardPost _postFromProto(PostResponse p) {
    return BoardPost(
      postId: p.postId,
      boardType: p.boardType.name,
      authorId: p.authorId,
      authorNickname: p.authorNickname,
      authorProfileImageUrl: p.authorProfileImageUrl,
      title: p.title,
      content: p.content,
      imageUrls: p.imageUrls.toList(),
      likeCount: p.likeCount,
      viewCount: p.viewCount,
      commentCount: p.commentCount,
      isNotice: p.isNotice,
      isLiked: p.isLiked,
      location: p.hasLocation()
          ? BoardLocation(
              name: p.location.name,
              address: p.location.address,
              latitude: p.location.latitude,
              longitude: p.location.longitude,
            )
          : null,
      createdAt: p.hasCreatedAt() ? p.createdAt.toDateTime() : DateTime.now(),
      updatedAt: p.hasUpdatedAt() ? p.updatedAt.toDateTime() : DateTime.now(),
    );
  }

  BoardComment _commentFromProto(CommentResponse c) {
    return BoardComment(
      commentId: c.commentId,
      postId: c.postId,
      parentCommentId: c.parentCommentId,
      authorId: c.authorId,
      authorNickname: c.authorNickname,
      authorProfileImageUrl: c.authorProfileImageUrl,
      content: c.content,
      likeCount: c.likeCount,
      isLiked: c.isLiked,
      isDeleted: c.isDeleted,
      replies: c.replies.map(_commentFromProto).toList(),
      createdAt: c.hasCreatedAt() ? c.createdAt.toDateTime() : DateTime.now(),
      updatedAt: c.hasUpdatedAt() ? c.updatedAt.toDateTime() : DateTime.now(),
    );
  }

  BoardPagination _paginationFromProto(PaginationResponse p) {
    return BoardPagination(
      totalCount: p.totalCount,
      page: p.page,
      pageSize: p.pageSize,
      hasNext: p.hasNext,
    );
  }

  BoardType _boardTypeFromString(String s) {
    switch (s) {
      case 'BOARD_TYPE_FREE':
      case 'free':
        return BoardType.BOARD_TYPE_FREE;
      case 'BOARD_TYPE_FLASH_MEETUP':
      case 'flash_meetup':
        return BoardType.BOARD_TYPE_FLASH_MEETUP;
      case 'BOARD_TYPE_INFO':
      case 'info':
        return BoardType.BOARD_TYPE_INFO;
      default:
        return BoardType.BOARD_TYPE_UNSPECIFIED;
    }
  }

  ReportReason _reportReasonFromString(String s) {
    switch (s) {
      case 'REPORT_REASON_SPAM':
      case 'spam':
        return ReportReason.REPORT_REASON_SPAM;
      case 'REPORT_REASON_INAPPROPRIATE':
      case 'inappropriate':
        return ReportReason.REPORT_REASON_INAPPROPRIATE;
      case 'REPORT_REASON_MISINFORMATION':
      case 'misinformation':
        return ReportReason.REPORT_REASON_MISINFORMATION;
      default:
        return ReportReason.REPORT_REASON_OTHER;
    }
  }

  // --- BoardRemoteDataSource implementation ---

  @override
  Future<BoardPostPage> listPosts({
    String boardType = '',
    String query = '',
    String userId = '', // ignored; gateway injects from JWT
    int page = 1,
    int pageSize = 20,
  }) async {
    final resp = await _client.listPosts(
      ListPostsRequest(
        boardType: _boardTypeFromString(boardType),
        query: query,
        pagination: PaginationRequest(page: page, pageSize: pageSize),
      ),
      options: _defaultOptions,
    );
    return BoardPostPage(
      posts: resp.posts.map(_postFromProto).toList(),
      pagination: _paginationFromProto(resp.pagination),
    );
  }

  @override
  Future<BoardPost> getPost({
    required String postId,
    String userId = '', // ignored; gateway injects from JWT
  }) async {
    final resp = await _client.getPost(
      GetPostRequest(postId: postId),
      options: _defaultOptions,
    );
    return _postFromProto(resp.post);
  }

  @override
  Future<BoardPost> createPost({
    required String userId, // ignored; gateway injects from JWT
    required String boardType,
    required String title,
    required String content,
    List<String> imageUrls = const [],
    String? locationName,
    String? locationAddress,
    double? latitude,
    double? longitude,
    required String accessToken,
  }) async {
    final req = CreatePostRequest(
      boardType: _boardTypeFromString(boardType),
      title: title,
      content: content,
    )..imageUrls.addAll(imageUrls);

    if (locationName != null) {
      req.location = Location(
        name: locationName,
        address: locationAddress ?? '',
        latitude: latitude ?? 0.0,
        longitude: longitude ?? 0.0,
      );
    }

    final resp = await _client.createPost(
      req,
      options: _authOptions(accessToken),
    );
    return _postFromProto(resp.post);
  }

  @override
  Future<BoardPost> updatePost({
    required String postId,
    required String userId, // ignored; gateway injects from JWT
    String? title,
    String? content,
    bool updateImages = false,
    List<String> imageUrls = const [],
    required String accessToken,
  }) async {
    final req = UpdatePostRequest(postId: postId, updateImages: updateImages);
    if (title != null) req.title = title;
    if (content != null) req.content = content;
    if (updateImages) req.imageUrls.addAll(imageUrls);

    final resp = await _client.updatePost(
      req,
      options: _authOptions(accessToken),
    );
    return _postFromProto(resp.post);
  }

  @override
  Future<void> deletePost({
    required String postId,
    required String accessToken,
  }) async {
    await _client.deletePost(
      DeletePostRequest(postId: postId),
      options: _authOptions(accessToken),
    );
  }

  @override
  Future<({bool liked, int likeCount})> likePost({
    required String postId,
    required String accessToken,
  }) async {
    final resp = await _client.likePost(
      LikePostRequest(postId: postId),
      options: _authOptions(accessToken),
    );
    return (liked: resp.liked, likeCount: resp.likeCount);
  }

  @override
  Future<BoardCommentPage> listComments({
    required String postId,
    String userId = '', // ignored; gateway injects from JWT
    int page = 1,
    int pageSize = 20,
  }) async {
    final resp = await _client.listComments(
      ListCommentsRequest(
        postId: postId,
        pagination: PaginationRequest(page: page, pageSize: pageSize),
      ),
      options: _defaultOptions,
    );
    return BoardCommentPage(
      comments: resp.comments.map(_commentFromProto).toList(),
      pagination: _paginationFromProto(resp.pagination),
    );
  }

  @override
  Future<BoardComment> createComment({
    required String postId,
    required String content,
    String parentCommentId = '',
    required String accessToken,
  }) async {
    final resp = await _client.createComment(
      CreateCommentRequest(
        postId: postId,
        content: content,
        parentCommentId: parentCommentId,
      ),
      options: _authOptions(accessToken),
    );
    return _commentFromProto(resp.comment);
  }

  @override
  Future<BoardComment> updateComment({
    required String commentId,
    required String content,
    required String accessToken,
  }) async {
    final resp = await _client.updateComment(
      UpdateCommentRequest(commentId: commentId, content: content),
      options: _authOptions(accessToken),
    );
    return _commentFromProto(resp.comment);
  }

  @override
  Future<void> deleteComment({
    required String commentId,
    required String accessToken,
  }) async {
    await _client.deleteComment(
      DeleteCommentRequest(commentId: commentId),
      options: _authOptions(accessToken),
    );
  }

  @override
  Future<({bool liked, int likeCount})> likeComment({
    required String commentId,
    required String accessToken,
  }) async {
    final resp = await _client.likeComment(
      LikeCommentRequest(commentId: commentId),
      options: _authOptions(accessToken),
    );
    return (liked: resp.liked, likeCount: resp.likeCount);
  }

  Future<void> reportPost({
    required String postId,
    required String reason,
    String detail = '',
    required String accessToken,
  }) async {
    await _client.reportPost(
      ReportPostRequest(
        postId: postId,
        reason: _reportReasonFromString(reason),
        detail: detail,
      ),
      options: _authOptions(accessToken),
    );
  }

  Future<void> reportComment({
    required String commentId,
    required String reason,
    String detail = '',
    required String accessToken,
  }) async {
    await _client.reportComment(
      ReportCommentRequest(
        commentId: commentId,
        reason: _reportReasonFromString(reason),
        detail: detail,
      ),
      options: _authOptions(accessToken),
    );
  }

  @override
  Future<void> dispose() => _channel.shutdown();

  @override
  String toString() =>
      'GrpcBoardRemoteDataSource(${_endpoint.host}:${_endpoint.port}, tls=${_endpoint.useTls})';
}
