// features/shopping/data/repo/cart_repository_implement.dart
import '../../domain/entity/cart_entity.dart';
import '../../domain/entity/product_entity.dart';
import '../../domain/repo/cart_repository.dart';
import '../service/cart_service.dart';

class CartRepositoryImpl implements CartRepository {
  final CartFirestoreService _service;
  CartRepositoryImpl({CartFirestoreService? service}) : _service = service ?? CartFirestoreService();

  @override
  Future<void> addProduct(ProductEntity product) async {
    await _service.addProduct(product);
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
  Future<void> removeProduct(int productId) async {
    await _service.removeProduct(productId);
  }

  @override
  Future<void> updateQuantity(int productId, int quantity) async {
    await _service.updateQuantity(productId, quantity);
  }
}
