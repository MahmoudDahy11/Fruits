import '../../domain/entity/product_entity.dart';

abstract class FavoriteRepository {
  Future<void> addToFavorite(ProductEntity product);
  Future<void> removeFromFavorite(String productId);
  Future<List<ProductEntity>> getFavorites();
}
