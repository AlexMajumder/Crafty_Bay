// import 'package:crafty_bay/features/common/data/models/from_json_contract.dart';
// import 'package:crafty_bay/features/common/data/models/paginationModel.dart';
//
// class PaginationCommonResponseModel <T extends FromJsonContract>{
//   int? code;
//   String? status;
//   String? msg;
//   PaginationModel? data;
//
//   PaginationCommonResponseModel({this.code, this.status, this.msg, this.data});
//
//   factory PaginationCommonResponseModel.fromJson(Map<String, dynamic> json) {
//     code = json['code'];
//     status = json['status'];
//     msg = json['msg'];
//     data = json['data'] != null ? PaginationModel.fromJson(json['data'], T.fromJson()) : null;
//   }
//
//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = <String, dynamic>{};
//     data['code'] = code;
//     data['status'] = status;
//     data['msg'] = msg;
//     if (this.data != null) {
//       data['data'] = this.data!.toJson();
//     }
//     return data;
//   }
// }