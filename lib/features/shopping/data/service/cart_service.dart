// features/shopping/data/service/cart_service.dart
import 'package:cloud_firestore/cloud_firestore.dart';
import '../../domain/entity/cart_entity.dart';
import '../model/cart_model.dart';

class CartFirestoreService {
  final CollectionReference _cartRef =
  FirebaseFirestore.instance.collection('cart');

  Future<List<CartItemEntity>> getCart() async {
    final snapshot = await _cartRef.get();
    final List<CartItemEntity> items = [];
    for (final doc in snapshot.docs) {
      final data = doc.data() as Map<String, dynamic>;
      try {
        final model = CartItemModel.fromJson(data);
        items.add(model.toEntity());
      } catch (_) {
        // if JSON shape differs, try to parse using doc fields
        final productJson = data['product'] as Map<String, dynamic>? ?? {};
        final qty = (data['quantity'] ?? 1) as int;
        final model = CartItemModel.fromJson({'product': productJson, 'quantity': qty});
        items.add(model.toEntity());
      }
    }
    return items;
  }

  Future<void> addProduct(CartItemEntity item) async {
    await _cartRef.doc(item.product.id).set(item.toJson());
  }

  Future<void> removeProduct(String productId) async {
    await _cartRef.doc(productId).delete();
  }

  Future<void> increaseQuantity(String productId) async {
    final doc = await _cartRef.doc(productId).get();
    if (doc.exists) {
      final data = doc.data() as Map<String, dynamic>;
      final current = (data['quantity'] ?? 1) as int;
      await _cartRef.doc(productId).update({'quantity': current + 1});
    }
  }

  Future<void> decreaseQuantity(String productId) async {
    final doc = await _cartRef.doc(productId).get();
    if (doc.exists) {
      final data = doc.data() as Map<String, dynamic>;
      final current = (data['quantity'] ?? 1) as int;
      if (current > 1) {
        await _cartRef.doc(productId).update({'quantity': current - 1});
      }
    }
  }

  Future<void> clearCart() async {
    final snapshot = await _cartRef.get();
    final batch = FirebaseFirestore.instance.batch();
    for (final doc in snapshot.docs) {
      batch.delete(doc.reference);
    }
    await batch.commit();
  }
}
