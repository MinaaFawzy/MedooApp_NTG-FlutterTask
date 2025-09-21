import 'package:flutter/material.dart';
import 'package:modee_e_commerce_app/src/app/screens/nav_bottom_bar/nav_bottom_bar.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

void main() {
  runApp(ProviderScope(child: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(

      debugShowCheckedModeBanner: false,
      title: 'Modee',
      theme: ThemeData(
          scaffoldBackgroundColor: Colors.white,
          primaryColor: Colors.black,
          appBarTheme: const AppBarTheme(
            scrolledUnderElevation: 0.0,
          )
      ),

      home:  BottomNavBar() ,
    ) ;
  }
}

