import 'package:crafty_bay/app/urls.dart';
import 'package:crafty_bay/features/auth/ui/controller/read_profile_controller.dart';
import 'package:crafty_bay/features/common/ui/controllers/auth_controller.dart';
import 'package:crafty_bay/services/network_caller/network_caller.dart';
import 'package:get/get.dart';
class OtpVerificationController extends GetxController{

  bool _inProgress = false;
  bool get inProgress => _inProgress;

  String? _errorMessage;
  String? get errorMessage => _errorMessage;

  bool _shouldNavigateToCompleteProfile = false;
  bool get shouldNavigateToCompleteProfile => _shouldNavigateToCompleteProfile;

  String? _token;
  String? get token => _token;


  Future<bool> verifyOtp(String email, String otp) async{
    bool isSuccess = false;
    _inProgress = true;
    update();

    final NetworkResponse response = await Get.find<NetworkCaller>().getRequest(Urls.verifyOtpUrl(email,otp));

    if (response.isSuccess){
      _errorMessage = null;
      isSuccess = true;

      String token = response.responseData['data'];

      await Get.find<ReadProfileController>().readProfileData(token);

      if(Get.find<ReadProfileController>().profileModel == null){

        await Get.find<AuthController>().saveUserData(token, Get.find<ReadProfileController>().profileModel!);
        _shouldNavigateToCompleteProfile = true;
      }else{
        _shouldNavigateToCompleteProfile = false;
      }
    }else{
      _errorMessage = response.errorMessage;
    }
    _inProgress = false;
    update();
    return isSuccess;
  }

}