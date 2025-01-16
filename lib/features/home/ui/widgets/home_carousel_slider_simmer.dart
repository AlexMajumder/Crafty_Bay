import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';
class HomeCarouselSliderSimmer extends StatelessWidget {
  const HomeCarouselSliderSimmer({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Shimmer.fromColors(
        baseColor: Colors.grey.shade300,
        highlightColor: Colors.grey.shade100,
        enabled: true,
        child:Container(
          height: 180,
          color: Colors.white,
        )
      ),);
  }
}

