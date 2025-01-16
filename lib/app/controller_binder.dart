import 'package:crafty_bay/features/auth/ui/controller/email_verification_controller.dart';
import 'package:crafty_bay/features/common/ui/controllers/main_bottom_nav_controller.dart';
import 'package:crafty_bay/services/network_caller/network_caller.dart';
import 'package:get/get.dart';

class ControllerBinder extends Bindings{
  @override
  void dependencies() {
   Get.put(MainBottomNavController());
   Get.put(NetworkCaller());
   Get.put(EmailVerificationController());
  }

}