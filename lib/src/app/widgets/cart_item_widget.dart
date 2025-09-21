import 'package:flutter/material.dart';
import 'package:modee_e_commerce_app/src/app/di/providers/cart_provider.dart';
import 'package:modee_e_commerce_app/src/domain/entities/product_model.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class CartItemWidget extends ConsumerWidget {
  const CartItemWidget({super.key, required this.item});

  final Product item;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Column(
      children: [
        Row(
          children: [
            Image(image: NetworkImage(item.image), width: 160, height: 140),
            SizedBox(width: 4),
            SizedBox(
              width: MediaQuery.of(context).size.width - 220,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(item.category, style: TextStyle(fontSize: 12)),
                  Text(item.title, style: TextStyle(fontSize: 16)),
                  Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      IconButton(
                        icon: const Icon(Icons.remove),
                        onPressed:
                            () => ref
                                .read(cartProvider.notifier)
                                .removeFromCart(item, ref),
                      ),
                      Text('${item.quantity}'),
                      IconButton(
                        icon: const Icon(Icons.add),
                        onPressed:
                            () => ref
                                .read(cartProvider.notifier)
                                .addToCart(item, ref),
                      ),
                    ],
                  ),
                  Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      IconButton(
                        onPressed: () {
                          ref
                              .read(cartProvider.notifier)
                              .toggleFavorite(item, ref);
                          ref.read(cartProvider.notifier).addToCart(item, ref);
                          ref
                              .read(cartProvider.notifier)
                              .removeFromCart(item, ref);
                        },
                        icon: Icon(
                          item.isFavorite
                              ? Icons.favorite
                              : Icons.favorite_border,
                          color:
                              item.isFavorite
                                  ? Colors.red
                                  : Theme.of(context).iconTheme.color,
                        ),
                      ),
                      Spacer(),
                      Text("\$${item.price.toStringAsFixed(2)}"),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
        const Divider(),
      ],
    );
  }
}
