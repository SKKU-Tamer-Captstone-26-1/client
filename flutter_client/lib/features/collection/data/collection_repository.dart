abstract class CollectionRepository {
  /// Add a beverage to the user's cart.
  ///
  /// [beverageId] — canonical UUID from recommendation-service beverage_items
  /// [nameKo]    — Korean display name
  /// [nameEn]    — English display name
  /// [priceKrw]  — price at this specific liquor shop (0 = varies)
  /// [placeId]   — map-service marker ID of the liquor shop
  Future<void> addToCart({
    required String beverageId,
    required String nameKo,
    required String nameEn,
    required int priceKrw,
    required String placeId,
  });
}
