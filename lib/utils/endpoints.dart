class Endpoints{
  /// ====================== base url ===================

  static const baseUrl ='https://festive-back.onrender.com';

  /// ===================== app endpoints ====================
  static const signUp ="$baseUrl/api/user/create";
  static const logIn ="$baseUrl/api/user/login";
  static const verifyOtp ="$baseUrl/api/user/verify-otp";
}