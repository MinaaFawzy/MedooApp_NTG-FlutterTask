import 'package:modee_e_commerce_app/src/domain/entities/product_model.dart';

abstract class ProductRepository {
  Future<List<Product>> getProducts();
  Future<List<String>> getCategories();
}
