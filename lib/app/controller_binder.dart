import 'package:crafty_bay/features/auth/ui/controller/sign_in_controller.dart';
import 'package:crafty_bay/features/common/ui/controllers/category_list_controller.dart';
import 'package:crafty_bay/features/common/ui/controllers/main_bottom_nav_controller.dart';
import 'package:crafty_bay/features/common/ui/controllers/product_list_controller.dart';
import 'package:crafty_bay/features/home/ui/controllers/home_banner_list_controller.dart';
import 'package:crafty_bay/features/home/ui/controllers/new_product_list_controller.dart';
import 'package:crafty_bay/features/home/ui/controllers/popular_product_list_controller.dart';
import 'package:crafty_bay/features/home/ui/controllers/special_product_list_controller.dart';
import 'package:crafty_bay/features/product/ui/controllers/product_details_controller.dart';
import 'package:crafty_bay/services/network_caller/network_caller.dart';
import 'package:get/get.dart';

import '../features/auth/ui/controller/otp_verification_controller.dart';
import '../features/auth/ui/controller/read_profile_controller.dart';
import '../features/auth/ui/controller/sign_up_controller.dart';
import '../features/common/ui/controllers/auth_controller.dart';

class ControllerBinder extends Bindings{
  @override
  void dependencies() {
   Get.put(MainBottomNavController());
   Get.put(AuthController());
   Get.put(SignUpController());
   Get.put(NetworkCaller());
   Get.put(SignInController());
   Get.put(OtpVerificationController());
   Get.put(ReadProfileController());
   Get.put(HomeBannerListController());
   Get.put(CategoryListController());
   Get.put(PopularProductListController());
   Get.put(SpecialProductListController());
   Get.put(NewProductListController());
   Get.put(ProductListController());
   Get.put(ProductDetailsController());
  }

}