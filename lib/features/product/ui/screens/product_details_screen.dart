import 'package:crafty_bay/app/app_color.dart';
import 'package:crafty_bay/features/product/data/models/product_details_model.dart';
import 'package:crafty_bay/features/product/ui/controllers/product_details_controller.dart';
import 'package:crafty_bay/features/product/ui/widgets/color_picker_widget.dart';
import 'package:crafty_bay/features/product/ui/widgets/product_details_simmer.dart';
import 'package:crafty_bay/features/product/ui/widgets/product_image_carousel_slider.dart';
import 'package:crafty_bay/features/common/ui/widgets/product_quantity_inc_dec_button.dart';
import 'package:crafty_bay/features/product/ui/widgets/size_picker_widget.dart';
import 'package:crafty_bay/features/review/ui/screens/review_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProductDetailsScreen extends StatefulWidget {
  const ProductDetailsScreen({super.key, required this.productId});

  final int productId;
  static const name = 'product/product-details';

  @override
  State<ProductDetailsScreen> createState() => _ProductDetailsScreenState();
}

class _ProductDetailsScreenState extends State<ProductDetailsScreen> {
  @override
  void initState() {
    super.initState();
    Get.find<ProductDetailsController>().getProductDetails(widget.productId);
  }

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return Scaffold(
      appBar: AppBar(
        title: const Text('Product Details'),
        leading: IconButton(
            onPressed: () {
              Get.back();
            },
            icon: const Icon(Icons.arrow_back_ios)),
      ),
      body: GetBuilder<ProductDetailsController>(builder: (controller) {
        if (controller.inProgress) {
          return const ProductDetailsShimmer();
        }
        if (controller.errorMessage != null) {
          return Center(
            child: Text(controller.errorMessage!),
          );
        }

        ProductDetails productDetails = controller.productDetails!;

        return Column(
          children: [
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    ProductImageCarouselSlider(
                      imageUrls: [
                        productDetails.img1!,
                        productDetails.img2!,
                        productDetails.img3!,
                        productDetails.img4!,
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.all(16),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          _buildProductHeader(textTheme, productDetails),
                          _buildColorPicker(textTheme, productDetails),
                          const SizedBox(height: 8),
                          _buildSizePicker(textTheme, productDetails),
                          const SizedBox(height: 8),
                          _buildDescription(textTheme, productDetails),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
            _buildPriceAndAddToCartSection(
                textTheme, productDetails.product?.price ?? '0.0'),
          ],
        );
      }),
    );
  }

  Widget _buildProductHeader(
      TextTheme textTheme, ProductDetails productDetails) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                productDetails.product?.title ?? '',
                style: textTheme.titleMedium,
                textAlign: TextAlign.start,
              ),
              Row(
                children: [
                  const Icon(Icons.star, color: Colors.amber, size: 18),
                  const SizedBox(width: 4),
                  Text('${productDetails.product?.star ?? ''}',
                      style: const TextStyle(
                          fontWeight: FontWeight.w600, color: Colors.grey)),
                  TextButton(
                    onPressed: () {
                      Get.toNamed(ReviewScreen.name, arguments: 1);
                    },
                    child: const Text('Reviews'),
                  ),
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(4),
                      color: AppColors.themeColor,
                    ),
                    padding: const EdgeInsets.all(4),
                    child: const Icon(
                      Icons.favorite_border,
                      size: 14,
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
        ProductQuantityIncDecButton(
          onChange: (int value) {},
        ),
      ],
    );
  }

  Widget _buildColorPicker(TextTheme textTheme, ProductDetails productDetails) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('Color', style: textTheme.titleMedium),
        ColorPickerWidget(
          colors: productDetails.color?.split(',') ?? [],
          onColorSelected: (String selectedColor) {},
        ),
      ],
    );
  }

  Widget _buildSizePicker(TextTheme textTheme, ProductDetails productDetails) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('Size', style: textTheme.titleMedium),
        SizePickerWidget(
          sizes: productDetails.size?.split(',') ?? [],
          onSizeSelected: (String selectedSize) {},
        ),
      ],
    );
  }

  Widget _buildDescription(TextTheme textTheme, ProductDetails productDetails) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('Description', style: textTheme.titleMedium),
        Text(
          productDetails.des ?? '',
          style:
              const TextStyle(fontWeight: FontWeight.w400, color: Colors.grey),
        ),
      ],
    );
  }

  Widget _buildPriceAndAddToCartSection(TextTheme textTheme, String price) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: AppColors.themeColor.withValues(alpha: .2),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('Price', style: textTheme.titleSmall),
              Text(
                '\$$price',
                style: const TextStyle(
                    color: AppColors.themeColor,
                    fontWeight: FontWeight.w600,
                    fontSize: 18),
              ),
            ],
          ),
          SizedBox(
            width: 120,
            child: ElevatedButton(
              onPressed: () {},
              child: const Text('Add to Cart'),
            ),
          ),
        ],
      ),
    );
  }
}
