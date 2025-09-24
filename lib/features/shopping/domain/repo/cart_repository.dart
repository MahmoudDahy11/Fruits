import '../entity/cart_entity.dart';

abstract class CartRepository {
  Future<List<CartItemEntity>> getCart();
  Future<void> addProduct(CartItemEntity item);
  Future<void> removeProduct(String productId);
  Future<void> increaseQuantity(String productId);
  Future<void> decreaseQuantity(String productId);
  Future<void> clearCart();
}
