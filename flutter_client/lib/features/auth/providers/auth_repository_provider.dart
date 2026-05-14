import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../data/auth_remote_data_source.dart';
import '../data/auth_repository.dart';

final authRemoteDataSourceProvider = Provider<AuthRemoteDataSource>(
  (ref) => HttpAuthRemoteDataSource(),
);

final authRepositoryProvider = Provider<AuthRepository>(
  (ref) => AuthRepository(ref.watch(authRemoteDataSourceProvider)),
);
