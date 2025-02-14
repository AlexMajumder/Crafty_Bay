class Urls{
  static const String _baseUrl = 'https://ecom-rs8e.onrender.com/api';
  static String signInUrl = '$_baseUrl/auth/login';
  static String verifyOtpUrl(String email,String otp) => '$_baseUrl/VerifyLogin/$email/$otp';
  static String readProfile ='$_baseUrl/auth/profile';
  static String bannerListUrl ='$_baseUrl/ListProductSlider';
  static String categoryListUrl ='$_baseUrl/CategoryList';
  static String productListByRemarkUrl(String remark) =>'$_baseUrl/ListProductByRemark/$remark';
  static String productListByCategoryUrl(int categoryId) =>'$_baseUrl/ListProductByCategory/$categoryId';
  static String productDetailsByIdUrl(int productDetailsId) =>'$_baseUrl/ProductDetailsById/$productDetailsId';
}