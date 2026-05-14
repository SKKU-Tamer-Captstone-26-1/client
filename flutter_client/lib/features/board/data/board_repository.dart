import '../models/board_models.dart';
import 'board_remote_data_source.dart';

abstract class BoardRepository {
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
}

class RemoteBoardRepository implements BoardRepository {
  RemoteBoardRepository({BoardRemoteDataSource? dataSource})
      : _dataSource = dataSource ?? GrpcBoardRemoteDataSource();

  final BoardRemoteDataSource _dataSource;

  @override
  Future<BoardPostPage> listPosts({
    String boardType = '',
    String query = '',
    String userId = '',
    int page = 1,
    int pageSize = 20,
  }) => _dataSource.listPosts(
        boardType: boardType,
        query: query,
        userId: userId,
        page: page,
        pageSize: pageSize,
      );

  @override
  Future<BoardPost> getPost({required String postId, String userId = ''}) =>
      _dataSource.getPost(postId: postId, userId: userId);

  @override
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
  }) => _dataSource.createPost(
        userId: userId,
        boardType: boardType,
        title: title,
        content: content,
        imageUrls: imageUrls,
        locationName: locationName,
        locationAddress: locationAddress,
        latitude: latitude,
        longitude: longitude,
        accessToken: accessToken,
      );

  @override
  Future<BoardPost> updatePost({
    required String postId,
    required String userId,
    String? title,
    String? content,
    bool updateImages = false,
    List<String> imageUrls = const [],
    required String accessToken,
  }) => _dataSource.updatePost(
        postId: postId,
        userId: userId,
        title: title,
        content: content,
        updateImages: updateImages,
        imageUrls: imageUrls,
        accessToken: accessToken,
      );

  @override
  Future<void> deletePost({
    required String postId,
    required String accessToken,
  }) => _dataSource.deletePost(postId: postId, accessToken: accessToken);

  @override
  Future<({bool liked, int likeCount})> likePost({
    required String postId,
    required String accessToken,
  }) => _dataSource.likePost(postId: postId, accessToken: accessToken);

  @override
  Future<BoardCommentPage> listComments({
    required String postId,
    String userId = '',
    int page = 1,
    int pageSize = 20,
  }) => _dataSource.listComments(
        postId: postId,
        userId: userId,
        page: page,
        pageSize: pageSize,
      );

  @override
  Future<BoardComment> createComment({
    required String postId,
    required String content,
    String parentCommentId = '',
    required String accessToken,
  }) => _dataSource.createComment(
        postId: postId,
        content: content,
        parentCommentId: parentCommentId,
        accessToken: accessToken,
      );

  @override
  Future<BoardComment> updateComment({
    required String commentId,
    required String content,
    required String accessToken,
  }) => _dataSource.updateComment(
        commentId: commentId,
        content: content,
        accessToken: accessToken,
      );

  @override
  Future<void> deleteComment({
    required String commentId,
    required String accessToken,
  }) => _dataSource.deleteComment(
        commentId: commentId,
        accessToken: accessToken,
      );

  @override
  Future<({bool liked, int likeCount})> likeComment({
    required String commentId,
    required String accessToken,
  }) => _dataSource.likeComment(
        commentId: commentId,
        accessToken: accessToken,
      );

  Future<void> dispose() => _dataSource.dispose();
}
