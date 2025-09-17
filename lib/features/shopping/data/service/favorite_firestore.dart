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
        .set(product.toJson());
  }

  Future<void> removeFavorite(int productId) async {
    await firestore.collection('favorites').doc(productId.toString()).delete();
  }

  Future<List<ProductModel>> getFavorites() async {
    final snapshot = await firestore.collection('favorites').get();
    return snapshot.docs
        .map((doc) => ProductModel.fromJson(doc.data()))
        .toList();
  }
}
