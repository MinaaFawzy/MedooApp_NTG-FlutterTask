import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:modee_e_commerce_app/src/domain/entities/product_model.dart';
import 'dart:convert';

class StorageService {
  final FlutterSecureStorage _storage;
  StorageService(this._storage);

  Future<void> saveCart(List<Product> cart) async {
    final cartJson = cart.map((e) => e.toJson()).toList();
    final cartString = jsonEncode(cartJson); // convert to String
    await _storage.write(key: 'cart', value: cartString);

  }

  Future<List<Product>> getCart() async {
    final cartString = await _storage.read(key: 'cart');
    if (cartString == null) return [];

    final List<dynamic> decoded = jsonDecode(cartString);
    return decoded.map((e) => Product.fromJson(e)).toList();
  }

}
