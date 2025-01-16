import 'package:crafty_bay/app/app_theme_data.dart';
import 'package:crafty_bay/app/controller_binder.dart';
import 'package:crafty_bay/features/auth/ui/screens/complite_profile_screen.dart';
import 'package:crafty_bay/features/auth/ui/screens/email_verification_screen.dart';
import 'package:crafty_bay/features/auth/ui/screens/splash_screen.dart';
import 'package:crafty_bay/features/creat_review/ui/screens/create_review_screen.dart';
import 'package:crafty_bay/features/product/ui/screens/product_details_screen.dart';
import 'package:crafty_bay/features/review/ui/screens/review_screen.dart';
import 'package:crafty_bay/features/wishlist/ui/screens/wish_list_screen.dart';
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
        } else if (setting.name == EmailVerificationScreen.name) {
          widget = const EmailVerificationScreen();
        } else if (setting.name == OtpVerificationScreen.name) {
          String email = setting.arguments as String;
          widget = OtpVerificationScreen(email: email,);
        } else if (setting.name == CompleteProfileScreen.name) {
          widget = const CompleteProfileScreen();
        } else if (setting.name == MainBottomNavScreen.name) {
          widget = const MainBottomNavScreen();
        } else if (setting.name == CategoryListScreen.name) {
          widget = const CategoryListScreen();
        } else if (setting.name == ProductListScreen.name) {
          String categoryName = setting.arguments as String;
          widget = ProductListScreen(
            categoryName: categoryName,
          );
        }else if (setting.name == ProductDetailsScreen.name) {
          int productId = setting.arguments as int;
          widget = ProductDetailsScreen(
            productId: productId,
          );
        }else if (setting.name == ReviewScreen.name) {
          int productId = setting.arguments as int;
          widget = ReviewScreen(
            productId: productId,
          );
        }else if (setting.name == CreateReviewScreen.name) {
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
