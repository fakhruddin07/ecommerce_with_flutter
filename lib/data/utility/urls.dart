class Urls {
  Urls._();

  static const String _baseUrl = "https://craftybay.teamrabbil.com/api";

  static String verifyEmail(String email) => "$_baseUrl/UserLogin/$email";

  static String verifyOtp(String email, String otp) =>
      "$_baseUrl/VerifyLogin/$email/$otp";

  static String getHomeSliders = "$_baseUrl/ListProductSlider";

  static String getCategories = "$_baseUrl/CategoryList";

  static String getProductByCategory(int categoryId) =>
      "$_baseUrl/ListProductByCategory/$categoryId";

  static String getProductsByRemark(String remark) =>
      "$_baseUrl/ListProductByRemark/$remark";

  static String getProductDetails(int productId) =>
      "$_baseUrl/ProductDetailsById/$productId";

  static const String addToCart = "$_baseUrl/CreateCartList";
}
