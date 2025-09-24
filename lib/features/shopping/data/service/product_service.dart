import 'package:e_commerce_app/core/services/api_service.dart';
import '../model/product_model.dart';
import '../../domain/entity/product_entity.dart';

class ProductService {
  final ApiService _api;
  ProductService(this._api);

  Future<ProductEntity> getProductById(String id) async {
    final data = await _api.get(endPoint: 'products/$id', token: null);
    final json = (data is Map && data.containsKey('data'))
        ? data['data']
        : data;
    final model = ProductModel.fromJson(json);
    return model.toEntity();
  }
}
