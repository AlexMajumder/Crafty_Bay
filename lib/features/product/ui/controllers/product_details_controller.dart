import 'package:get/get.dart';
import '../../../../app/urls.dart';
import '../../../../services/network_caller/network_caller.dart';
import '../../../common/ui/controllers/auth_controller.dart';
import '../../data/models/product_details_model.dart';

class ProductDetailsController extends GetxController {
  bool _inProgress = false;
  bool get inProgress => _inProgress;

  String? _errorMessage;
  String? get errorMessage => _errorMessage;

  bool _isError = false;
  bool get isError => _isError;

  ProductDetailsModel? _productDetailsModel;
  ProductDetailsModel? get productDetailsModel => _productDetailsModel;
  Future<bool> getProductDetails(String productId) async {
    _inProgress = true;
    bool isSuccess = false;
    _errorMessage = null;
    _isError = false;
    _productDetailsModel = null;
    update();

    String? token = Get.find<AuthController>().accessToken;

    NetworkResponse response = await Get.find<NetworkCaller>().getRequest(
      Urls.productDetailsByIdUrl(productId),
      accessToken: token,
    );

    if (response.isSuccess) {
      _productDetailsModel =
          ProductDetailsModel.fromJson(response.responseData);
      isSuccess = true;
    } else {
      _errorMessage = response.errorMessage;
      _isError = true;
    }

    _inProgress = false;
    update();

    return isSuccess;
  }
}
