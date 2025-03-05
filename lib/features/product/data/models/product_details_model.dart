
import '../../../common/data/models/product_model.dart';

class ProductDetailsModel {
  int? code;
  String? status;
  String? msg;
  Data? data;

  ProductDetailsModel({this.code, this.status, this.msg, this.data});

  ProductDetailsModel.fromJson(Map<String, dynamic> json) {
    code = json['code'];
    status = json['status'];
    msg = json['msg'];
    data = json['data'] != null ? Data.fromJson(json['data']) : null;
  }
}

class Data {
  String? sId;
  String? title;
  Brand? brand;
  List<Categories>? categories;
  String? slug;
  String? metaDescription;
  String? description;
  List<String>? photos;
  List<String>? colors;
  List<String>? sizes;
  List<String>? tags;
  double? regularPrice;
  double? currentPrice;
  int? quantity;
  String? createdAt;
  String? updatedAt;
  int? iV;
  bool? inCart; // added inCart field
  bool? inWishlist; // added inWishlist field

  Data({
    this.sId,
    this.title,
    this.brand,
    this.categories,
    this.slug,
    this.metaDescription,
    this.description,
    this.photos,
    this.colors,
    this.sizes,
    this.tags,
    this.regularPrice,
    this.currentPrice,
    this.quantity,
    this.createdAt,
    this.updatedAt,
    this.iV,
    this.inCart,
    this.inWishlist,
  });

  Data.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    title = json['title'];
    brand = json['brand'] != null ? Brand.fromJson(json['brand']) : null;

    if (json['categories'] != null) {
      categories = <Categories>[];
      json['categories'].forEach((v) {
        categories!.add(Categories.fromJson(v));
      });
    }

    slug = json['slug'];
    metaDescription = json['meta_description'];
    description = json['description'];
    photos = json['photos']?.cast<String>();
    colors = json['colors']?.cast<String>();
    sizes = json['sizes']?.cast<String>();
    tags = json['tags']?.cast<String>();

    regularPrice = json['regular_price'] is num
        ? (json['regular_price'] as num).toDouble()
        : double.tryParse(json['regular_price'].toString());

    currentPrice = json['current_price'] is num
        ? (json['current_price'] as num).toDouble()
        : double.tryParse(json['current_price'].toString());

    quantity = json['quantity'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    iV = json['__v'];

    inCart = json['in_cart']; // added inCart
    inWishlist = json['in_wishlist']; // added inWishlist
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['_id'] = sId;
    data['title'] = title;

    if (brand != null) {
      data['brand'] = brand!.toJson();
    }

    if (categories != null) {
      data['categories'] = categories!.map((v) => v.toJson()).toList();
    }

    data['slug'] = slug;
    data['meta_description'] = metaDescription;
    data['description'] = description;
    data['photos'] = photos;
    data['colors'] = colors;
    data['sizes'] = sizes;
    data['tags'] = tags;
    data['regular_price'] = regularPrice;
    data['current_price'] = currentPrice;
    data['quantity'] = quantity;
    data['createdAt'] = createdAt;
    data['updatedAt'] = updatedAt;
    data['__v'] = iV;

    data['in_cart'] = inCart;
    data['in_wishlist'] = inWishlist;

    return data;
  }
}

class Brand {
  String? sId;
  String? title;
  String? slug;
  String? icon;

  Brand({this.sId, this.title, this.slug, this.icon});

  Brand.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    title = json['title'];
    slug = json['slug'];
    icon = json['icon'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['_id'] = sId;
    data['title'] = title;
    data['slug'] = slug;
    data['icon'] = icon;
    return data;
  }
}