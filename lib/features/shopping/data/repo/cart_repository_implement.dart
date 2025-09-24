import '../../domain/entity/cart_entity.dart';
import '../../domain/repo/cart_repository.dart';
import '../service/cart_service.dart';

class CartRepositoryImpl implements CartRepository {
  final CartFirestoreService _service;
  CartRepositoryImpl(this._service);

  @override
  Future<void> addProduct(CartItemEntity item) async {
    await _service.addProduct(item);
  }

  @override
  Future<void> clearCart() async {
    await _service.clearCart();
  }

  @override
  Future<List<CartItemEntity>> getCart() async {
    return await _service.getCart();
  }

  @override
  Future<void> removeProduct(String productId) async {
    await _service.removeProduct(productId);
  }

  @override
  Future<void> increaseQuantity(String productId) async {
    await _service.increaseQuantity(productId);
  }

  @override
  Future<void> decreaseQuantity(String productId) async {
    await _service.decreaseQuantity(productId);
  }
}
