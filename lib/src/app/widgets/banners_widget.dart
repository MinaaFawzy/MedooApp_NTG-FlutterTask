import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';

class BannersWidget extends StatelessWidget {
  const BannersWidget({super.key , required this.banners});

  final List<Widget> banners ;
  @override
  Widget build(BuildContext context) {
    return CarouselSlider(
        items: banners,
        options: CarouselOptions(
          height: 150,
          aspectRatio: 16/9,
          viewportFraction: 0.8,
          initialPage: 0,
          enableInfiniteScroll: true,
          reverse: false,
          autoPlay: true,
          autoPlayInterval: Duration(seconds: 3),
          autoPlayAnimationDuration: Duration(milliseconds: 800),
          autoPlayCurve: Curves.fastOutSlowIn,
          enlargeCenterPage: true,
          enlargeFactor: 0.3,
          onPageChanged: null,
          scrollDirection: Axis.horizontal,
        )
    );
  }
}
