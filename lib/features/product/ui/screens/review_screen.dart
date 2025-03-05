
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../app/app_color.dart';
import '../../../creat_review/ui/screens/create_review_screen.dart';
import '../controllers/review_list_controller.dart';
import '../widgets/review_widget.dart';

class ReviewScreen extends StatefulWidget {
  const ReviewScreen({super.key, required this.productId});
  static String name = '/review-screen';
  final String productId;

  @override
  State<ReviewScreen> createState() => _ReviewScreenState();
}

class _ReviewScreenState extends State<ReviewScreen> {
  ReviewListContoller reviewListController = Get.find<ReviewListContoller>();

  @override
  void initState() {
    super.initState();
    reviewListController.getReviewList(widget.productId);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:const Text('Reviews'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Expanded(
              child: SingleChildScrollView(
                child: GetBuilder<ReviewListContoller>(
                  builder: (controller) {
                    if (controller.inProgress) {
                      return const CircularProgressIndicator();
                    } else {
                      return Column(
                        children: getReviewList(),
                      );
                    }
                  },
                ),
              ),
            ),
            Container(
              height: 80,
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                color: AppColors.themeColor.withValues(alpha: 0.2),
                borderRadius: const BorderRadius.only(
                  topRight: Radius.circular(20),
                  topLeft: Radius.circular(20),
                ),
                border: Border.all(
                  color:  AppColors.themeColor.withValues(alpha: 0.4),
                  width: 1,
                ),
              ),
              child: GetBuilder<ReviewListContoller>(
                builder: (controller) {
                  if (controller.inProgress) {
                    return const Padding(
                      padding: EdgeInsets.all(30.0),
                      child: Text(
                        'Loading...',
                        style: TextStyle(
                            fontSize: 16, fontWeight: FontWeight.w600),
                      ),
                    );
                  } else {
                    return Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 20.0, vertical: 12),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Total Reviews',
                            style: TextStyle(
                              fontSize: 14,
                              color: Colors.grey[600],
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          Text(
                            '${controller.totalCount}',
                            style: const TextStyle(
                              fontSize: 22,
                              fontWeight: FontWeight.bold,
                              color: AppColors.themeColor,
                            ),
                          ),
                        ],
                      ),
                    );
                  }
                },
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          final result = await Navigator.pushNamed(
            context,
            CreateReviewScreen.name,
            arguments: {'productId': widget.productId},
          );

          if (result == true) {
            reviewListController.getReviewList(widget.productId);
          }
        },
        backgroundColor: AppColors.themeColor,
        child: const Icon(
          Icons.add,
          size: 30,
          color: Colors.white,
        ),
      ),
    );
  }
}

List<Widget> getReviewList() {
  ReviewListContoller reviewListController = Get.find<ReviewListContoller>();
  List<Widget> reviewList = [];
  for (int i = 0; i < reviewListController.reviewList.length; i++) {
    reviewList.add(
        ReviewWidgetDesign(reviewModel: reviewListController.reviewList[i]));
  }
  return reviewList;
}