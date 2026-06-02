import 'package:flutter/foundation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../auth/providers/auth_provider.dart';
import '../data/board_remote_data_source.dart';
import '../data/board_repository.dart';
import '../models/board_models.dart';

final boardRemoteDataSourceProvider = Provider<BoardRemoteDataSource>(
  (ref) => GrpcBoardRemoteDataSource(),
);

final boardRepositoryProvider = Provider<BoardRepository>(
  (ref) => GrpcBoardRepository(ref.watch(boardRemoteDataSourceProvider)),
);

final boardPostsProvider = FutureProvider<List<BoardPost>>((ref) async {
  final repo = ref.watch(boardRepositoryProvider);
  final authToken = ref.watch(authProvider).accessToken ?? '';
  try {
    return await repo.listPosts(authToken: authToken);
  } catch (e) {
    if (kDebugMode) debugPrint('BOARD_LIST_FAILED: $e');
    rethrow;
  }
});

final boardCommentsProvider = FutureProvider.autoDispose
    .family<List<BoardComment>, String>((ref, postId) async {
  final repo = ref.watch(boardRepositoryProvider);
  final authToken = ref.watch(authProvider).accessToken ?? '';
  try {
    return await repo.listComments(postId: postId, authToken: authToken);
  } catch (e) {
    if (kDebugMode) debugPrint('BOARD_COMMENTS_FAILED: $e');
    rethrow;
  }
});
