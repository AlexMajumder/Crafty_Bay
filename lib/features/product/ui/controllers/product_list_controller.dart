import 'package:get/get.dart';

import '../../../../app/urls.dart';
import '../../../../services/network_caller/network_caller.dart';
import '../../../common/data/models/product_model.dart';
import '../../data/models/product_pagination_model.dart';


class ProductListController extends GetxController {
  bool _inProgress = false;

  bool get inProgress => _inProgress;

  ProductPaginationModel? _productPaginationModel;

  List<ProductModel> get productList => _productPaginationModel?.data?.results ?? [];

  String? _errorMessage;

  String? get errorMessage => _errorMessage;

  Future<bool> getProductList() async {
    bool isSuccess = false;
    _inProgress = true;
    update();
    final NetworkResponse response =
    await Get.find<NetworkCaller>().getRequest(Urls.productListUrl);
    if (response.isSuccess) {
      _productPaginationModel =
          ProductPaginationModel.fromJson(response.responseData);
      isSuccess = true;
    } else {
      _errorMessage = response.errorMessage;
    }
    _inProgress = false;
    update();
    return isSuccess;
  }
}