import 'package:crafty_bay/features/cart/ui/widgets/cart_product_item_widgets.dart';
import 'package:crafty_bay/features/common/ui/screens/cart_and_wish_list_simmer_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../common/ui/controllers/main_bottom_nav_controller.dart';
import '../controller/cart_list_controller.dart';

class CartListScreen extends StatefulWidget {
  const CartListScreen({super.key});
  static String name = '/cart-screen';

  @override
  State<CartListScreen> createState() => _CartListScreenState();
}

class _CartListScreenState extends State<CartListScreen> {
  CartListController cartListController = Get.find<CartListController>();
  @override
  void initState() {
    super.initState();
    cartListController.getCartList();
  }
  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: false,
      onPopInvokedWithResult: (_,__){
        Get.find<MainBottomNavController>().backToHome();
      },
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Cart'),
          leading: IconButton(onPressed: (){
            Get.find<MainBottomNavController>().backToHome();
          }, icon: const Icon(Icons.arrow_back_ios)),
        ),
        body: GetBuilder<CartListController>(
          builder: (controller) {
            if (controller.inProgress) {
              return const CartAndWishListSimmerScreen();
            } else if (controller.cartList.isEmpty) {
              return const Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.shopping_cart_outlined,
                      size: 50,
                      color: Colors.grey,
                    ),
                    SizedBox(height: 10),
                    Text(
                      "Your cart is empty",
                      style: TextStyle(fontSize: 18, color: Colors.grey),
                    ),

                  ],
                ),
              );
            } else {
              return SingleChildScrollView(
                child: Column(
                  children: getCartList(),
                ),
              );
            }
          },
        ),

      ),
    );
  }
  List<Widget>getCartList(){
    List<Widget>cartList=[];
    for(int i=0;i<cartListController.cartList.length;i++){
      cartList.add(CartItemWidget(cartModel: cartListController.cartList[i],));
    }
    return cartList;
  }
}