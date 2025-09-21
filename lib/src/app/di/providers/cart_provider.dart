import 'package:modee_e_commerce_app/src/data/services/storage_service.dart';
import 'package:modee_e_commerce_app/src/domain/entities/product_model.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';


final totalPriceProvider = StateProvider<double>((ref) => 0);

class CartNotifier extends StateNotifier<List<Product>> {
  final StorageService storageService;
  final Ref ref;

  CartNotifier(this.storageService, this.ref) : super([]) {
    _loadCart();
  }
  Future<void> _loadCart() async {
    final savedCart = await storageService.getCart();
    state = savedCart;
    _recalculateTotal(); // calculate immediately after loading
  }


  Future<void> addToCart(Product product, WidgetRef ref) async {
    ref.read(totalPriceProvider.notifier).state = 0 ;
    product.quantity = product.quantity! + 1;
    if (state.any((p) => p.id == product.id)) {
     state.where((p) => p.id == product.id).toList().first.quantity = product.quantity!;
    } else {
      state = [...state, product];
    }
    for (var item in state) {
      ref.read(totalPriceProvider.notifier).state += item.price * (item.quantity ?? 0);
    }
    await storageService.saveCart(state);
  }

  Future<void> removeFromCart(Product product, WidgetRef ref) async {
    ref.read(totalPriceProvider.notifier).state = 0 ;
    product.quantity = product.quantity! - 1;
    if (product.quantity! <= 0 ){
      state = state.where((p) => p.id != product.id).toList();
    }else {
      state.where((p) => p.id == product.id).toList().first.quantity = product.quantity!;
    }
    for (var item in state) {
      ref.read(totalPriceProvider.notifier).state += item.price * (item.quantity ?? 0);
    }
    await storageService.saveCart(state);
  }

  Future<void> toggleFavorite(Product product, WidgetRef ref) async {
    if (state.any((p) => p.id == product.id)) {
      state.where((p) => p.id == product.id).toList().first.isFavorite = !product.isFavorite;
    }

    await storageService.saveCart(state);
  }

  Future<void> clearCart() async {
    state = [];
    await storageService.saveCart(state);
  }

  void _recalculateTotal() {
    ref.read(totalPriceProvider.notifier).state = 0;
    for (var item in state) {
      ref.read(totalPriceProvider.notifier).state += item.price * (item.quantity ?? 0);
    }
  }

}

final cartProvider =
StateNotifierProvider<CartNotifier, List<Product>>((ref) {
  final storage = StorageService(const FlutterSecureStorage());
  return CartNotifier(storage, ref);
});

