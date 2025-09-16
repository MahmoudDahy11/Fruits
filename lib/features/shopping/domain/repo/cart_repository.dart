import '../entity/cart_entity.dart';
import '../entity/product_entity.dart';

abstract class CartRepository {
  Future<List<CartItemEntity>> getCart();
  Future<void> addProduct(ProductEntity product);
  Future<void> removeProduct(int productId);
  Future<void> updateQuantity(int productId, int quantity);
  Future<void> clearCart();
}
