// features/shopping/domain/entity/cart_entity.dart
import 'product_entity.dart';

class CartItemEntity {
  final ProductEntity product;
  final int quantity;

  CartItemEntity({required this.product, this.quantity = 1});

  CartItemEntity copyWith({ProductEntity? product, int? quantity}) {
    return CartItemEntity(
      product: product ?? this.product,
      quantity: quantity ?? this.quantity,
    );
  }

  double get totalPrice => product.price * quantity;

  Map<String, dynamic> toJson() {
    return {'product': product.toJson(), 'quantity': quantity};
  }

  factory CartItemEntity.fromJson(Map<String, dynamic> json) {
    return CartItemEntity(
      product: ProductEntity.fromJson(
        Map<String, dynamic>.from(json['product'] ?? {}),
      ),
      quantity: (json['quantity'] ?? 1) as int,
    );
  }
}
