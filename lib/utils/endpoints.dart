class Endpoints{
  /// ====================== base url ===================

  static const baseUrl ='https://festive-back.onrender.com';


  /// ==================== token =========================
  static const refreshToken  ="refreshToken=eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6IjY2YTc2OTBjNjE5MGNkZGM0NzZlZjg3YSIsImlhdCI6MTcyMjI0ODgxMCwiZXhwIjoxNzIyNTA4MDEwfQ.oQuREO2AqbRILVhUUfdzqjuG52xAS5Zy7pOGfJ5R-j4";

  /// ===================== app endpoints ====================
  static const signUp ="$baseUrl/api/user/create";
  static const logIn ="$baseUrl/api/user/login";
  static const verifyOtp ="$baseUrl/api/user/verify-otp";
  static const updateBrand ="$baseUrl/api/user/updatebrand";
  static const policy ="$baseUrl/api/policy/getallpolicy";
  static const faq ="$baseUrl/api/faq/getallfaqs";
  static const getCategory ="$baseUrl/api/festivepost/getall";
  static const getFrames ="$baseUrl/api/frame/getallframe";
}