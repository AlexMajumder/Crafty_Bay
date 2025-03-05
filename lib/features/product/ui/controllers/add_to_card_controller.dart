
import 'package:get/get.dart';

import '../../../../app/urls.dart';
import '../../../../services/network_caller/network_caller.dart';
import '../../../common/ui/controllers/auth_controller.dart';

class AddToCartController extends GetxController {
  bool _inProgress = false;
  bool get inProgress => _inProgress;
  String? _errorMessage;
  String? get errorMessage => _errorMessage;



  Future<bool> addToCart(String productId, {required String color, required String size}) async {
    bool isSuccess = false;
    _inProgress = true;
    update();
    String? token=Get.find<AuthController>().accessToken;
    Map<String,dynamic>body={
      "product":productId,
      // "quantity":2,
      "color": color,
      "size": size
    };
    NetworkResponse response = await Get.find<NetworkCaller>().postRequest(
        Urls.addToCart,
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