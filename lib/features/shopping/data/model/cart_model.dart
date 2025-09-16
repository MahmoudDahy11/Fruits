import '../../domain/entity/cart_entity.dart';
import 'product_model.dart';

class CartItemModel {
  final ProductModel product;
  final int quantity;

  CartItemModel({required this.product, required this.quantity});

  factory CartItemModel.fromJson(json) {
    return CartItemModel(
      product: ProductModel.fromJson(
        Map<String, dynamic>.from(json['product'] as Map),
      ),
      quantity: (json['quantity'] ?? 1) as int,
    );
  }

  Map<String, dynamic> toJson() {
    return {'product': product.toJson(), 'quantity': quantity};
  }

  CartItemEntity toEntity() {
    return CartItemEntity(product: product.toEntity(), quantity: quantity);
  }

  factory CartItemModel.fromEntity(CartItemEntity entity) {
    return CartItemModel(
      product: ProductModel.fromEntity(entity.product),
      quantity: entity.quantity,
    );
  }
}
