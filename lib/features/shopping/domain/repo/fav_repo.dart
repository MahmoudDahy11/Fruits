import '../../domain/entity/product_entity.dart';

abstract class FavoriteRepository {
  Future<void> addToFavorite(ProductEntity product);
  Future<void> removeFromFavorite(int productId);
  Future<List<ProductEntity>> getFavorites();
}
