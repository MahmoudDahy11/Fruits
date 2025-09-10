import 'package:dartz/dartz.dart';
import 'package:e_commerce_app/core/errors/failure.dart';
import 'package:e_commerce_app/features/shopping/domain/entity/product_entity.dart';

/*
 * ProductRepo interface
 * defines the contract for product repository
 * includes methods for CRUD operations
 */
abstract class ProductRepo {
  Future<Either<CustomFailure, List<ProductEntity>>> get({
    required String endPoint,
    String? token,
  });

  Future<Either<CustomFailure, ProductEntity>> post({
    required String endPoint,
    String? token,
    Map<String, dynamic>? body,
  });



  Future<Either<CustomFailure, ProductEntity>> put({
    required String endPoint,
    String? token,
    Map<String, dynamic>? body,
  });

  Future<Either<CustomFailure, ProductEntity>> patch({
    required String endPoint,
    String? token,
    Map<String, dynamic>? body,
  });

  Future<Either<CustomFailure, Unit>> delete({
    required String endPoint,
    String? token,
    Map<String, dynamic>? body,
  });
}
