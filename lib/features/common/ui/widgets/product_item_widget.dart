import 'package:crafty_bay/features/common/data/models/product_model.dart';
import 'package:crafty_bay/features/product/ui/screens/product_details_screen.dart';
import 'package:flutter/material.dart';
import '../../../../app/app_color.dart';
class ProductItemWidget extends StatelessWidget {
  const ProductItemWidget({
    super.key, required this.productModel,
  });

  final ProductModel productModel;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        Navigator.pushNamed(context, ProductDetailsScreen.name, arguments: {'productId': productModel.sId},);
      },
      child: SizedBox(
        width: 140,
        child: Card(
          color: Colors.white,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
          child: Column(
            children: [
              Container(
                decoration: BoxDecoration(
                    color: AppColors.themeColor.withValues(alpha: 0.12),
                    borderRadius: const BorderRadius.only(
                        topLeft: Radius.circular(16),
                        topRight: Radius.circular(16))),
                child: Image.network(
                 productModel.brand?.icon ?? '',
                  width: 140,
                  height: 90,
                  fit: BoxFit.scaleDown,
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  children: [
                     Text(
                      productModel.title ?? '',
                      maxLines: 1,
                      style: const TextStyle(
                          overflow: TextOverflow.ellipsis,
                          fontWeight: FontWeight.w600,
                          color: Colors.black54),
                    ),
                    const SizedBox(
                      height: 2,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          '\$${productModel.currentPrice}',
                          style: const TextStyle(
                              fontWeight: FontWeight.w600,
                              color: AppColors.themeColor),
                        ),
                         Wrap(
                          children: [
                            const Icon(
                              Icons.star,
                              color: Colors.amber,
                              size: 18,
                            ),
                            Text(
                              '${productModel.quantity ?? '0.0'}',
                              style: const TextStyle(
                                  fontWeight: FontWeight.w600,
                                  color: AppColors.themeColor),
                            ),
                          ],
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
                            )),
                      ],
                    ),
                    const SizedBox(
                      height: 4,
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}