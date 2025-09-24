import '../../../domain/entity/cart_entity.dart';

abstract class CartState {}

class CartInitial extends CartState {}

class CartLoading extends CartState {}

class CartLoaded extends CartState {
  final List<CartItemEntity> items;
  final double total;

  CartLoaded(this.items)
      : total = items.fold(0.0, (sum, item) => sum + item.totalPrice);
}

class CartError extends CartState {
  final String message;
  CartError(this.message);
}
