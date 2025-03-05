class ProductModel {
  String? sId;
  String? title;
  List<Categories>? categories;
  String? slug;
  Null metaDescription;
  String? description;
  int? regularPrice;
  int? currentPrice;
  int? quantity;
  String? createdAt;
  String? updatedAt;
  bool? inCart;
  bool? inWishlist;
  Categories? brand;

  ProductModel(
      {this.sId,
      this.title,
      this.categories,
      this.slug,
      this.metaDescription,
      this.description,
      this.regularPrice,
      this.currentPrice,
      this.quantity,
      this.createdAt,
      this.updatedAt,
      this.inCart,
      this.inWishlist,
      this.brand});

  ProductModel.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    title = json['title'];
    if (json['categories'] != null) {
      categories = <Categories>[];
      json['categories'].forEach((v) {
        categories!.add(Categories.fromJson(v));
      });
    }
    slug = json['slug'];
    metaDescription = json['meta_description'];
    description = json['description'];
    regularPrice = json['regular_price'];
    currentPrice = json['current_price'];
    quantity = json['quantity'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    inCart = json['in_cart'];
    inWishlist = json['in_wishlist'];
    brand = json['brand'] != null ? Categories.fromJson(json['brand']) : null;
  }
}

class Categories {
  String? sId;
  String? title;
  String? slug;
  String? icon;

  Categories({this.sId, this.title, this.slug, this.icon});

  Categories.fromJson(Map<String, dynamic> json) {
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
