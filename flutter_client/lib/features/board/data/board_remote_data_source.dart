import 'dart:convert';

import 'package:http/http.dart' as http;

import 'board_gateway_endpoint.dart';
import '../models/board_models.dart';

abstract class BoardRemoteDataSource {
  Future<BoardPostPage> listPosts({
    String boardType = '',
    String query = '',
    String userId = '',
    int page = 1,
    int pageSize = 20,
  });

  Future<BoardPost> getPost({
    required String postId,
    String userId = '',
  });

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

class HttpBoardRemoteDataSource implements BoardRemoteDataSource {
  HttpBoardRemoteDataSource({BoardGatewayEndpoint? endpoint})
      : _endpoint = endpoint ?? BoardGatewayEndpoint.fromEnvironment(),
        _client = http.Client();

  final BoardGatewayEndpoint _endpoint;
  final http.Client _client;

  Uri _uri(String path, [Map<String, String>? params]) {
    final base = Uri.parse('${_endpoint.baseUrl}/board$path');
    if (params == null || params.isEmpty) return base;
    return base.replace(queryParameters: {
      ...base.queryParameters,
      ...params,
    });
  }

  Map<String, String> _authHeaders(String accessToken) => {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer $accessToken',
      };

  static const _jsonHeaders = {'Content-Type': 'application/json'};

  Map<String, dynamic> _decode(http.Response response) {
    if (response.statusCode >= 200 && response.statusCode < 300) {
      return jsonDecode(response.body) as Map<String, dynamic>;
    }
    final body = jsonDecode(response.body) as Map<String, dynamic>?;
    throw BoardApiException(
      statusCode: response.statusCode,
      message: body?['error'] as String? ?? 'unknown error',
    );
  }

  @override
  Future<BoardPostPage> listPosts({
    String boardType = '',
    String query = '',
    String userId = '',
    int page = 1,
    int pageSize = 20,
  }) async {
    final params = <String, String>{
      'page': '$page',
      'page_size': '$pageSize',
    };
    if (boardType.isNotEmpty) params['board_type'] = boardType;
    if (query.isNotEmpty) params['q'] = query;

    final response = await _client.get(
      _uri('/posts', params),
      headers: _jsonHeaders,
    );
    final json = _decode(response);
    final posts = (json['posts'] as List<dynamic>)
        .map((e) => BoardPost.fromJson(e as Map<String, dynamic>))
        .toList();
    final pagination = BoardPagination.fromJson(
        json['pagination'] as Map<String, dynamic>? ?? {});
    return BoardPostPage(posts: posts, pagination: pagination);
  }

  @override
  Future<BoardPost> getPost({required String postId, String userId = ''}) async {
    final response = await _client.get(
      _uri('/posts/$postId'),
      headers: _jsonHeaders,
    );
    return BoardPost.fromJson(_decode(response));
  }

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
  }) async {
    final body = <String, dynamic>{
      'board_type': boardType,
      'title': title,
      'content': content,
      'image_urls': imageUrls,
    };
    if (locationName != null) {
      body['location_name'] = locationName;
      body['location_address'] = locationAddress ?? '';
      body['latitude'] = latitude ?? 0.0;
      body['longitude'] = longitude ?? 0.0;
    }
    final response = await _client.post(
      _uri('/posts'),
      headers: _authHeaders(accessToken),
      body: jsonEncode(body),
    );
    return BoardPost.fromJson(_decode(response));
  }

  @override
  Future<BoardPost> updatePost({
    required String postId,
    required String userId,
    String? title,
    String? content,
    bool updateImages = false,
    List<String> imageUrls = const [],
    required String accessToken,
  }) async {
    final body = <String, dynamic>{
      if (title != null) 'title': title,
      if (content != null) 'content': content,
      if (updateImages) 'update_images': true,
      if (updateImages) 'image_urls': imageUrls,
    };
    final response = await _client.put(
      _uri('/posts/$postId'),
      headers: _authHeaders(accessToken),
      body: jsonEncode(body),
    );
    return BoardPost.fromJson(_decode(response));
  }

  @override
  Future<void> deletePost({
    required String postId,
    required String accessToken,
  }) async {
    final response = await _client.delete(
      _uri('/posts/$postId'),
      headers: _authHeaders(accessToken),
    );
    if (response.statusCode != 204) {
      final body = jsonDecode(response.body) as Map<String, dynamic>?;
      throw BoardApiException(
        statusCode: response.statusCode,
        message: body?['error'] as String? ?? 'unknown error',
      );
    }
  }

  @override
  Future<({bool liked, int likeCount})> likePost({
    required String postId,
    required String accessToken,
  }) async {
    final response = await _client.post(
      _uri('/posts/$postId/like'),
      headers: _authHeaders(accessToken),
    );
    final json = _decode(response);
    return (
      liked: json['liked'] as bool? ?? false,
      likeCount: json['like_count'] as int? ?? 0,
    );
  }

  @override
  Future<BoardCommentPage> listComments({
    required String postId,
    String userId = '',
    int page = 1,
    int pageSize = 20,
  }) async {
    final response = await _client.get(
      _uri('/posts/$postId/comments', {
        'page': '$page',
        'page_size': '$pageSize',
      }),
      headers: _jsonHeaders,
    );
    final json = _decode(response);
    final comments = (json['comments'] as List<dynamic>)
        .map((e) => BoardComment.fromJson(e as Map<String, dynamic>))
        .toList();
    final pagination = BoardPagination.fromJson(
        json['pagination'] as Map<String, dynamic>? ?? {});
    return BoardCommentPage(comments: comments, pagination: pagination);
  }

  @override
  Future<BoardComment> createComment({
    required String postId,
    required String content,
    String parentCommentId = '',
    required String accessToken,
  }) async {
    final response = await _client.post(
      _uri('/posts/$postId/comments'),
      headers: _authHeaders(accessToken),
      body: jsonEncode({
        'content': content,
        if (parentCommentId.isNotEmpty)
          'parent_comment_id': parentCommentId,
      }),
    );
    return BoardComment.fromJson(_decode(response));
  }

  @override
  Future<BoardComment> updateComment({
    required String commentId,
    required String content,
    required String accessToken,
  }) async {
    final response = await _client.put(
      _uri('/comments/$commentId'),
      headers: _authHeaders(accessToken),
      body: jsonEncode({'content': content}),
    );
    return BoardComment.fromJson(_decode(response));
  }

  @override
  Future<void> deleteComment({
    required String commentId,
    required String accessToken,
  }) async {
    final response = await _client.delete(
      _uri('/comments/$commentId'),
      headers: _authHeaders(accessToken),
    );
    if (response.statusCode != 204) {
      final body = jsonDecode(response.body) as Map<String, dynamic>?;
      throw BoardApiException(
        statusCode: response.statusCode,
        message: body?['error'] as String? ?? 'unknown error',
      );
    }
  }

  @override
  Future<({bool liked, int likeCount})> likeComment({
    required String commentId,
    required String accessToken,
  }) async {
    final response = await _client.post(
      _uri('/comments/$commentId/like'),
      headers: _authHeaders(accessToken),
    );
    final json = _decode(response);
    return (
      liked: json['liked'] as bool? ?? false,
      likeCount: json['like_count'] as int? ?? 0,
    );
  }

  void dispose() => _client.close();
}

class BoardApiException implements Exception {
  const BoardApiException({required this.statusCode, required this.message});

  final int statusCode;
  final String message;

  @override
  String toString() => 'BoardApiException($statusCode): $message';
}
