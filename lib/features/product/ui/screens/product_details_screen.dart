import 'package:crafty_bay/features/auth/ui/screens/sign_in_screen.dart';
import 'package:crafty_bay/features/common/ui/widgets/snack_bar_message.dart';
import 'package:crafty_bay/features/product/ui/widgets/product_image_carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../app/app_color.dart';
import '../../../common/ui/controllers/auth_controller.dart';
import '../../../review/ui/screens/review_screen.dart';
import '../../../wishlist/ui/controller/add_to_wish_list_controller.dart';
import '../controllers/add_to_card_controller.dart';
import '../controllers/product_details_controller.dart';
import '../widgets/color_picker_widget.dart';
import '../widgets/product_details_simmer.dart';
import '../widgets/size_picker_widget.dart';

class ProductDetailsScreen extends StatefulWidget {
  const ProductDetailsScreen({super.key, required this.productId});
  static String name = '/product/ui/screens/product_details';
  final String productId;

  @override
  State<ProductDetailsScreen> createState() => _ProductDetailsScreenState();
}

class _ProductDetailsScreenState extends State<ProductDetailsScreen> {
  ProductDetailsController productDetailsController = Get.find<ProductDetailsController>();

  String? selectedColor;
  String? selectedSize;

  @override
  void initState() {
    super.initState();
    productDetailsController.getProductDetails(widget.productId);
  }

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return Scaffold(
      appBar: AppBar(
        title: const Text('Product Details'),
      ),
      body: GetBuilder<ProductDetailsController>(builder: (controller) {
        if (controller.isError) {
          return const Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(Icons.error, color: Colors.red, size: 50),
                SizedBox(height: 10),
                Text(
                  'Product not found. Please try again.',
                  style: TextStyle(fontSize: 18, color: Colors.red),
                ),
              ],
            ),
          );
        }
        if (controller.productDetailsModel == null || controller.productDetailsModel!.data == null) {
          return const ProductDetailsShimmer();
        }
        return Column(
          children: [
            ProductImageCarouselSlider(productDetailsModel: controller.productDetailsModel!),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          SizedBox(
                            width: 230,
                            child: Text(
                              controller.productDetailsModel?.data?.title ?? 'No Title Available',
                              style: const TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 18,
                                  color: Colors.black54),
                            ),
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          Wrap(
                            children: [
                              const Icon(
                                Icons.star,
                                color: Colors.amber,
                                size: 18,
                              ),
                              Text(
                                '${controller.productDetailsModel?.data?.iV ?? 0}',
                                style: const TextStyle(fontWeight: FontWeight.w400),
                              ),
                            ],
                          ),
                          const SizedBox(
                            width: 8,
                          ),
                          TextButton(
                              onPressed: onPressedReview,
                              child: const Text(
                                'Reviews',
                                style: TextStyle(
                                    fontWeight: FontWeight.w600,
                                    color: AppColors.themeColor),
                              )),
                          const SizedBox(
                            width: 2,
                          ),
                          IconButton(
                            onPressed: onTapWish,
                            icon: Icon(
                              controller.productDetailsModel!.data?.inWishlist ?? false
                                  ? Icons.favorite
                                  : Icons.favorite_border,
                              color: controller.productDetailsModel!.data?.inWishlist ?? false
                                  ? Colors.red
                                  : null,
                            ),
                          )
                        ],
                      ),
                      const Text(
                        'Color',
                        style: TextStyle(
                          fontWeight: FontWeight.w500,
                          fontSize: 20,
                        ),
                      ),
                      const SizedBox(height: 8),
                      (controller.productDetailsModel?.data!.colors?.isEmpty ?? true)
                          ? const Text("No Color Available")
                          : ColorPickerWidget(
                        colors: controller.productDetailsModel!.data!.colors!,
                        onColorSelected: (color) {
                          setState(() {
                            selectedColor = color;
                          });
                        },
                      ),
                      const SizedBox(height: 8),
                      const Text(
                        'Size',
                        style: TextStyle(
                          fontWeight: FontWeight.w500,
                          fontSize: 20,
                        ),
                      ),
                      const SizedBox(height: 8),
                      (controller.productDetailsModel?.data!.sizes?.isEmpty ?? true)
                          ? const Text("No Size Available")
                          : SizePickerWidget(
                        sizes: controller.productDetailsModel!.data!.sizes!,
                        onSizeSelected: (size) {
                          setState(() {
                            selectedSize = size;
                          });
                        },
                      ),
                      const SizedBox(height: 8),
                      const Text(
                        'Description',
                        style: TextStyle(
                          fontWeight: FontWeight.w500,
                          fontSize: 20,
                        ),
                      ),
                      const SizedBox(height: 8),
                      Text(
                          controller.productDetailsModel?.data!.description ?? 'No Description Available',
                          style: const TextStyle(color: Colors.grey)),
                    ],
                  ),
                ),
              ),
            ),
            Container(
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
        '\$${controller.productDetailsModel?.data!.currentPrice ?? '0'}',
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
        )
          ],
        );
      }),
    );
  }

  void onTapWish() async {
    if (await Get.find<AuthController>().isUserLoggedIn()) {
      AddToWishController addToWishController = Get.find<AddToWishController>();
      final bool result = await addToWishController.addToWish(widget.productId);
      if (result) {
        ShowSnackBarMessage(context, 'Wish Added Successfully');
      } else {
        ShowSnackBarMessage(context, addToWishController.errorMessage!);
      }
    } else {
      Navigator.pushNamed(context, SignInScreen.name);
    }
  }

  void onTapAddToCart() async {
    if (await Get.find<AuthController>().isUserLoggedIn()) {
      if (selectedColor == null || selectedSize == null) {
        ShowSnackBarMessage(context, 'Please select both color and size');
        return;
      }

      AddToCartController addToCartController = Get.find<AddToCartController>();
      final bool result = await addToCartController.addToCart(
        widget.productId,
        size: selectedSize!,
        color: selectedColor!,
      );
      if (result) {
        ShowSnackBarMessage(context, 'Cart Added Successfully');
      } else {
        ShowSnackBarMessage(context, addToCartController.errorMessage!);
      }
    } else {
      Navigator.pushNamed(context, SignInScreen.name);
    }
  }


  void onPressedReview() {
    Navigator.pushNamed(context, ReviewScreen.name, arguments: {'productId': widget.productId});
  }
}