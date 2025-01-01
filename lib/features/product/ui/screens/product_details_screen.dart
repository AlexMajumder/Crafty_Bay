import 'package:crafty_bay/features/product/ui/widgets/product_image_carousel_slider.dart';
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
    return Scaffold(
      appBar: AppBar(title: const Text('Product Details screen'),),
      body: const Column(
        children: [
          ProductImageCarouselSlider(),

        ],
      ),
    );
  }
}
