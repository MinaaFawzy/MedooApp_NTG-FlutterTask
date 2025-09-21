import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:modee_e_commerce_app/src/app/di/providers/cart_provider.dart';
import 'package:modee_e_commerce_app/src/app/di/providers/home_provider.dart';
import 'package:modee_e_commerce_app/src/data/services/toast_service.dart';
import 'package:modee_e_commerce_app/src/data/utils/app_colors.dart';
import 'package:modee_e_commerce_app/src/domain/entities/product_model.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ProductItemScreen extends ConsumerWidget {
  const ProductItemScreen({super.key, required this.product});

  final Product product;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isFavorite = ref.watch(isFavoriteProvider);

    return Scaffold(

      body: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              margin: EdgeInsets.only(top: 24, left: 6),
              child: Row(
                children: [
                  GestureDetector(
                    child: Container(
                      padding: EdgeInsets.all(11),
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        border: Border.all(
                          color: AppColors.borderColor(context),
                          width: 1,
                        ),
                      ),
                      child: Icon(Icons.arrow_back_ios_rounded),
                    ),
                    onTap: () {
                        Navigator.pop(context);
                    },
                  ),
                  SizedBox(width: MediaQuery.of(context).size.width * 0.11,),
                  Text(
                    'Product Details',
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                  Spacer(),
                ],
              ),
            ),
            Container(
              margin: const EdgeInsets.all(24),
              child: Row(
                children: [
                  SizedBox(width: MediaQuery.of(context).size.width * 0.1),
                  const Spacer(),
                ],
              ),
            ),
            Image.network(product.image, height: 300, fit: BoxFit.contain),
            const SizedBox(height: 16),
            Text(
              product.title,
              style: const TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 8),
            // Category + Favorite
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  product.category,
                  style: TextStyle(fontSize: 16, color: Colors.grey[600]),
                ),
                const SizedBox(width: 48),
                IconButton(
                  onPressed: () {
                    ref.read(cartProvider.notifier).toggleFavorite(product, ref);
                    ref.read(isFavoriteProvider.notifier).state = !isFavorite;
                  },
                  icon: Icon(
                    isFavorite ? Icons.favorite : Icons.favorite_border,
                    color: isFavorite
                        ? Colors.red
                        : Theme.of(context).iconTheme.color,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 12),
            // Rating & Count
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Icon(Icons.star, color: Colors.amber, size: 24),
                const SizedBox(width: 4),
                Text(
                  "${product.rating.rate}",
                  style: const TextStyle(fontSize: 16),
                ),
                const SizedBox(width: 8),
                Text(
                  "(${product.rating.count} reviews)",
                  style: TextStyle(color: Colors.grey[600]),
                ),
              ],
            ),
            const Spacer(),
            //Add to cart button
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {
                  ref.read(cartProvider.notifier).addToCart(product, ref);
                  ToastManager.showSuccess(context, 'Product added to cart');
                  Navigator.pop(context);
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: AppColors.buttonColor,
                  foregroundColor: Colors.white,
                  padding: const EdgeInsets.symmetric(vertical: 16),
                ),
                child: const Text(
                  "Add to Cart",
                  style: TextStyle(fontSize: 18),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

