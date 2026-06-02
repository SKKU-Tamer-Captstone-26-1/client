import 'package:grpc/grpc.dart';

import 'board_grpc_endpoint.dart';
import 'grpc_gen/board/v1/board.pbgrpc.dart';
import 'grpc_gen/common/v1/common.pb.dart';

abstract class BoardRemoteDataSource {
  Future<ListPostsResponse> listPosts({
    String authToken = '',
    BoardType boardType = BoardType.BOARD_TYPE_UNSPECIFIED,
    String query = '',
    int page = 1,
    int pageSize = 20,
  });

  Future<GetPostResponse> getPost({
    required String postId,
    String authToken = '',
  });

  Future<CreatePostResponse> createPost({
    required String authToken,
    required BoardType boardType,
    required String title,
    required String content,
    List<String> imageUrls = const [],
    String? locationName,
    String? locationAddress,
    double? latitude,
    double? longitude,
  });

  Future<void> deletePost({
    required String postId,
    required String authToken,
  });

  Future<({bool liked, int likeCount})> likePost({
    required String postId,
    required String authToken,
  });

  Future<ListCommentsResponse> listComments({
    required String postId,
    String authToken = '',
    int page = 1,
    int pageSize = 20,
  });

  Future<CreateCommentResponse> createComment({
    required String postId,
    required String content,
    String parentCommentId = '',
    required String authToken,
  });

  Future<({bool liked, int likeCount})> likeComment({
    required String commentId,
    required String authToken,
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

  static const _timeout = Duration(seconds: 30);

  CallOptions _authOptions(String authToken) => CallOptions(
        metadata: {'authorization': 'Bearer $authToken'},
        timeout: _timeout,
      );

  static final _defaultOptions = CallOptions(timeout: _timeout);

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

  @override
  Future<ListPostsResponse> listPosts({
    String authToken = '',
    BoardType boardType = BoardType.BOARD_TYPE_UNSPECIFIED,
    String query = '',
    int page = 1,
    int pageSize = 20,
  }) {
    return _client.listPosts(
      ListPostsRequest(
        boardType: boardType,
        query: query,
        pagination: PaginationRequest(page: page, pageSize: pageSize),
      ),
      options: authToken.isEmpty ? _defaultOptions : _authOptions(authToken),
    );
  }

  @override
  Future<GetPostResponse> getPost({
    required String postId,
    String authToken = '',
  }) {
    return _client.getPost(
      GetPostRequest(postId: postId),
      options: authToken.isEmpty ? _defaultOptions : _authOptions(authToken),
    );
  }

  @override
  Future<CreatePostResponse> createPost({
    required String authToken,
    required BoardType boardType,
    required String title,
    required String content,
    List<String> imageUrls = const [],
    String? locationName,
    String? locationAddress,
    double? latitude,
    double? longitude,
  }) async {
    final req = CreatePostRequest(
      boardType: boardType,
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

    return _client.createPost(req, options: _authOptions(authToken));
  }

  @override
  Future<void> deletePost({
    required String postId,
    required String authToken,
  }) async {
    await _client.deletePost(
      DeletePostRequest(postId: postId),
      options: _authOptions(authToken),
    );
  }

  @override
  Future<({bool liked, int likeCount})> likePost({
    required String postId,
    required String authToken,
  }) async {
    final resp = await _client.likePost(
      LikePostRequest(postId: postId),
      options: _authOptions(authToken),
    );
    return (liked: resp.liked, likeCount: resp.likeCount);
  }

  @override
  Future<ListCommentsResponse> listComments({
    required String postId,
    String authToken = '',
    int page = 1,
    int pageSize = 20,
  }) {
    return _client.listComments(
      ListCommentsRequest(
        postId: postId,
        pagination: PaginationRequest(page: page, pageSize: pageSize),
      ),
      options: authToken.isEmpty ? _defaultOptions : _authOptions(authToken),
    );
  }

  @override
  Future<CreateCommentResponse> createComment({
    required String postId,
    required String content,
    String parentCommentId = '',
    required String authToken,
  }) {
    return _client.createComment(
      CreateCommentRequest(
        postId: postId,
        content: content,
        parentCommentId: parentCommentId,
      ),
      options: _authOptions(authToken),
    );
  }

  @override
  Future<({bool liked, int likeCount})> likeComment({
    required String commentId,
    required String authToken,
  }) async {
    final resp = await _client.likeComment(
      LikeCommentRequest(commentId: commentId),
      options: _authOptions(authToken),
    );
    return (liked: resp.liked, likeCount: resp.likeCount);
  }

  Future<void> reportPost({
    required String postId,
    required String reason,
    String detail = '',
    required String authToken,
  }) async {
    await _client.reportPost(
      ReportPostRequest(
        postId: postId,
        reason: _reportReasonFromString(reason),
        detail: detail,
      ),
      options: _authOptions(authToken),
    );
  }

  Future<void> reportComment({
    required String commentId,
    required String reason,
    String detail = '',
    required String authToken,
  }) async {
    await _client.reportComment(
      ReportCommentRequest(
        commentId: commentId,
        reason: _reportReasonFromString(reason),
        detail: detail,
      ),
      options: _authOptions(authToken),
    );
  }

  @override
  Future<void> dispose() => _channel.shutdown();

  @override
  String toString() =>
      'GrpcBoardRemoteDataSource(${_endpoint.host}:${_endpoint.port}, tls=${_endpoint.useTls})';
}
