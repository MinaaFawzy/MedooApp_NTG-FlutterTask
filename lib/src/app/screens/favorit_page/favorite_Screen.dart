import 'package:flutter/material.dart';
class FavoriteScreen extends StatefulWidget {
  const FavoriteScreen ({super.key});

  @override
  State<FavoriteScreen> createState() => _State();
}

class _State extends State<FavoriteScreen> {
  @override
  Widget build(BuildContext context) {
    return Center(child: Text('Favorite Screen'));
  }
}
