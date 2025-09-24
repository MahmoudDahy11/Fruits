import 'package:cloud_firestore/cloud_firestore.dart';
import '../../data/model/product_model.dart';

class FavoriteFirestoreService {
  final FirebaseFirestore firestore;

  FavoriteFirestoreService({FirebaseFirestore? firestore})
      : firestore = firestore ?? FirebaseFirestore.instance;

  Future<void> addFavorite(ProductModel product) async {
    await firestore
        .collection('favorites')
        .doc(product.id.toString())
        .set(product.toJson(), SetOptions(merge: true)); // 👈 يضمن إن البيانات تتحدث بدل ما تتكتب من الأول
  }

  Future<void> removeFavorite(String productId) async {
    await firestore.collection('favorites').doc(productId).delete();
  }

  Future<List<ProductModel>> getFavorites() async {
    final snapshot = await firestore.collection('favorites').get();
    return snapshot.docs.map((doc) {
      final data = doc.data();
      // 👇 نضيف الـ id جوة الماب عشان Model يبقى consistent
      return ProductModel.fromJson({...data, 'id': doc.id});
    }).toList();
  }
}
