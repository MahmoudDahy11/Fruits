import 'package:dio/dio.dart';
import 'package:e_commerce_app/core/errors/custom_excption.dart';
import 'package:e_commerce_app/core/errors/failure.dart';
import 'package:flutter/material.dart';

/*
 * ApiService class
 * handles HTTP requests using Dio package
 * includes methods for GET, POST, PUT, PATCH, DELETE
 */
class ApiService {
  final Dio _dio;
  ApiService(this._dio);

  final String _baseUrl = 'https://fakestoreapi.com/';

  /*
* get method
* makes a GET request to the specified endpoint
* includes optional authorization token in headers
* handles Dio exceptions and throws CustomException on error
* returns response data on success
*/
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

  /*
* post method
* makes a POST request to the specified endpoint with optional body data
* includes optional authorization token in headers
* handles Dio exceptions and throws CustomException on error
* returns response data on success
*/
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

  /*
* put method
* makes a PUT request to the specified endpoint with optional body data
* includes optional authorization token in headers
* handles Dio exceptions and throws CustomException on error
* returns response data on success
 */
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

  /* 
*patch method
* makes a PATCH request to the specified endpoint with optional body data
* includes optional authorization token in headers
* handles Dio exceptions and throws CustomException on error
* returns response data on success
*/
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

  /* 
*delete method
* makes a DELETE request to the specified endpoint with optional body data
* includes optional authorization token in headers
* handles Dio exceptions and throws CustomException on error
* returns response data on success
*/
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
