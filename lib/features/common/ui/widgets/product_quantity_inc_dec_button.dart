
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../app/app_color.dart';
import '../../../cart/data/model/cart_list_model.dart';
import '../../../cart/ui/controller/cart_list_controller.dart';

class ProductQuantityIncDecButton extends StatefulWidget {
  final CartModel cartModel;
  const ProductQuantityIncDecButton({super.key, required this.cartModel});

  @override
  State<ProductQuantityIncDecButton> createState() =>
      _ProductQuantityIncDecButtonState();
}

class _ProductQuantityIncDecButtonState
    extends State<ProductQuantityIncDecButton> {
  late bool isRemoveButtonDisabled;
  late bool isAddButtonDisabled;

  @override
  void initState() {
    super.initState();
    isRemoveButtonDisabled = widget.cartModel.quantity == 1;
    isAddButtonDisabled = widget.cartModel.quantity == 19;
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder<CartListController>(
      builder: (controller) {
        return Row(
          children: [
            incrementDecrementButton(
              Icons.remove,
              isRemoveButtonDisabled ? null : onTapRemoveButton,
              isRemoveButtonDisabled,
            ),
            const SizedBox(width: 8),
            Text('${widget.cartModel.quantity}', style: const TextStyle(fontSize: 18)),
            const SizedBox(width: 8),
            incrementDecrementButton(
              Icons.add,
              isAddButtonDisabled ? null : onTapAddButton,
              isAddButtonDisabled,
            ),
          ],
        );
      },
    );
  }

  Container incrementDecrementButton(
      IconData icon, VoidCallback? onTap, bool isButtonDisabled) {
    return Container(
      height: 30,
      width: 30,
      decoration: BoxDecoration(
        color: isButtonDisabled ? Colors.grey[300] : AppColors.themeColor,
        borderRadius: BorderRadius.circular(6),
      ),
      child: IconButton(
        onPressed: onTap,
        icon: Icon(icon, color: Colors.white, size: 16),
        padding: EdgeInsets.zero,
      ),
    );
  }

  void onTapRemoveButton() {
    final product = widget.cartModel;

    if (product.quantity! > 1) {
      Get.find<CartListController>().updateCartQuantity(product.sId!, product.quantity! - 1);

      setState(() {
        product.quantity = product.quantity! ;
        isAddButtonDisabled = false;
        isRemoveButtonDisabled = product.quantity == 1;
      });
    }
  }

  void onTapAddButton() {
    final product = widget.cartModel;

    if (product.quantity! < 20) {
      Get.find<CartListController>().updateCartQuantity(product.sId!, product.quantity! +1);

      setState(() {
        product.quantity = product.quantity!;
        isRemoveButtonDisabled = false;
        isAddButtonDisabled = product.quantity == 20;
      });
    }
  }
}