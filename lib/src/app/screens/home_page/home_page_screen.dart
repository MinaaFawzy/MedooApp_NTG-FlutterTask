import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:modee_e_commerce_app/l10n/app_localizations.dart';
import 'package:modee_e_commerce_app/src/app/di/providers/cart_provider.dart';
import 'package:modee_e_commerce_app/src/app/screens/cart_page/cart_page_screen.dart';
import 'package:modee_e_commerce_app/src/app/widgets/banners_widget.dart';
import 'package:modee_e_commerce_app/src/app/widgets/categories_widget.dart';
import 'package:modee_e_commerce_app/src/app/widgets/product_item.dart';
import 'package:modee_e_commerce_app/src/data/utils/app_colors.dart';
import '../../di/providers/home_provider.dart';

class HomePageScreen extends ConsumerWidget {
  HomePageScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {

    final products = ref.watch(productsProvider);
    final isSearching = ref.watch(isSearchingProvider);
    final categories = ref.watch(categoriesProvider);
    final cartItems = ref.watch(cartProvider);
    final loc = AppLocalizations.of(context)!;

    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(top:8.0),
                child: Row(
                  children: [
                    SizedBox(
                      width: MediaQuery.of(context).size.width * 0.3,
                      height: 33,
                      child: Row(
                        children: [
                          Image(image: AssetImage('assets/images/Logo.png')),
                          SizedBox(width: 8),
                          Text('Modee', style: TextStyle(
                            fontSize: 24,
                          )
                          )
                        ],
                      ),
                    ),
                    Spacer(),
                    GestureDetector(
                      child: SizedBox(
                        width:
                            isSearching
                                ? MediaQuery.of(context).size.width * 0.43
                                : 48,
                        child: TextField(
                          enabled: false,
                          cursorColor: Colors.black,
                          decoration: InputDecoration(
                            suffixIcon: Icon(
                              CupertinoIcons.search,
                              color: AppColors.iconColor(context),
                            ),
                            hintText: "",
                            contentPadding: EdgeInsets.zero,
                            disabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(24),
                              borderSide: BorderSide(
                                color: AppColors.borderColor(context), // change for disabled state
                                width: 1,
                              ),
                            ),
                          ),
                        )
                        ,
                      ),
                      onTap: () {
                        ref.read(isSearchingProvider.notifier).state =
                            !isSearching;
                      },
                    ),
                    GestureDetector(
                      child: Stack(
                        clipBehavior: Clip.none,
                        children: [
                          Container(
                            padding: const EdgeInsets.all(11),
                            margin: const EdgeInsets.only(left: 8 ),
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              border: Border.all(
                                color: AppColors.borderColor(context),
                                width: 1,
                              ),
                            ),
                            child: Image.asset(
                              'assets/images/ShoppingBag.png',
                              width: 24,
                              height: 24,
                              color: AppColors.iconColor(context),
                            ),
                          ),
                          cartItems.isEmpty
                              ? const SizedBox()
                              : Positioned(
                                right: 12, // adjust to move horizontally
                                top: 12, // adjust to move vertically
                                child: Container(
                                  width: 8,
                                  height: 8,
                                  decoration: const BoxDecoration(
                                    color: Colors.red,
                                    shape: BoxShape.circle,
                                  ),
                                ),
                              ),
                        ],
                      ),
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => CartPageScreen(),
                          ),
                        );
                      },
                    ),
                  ],
                ),
              ),
              Container(
                height: 56,
                margin: EdgeInsets.symmetric(vertical: 8),
                padding: EdgeInsets.all(2),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(28),
                  border: Border.all(color: AppColors.borderColor(context), width: 1),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(4.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          // Location icon
                          Container(
                            width: 40,
                            height: 40,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: Color(0X1F1F1F0A),
                            ),
                            child: Icon(Icons.location_on_outlined,color: AppColors.iconColor(context),)
                          ),
                          SizedBox(width: 8),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                loc.sendTo,
                                style: TextStyle(
                                  fontSize: 12,
                                  color: Colors.grey,
                                ),
                              ),
                              Text(
                                "Brisbane, Queensland",
                                style: TextStyle(
                                  fontSize: 14,
                                  color: AppColors.borderColor(context),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                      ElevatedButton(
                        onPressed: () {},
                        style: ElevatedButton.styleFrom(
                          backgroundColor: AppColors.buttonColor,
                          foregroundColor: Colors.white,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20),
                          ),
                          padding: EdgeInsets.symmetric(
                            horizontal: 16,
                            vertical: 8,
                          ),
                        ),
                        child: Text(loc.change),
                      ),
                    ],
                  ),
                ),
              ),
              Expanded(
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      BannersWidget(
                        banners: [
                          Image.asset('assets/images/Banner1.jpg'),
                          Image.asset('assets/images/Banner2.jpeg'),
                          Image.asset('assets/images/Banner3.PNG'),
                        ],
                      ),
                      categories.when(
                        data:
                            (categories) =>
                                CategoriesWidget(categoryList: categories),
                        error:
                            (error, stackTrace) =>
                                Center(child: Text(error.toString())),
                        loading:
                            () => Center(
                              child: SizedBox(
                                height: 85,
                                child: CircularProgressIndicator(
                                  color: Colors.transparent,
                                ),
                              ),
                            ),
                      ),
                      SizedBox(height: 8),
                      Text( loc.products, style: TextStyle(fontSize: 20)),
                      products.when(
                        data:
                            (products) =>
                                products.isEmpty
                                    ? Column(
                                      children: [
                                        SizedBox(
                                          height:
                                              MediaQuery.of(
                                                context,
                                              ).size.height *
                                              0.15,
                                        ),
                                        Center(
                                          child: Text(
                                            loc.noProducts,
                                            style: TextStyle(
                                              fontSize: 20,
                                              color: Colors.grey,
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ),
                                        ),
                                      ],
                                    )
                                    : GridView.builder(
                                      gridDelegate:
                                          const SliverGridDelegateWithFixedCrossAxisCount(
                                            crossAxisCount: 2,
                                            childAspectRatio: 0.6,
                                          ),
                                      shrinkWrap: true,
                                      physics: NeverScrollableScrollPhysics(),
                                      itemCount: products.length,
                                      itemBuilder: (context, index) {
                                        return ProductItem(
                                          product: products[index],
                                        );
                                      },
                                      addAutomaticKeepAlives: true,
                                    ),
                        error:
                            (error, stackTrace) =>
                                Center(child: Text(error.toString())),
                        loading:
                            () => Center(
                              child: Column(
                                children: [
                                  SizedBox(
                                    height:
                                        MediaQuery.of(context).size.height *
                                        0.15,
                                  ),
                                  CircularProgressIndicator(
                                    color: AppColors.buttonColor,
                                  ),
                                ],
                              ),
                            ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
