import 'package:crafty_bay/features/common/data/models/product_model.dart';

class ProductListDataModel {
  List<ProductModel>? results;
  int? total;
  Null? firstPage;
  Null? previous;
  int? next;
  int? lastPage;

  ProductListDataModel(
      {this.results,
      this.total,
      this.firstPage,
      this.previous,
      this.next,
      this.lastPage});

  ProductListDataModel.fromJson(Map<String, dynamic> json) {
    if (json['results'] != null) {
      results = <ProductModel>[];
      json['results'].forEach((v) {
        results!.add(ProductModel.fromJson(v));
      });
    }
    total = json['total'];
    firstPage = json['first_page'];
    previous = json['previous'];
    next = json['next'];
    lastPage = json['last_page'];
  }
}
