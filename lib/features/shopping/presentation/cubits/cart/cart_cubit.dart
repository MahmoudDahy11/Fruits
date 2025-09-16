import 'package:bloc/bloc.dart';
import 'package:e_commerce_app/features/shopping/domain/entity/cart_entity.dart';
import 'package:equatable/equatable.dart';
import '../../../domain/entity/product_entity.dart';
import '../../../domain/repo/cart_repository.dart';

part 'cart_state.dart';

class CartCubit extends Cubit<CartState> {
  final CartRepository repository;
  CartCubit(this.repository) : super(const CartState());

  Future<void> loadCart() async {
    final items = await repository.getCart();
    emit(state.copyWith(items: items, total: _calculateTotal(items)));
  }

  Future<void> addProduct(ProductEntity product) async {
    await repository.addProduct(product);
    await loadCart();
  }

  Future<void> removeProduct(int productId) async {
    await repository.removeProduct(productId);
    await loadCart();
  }

  Future<void> increaseQuantity(int productId) async {
    final item = state.items.firstWhere((i) => i.product.id == productId);
    await repository.updateQuantity(productId, item.quantity + 1);
    await loadCart();
  }

  Future<void> decreaseQuantity(int productId) async {
    final item = state.items.firstWhere((i) => i.product.id == productId);
    final newQty = item.quantity - 1;
    if (newQty > 0) {
      await repository.updateQuantity(productId, newQty);
    } else {
      await repository.removeProduct(productId);
    }
    await loadCart();
  }

  Future<void> clearCart() async {
    await repository.clearCart();
    await loadCart();
  }

  double _calculateTotal(List<CartItemEntity> items) {
    return items.fold(
      0.0,
      (total, e) => total + (e.product.price * e.quantity),
    );
  }
}
