import 'package:crafty_bay/app/urls.dart';
import 'package:crafty_bay/features/common/data/models/category_list_model.dart';
import 'package:crafty_bay/features/common/data/models/category_model.dart';
import 'package:crafty_bay/features/home/data/models/banner_list_model.dart';
import 'package:crafty_bay/features/home/data/models/banner_model.dart';
import 'package:crafty_bay/services/network_caller/network_caller.dart';
import 'package:get/get.dart';

class CategoryListController extends GetxController {
  bool _inProgress = false;

  bool get inProgress => _inProgress;

  CategoryListModel? _categoryListModel;

  List<CategoryModel> get categoryList => _categoryListModel?.categoryList ?? [];

  String? _errorMessage;

  String? get errorMessage => _errorMessage;

  Future<bool> getCategoryList() async {
    bool isSuccess = false;

    _inProgress = true;
    update();

    NetworkResponse response =
        await Get.find<NetworkCaller>().getRequest(Urls.categoryListUrl);

    if (response.isSuccess) {
      _categoryListModel = CategoryListModel.fromJson(response.responseData);
      isSuccess = true;
    } else {
      _errorMessage = response.errorMessage;
    }

    _inProgress = false;
    update();

    return isSuccess;
  }
}
