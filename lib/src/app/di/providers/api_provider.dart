import 'package:riverpod/riverpod.dart';
import 'package:dio/dio.dart';
import 'package:modee_e_commerce_app/src/data/repositories_impl/product_repository_imp.dart';
import 'package:modee_e_commerce_app/src/data/services/api_service.dart';
import 'package:modee_e_commerce_app/src/data/utils/app_apis.dart';
import 'package:modee_e_commerce_app/src/domain/repositories/product_repository.dart';

final dioProvider = Provider<Dio>((ref) {
  return Dio(BaseOptions(baseUrl: AppApis.baseUrl));
});

final apiServiceProvider = Provider<ApiService>((ref) {
  final dio = ref.watch(dioProvider);
  return ApiService(dio, ref);
});

final productRepositoryProvider = Provider<ProductRepository>((ref) {
  final apiService = ref.watch(apiServiceProvider);
  return ProductRepositoryImp(apiService);
});

