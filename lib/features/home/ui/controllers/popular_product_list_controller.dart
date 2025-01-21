import 'package:crafty_bay/app/urls.dart';
import 'package:crafty_bay/features/common/data/models/product_list_model.dart';
import 'package:crafty_bay/services/network_caller/network_caller.dart';
import 'package:get/get.dart';
import '../../../common/data/models/product_model.dart';

class PopularProductListController extends GetxController {
  bool _inProgress = false;

  bool get inProgress => _inProgress;

  ProductListModel? _productListModel;

  List<ProductModel> get productList => _productListModel?.productList ?? [];

  String? _errorMessage;

  String? get errorMessage => _errorMessage;

  Future<bool> getProductList() async {
    bool isSuccess = false;

    _inProgress = true;
    update();

    NetworkResponse response =
        await Get.find<NetworkCaller>().getRequest(Urls.productListByRemarkUrl('Popular'));

    if (response.isSuccess) {
      _productListModel = ProductListModel.fromJson(response.responseData);
      isSuccess = true;
    } else {
      _errorMessage = response.errorMessage;
    }

    _inProgress = false;
    update();

    return isSuccess;
  }
}
