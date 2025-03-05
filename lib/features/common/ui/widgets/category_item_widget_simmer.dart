import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class CategoryItemWidgetSimmer extends StatelessWidget {
  const CategoryItemWidgetSimmer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: Colors.grey.shade300,
      highlightColor: Colors.grey.shade100,
      enabled: true,
      child: Column(
        spacing: 8,
        children: [
          Container(
            height: 45,
            width: 45,
            color: Colors.white,
          ),
          Container(
            height: 10,
            width: 40,
            color: Colors.white,
          )
        ],
      ),
    );
  }
}
