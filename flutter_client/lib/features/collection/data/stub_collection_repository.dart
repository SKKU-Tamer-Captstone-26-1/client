import 'package:flutter/foundation.dart';

import 'collection_repository.dart';

/// Placeholder until collection-service is implemented.
/// Replace with real HTTP/gRPC implementation when ready.
class StubCollectionRepository implements CollectionRepository {
  const StubCollectionRepository();

  @override
  Future<void> addToCart({
    required String beverageId,
    required String nameKo,
    required String nameEn,
    required int priceKrw,
    required String placeId,
  }) async {
    // TODO: POST to collection-service when available
    debugPrint(
      '[Collection] addToCart — beverageId=$beverageId '
      'name=$nameKo placeId=$placeId price=$priceKrw',
    );
  }
}
