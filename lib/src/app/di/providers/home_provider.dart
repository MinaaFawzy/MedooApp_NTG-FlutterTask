import 'package:riverpod/riverpod.dart';
import 'package:modee_e_commerce_app/src/data/repositories_impl/product_repository_imp.dart';
import 'package:modee_e_commerce_app/src/domain/entities/product_model.dart';
import 'package:modee_e_commerce_app/src/domain/repositories/product_repository.dart';

import 'api_provider.dart';

final isSearchingProvider = StateProvider<bool>((ref) => false);
final isFavoriteProvider = StateProvider<bool>((ref) => false);

final productRepositoryProvider = Provider<ProductRepository>((ref) {
  final apiService = ref.watch(apiServiceProvider);
  return ProductRepositoryImp(apiService);
});

final productsProvider = FutureProvider<List<Product>>((ref) async {
  final productRepository = ref.watch(productRepositoryProvider);
  return productRepository.getProducts();
});

final categoriesProvider = FutureProvider<List<String>>((ref) async {
  final productRepository = ref.watch(productRepositoryProvider);
  return productRepository.getCategories();
});