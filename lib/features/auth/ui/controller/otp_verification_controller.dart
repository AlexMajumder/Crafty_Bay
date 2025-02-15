import 'package:crafty_bay/app/urls.dart';
import 'package:crafty_bay/services/network_caller/network_caller.dart';
import 'package:get/get.dart';
import '../../../common/ui/controllers/auth_controller.dart';
import '../../data/models/auth_success_model.dart';
class OtpVerificationController extends GetxController{

  bool _inProgress = false;
  bool get inProgress => _inProgress;

  String? _errorMessage;
  String? get errorMessage => _errorMessage;

  Future<bool> verifyOtp(String email, String otp) async{
    bool isSuccess = false;
    _inProgress = true;
    update();

    final Map<String,dynamic> params ={
      "email":email,
      "otp":otp
    };

    final NetworkResponse response = await Get.find<NetworkCaller>().postRequest(Urls.verifyOtpUrl,body: params);

    if (response.isSuccess){
      AuthSuccessModel authSuccessModel = AuthSuccessModel.fromJson(response.responseData);
      await Get.find<AuthController>().saveUserData(
          authSuccessModel.data!.token!,
          authSuccessModel.data!.user!);
      _errorMessage = null;
      isSuccess = true;
    }else{
      _errorMessage = response.errorMessage;
    }
    _inProgress = false;
    update();
    return isSuccess;
  }

}