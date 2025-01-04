import 'package:crafty_bay/features/creat_review/ui/screens/create_review_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../app/app_color.dart';
import '../widgets/cart_review_item_widget.dart';

class ReviewScreen extends StatefulWidget {
  const ReviewScreen({super.key, required this.productId});

  final int productId;
  static const name = '/review-screen';

  @override
  State<ReviewScreen> createState() => _ReviewScreenState();
}

class _ReviewScreenState extends State<ReviewScreen> {
  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return Scaffold(
      appBar: AppBar(
        title: const Text('Reviews'),
        leading: IconButton(
            onPressed: () {
              Get.back();
            },
            icon: Icon(Icons.arrow_back_ios)),
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: 10,
              itemBuilder: (context, index) {
                return const CartReviewItemWidget();
              },
            ),
          ),
          _buildReviewNumberAndAdd(textTheme),
        ],
      ),
    );
  }


  Widget _buildReviewNumberAndAdd(TextTheme textTheme) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: AppColors.themeColor.withValues(alpha: .2),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            spacing: 8,
            children: [
              Text('Reviews', style: textTheme.titleMedium),
              Text('(125)', style: textTheme.titleMedium),
            ],
          ),
          Ink(
            decoration: const BoxDecoration(
              color: AppColors.themeColor, // Background color
              shape: BoxShape.circle, // Makes it circular
            ),
            child: IconButton(
              onPressed: () {
                Get.toNamed(CreateReviewScreen.name,arguments: 1);
              },
              icon: const Icon(Icons.add, size: 28, color: Colors.white),
            ),
          ),


        ],
      ),
    );
  }

}
