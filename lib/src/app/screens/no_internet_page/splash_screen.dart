import 'package:flutter/material.dart';
import 'package:modee_e_commerce_app/src/app/screens/nav_bottom_bar/nav_bottom_bar.dart';
import 'package:modee_e_commerce_app/src/app/screens/no_internet_page/no_internet_screen.dart';
import 'package:modee_e_commerce_app/src/data/services/network_check.dart';
import 'package:modee_e_commerce_app/src/data/utils/app_colors.dart';

class SplashScreen extends StatefulWidget {
  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  bool? _hasInternet; // only one variable

  @override
  void initState() {
    super.initState();
    _checkInternet(); // check at start
  }

  Future<void> _checkInternet() async {
    final hasInternet = await checkConnection()
        .timeout(const Duration(seconds: 5), onTimeout: () => false);

    setState(() {
      _hasInternet = hasInternet;
    });
  }

  @override
  Widget build(BuildContext context) {
    if (_hasInternet == null) {
      return const Scaffold(
        body: Center(
          child: CircularProgressIndicator(color: AppColors.buttonColor),
        ),
      );
    } else if (_hasInternet == true) {
      return BottomNavBar();
    } else {
      return NoInternetScreen(onRetry: _checkInternet);
    }
  }
}
