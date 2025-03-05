
import 'package:get/get.dart';

import '../../../../app/urls.dart';
import '../../../../services/network_caller/network_caller.dart';
import '../../../common/ui/controllers/auth_controller.dart';
import '../../data/models/review_list_model.dart';

class ReviewListContoller extends GetxController {
  bool _inProgress = false;
  bool get inProgress => _inProgress;
  String? _errorMessage;
  String? get errorMessage => _errorMessage;
  int? _totalCount;
  int? get totalCount => _totalCount;

  final List<ReviewModel> _reviewList = [];
  List<ReviewModel> get reviewList => _reviewList;



  Future<bool> getReviewList(String productId) async {
    _inProgress = true;
    bool isSuccess = false;
    update();
    String? token=Get.find<AuthController>().accessToken;
    NetworkResponse response = await Get.find<NetworkCaller>().getRequest(
        Urls.reviewListUrl(productId),
        accessToken: token
    );

    if (response.isSuccess) {
      _reviewList.clear();
      isSuccess = true;
      ReviewListModel reviewListModel= ReviewListModel.fromJson(
        response.responseData,
      );
      _reviewList.addAll(reviewListModel.data!.results??[]);
      _totalCount = reviewListModel.data!.total;

    } else {
      _errorMessage = response.errorMessage;
    }
    _inProgress = false;
    update();

    return isSuccess;
  }
}