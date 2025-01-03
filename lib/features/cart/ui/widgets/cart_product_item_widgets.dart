import 'package:flutter/material.dart';

import '../../../../app/app_color.dart';
import '../../../common/ui/widgets/product_quantity_inc_dec_button.dart';
class CartProductWidget extends StatelessWidget {
  const CartProductWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return Card(
      elevation: 1,
      color: Colors.white,
      margin: const EdgeInsets.symmetric(horizontal: 16,vertical: 4),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10,vertical: 14),
        child: Row(
          spacing: 8,
          children: [
            Image.asset(
              'assets/images/shoe.png',
              width: 90,
              height: 90,
              fit: BoxFit.scaleDown,
            ),
            Expanded(
                child: Column(
                  spacing: 8,
                  children: [
                    Row(
                      children: [
                        Expanded(
                          child: Column(
                            children: [
                              Text(
                                'New Year Special Sell, Make for you only',
                                maxLines: 1,
                                style:
                                textTheme.bodyLarge?.copyWith(overflow: TextOverflow.ellipsis),
                              ),
                              const Row(
                                spacing: 4,
                                children: [
                                  Text('Size: X'),
                                  Text('Color: Blue')
                                ],
                              )
                            ],
                          ),
                        ),
                        IconButton(
                            onPressed: () {},
                            icon: Icon(Icons.delete))
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text('\$100',style: TextStyle(
                          color: AppColors.themeColor,
                          fontSize: 18,
                          fontWeight: FontWeight.w600,
                        ),),
                        ProductQuantityIncDecButton(
                            onChange: (int numberOfItem) {})
                      ],
                    )
                  ],
                ))
          ],
        ),
      ),
    );
  }
}