import 'package:crafty_bay/features/product/data/models/product_list_data_model.dart';

class ProductPaginationModel {
  int? code;
  String? status;
  String? msg;
  ProductListDataModel? data;

  ProductPaginationModel({this.code, this.status, this.msg, this.data});

  ProductPaginationModel.fromJson(Map<String, dynamic> json) {
    code = json['code'];
    status = json['status'];
    msg = json['msg'];
    data = json['data'] != null
        ? ProductListDataModel.fromJson(json['data'])
        : null;
  }
}
