part of 'favorite_cubit.dart';

abstract class FavoriteState {}

class FavoriteInitial extends FavoriteState {}

class FavoriteLoading extends FavoriteState {}

class FavoriteUpdated extends FavoriteState {
  final List<ProductEntity> favorites;

  FavoriteUpdated({required this.favorites});
}

class FavoriteError extends FavoriteState {
  final String message;

  FavoriteError(this.message);
}
