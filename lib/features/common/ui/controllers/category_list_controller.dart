import 'package:crafty_bay/app/urls.dart';
import 'package:crafty_bay/features/common/data/models/category/category_pagination_model.dart';
import 'package:crafty_bay/services/network_caller/network_caller.dart';
import 'package:get/get.dart';

class CategoryListController extends GetxController {
  bool _inProgress = false;

  bool get inProgress => _inProgress;
  bool get initialInProgress => _page == 1  && inProgress ;

  List<CategoryItemModel> _categoryList = [];

  List<CategoryItemModel> get categoryList => _categoryList ;

  String? _errorMessage;

  String? get errorMessage => _errorMessage;

  final int _count = 30;
  int _page = 0;
  int? _lastPage;

  Future<bool> getCategoryList() async {
    if (_lastPage != null && _page > _lastPage!) return false;
    _page++;
    bool isSuccess = false;

    _inProgress = true;
    update();

    Map<String, dynamic> queryParams ={
      'count': _count,
      'page' : _page
    };

    NetworkResponse response =
        await Get.find<NetworkCaller>().getRequest(Urls.categoryListUrl,queryParams: queryParams);

    if (response.isSuccess) {
      CategoryPaginationModel paginationModel = CategoryPaginationModel.fromJson(response.responseData);
      _categoryList.addAll(paginationModel.data?.results ?? []);

      if(paginationModel.data?.lastPage != null){
        _lastPage = paginationModel.data!.lastPage!;
      }

      isSuccess = true;
    } else {
      _errorMessage = response.errorMessage;
    }

    _inProgress = false;
    update();

    return isSuccess;
  }

  Future<bool> refreshCategoryList()async {
    _page = 0;
    _lastPage = null;
    _categoryList.clear();
    return getCategoryList();
  }

}
