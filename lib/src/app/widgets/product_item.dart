import 'package:flutter/material.dart';
import 'package:modee_e_commerce_app/l10n/app_localizations.dart';
import 'package:modee_e_commerce_app/src/app/di/providers/cart_provider.dart';
import 'package:modee_e_commerce_app/src/app/di/providers/home_provider.dart';
import 'package:modee_e_commerce_app/src/app/screens/product_details/product_details_screen.dart';
import 'package:modee_e_commerce_app/src/data/services/toast_service.dart';
import 'package:modee_e_commerce_app/src/data/utils/app_colors.dart';
import 'package:modee_e_commerce_app/src/domain/entities/product_model.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ProductItem extends ConsumerWidget {
  const ProductItem({
    super.key, required this.product,
  });

  final Product product;

  @override
  Widget build(BuildContext context, WidgetRef ref) {

    final loc = AppLocalizations.of(context)!;

    return GestureDetector(
      child: Container(
        padding: EdgeInsets.all(8),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Stack(
              children: [
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(16),
                  ),
                  child: Image(
                    image: NetworkImage(product.image) ,
                    width: 180,
                    height: 180,
                  ),
                ),
                Row(
                  children: [
                    Icon(Icons.star, color: Colors.amber, size: 12,),
                    SizedBox(width: 2,),
                    Text('${product.rating.rate}', style: TextStyle(fontSize: 10),)
                  ],
                )
              ],
            ),
            Text(
              product.title,
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),
            Row(
              children: [
                Text(
                  "\$ ${product.price}",
                  style: TextStyle(fontSize: 12),
                ),
                Spacer(),
                IconButton(
                    style: IconButton.styleFrom(
                        backgroundColor: AppColors.buttonColor,
                        foregroundColor: Colors.white
                    ),
                    onPressed: () {
                      ref.read(cartProvider.notifier).addToCart(product, ref);
                      ToastManager.showSuccess(context, loc.productAddedToCart );
                    },
                    icon: Icon(Icons.add_shopping_cart_outlined)
                ),
              ],
            ),
          ],
        ),
      ),
      onTap: () {
        ref.read(isFavoriteProvider.notifier).state = product.isFavorite;
        Navigator.push(context, MaterialPageRoute(builder: (context) => ProductItemScreen(product: product,)));
      }
    );
  }
}

