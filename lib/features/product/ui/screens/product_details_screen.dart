import 'package:crafty_bay/app/app_color.dart';
import 'package:crafty_bay/features/product/ui/widgets/color_picker_widget.dart';
import 'package:crafty_bay/features/product/ui/widgets/product_image_carousel_slider.dart';
import 'package:crafty_bay/features/common/ui/widgets/product_quantity_inc_dec_button.dart';
import 'package:crafty_bay/features/product/ui/widgets/size_picker_widget.dart';
import 'package:flutter/material.dart';

class ProductDetailsScreen extends StatefulWidget {
  const ProductDetailsScreen({super.key, required this.productId});

  final int productId;
  static const name = 'product/product-details';

  @override
  State<ProductDetailsScreen> createState() => _ProductDetailsScreenState();
}

class _ProductDetailsScreenState extends State<ProductDetailsScreen> {
  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Product Details'),
      ),
      body: Column(
        children: [
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  const ProductImageCarouselSlider(),
                  Padding(
                    padding: const EdgeInsets.all(16),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        _buildProductHeader(textTheme),
                        _buildColorPicker(textTheme),
                        const SizedBox(height: 8),
                        _buildSizePicker(textTheme),
                        const SizedBox(height: 8),
                        _buildDescription(textTheme),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
          _buildPriceAndAddToCartSection(textTheme),
        ],
      ),
    );
  }

  Widget _buildProductHeader(TextTheme textTheme) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Samsung S24 Ultra, Yes Its right choice for you',
                style: textTheme.titleMedium,
              ),
              Row(
                children: [
                  const Icon(Icons.star, color: Colors.amber, size: 18),
                  const SizedBox(width: 4),
                  const Text('4.5',
                      style: TextStyle(
                          fontWeight: FontWeight.w600, color: Colors.grey)),
                  TextButton(
                    onPressed: () {},
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

  Widget _buildColorPicker(TextTheme textTheme) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('Color', style: textTheme.titleMedium),
        ColorPickerWidget(
          colors: const ['Red', 'Green', 'Yellow', 'Blue', 'Pink'],
          onColorSelected: (String selectedColor) {},
        ),
      ],
    );
  }

  Widget _buildSizePicker(TextTheme textTheme) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('Size', style: textTheme.titleMedium),
        SizePickerWidget(
          sizes: const ['S', 'M', 'L', 'XL', 'XXL', 'XXXL'],
          onSizeSelected: (String selectedSize) {},
        ),
      ],
    );
  }

  Widget _buildDescription(TextTheme textTheme) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('Description', style: textTheme.titleMedium),
        const Text(
          "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s...",
          style: TextStyle(
              fontWeight: FontWeight.w400, color: Colors.grey),
        ),
      ],
    );
  }

  Widget _buildPriceAndAddToCartSection(TextTheme textTheme) {
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
              const Text(
                '\$100',
                style: TextStyle(
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
