import 'package:flutter/material.dart';
import 'package:modee_e_commerce_app/src/app/screens/nav_bottom_bar/nav_bottom_bar.dart';
import 'package:modee_e_commerce_app/src/app/screens/no_internet_page/no_internet_screen.dart';
import 'package:modee_e_commerce_app/src/data/services/network_check.dart';

class SplashScreen extends StatefulWidget {
  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  bool? hasInternet;

  @override
  void initState() {
    super.initState();
    _checkInternet();
  }

  void _checkInternet() async {
    bool result = await checkConnection();
    setState(() => hasInternet = result);
  }

  @override
  Widget build(BuildContext context) {
    if (hasInternet == null) {
      return const Scaffold(
        body: Center(child: CircularProgressIndicator()),
      );
    } else if (hasInternet == true) {
      return  BottomNavBar();
    } else {
      return NoInternetScreen(onRetry: _checkInternet);
    }
  }
}
