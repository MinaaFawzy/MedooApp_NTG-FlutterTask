
import 'package:modee_e_commerce_app/src/domain/entities/product_model.dart';

Future<double> calculateTotalPrice(List<Product> cartItems) async {
  double total = 0;
  for (var item in cartItems) {
    total += item.price;
  }
  return total;
}