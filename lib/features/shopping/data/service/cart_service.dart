import 'package:cloud_firestore/cloud_firestore.dart';
import '../../domain/entity/cart_entity.dart';
import '../../domain/entity/product_entity.dart';
import '../model/cart_model.dart';

class CartFirestoreService {
  CartFirestoreService._();
  static final CartFirestoreService _instance = CartFirestoreService._();
  factory CartFirestoreService() => _instance;

  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  final String _collection = 'cart';

  Future<List<CartItemEntity>> getCart() async {
    final snapshot = await _firestore.collection(_collection).get();
    final List<CartItemEntity> items = [];
    for (final doc in snapshot.docs) {
      final data = doc.data();
      final model = CartItemModel.fromJson(data);
      items.add(model.toEntity());
    }
    return items;
  }

  Future<void> addProduct(ProductEntity product) async {
    final docId = product.id.toString();
    final docRef = _firestore.collection(_collection).doc(docId);

    final doc = await docRef.get();
    if (doc.exists) {
      final current = doc.data()!;
      final currentQty = (current['quantity'] ?? 1) as int;
      await docRef.update({'quantity': currentQty + 1});
    } else {
      final cartModel = CartItemModel.fromEntity(
        CartItemEntity(product: product, quantity: 1),
      );
      await docRef.set(cartModel.toJson());
    }
  }

  Future<void> removeProduct(int productId) async {
    final docId = productId.toString();
    await _firestore.collection(_collection).doc(docId).delete();
  }

  Future<void> updateQuantity(int productId, int quantity) async {
    final docId = productId.toString();
    final docRef = _firestore.collection(_collection).doc(docId);
    if (quantity <= 0) {
      await docRef.delete();
    } else {
      await docRef.update({'quantity': quantity});
    }
  }

  Future<void> clearCart() async {
    final snapshot = await _firestore.collection(_collection).get();
    final batch = _firestore.batch();
    for (final doc in snapshot.docs) {
      batch.delete(doc.reference);
    }
    await batch.commit();
  }
}
