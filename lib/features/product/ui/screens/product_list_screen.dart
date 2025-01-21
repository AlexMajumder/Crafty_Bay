import 'package:crafty_bay/features/common/ui/widgets/product_item_widget.dart';
import 'package:flutter/material.dart';
class ProductListScreen extends StatefulWidget {

  static const name = '/product/product/list-by-category';

  const ProductListScreen({super.key, required this.categoryName});

  final String categoryName;

  @override
  State<ProductListScreen> createState() => _ProductListScreenState();
}

class _ProductListScreenState extends State<ProductListScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(widget.categoryName),),
      body: Padding(
        padding: const EdgeInsets.all(4),
        child: GridView.builder(
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3,
                childAspectRatio: 0.8,
            crossAxisSpacing: 2,
              mainAxisSpacing: 4
            ),
            itemCount: 20,
            itemBuilder: (context,index){
          //return const FittedBox(child: ProductItemWidget());
            }),
      ),
    );
  }
}
