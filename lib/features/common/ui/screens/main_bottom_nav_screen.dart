import 'package:crafty_bay/features/cart/ui/screens/cart_list_screen.dart';
import 'package:crafty_bay/features/category/ui/screens/category_list_screen.dart';
import 'package:crafty_bay/features/common/ui/controllers/main_bottom_nav_controller.dart';
import 'package:crafty_bay/features/home/ui/controllers/new_product_list_controller.dart';
import 'package:crafty_bay/features/home/ui/controllers/popular_product_list_controller.dart';
import 'package:crafty_bay/features/home/ui/controllers/slider_list_controller.dart';
import 'package:crafty_bay/features/home/ui/controllers/special_product_list_controller.dart';
import 'package:crafty_bay/features/home/ui/screens/home_screen.dart';
import 'package:crafty_bay/features/wishlist/ui/screens/wish_list_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MainBottomNavScreen extends StatefulWidget {
  const MainBottomNavScreen({super.key});

  static const name = '/main-bottom-nav-screen';

  @override
  State<MainBottomNavScreen> createState() => _MainBottomNavScreenState();
}

class _MainBottomNavScreenState extends State<MainBottomNavScreen> {

  final List<Widget> _screens = [
    const HomeScreen(),
    const CategoryListScreen(),
    const CartListScreen(),
    const WishListScreen(),
  ];

  @override
  void initState() {
    super.initState();
    Get.find<SliderListController>().getSliders();
    //Get.find<CategoryListController>().getCategoryList();
    Get.find<PopularProductListController>().getProductList();
    Get.find<SpecialProductListController>().getProductList();
    Get.find<NewProductListController>().getProductList();
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder<MainBottomNavController>(
        builder: (mainBottomNavController) {
      return Scaffold(
        body: _screens[mainBottomNavController.selectedIndex],
        bottomNavigationBar: NavigationBar(
            selectedIndex: mainBottomNavController.selectedIndex,
            onDestinationSelected: mainBottomNavController.changeIndex,
            destinations: const [
              NavigationDestination(icon: Icon(Icons.home), label: 'Home'),
              NavigationDestination(
                  icon: Icon(Icons.category), label: 'Categories'),
              NavigationDestination(
                  icon: Icon(Icons.shopping_cart), label: 'Cart'),
              NavigationDestination(
                  icon: Icon(Icons.favorite), label: 'WishList'),
            ]),
      );
    });
  }
}
