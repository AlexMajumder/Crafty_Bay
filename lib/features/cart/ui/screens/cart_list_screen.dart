import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../app/app_color.dart';
import '../../../common/ui/controllers/main_bottom_nav_controller.dart';
class CartListScreen extends StatefulWidget {
  const CartListScreen({super.key});

  @override
  State<CartListScreen> createState() => _CartListScreenState();
}

class _CartListScreenState extends State<CartListScreen> {

  @override
  Widget build(BuildContext context) {

    final textTheme = Theme.of(context).textTheme;

    return PopScope(
      canPop: false,
      onPopInvokedWithResult: (_,__) => _onPop(),
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Cart'),
          leading: IconButton(onPressed: _onPop,
              icon: const Icon(Icons.arrow_back_ios)),
        ),body: Column(
        children: [
          Expanded(child: SizedBox()),
          _buildPriceAndAddToCartSection(textTheme)
        ],
      ),
      ),
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

  void _onPop(){
    Get.find<MainBottomNavController>().backToHome();
  }

}
