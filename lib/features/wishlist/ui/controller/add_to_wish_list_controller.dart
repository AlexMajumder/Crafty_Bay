import 'package:get/get.dart';
import '../../../../app/urls.dart';
import '../../../../services/network_caller/network_caller.dart';
import '../../../common/ui/controllers/auth_controller.dart';

class AddToWishController extends GetxController {
  bool _inProgress = false;
  bool get inProgress => _inProgress;
  String? _errorMessage;
  String? get errorMessage => _errorMessage;



  Future<bool> addToWish(String productId) async {
    bool isSuccess = false;
    _inProgress = true;
    update();
    String? token=Get.find<AuthController>().accessToken;
    Map<String,dynamic>body={
      "product":productId
    };
    NetworkResponse response = await Get.find<NetworkCaller>().postRequest(
        Urls.addToWishUrl,
        body: body,
        accessToken: token
    );

    if (response.isSuccess) {
      isSuccess = true;

    } else {
      _errorMessage = response.errorMessage;
    }
    _inProgress = false;
    update();

    return isSuccess;
  }
}