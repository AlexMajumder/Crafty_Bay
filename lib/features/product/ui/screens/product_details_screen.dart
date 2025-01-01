import 'package:crafty_bay/app/app_color.dart';
import 'package:crafty_bay/features/product/ui/widgets/color_picker_widget.dart';
import 'package:crafty_bay/features/product/ui/widgets/product_image_carousel_slider.dart';
import 'package:crafty_bay/features/product/ui/widgets/product_quantity_inc_dec_button.dart';
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
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        spacing: 8,
                        children: [
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              spacing: 8,
                              children: [
                                Text(
                                  'Samsung S24 Ultra, Yes Its right choice for you',
                                  style: textTheme.titleMedium,
                                ),
                                Row(
                                  children: [
                                    const Wrap(
                                      children: [
                                        Icon(
                                          Icons.star,
                                          color: Colors.amber,
                                          size: 18,
                                        ),
                                        SizedBox(
                                          width: 4,
                                        ),
                                        Text(
                                          '4.5',
                                          style: TextStyle(
                                              fontWeight: FontWeight.w600,
                                              color: Colors.grey),
                                        ),
                                      ],
                                    ),
                                    TextButton(
                                        onPressed: () {},
                                        child: const Text('Reviews')),
                                    Container(
                                        decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(4),
                                          color: AppColors.themeColor,
                                        ),
                                        padding: const EdgeInsets.all(4),
                                        child: const Icon(
                                          Icons.favorite_border,
                                          size: 14,
                                          color: Colors.white,
                                        )),
                                  ],
                                ),
                              ],
                            ),
                          ),
                          ProductQuantityIncDecButton(
                            onChange: (int value) {},
                          ),
                        ],
                      ),
                      Text(
                        'Color',
                        style: textTheme.titleMedium,
                      ),
                      ColorPickerWidget(
                        colors: const ['Red', 'Green', 'Yellow', 'Blue', 'pink'],
                        onColorSelected: (String selectedColor) {},
                      ),
                      const SizedBox(
                        height: 8,
                      ),
                      Text(
                        'Size',
                        style: textTheme.titleMedium,
                      ),
                      SizePickerWidget(
                        sizes: const ['S', 'M', 'L', 'XL', 'XXL', 'XXXL'],
                        onSizeSelected: (String selectedColor) {},
                      ),
                      const SizedBox(
                        height: 8,
                      ),
                      Text(
                        'Description',
                        style: textTheme.titleMedium,
                      ),
                      const Text(
                        "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.",
                        style: TextStyle(
                            fontWeight: FontWeight.w400, color: Colors.grey),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          )),
          _buildPriceAndAddToCardSection(textTheme)
        ],
      ),
    );
  }

  Widget _buildPriceAndAddToCardSection(TextTheme textTheme) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration:
          BoxDecoration(color: AppColors.themeColor.withValues(alpha: .2)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            children: [
              Text('Price', style: textTheme.titleSmall),
              const Text(
                '\$100',
                style: TextStyle(
                    color: AppColors.themeColor,
                    fontWeight: FontWeight.w600,
                    fontSize: 18),
              )
            ],
          ),
          SizedBox(
            width: 120,
            child: ElevatedButton(
              onPressed: () {},
              child: const Text(
                'Add to Card',
              ),
            ),
          )
        ],
      ),
    );
  }
}
