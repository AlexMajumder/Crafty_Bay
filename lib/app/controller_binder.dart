import 'package:crafty_bay/features/auth/ui/controller/email_verification_controller.dart';
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

import '../features/auth/ui/controller/email_otp_controller.dart';

class ControllerBinder extends Bindings{
  @override
  void dependencies() {
   Get.put(MainBottomNavController());
   Get.put(NetworkCaller());
   Get.put(EmailVerificationController());
   Get.put(OtpVerificationController());
   Get.put(HomeBannerListController());
   Get.put(CategoryListController());
   Get.put(PopularProductListController());
   Get.put(SpecialProductListController());
   Get.put(NewProductListController());
   Get.put(ProductListController());
   Get.put(ProductDetailsController());
  }

}