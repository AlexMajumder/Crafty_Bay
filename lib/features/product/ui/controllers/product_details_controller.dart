import 'package:crafty_bay/app/urls.dart';
import 'package:crafty_bay/services/network_caller/network_caller.dart';
import 'package:get/get.dart';
import '../../data/models/product_details_model.dart';


class ProductDetailsController extends GetxController {
  bool _inProgress = false;

  bool get inProgress => _inProgress;

  ProductDetailsModel? _productDetailsModel;

  ProductDetails? get productDetails => _productDetailsModel?.data!.first;

  String? _errorMessage;

  String? get errorMessage => _errorMessage;

  Future<bool> getProductDetails(int productId) async {
    bool isSuccess = false;

    _inProgress = true;
    update();

    NetworkResponse response =
    await Get.find<NetworkCaller>().getRequest(Urls.productDetailsByIdUrl(productId));

    if (response.isSuccess) {
      _productDetailsModel = ProductDetailsModel.fromJson(response.responseData);
      isSuccess = true;
    } else {
      _errorMessage = response.errorMessage;
    }

    _inProgress = false;
    update();

    return isSuccess;
  }
}
