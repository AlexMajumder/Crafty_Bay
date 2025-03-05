class ReviewListModel {
  int? code;
  String? status;
  String? msg;
  Data? data;

  ReviewListModel({this.code, this.status, this.msg, this.data});

  ReviewListModel.fromJson(Map<String, dynamic> json) {
    code = json['code'];
    status = json['status'];
    msg = json['msg'];
    data = json['data'] != null ? Data.fromJson(json['data']) : null;
  }
}

class Data {
  List<ReviewModel>? results;
  int? total;
  int? firstPage;
  int? previous;
  int? next;
  int? lastPage;

  Data(
      {this.results,
        this.total,
        this.firstPage,
        this.previous,
        this.next,
        this.lastPage});

  Data.fromJson(Map<String, dynamic> json) {
    if (json['results'] != null) {
      results = <ReviewModel>[];
      json['results'].forEach((v) {
        results!.add(ReviewModel.fromJson(v));
      });
    }
    total = json['total'];
    firstPage = json['first_page'];
    previous = json['previous'];
    next = json['next'];
    lastPage = json['last_page'];
  }

}

class ReviewModel {
  String? sId;
  Product? product;
  User? user;
  double? rating;
  String? comment;
  String? createdAt;
  String? updatedAt;
  double? iV;

  ReviewModel(
      {this.sId,
        this.product,
        this.user,
        this.rating,
        this.comment,
        this.createdAt,
        this.updatedAt,
        this.iV});

  ReviewModel.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    product = json['product'] != null ? Product.fromJson(json['product']) : null;
    user = json['user'] != null ? User.fromJson(json['user']) : null;

    // Handle case where 'rating' could be either an int or a double
    var ratingValue = json['rating'];
    if (ratingValue != null) {
      if (ratingValue is int) {
        rating = ratingValue.toDouble();  // Convert int to double
      } else if (ratingValue is double) {
        rating = ratingValue;  // It's already a double, so just assign
      }
    } else {
      rating = null;  // If no value, set to null
    }

    comment = json['comment'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];

    // Handle case where '__v' (iV) could be an int or double
    var ivValue = json['__v'];
    if (ivValue != null) {
      if (ivValue is int) {
        iV = ivValue.toDouble();  // Convert int to double
      } else if (ivValue is double) {
        iV = ivValue;  // It's already a double, so just assign
      }
    } else {
      iV = null;  // If no value, set to null
    }
  }



}

class Product {
  String? sId;
  String? title;
  String? slug;
  List<String>? photos;

  Product({this.sId, this.title, this.slug, this.photos});

  Product.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    title = json['title'];
    slug = json['slug'];
    photos = json['photos'].cast<String>();
  }

}

class User {
  String? sId;
  String? firstName;
  String? lastName;
  String? avatarUrl;

  User({this.sId, this.firstName, this.lastName, this.avatarUrl});

  User.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    firstName = json['first_name'];
    lastName = json['last_name'];
    avatarUrl = json['avatar_url'];
  }

}