import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:modee_e_commerce_app/src/app/di/providers/bottom_nav_bar_providers.dart';
import 'package:modee_e_commerce_app/src/app/di/providers/cart_provider.dart';
import 'package:modee_e_commerce_app/src/app/widgets/cart_item_widget.dart';
import 'package:modee_e_commerce_app/src/app/widgets/shopping_info_widget.dart';
import 'package:modee_e_commerce_app/src/data/utils/app_colors.dart';
import 'package:flutter/cupertino.dart';

class CartPageScreen extends ConsumerWidget {
  const CartPageScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final totalPrice = ref.watch(totalPriceProvider);
    final cartItems = ref.watch(cartProvider);

    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            // Cart List
            Container(
              margin: EdgeInsets.all(24),
              child: Row(
                children: [
                  GestureDetector(
                    child: Container(
                      padding: EdgeInsets.all(11),
                      margin: EdgeInsets.only(left: 8),
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        border: Border.all(
                          color: AppColors.borderColor,
                          width: 1,
                        ),
                      ),
                      child: Icon(Icons.arrow_back_ios_rounded),
                    ),
                    onTap: () {
                      if (ref.watch(bottomIndexProvider) == 0) {
                        Navigator.pop(context);
                      } else {
                        ref.read(bottomIndexProvider.notifier).state = 0;
                      }
                    },
                  ),
                  Spacer(),
                  Text(
                    'Cart',
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                  Spacer(),
                  GestureDetector(
                    child: Container(
                      padding: EdgeInsets.all(11),
                      margin: EdgeInsets.only(left: 8),
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        border: Border.all(
                          color: AppColors.borderColor,
                          width: 1,
                        ),
                      ),
                      child: Icon(CupertinoIcons.heart),
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              child:
                  cartItems.isEmpty
                      ? Center(child: Text('Your cart is empty'))
                      : ListView.separated(
                        separatorBuilder:
                            (context, index) => SizedBox(height: 8),
                        itemCount: cartItems.length,
                        itemBuilder: (context, index) {
                          final item = cartItems[index];
                          return Container(
                            margin: EdgeInsets.symmetric(horizontal: 24),
                            child: CartItemWidget(item: item),
                          );
                        },
                      ),
            ),
            ShoppingInformationWidget(
              cartItems: cartItems,
              totalPrice: totalPrice,
            ),
          ],
        ),
      ),
    );
  }
}
