// core/services/api_service.dart
import 'package:dio/dio.dart';
import 'package:e_commerce_app/core/errors/custom_excption.dart';
import 'package:e_commerce_app/core/errors/failure.dart';
import 'package:flutter/material.dart';

/*
 * ApiService class
 * provides methods for making HTTP requests (GET, POST, PUT, PATCH, DELETE)
 * uses Dio package for network operations
 * handles authorization headers if a token is provided
 * throws CustomException on errors with appropriate messages
 */
class ApiService {
  final Dio _dio;
  ApiService(this._dio);

  final String _baseUrl = 'https://fruitapi-nu.vercel.app/api/';

  Future<dynamic> get({
    required String endPoint,
    @required String? token,
  }) async {
    try {
      Map<String, String> headers = {};
      if (token != null) {
        headers['Authorization'] = 'Bearer $token';
      }

      var response = await _dio.get(
        '$_baseUrl$endPoint',
        options: Options(headers: headers),
      );
      return response.data;
    } on DioException catch (e) {
      throw CustomException(
        errMessage: ServerFailure.fromDioException(e).errMessage,
      );
    } catch (e) {
      throw CustomException(errMessage: 'Unexpected error: $e');
    }
  }

  Future<dynamic> post({
    required String endPoint,
    @required String? token,
    Map<String, dynamic>? body,
  }) async {
    try {
      Map<String, String> headers = {};
      if (token != null) {
        headers['Authorization'] = 'Bearer $token';
      }

      var response = await _dio.post(
        '$_baseUrl$endPoint',
        data: body,
        options: Options(headers: headers),
      );
      return response.data;
    } on DioException catch (e) {
      throw CustomException(
        errMessage: ServerFailure.fromDioException(e).errMessage,
      );
    }
  }

  Future<dynamic> put({
    required String endPoint,
    @required String? token,
    Map<String, dynamic>? body,
  }) async {
    try {
      Map<String, String> headers = {};
      if (token != null) {
        headers['Authorization'] = 'Bearer $token';
      }

      var response = await _dio.put(
        '$_baseUrl$endPoint',
        data: body,
        options: Options(headers: headers),
      );
      return response.data;
    } on DioException catch (e) {
      throw CustomException(
        errMessage: ServerFailure.fromDioException(e).errMessage,
      );
    }
  }

  Future<dynamic> patch({
    required String endPoint,
    @required String? token,
    Map<String, dynamic>? body,
  }) async {
    try {
      Map<String, String> headers = {};
      if (token != null) {
        headers['Authorization'] = 'Bearer $token';
      }

      var response = await _dio.patch(
        '$_baseUrl$endPoint',
        data: body,
        options: Options(headers: headers),
      );
      return response.data;
    } on DioException catch (e) {
      throw CustomException(
        errMessage: ServerFailure.fromDioException(e).errMessage,
      );
    }
  }

  Future<dynamic> delete({
    required String endPoint,
    @required String? token,
    Map<String, dynamic>? body,
  }) async {
    try {
      Map<String, String> headers = {};
      if (token != null) {
        headers['Authorization'] = 'Bearer $token';
      }

      var response = await _dio.delete(
        '$_baseUrl$endPoint',
        data: body,
        options: Options(headers: headers),
      );
      return response.data;
    } on DioException catch (e) {
      throw CustomException(
        errMessage: ServerFailure.fromDioException(e).errMessage,
      );
    }
  }
}
