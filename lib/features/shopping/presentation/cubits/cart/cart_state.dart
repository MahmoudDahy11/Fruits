part of 'cart_cubit.dart';

class CartState extends Equatable {
  final List<CartItemEntity> items;
  final double total;

  const CartState({
    this.items = const [],
    this.total = 0.0,
  });

  CartState copyWith({
    List<CartItemEntity>? items,
    double? total,
  }) {
    return CartState(
      items: items ?? this.items,
      total: total ?? this.total,
    );
  }

  @override
  List<Object?> get props => [items, total];
}
