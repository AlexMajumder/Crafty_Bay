import 'package:crafty_bay/features/common/ui/controllers/main_bottom_nav_controller.dart';
import 'package:crafty_bay/features/home/ui/screens/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
class MainBottomNavScreen extends StatefulWidget {
  const MainBottomNavScreen({super.key});

  static const name = '/main-bottom-nav-screen';

  @override
  State<MainBottomNavScreen> createState() => _MainBottomNavScreenState();
}

class _MainBottomNavScreenState extends State<MainBottomNavScreen> {

  final List<Widget> _screens= [
    const HomeScreen(),
    const HomeScreen(),
    const HomeScreen(),
    const HomeScreen(),
  ];

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
            NavigationDestination(icon: Icon(Icons.category), label: 'Categories'),
            NavigationDestination(icon: Icon(Icons.shopping_cart), label: 'Cart'),
            NavigationDestination(icon: Icon(Icons.favorite), label: 'WishList'),
          ]),
        );
      }
    );
  }
}
