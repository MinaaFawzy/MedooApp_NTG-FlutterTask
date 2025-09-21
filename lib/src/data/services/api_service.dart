import 'dart:developer';
import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ApiService {
  final Dio _dio;
  final Ref ref;

  ApiService(this._dio, this.ref);

  Future<Response> get(
    String endpoint, {
    Map<String, dynamic>? queryParameters,
  }) async {
    try {
      final response = await _dio.get(
        endpoint,
        queryParameters: queryParameters,
        options: Options(receiveTimeout: const Duration(seconds: 30)),
      );

      if (response.data == null) {
        throw Exception("Server returned empty response");
      }

      return response;
    } on DioException catch (e) {
      log("Error: ${e.response?.data}");

      throw Exception("There is ERROR when getting data Please try again later" );
    } catch (e) {
      throw Exception("There is unexpected ERROR getting data Please try again later");
    }
  }
}
