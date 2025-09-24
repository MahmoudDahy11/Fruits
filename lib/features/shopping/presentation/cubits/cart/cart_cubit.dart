import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../domain/entity/cart_entity.dart';
import '../../../domain/entity/product_entity.dart';
import '../../../domain/repo/cart_repository.dart';
import 'cart_state.dart';

class CartCubit extends Cubit<CartState> {
  final CartRepository cartRepository;

  CartCubit(this.cartRepository) : super(CartInitial());

  Future<void> loadCart() async {
    try {
      emit(CartLoading());
      final items = await cartRepository.getCart();
      emit(CartLoaded(items));
    } catch (e) {
      emit(CartError(e.toString()));
    }
  }

  Future<void> addProduct(ProductEntity product) async {
    try {
      if (state is CartLoaded) {
        final items = List<CartItemEntity>.from((state as CartLoaded).items);
        final index = items.indexWhere((e) => e.product.id == product.id);
        if (index >= 0) {
          items[index] =
              items[index].copyWith(quantity: items[index].quantity + 1);
        } else {
          items.add(CartItemEntity(product: product, quantity: 1));
        }
        emit(CartLoaded(items));
      } else {
        final items = [CartItemEntity(product: product, quantity: 1)];
        emit(CartLoaded(items));
      }
      await cartRepository.addProduct(CartItemEntity(product: product, quantity: 1));
    } catch (e) {
      emit(CartError(e.toString()));
    }
  }

  Future<void> decreaseQuantity(String productId) async {
    if (state is CartLoaded) {
      final items = List<CartItemEntity>.from((state as CartLoaded).items);
      final index = items.indexWhere((e) => e.product.id == productId);
      if (index >= 0 && items[index].quantity > 1) {
        items[index] =
            items[index].copyWith(quantity: items[index].quantity - 1);
        emit(CartLoaded(items));
        await cartRepository.decreaseQuantity(productId);
      }
    }
  }

  Future<void> removeProduct(String productId) async {
    if (state is CartLoaded) {
      final items = List<CartItemEntity>.from((state as CartLoaded).items)
        ..removeWhere((e) => e.product.id == productId);
      emit(CartLoaded(items));
      await cartRepository.removeProduct(productId);
    }
  }

  Future<void> increaseQuantity(String productId) async {
    if (state is CartLoaded) {
      final items = List<CartItemEntity>.from((state as CartLoaded).items);
      final index = items.indexWhere((e) => e.product.id == productId);
      if (index >= 0) {
        items[index] =
            items[index].copyWith(quantity: items[index].quantity + 1);
        emit(CartLoaded(items));
        await cartRepository.increaseQuantity(productId);
      }
    }
  }
}
