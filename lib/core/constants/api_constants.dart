class ApiConstants {
  static const String baseUrl = 'https://supermarket-dan1.onrender.com/api/v1';

  // Auth Endpoints
  static const String signUp = '/auth/signUp';
  static const String signIn = '/auth/signIn';
  static const String resetPassCode = '/auth/resetPassCode';
  static const String activeResetPass = '/auth/activeResetPass';
  static const String resetPassword = '/auth/resetPassword';

  // Home & Products Endpoints
  static const String products = '/home/products';
  static const String categories = '/home/categories';
}
