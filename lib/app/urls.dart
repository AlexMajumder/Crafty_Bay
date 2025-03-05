class Urls{
  static const String _baseUrl = 'https://ecom-rs8e.onrender.com/api';
  static String signInUrl = '$_baseUrl/auth/login';
  static String signUpUrl = '$_baseUrl/auth/signup';
  static String productListUrl = '$_baseUrl/products';
  static String verifyOtpUrl = '$_baseUrl/auth/verify-otp';
  static String homeSliderUrl = '$_baseUrl/slides';
  static String readProfile ='$_baseUrl/auth/profile';
  static String bannerListUrl ='$_baseUrl/ListProductSlider';
  static String categoryListUrl ='$_baseUrl/categories';
  static String addToWishUrl = '$_baseUrl/wishlist';
  static String addToCart = '$_baseUrl/cart';
  static String cartListUrl = '$_baseUrl/cart';
  static String profileUrl = '$_baseUrl/auth/profile';
  static String cartDeleteUrl(String cartItemId) => '$_baseUrl/cart/$cartItemId';
  static String productListByIdUrl(String id) =>
      '$_baseUrl/products/id/$id';
  static String productListByCategoryUrl(String categoryId) =>
      '$_baseUrl/products?=$categoryId';
  static String productListByRemarkUrl(String remark) =>'$_baseUrl/ListProductByRemark/$remark';
  static String productDetailsByIdUrl(String productDetailsId) =>'$_baseUrl/products/id/$productDetailsId';
  static String addReviewUrl = '$_baseUrl/review';
  static String reviewListUrl(String productId) => '$_baseUrl/reviews?product=$productId';
  static String wishListUrl = '$_baseUrl/wishlist';
  static String wishDeleteUrl(String wishItemId) => '$_baseUrl/wishlist/$wishItemId';
}