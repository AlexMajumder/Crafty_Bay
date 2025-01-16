import 'package:crafty_bay/features/product/ui/screens/product_list_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shimmer/shimmer.dart';

import '../../../../app/app_color.dart';

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
