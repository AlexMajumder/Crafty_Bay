import 'package:crafty_bay/features/common/ui/controllers/product_list_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../common/ui/widgets/category_item_widget_simmer.dart';
import '../../../common/ui/widgets/product_item_widget.dart';
class ProductListScreen extends StatefulWidget {
  static const name = '/product/product/list-by-category';

  const ProductListScreen(
      {super.key, required this.categoryName, required this.categoryId});

  final String categoryName;
  final int categoryId;

  @override
  State<ProductListScreen> createState() => _ProductListScreenState();
}

class _ProductListScreenState extends State<ProductListScreen> {
  @override
  void initState() {
    super.initState();
    Get.find<ProductListController>()
        .getProductListByCategory(widget.categoryId);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.categoryName),
      ),
      body: Padding(
        padding: const EdgeInsets.all(4),
        child: GetBuilder<ProductListController>(builder: (controller) {
          if (controller.inProgress) {
            return GridView.builder(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 3,
                    childAspectRatio: 0.8,
                    crossAxisSpacing: 2,
                    mainAxisSpacing: 4),
                itemCount: 20,
                itemBuilder: (context, index) {
                  return  const FittedBox(child: CategoryItemWidgetSimmer());
                });
          }
          return GridView.builder(
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 3,
                  childAspectRatio: 0.8,
                  crossAxisSpacing: 2,
                  mainAxisSpacing: 4),
              itemCount: controller.productList.length,
              itemBuilder: (context, index) {
                return FittedBox(
                    child: ProductItemWidget(
                  productModel: controller.productList[index],
                ));
              });
        }),
      ),
    );
  }
}
