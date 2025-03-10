import 'package:crafty_bay/app/app_theme_data.dart';
import 'package:crafty_bay/app/controller_binder.dart';
import 'package:crafty_bay/features/auth/ui/screens/sign_up_screen.dart';
import 'package:crafty_bay/features/auth/ui/screens/sign_in_screen.dart';
import 'package:crafty_bay/features/auth/ui/screens/splash_screen.dart';
import 'package:crafty_bay/features/creat_review/ui/screens/create_review_screen.dart';
import 'package:crafty_bay/features/product/ui/screens/product_details_screen.dart';
import 'package:crafty_bay/features/review/ui/screens/review_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../features/auth/ui/screens/otp_verification_screen.dart';
import '../features/category/ui/screens/category_list_screen.dart';
import '../features/common/ui/screens/main_bottom_nav_screen.dart';
import '../features/product/ui/screens/product_list_screen.dart';

class CraftyBay extends StatelessWidget {
  const CraftyBay({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: SplashScreen.name,
      initialBinding: ControllerBinder(),
      theme: AppThemeData.lightThemeData,
      darkTheme: AppThemeData.darkThemeData,
      themeMode: ThemeMode.light,
      onGenerateRoute: (RouteSettings setting) {
        late Widget widget;
        if (setting.name == SplashScreen.name) {
          widget = const SplashScreen();
        } else if (setting.name == SignInScreen.name) {
          widget = const SignInScreen();
        } else if (setting.name == OtpVerificationScreen.name) {
          String email = setting.arguments as String;
          widget = OtpVerificationScreen(
            email: email,
          );
        } else if (setting.name == SignUpScreen.name) {
          widget = const SignUpScreen();
        } else if (setting.name == MainBottomNavScreen.name) {
          widget = const MainBottomNavScreen();
        } else if (setting.name == CategoryListScreen.name) {
          widget = const CategoryListScreen();
        } else if (setting.name == ProductListScreen.name) {
          Map<String, dynamic> args = setting.arguments as Map<String, dynamic>;
          widget = ProductListScreen(
            categoryName: args['categoryName'],
            categoryId: args['categoryId'],
          );
        } else if (setting.name == ProductDetailsScreen.name) {
          final arguments = setting.arguments as Map<String, dynamic>;
          String productId = arguments['productId'] as String;
          widget = ProductDetailsScreen(productId: productId);
        } else if (setting.name == ReviewScreen.name) {
          final arg = setting.arguments as Map<String, dynamic>;
          widget = ReviewScreen(
            productId: arg['productId'],
          );
        } else if (setting.name == CreateReviewScreen.name) {
          int productId = setting.arguments as int;
          widget = CreateReviewScreen(
            productId: productId,
          );
        }

        return MaterialPageRoute(
          builder: (ctx) {
            return widget;
          },
        );
      },
    );
  }
}
