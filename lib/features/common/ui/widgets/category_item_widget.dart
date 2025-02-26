import 'package:crafty_bay/features/common/data/models/category/category_pagination_model.dart';
import 'package:crafty_bay/features/product/ui/screens/product_list_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../app/app_color.dart';

class CategoryItemWidget extends StatelessWidget {
  const CategoryItemWidget({
    super.key,
    required this.categoryModel,
  });
  final CategoryItemModel categoryModel;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Get.toNamed(ProductListScreen.name, arguments: {
          'categoryName':categoryModel.title ?? '',
          'categoryId':categoryModel.sId!
        });
      },
      child: Column(
        spacing: 8,
        children: [
          Container(
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
                color: AppColors.themeColor.withValues(alpha: 0.12),
                borderRadius: BorderRadius.circular(8)),
            child: Image(
              image: NetworkImage(categoryModel.icon ?? ''),
              width: 40,
              height: 40,
              fit: BoxFit.scaleDown,
            ),
          ),
          Text(
            categoryModel.title ?? '',
            style: const TextStyle(
                color: AppColors.themeColor,
                fontSize: 16,
                fontWeight: FontWeight.w500),
          )
        ],
      ),
    );
  }
}
