import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:modee_e_commerce_app/l10n/app_localizations.dart';
import 'package:modee_e_commerce_app/src/app/screens/favorit_page/favorite_Screen.dart';
import 'package:modee_e_commerce_app/src/app/screens/profile_page/profile_screen.dart';
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
    final loc = AppLocalizations.of(context)!;

    final List<Widget> _screens = [
      HomePageScreen(),
      FavoriteScreen(),
      CartPageScreen(),
      ProfileScreen(),
    ];

    return Scaffold(
      body: _screens[bottomIndex],
      bottomNavigationBar: BottomBar(
        selectedIndex: ref.watch(bottomIndexProvider),
        items: <BottomBarItem>[
          BottomBarItem(
            icon: Icon(Icons.home_outlined),
            title: Text(loc.home),
            activeColor: AppColors.buttonColor,
            activeIconColor: Colors.white,
            activeTitleColor: Colors.white,
            backgroundColorOpacity: 1,
          ),
          BottomBarItem(
            icon: Icon(Icons.favorite_border),
            title: Text(loc.favorite),
            activeColor: AppColors.buttonColor,
            activeIconColor: Colors.white,
            activeTitleColor: Colors.white,
            backgroundColorOpacity: 1,
          ),
          BottomBarItem(
            icon: Image.asset(
              'assets/images/ShoppingBag.png',
              width: 24,
              height: 24,
              color: Colors.white,
            ),
            title: Text(loc.cart),
            activeColor: AppColors.buttonColor,
            activeIconColor: Colors.white,
            activeTitleColor: Colors.white,
            backgroundColorOpacity: 1,
          ),
          BottomBarItem(
            icon: Icon(Icons.person_2_outlined),
            title: Text(loc.profile),
            activeColor: AppColors.buttonColor,
            activeIconColor: Colors.white,
            activeTitleColor: Colors.white,
            backgroundColorOpacity: 1,
          ),
        ],
        onTap: (int index) {
          ref.read(bottomIndexProvider.notifier).state = index;
        },
      ),
    );
  }
}
