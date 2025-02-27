class Urls{
  static const String _baseUrl = 'https://ecom-rs8e.onrender.com/api';
  static String signInUrl = '$_baseUrl/auth/login';
  static String signUpUrl = '$_baseUrl/auth/signup';
  static String verifyOtpUrl = '$_baseUrl/auth/verify-otp';
  static String homeSliderUrl = '$_baseUrl/slides';
  static String readProfile ='$_baseUrl/auth/profile';
  static String bannerListUrl ='$_baseUrl/ListProductSlider';
  static String categoryListUrl ='$_baseUrl/categories';
  static String productListByRemarkUrl(String remark) =>'$_baseUrl/ListProductByRemark/$remark';
  static String productListByCategoryUrl(int categoryId) =>'$_baseUrl/ListProductByCategory/$categoryId';
  static String productDetailsByIdUrl(int productDetailsId) =>'$_baseUrl/ProductDetailsById/$productDetailsId';
}