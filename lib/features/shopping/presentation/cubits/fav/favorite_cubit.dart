import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../domain/entity/product_entity.dart';
import '../../../domain/repo/fav_repo.dart';

part 'favorite_state.dart';

class FavoriteCubit extends Cubit<FavoriteState> {
  final FavoriteRepository repository;

  FavoriteCubit(this.repository) : super(FavoriteInitial());

  Future<void> loadFavorites() async {
    emit(FavoriteLoading());
    try {
      final favorites = await repository.getFavorites();
      emit(FavoriteUpdated(favorites: favorites));
    } catch (e) {
      emit(FavoriteError(e.toString()));
    }
  }

  Future<void> toggleFavorite(ProductEntity product, bool isFav) async {
    try {
      final currentFavorites = state is FavoriteUpdated
          ? List<ProductEntity>.from((state as FavoriteUpdated).favorites)
          : <ProductEntity>[];

      if (isFav) {
        await repository.removeFromFavorite(product.id);
        currentFavorites.removeWhere((p) => p.id == product.id);
      } else {
        await repository.addToFavorite(product);
        currentFavorites.add(product);
      }

      emit(FavoriteUpdated(favorites: currentFavorites));
    } catch (e) {
      emit(FavoriteError(e.toString()));
    }
  }
}
