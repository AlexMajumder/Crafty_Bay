
import 'cart_model.dart';

class CartListModel {
  int? code;
  String? status;
  String? msg;
  Data? data;

  CartListModel({this.code, this.status, this.msg, this.data});

  CartListModel.fromJson(Map<String, dynamic> json) {
    code = json['code'];
    status = json['status'];
    msg = json['msg'];
    data = json['data'] != null ? Data.fromJson(json['data']) : null;
  }

}

class Data {
  List<CartModel>? productList;
  int? total;
  int? firstPage;
  int? previous;
  int? next;
  int? lastPage;
  Data({this.productList, this.total, this.firstPage, this.previous, this.next, this.lastPage});

  Data.fromJson(Map<String, dynamic> json) {
    productList = (json['results'] as List?)?.map((v) => CartModel.fromJson(v)).toList();
    total = json['total'];
    firstPage = json['first_page'];
    previous = json['previous'];
    next = json['next'];
    lastPage = json['last_page'];
  }

}

class CartModel {
  String? sId;
  Cart? product;
  String? user;
  int? quantity;
  String? color;
  String? size;
  String? createdAt;
  String? updatedAt;
  int? iV;

  CartModel({this.sId, this.product, this.user, this.quantity, this.color, this.size, this.createdAt, this.updatedAt, this.iV});

  CartModel.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    product = json['product'] != null ? Cart.fromJson(json['product']) : null;
    user = json['user'];
    quantity = json['quantity'];
    color = json['color'];
    size = json['size'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    iV = json['__v'];
  }

}