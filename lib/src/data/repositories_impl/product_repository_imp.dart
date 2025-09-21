import 'package:modee_e_commerce_app/src/data/services/api_service.dart';
import 'package:modee_e_commerce_app/src/data/utils/app_apis.dart';
import 'package:modee_e_commerce_app/src/domain/entities/product_model.dart';
import 'package:modee_e_commerce_app/src/domain/repositories/product_repository.dart';

class ProductRepositoryImp implements ProductRepository {
  final ApiService apiService;
  ProductRepositoryImp(this.apiService);

  @override
  Future<List<Product>> getProducts() async {
    final response = await apiService.get(AppApis.products);

    // Ensure response.data is treated as List
    final List<dynamic> data = response.data as List<dynamic>;

    return data
        .map((e) => Product.fromJson(e as Map<String, dynamic>))
        .toList();
  }

  @override
  Future<List<String>> getCategories() async {
    final response = await apiService.get(AppApis.categories);

    final List<dynamic> data = response.data as List<dynamic>;

    return data.map((e) => e as String).toList();
  }
}
