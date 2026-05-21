//
//  Generated code. Do not modify.
//  source: board/v1/board.proto
//
// @dart = 2.12

// ignore_for_file: annotate_overrides, camel_case_types, comment_references
// ignore_for_file: constant_identifier_names, library_prefixes
// ignore_for_file: non_constant_identifier_names, prefer_final_fields
// ignore_for_file: unnecessary_import, unnecessary_this, unused_import

import 'dart:async' as $async;
import 'dart:core' as $core;

import 'package:grpc/service_api.dart' as $grpc;
import 'package:protobuf/protobuf.dart' as $pb;

import 'board.pb.dart' as $0;

export 'board.pb.dart';

@$pb.GrpcServiceName('ontheblock.board.v1.BoardService')
class BoardServiceClient extends $grpc.Client {
  static final _$createPost = $grpc.ClientMethod<$0.CreatePostRequest, $0.CreatePostResponse>(
      '/ontheblock.board.v1.BoardService/CreatePost',
      ($0.CreatePostRequest value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $0.CreatePostResponse.fromBuffer(value));
  static final _$getPost = $grpc.ClientMethod<$0.GetPostRequest, $0.GetPostResponse>(
      '/ontheblock.board.v1.BoardService/GetPost',
      ($0.GetPostRequest value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $0.GetPostResponse.fromBuffer(value));
  static final _$updatePost = $grpc.ClientMethod<$0.UpdatePostRequest, $0.UpdatePostResponse>(
      '/ontheblock.board.v1.BoardService/UpdatePost',
      ($0.UpdatePostRequest value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $0.UpdatePostResponse.fromBuffer(value));
  static final _$deletePost = $grpc.ClientMethod<$0.DeletePostRequest, $0.DeletePostResponse>(
      '/ontheblock.board.v1.BoardService/DeletePost',
      ($0.DeletePostRequest value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $0.DeletePostResponse.fromBuffer(value));
  static final _$listPosts = $grpc.ClientMethod<$0.ListPostsRequest, $0.ListPostsResponse>(
      '/ontheblock.board.v1.BoardService/ListPosts',
      ($0.ListPostsRequest value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $0.ListPostsResponse.fromBuffer(value));
  static final _$likePost = $grpc.ClientMethod<$0.LikePostRequest, $0.LikePostResponse>(
      '/ontheblock.board.v1.BoardService/LikePost',
      ($0.LikePostRequest value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $0.LikePostResponse.fromBuffer(value));
  static final _$pinPost = $grpc.ClientMethod<$0.PinPostRequest, $0.PinPostResponse>(
      '/ontheblock.board.v1.BoardService/PinPost',
      ($0.PinPostRequest value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $0.PinPostResponse.fromBuffer(value));
  static final _$createComment = $grpc.ClientMethod<$0.CreateCommentRequest, $0.CreateCommentResponse>(
      '/ontheblock.board.v1.BoardService/CreateComment',
      ($0.CreateCommentRequest value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $0.CreateCommentResponse.fromBuffer(value));
  static final _$updateComment = $grpc.ClientMethod<$0.UpdateCommentRequest, $0.UpdateCommentResponse>(
      '/ontheblock.board.v1.BoardService/UpdateComment',
      ($0.UpdateCommentRequest value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $0.UpdateCommentResponse.fromBuffer(value));
  static final _$deleteComment = $grpc.ClientMethod<$0.DeleteCommentRequest, $0.DeleteCommentResponse>(
      '/ontheblock.board.v1.BoardService/DeleteComment',
      ($0.DeleteCommentRequest value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $0.DeleteCommentResponse.fromBuffer(value));
  static final _$listComments = $grpc.ClientMethod<$0.ListCommentsRequest, $0.ListCommentsResponse>(
      '/ontheblock.board.v1.BoardService/ListComments',
      ($0.ListCommentsRequest value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $0.ListCommentsResponse.fromBuffer(value));
  static final _$likeComment = $grpc.ClientMethod<$0.LikeCommentRequest, $0.LikeCommentResponse>(
      '/ontheblock.board.v1.BoardService/LikeComment',
      ($0.LikeCommentRequest value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $0.LikeCommentResponse.fromBuffer(value));
  static final _$reportPost = $grpc.ClientMethod<$0.ReportPostRequest, $0.ReportPostResponse>(
      '/ontheblock.board.v1.BoardService/ReportPost',
      ($0.ReportPostRequest value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $0.ReportPostResponse.fromBuffer(value));
  static final _$reportComment = $grpc.ClientMethod<$0.ReportCommentRequest, $0.ReportCommentResponse>(
      '/ontheblock.board.v1.BoardService/ReportComment',
      ($0.ReportCommentRequest value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $0.ReportCommentResponse.fromBuffer(value));

  BoardServiceClient($grpc.ClientChannel channel,
      {$grpc.CallOptions? options,
      $core.Iterable<$grpc.ClientInterceptor>? interceptors})
      : super(channel, options: options,
        interceptors: interceptors);

  $grpc.ResponseFuture<$0.CreatePostResponse> createPost($0.CreatePostRequest request, {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$createPost, request, options: options);
  }

  $grpc.ResponseFuture<$0.GetPostResponse> getPost($0.GetPostRequest request, {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$getPost, request, options: options);
  }

  $grpc.ResponseFuture<$0.UpdatePostResponse> updatePost($0.UpdatePostRequest request, {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$updatePost, request, options: options);
  }

  $grpc.ResponseFuture<$0.DeletePostResponse> deletePost($0.DeletePostRequest request, {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$deletePost, request, options: options);
  }

  $grpc.ResponseFuture<$0.ListPostsResponse> listPosts($0.ListPostsRequest request, {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$listPosts, request, options: options);
  }

  $grpc.ResponseFuture<$0.LikePostResponse> likePost($0.LikePostRequest request, {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$likePost, request, options: options);
  }

  $grpc.ResponseFuture<$0.PinPostResponse> pinPost($0.PinPostRequest request, {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$pinPost, request, options: options);
  }

  $grpc.ResponseFuture<$0.CreateCommentResponse> createComment($0.CreateCommentRequest request, {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$createComment, request, options: options);
  }

  $grpc.ResponseFuture<$0.UpdateCommentResponse> updateComment($0.UpdateCommentRequest request, {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$updateComment, request, options: options);
  }

  $grpc.ResponseFuture<$0.DeleteCommentResponse> deleteComment($0.DeleteCommentRequest request, {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$deleteComment, request, options: options);
  }

  $grpc.ResponseFuture<$0.ListCommentsResponse> listComments($0.ListCommentsRequest request, {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$listComments, request, options: options);
  }

  $grpc.ResponseFuture<$0.LikeCommentResponse> likeComment($0.LikeCommentRequest request, {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$likeComment, request, options: options);
  }

  $grpc.ResponseFuture<$0.ReportPostResponse> reportPost($0.ReportPostRequest request, {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$reportPost, request, options: options);
  }

  $grpc.ResponseFuture<$0.ReportCommentResponse> reportComment($0.ReportCommentRequest request, {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$reportComment, request, options: options);
  }
}

@$pb.GrpcServiceName('ontheblock.board.v1.BoardService')
abstract class BoardServiceBase extends $grpc.Service {
  $core.String get $name => 'ontheblock.board.v1.BoardService';

  BoardServiceBase() {
    $addMethod($grpc.ServiceMethod<$0.CreatePostRequest, $0.CreatePostResponse>(
        'CreatePost',
        createPost_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $0.CreatePostRequest.fromBuffer(value),
        ($0.CreatePostResponse value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$0.GetPostRequest, $0.GetPostResponse>(
        'GetPost',
        getPost_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $0.GetPostRequest.fromBuffer(value),
        ($0.GetPostResponse value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$0.UpdatePostRequest, $0.UpdatePostResponse>(
        'UpdatePost',
        updatePost_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $0.UpdatePostRequest.fromBuffer(value),
        ($0.UpdatePostResponse value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$0.DeletePostRequest, $0.DeletePostResponse>(
        'DeletePost',
        deletePost_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $0.DeletePostRequest.fromBuffer(value),
        ($0.DeletePostResponse value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$0.ListPostsRequest, $0.ListPostsResponse>(
        'ListPosts',
        listPosts_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $0.ListPostsRequest.fromBuffer(value),
        ($0.ListPostsResponse value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$0.LikePostRequest, $0.LikePostResponse>(
        'LikePost',
        likePost_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $0.LikePostRequest.fromBuffer(value),
        ($0.LikePostResponse value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$0.PinPostRequest, $0.PinPostResponse>(
        'PinPost',
        pinPost_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $0.PinPostRequest.fromBuffer(value),
        ($0.PinPostResponse value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$0.CreateCommentRequest, $0.CreateCommentResponse>(
        'CreateComment',
        createComment_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $0.CreateCommentRequest.fromBuffer(value),
        ($0.CreateCommentResponse value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$0.UpdateCommentRequest, $0.UpdateCommentResponse>(
        'UpdateComment',
        updateComment_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $0.UpdateCommentRequest.fromBuffer(value),
        ($0.UpdateCommentResponse value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$0.DeleteCommentRequest, $0.DeleteCommentResponse>(
        'DeleteComment',
        deleteComment_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $0.DeleteCommentRequest.fromBuffer(value),
        ($0.DeleteCommentResponse value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$0.ListCommentsRequest, $0.ListCommentsResponse>(
        'ListComments',
        listComments_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $0.ListCommentsRequest.fromBuffer(value),
        ($0.ListCommentsResponse value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$0.LikeCommentRequest, $0.LikeCommentResponse>(
        'LikeComment',
        likeComment_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $0.LikeCommentRequest.fromBuffer(value),
        ($0.LikeCommentResponse value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$0.ReportPostRequest, $0.ReportPostResponse>(
        'ReportPost',
        reportPost_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $0.ReportPostRequest.fromBuffer(value),
        ($0.ReportPostResponse value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$0.ReportCommentRequest, $0.ReportCommentResponse>(
        'ReportComment',
        reportComment_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $0.ReportCommentRequest.fromBuffer(value),
        ($0.ReportCommentResponse value) => value.writeToBuffer()));
  }

  $async.Future<$0.CreatePostResponse> createPost_Pre($grpc.ServiceCall call, $async.Future<$0.CreatePostRequest> request) async {
    return createPost(call, await request);
  }

  $async.Future<$0.GetPostResponse> getPost_Pre($grpc.ServiceCall call, $async.Future<$0.GetPostRequest> request) async {
    return getPost(call, await request);
  }

  $async.Future<$0.UpdatePostResponse> updatePost_Pre($grpc.ServiceCall call, $async.Future<$0.UpdatePostRequest> request) async {
    return updatePost(call, await request);
  }

  $async.Future<$0.DeletePostResponse> deletePost_Pre($grpc.ServiceCall call, $async.Future<$0.DeletePostRequest> request) async {
    return deletePost(call, await request);
  }

  $async.Future<$0.ListPostsResponse> listPosts_Pre($grpc.ServiceCall call, $async.Future<$0.ListPostsRequest> request) async {
    return listPosts(call, await request);
  }

  $async.Future<$0.LikePostResponse> likePost_Pre($grpc.ServiceCall call, $async.Future<$0.LikePostRequest> request) async {
    return likePost(call, await request);
  }

  $async.Future<$0.PinPostResponse> pinPost_Pre($grpc.ServiceCall call, $async.Future<$0.PinPostRequest> request) async {
    return pinPost(call, await request);
  }

  $async.Future<$0.CreateCommentResponse> createComment_Pre($grpc.ServiceCall call, $async.Future<$0.CreateCommentRequest> request) async {
    return createComment(call, await request);
  }

  $async.Future<$0.UpdateCommentResponse> updateComment_Pre($grpc.ServiceCall call, $async.Future<$0.UpdateCommentRequest> request) async {
    return updateComment(call, await request);
  }

  $async.Future<$0.DeleteCommentResponse> deleteComment_Pre($grpc.ServiceCall call, $async.Future<$0.DeleteCommentRequest> request) async {
    return deleteComment(call, await request);
  }

  $async.Future<$0.ListCommentsResponse> listComments_Pre($grpc.ServiceCall call, $async.Future<$0.ListCommentsRequest> request) async {
    return listComments(call, await request);
  }

  $async.Future<$0.LikeCommentResponse> likeComment_Pre($grpc.ServiceCall call, $async.Future<$0.LikeCommentRequest> request) async {
    return likeComment(call, await request);
  }

  $async.Future<$0.ReportPostResponse> reportPost_Pre($grpc.ServiceCall call, $async.Future<$0.ReportPostRequest> request) async {
    return reportPost(call, await request);
  }

  $async.Future<$0.ReportCommentResponse> reportComment_Pre($grpc.ServiceCall call, $async.Future<$0.ReportCommentRequest> request) async {
    return reportComment(call, await request);
  }

  $async.Future<$0.CreatePostResponse> createPost($grpc.ServiceCall call, $0.CreatePostRequest request);
  $async.Future<$0.GetPostResponse> getPost($grpc.ServiceCall call, $0.GetPostRequest request);
  $async.Future<$0.UpdatePostResponse> updatePost($grpc.ServiceCall call, $0.UpdatePostRequest request);
  $async.Future<$0.DeletePostResponse> deletePost($grpc.ServiceCall call, $0.DeletePostRequest request);
  $async.Future<$0.ListPostsResponse> listPosts($grpc.ServiceCall call, $0.ListPostsRequest request);
  $async.Future<$0.LikePostResponse> likePost($grpc.ServiceCall call, $0.LikePostRequest request);
  $async.Future<$0.PinPostResponse> pinPost($grpc.ServiceCall call, $0.PinPostRequest request);
  $async.Future<$0.CreateCommentResponse> createComment($grpc.ServiceCall call, $0.CreateCommentRequest request);
  $async.Future<$0.UpdateCommentResponse> updateComment($grpc.ServiceCall call, $0.UpdateCommentRequest request);
  $async.Future<$0.DeleteCommentResponse> deleteComment($grpc.ServiceCall call, $0.DeleteCommentRequest request);
  $async.Future<$0.ListCommentsResponse> listComments($grpc.ServiceCall call, $0.ListCommentsRequest request);
  $async.Future<$0.LikeCommentResponse> likeComment($grpc.ServiceCall call, $0.LikeCommentRequest request);
  $async.Future<$0.ReportPostResponse> reportPost($grpc.ServiceCall call, $0.ReportPostRequest request);
  $async.Future<$0.ReportCommentResponse> reportComment($grpc.ServiceCall call, $0.ReportCommentRequest request);
}
