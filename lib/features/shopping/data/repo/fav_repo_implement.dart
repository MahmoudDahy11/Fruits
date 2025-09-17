import '../../domain/entity/product_entity.dart';
import '../../data/model/product_model.dart';
import '../../domain/repo/fav_repo.dart';
import '../service/favorite_firestore.dart';

class FavoriteRepositoryImpl implements FavoriteRepository {
  final FavoriteFirestoreService service;

  FavoriteRepositoryImpl(this.service);

  @override
  Future<void> addToFavorite(ProductEntity product) async {
    final model = ProductModel.fromEntity(product);
    await service.addFavorite(model);
  }

  @override
  Future<void> removeFromFavorite(int productId) async {
    await service.removeFavorite(productId);
  }

  @override
  Future<List<ProductEntity>> getFavorites() async {
    final models = await service.getFavorites();
    return models.map((m) => m.toEntity()).toList();
  }
}
