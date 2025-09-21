import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:modee_e_commerce_app/src/data/utils/app_colors.dart';
import '../../di/providers/bottom_nav_bar_providers.dart';
import '../cart_page/cart_page_screen.dart';
import '../home_page/home_page_screen.dart';
import 'package:bottom_bar/bottom_bar.dart';

class BottomNavBar extends ConsumerWidget {
  BottomNavBar({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final bottomIndex = ref.watch(bottomIndexProvider);


    final List<Widget> _screens = [
      HomePageScreen(),
      CartPageScreen(),
      CartPageScreen(),
      CartPageScreen(),
    ];

    return Scaffold(
      body: _screens[bottomIndex],
      bottomNavigationBar: BottomBar(selectedIndex: ref.watch(bottomIndexProvider), items: <BottomBarItem>[
        BottomBarItem(
          icon: Icon(Icons.home_outlined),
          title: Text('Home'),
          activeColor: AppColors.buttonColor,
          activeIconColor: Colors.white ,
          activeTitleColor: Colors.white,
          backgroundColorOpacity: 1 ,
        ),
        BottomBarItem(
          icon: Icon(Icons.favorite_border),
          title: Text('Favorites'),
          activeColor: AppColors.buttonColor,
          activeIconColor: Colors.white ,
          activeTitleColor: Colors.white,
          backgroundColorOpacity: 1 ,
        ),
        BottomBarItem(
          icon: Icon(Icons.shopping_cart_outlined),
          title: Text('Cart'),
          activeColor: AppColors.buttonColor,
          activeIconColor: Colors.white ,
          activeTitleColor: Colors.white,
          backgroundColorOpacity: 1 ,
        ),
        BottomBarItem(
          icon: Icon(Icons.person_2_outlined),
          title: Text('Profile'),
          activeColor: AppColors.buttonColor,
          activeIconColor: Colors.white ,
          activeTitleColor: Colors.white,
          backgroundColorOpacity: 1 ,

        ),
      ],onTap: (int index){
        ref.read(bottomIndexProvider.notifier).state = index;
      })
    );
  }

}
