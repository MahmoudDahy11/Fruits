import 'package:dartz/dartz.dart';
import 'package:e_commerce_app/core/errors/failure.dart';
import 'package:e_commerce_app/core/services/api_service.dart';
import 'package:e_commerce_app/features/shopping/domain/entity/product_entity.dart';
import 'package:e_commerce_app/features/shopping/domain/repo/product_repo.dart';

import '../model/product_model.dart';

/*
 * ProductRepoImplement class
 * implements ProductRepo interface
 * uses ApiService to perform API calls
 */
class ProductRepoImplement implements ProductRepo {
  final ApiService _apiService;
  ProductRepoImplement(this._apiService);
  /*
   * delete method implementation
   * returns Either<CustomFailure, Unit>
   * on success returns Right(unit)
   * delete method deletes a product and returns unit on success
   */
  @override
  Future<Either<CustomFailure, Unit>> delete({
    required String endPoint,
    String? token,
    Map<String, dynamic>? body,
  }) async {
    try {
      await _apiService.delete(endPoint: endPoint, token: token, body: body);
      return const Right(unit);
    } on CustomFailure catch (failure) {
      return Left(failure);
    } catch (e) {
      return Left(CustomFailure(errMessage: e.toString()));
    }
  }

  /*
   * get method implementation
   * returns Either<CustomFailure, List<ProductEntity>>
   * on success returns Right(List<ProductEntity>)
   * get method fetches a list of products from the API and converts them to ProductEntity
   */
  @override
  Future<Either<CustomFailure, List<ProductEntity>>> get({
    required String endPoint,
    String? token,
  }) async {
    try {
      final data = await _apiService.get(endPoint: endPoint, token: token);
      List<ProductEntity> products = [];
      for (var item in data as List) {
        final model = ProductModel.fromJson(item);
        products.add(model.toEntity());
      }

      return Right(products);
    } on CustomFailure catch (failure) {
      return Left(failure);
    } catch (e) {
      return Left(CustomFailure(errMessage: e.toString()));
    }
  }

  /*
   * post method implementation
   * returns Either<CustomFailure, ProductEntity>
   * on success returns Right(ProductEntity)
   * post method creates a new product and returns the created product entity
   */
  @override
  Future<Either<CustomFailure, ProductEntity>> patch({
    required String endPoint,
    String? token,
    Map<String, dynamic>? body,
  }) async {
    try {
      final data = await _apiService.patch(
        endPoint: endPoint,
        token: token,
        body: body,
      );

      final productModel = ProductModel.fromJson(data);
      final productEntity = productModel.toEntity();

      return Right(productEntity);
    } on CustomFailure catch (failure) {
      return Left(failure);
    } catch (e) {
      return Left(CustomFailure(errMessage: e.toString()));
    }
  }

  /*
   * post method implementation
   * returns Either<CustomFailure, ProductEntity>
   * on success returns Right(ProductEntity)
   * post method creates a new product and returns the created product entity
   */
  @override
  Future<Either<CustomFailure, ProductEntity>> post({
    required String endPoint,
    String? token,
    Map<String, dynamic>? body,
  }) async {
    try {
      final data = await _apiService.post(
        endPoint: endPoint,
        token: token,
        body: body,
      );

      final productModel = ProductModel.fromJson(data);
      final productEntity = productModel.toEntity();

      return Right(productEntity);
    } on CustomFailure catch (failure) {
      return Left(failure);
    } catch (e) {
      return Left(CustomFailure(errMessage: e.toString()));
    }
  }

  /*
   * put method implementation
   * returns Either<CustomFailure, ProductEntity>
   * on success returns Right(ProductEntity)
   * put method updates a product and returns the updated product entity
   */
  @override
  Future<Either<CustomFailure, ProductEntity>> put({
    required String endPoint,
    String? token,
    Map<String, dynamic>? body,
  }) async {
    try {
      final data = await _apiService.put(
        endPoint: endPoint,
        token: token,
        body: body,
      );
      final ProductModel productModel = ProductModel.fromJson(data);
      final ProductEntity productEntity = productModel.toEntity();
      return Right(productEntity);
    } on CustomFailure catch (failure) {
      return Left(failure);
    } catch (e) {
      return Left(CustomFailure(errMessage: e.toString()));
    }
  }
}
