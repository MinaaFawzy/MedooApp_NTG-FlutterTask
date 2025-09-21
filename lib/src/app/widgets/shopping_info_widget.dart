import 'package:flutter/material.dart';
import 'package:modee_e_commerce_app/src/data/utils/app_colors.dart';
import 'package:modee_e_commerce_app/src/domain/entities/product_model.dart';

class ShoppingInformationWidget extends StatelessWidget {
  const ShoppingInformationWidget({
    super.key,
    required this.cartItems,
    required this.totalPrice,
  });

  final List<Product> cartItems;
  final double totalPrice;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 8),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Divider(),
          const Text(
            "Shipping Information",
            style: TextStyle( fontSize: 20),
          ),
          const SizedBox(height: 8),
          Container(
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(
              border: Border.all(color: Colors.grey.shade300),
              borderRadius: BorderRadius.circular(8),
            ),
            child: Row(
              children: const [
                Image(image: AssetImage("assets/images/mastercard.png"), width: 40, height: 40),
                SizedBox(width: 8),
                Text("**** **** **** 5124"),
                Spacer(),
                Icon(Icons.arrow_drop_down),
              ],
            ),
          ),
          const SizedBox(height: 16),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text("Total (${cartItems.length} Items)"),

              Text("\$ ${totalPrice.toStringAsFixed(2)} "),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: const [
              Text("Shipping Fee"),
              Text("\$0.00"),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: const [
              Text("Taxes"),
              Text("\$0.00"),
            ],
          ),
          const Divider(),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                "Total",
                style:
                TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
              ),
              Text(
                "\$ ${totalPrice.toStringAsFixed(2)}",
                style: const TextStyle(
                    fontWeight: FontWeight.bold, fontSize: 18),
              ),
              Spacer(),
              SizedBox(
                width: MediaQuery.of(context).size.width * 0.45,
                child: ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppColors.buttonColor,
                    foregroundColor: Colors.white,
                    padding: const EdgeInsets.symmetric(vertical: 14),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30),
                    ),
                  ),
                  child: const Text("Checkout"),
                ),
              ),
            ],
          ),

        ],
      ),
    );
  }
}
