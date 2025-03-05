class Cart {
  String? sId;
  String? title;
  String? brand;
  List<String>? categories;
  String? slug;
  String? metaDescription;
  String? description;
  List<String>? photos;
  List<String>? colors;
  List<String>? sizes;
  List<String>? tags;
  int? regularPrice;
  int? currentPrice;
  int? quantity;
  String? createdAt;
  String? updatedAt;
  int? iV;

  Cart(
      {this.sId,
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
        this.iV});

  Cart.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    title = json['title'];
    brand = json['brand'];
    categories = (json['categories'] as List?)?.cast<String>();
    slug = json['slug'];
    metaDescription = json['meta_description'];
    description = json['description'];
    photos = (json['photos'] as List?)?.cast<String>();
    colors = (json['colors'] as List?)?.cast<String>();
    sizes = (json['sizes'] as List?)?.cast<String>();
    tags = (json['tags'] as List?)?.cast<String>();
    regularPrice = json['regular_price'];
    currentPrice = json['current_price'];
    quantity = json['quantity'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    iV = json['__v'];
  }

  Map<String, dynamic> toJson() => {
    '_id': sId,
    'title': title,
    'brand': brand,
    'categories': categories,
    'slug': slug,
    'meta_description': metaDescription,
    'description': description,
    'photos': photos,
    'colors': colors,
    'sizes': sizes,
    'tags': tags,
    'regular_price': regularPrice,
    'current_price': currentPrice,
    'quantity': quantity,
    'createdAt': createdAt,
    'updatedAt': updatedAt,
    '__v': iV,
  };
}