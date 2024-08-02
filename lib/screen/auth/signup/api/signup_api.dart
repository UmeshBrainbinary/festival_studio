import 'dart:convert';
import 'package:festiveapp_studio/common/popup_message/popup_message.dart';
import 'package:festiveapp_studio/screen/auth/signup/api/signup_model.dart';
import 'package:festiveapp_studio/service/http_services.dart';
import 'package:festiveapp_studio/utils/endpoints.dart';
import 'package:flutter/foundation.dart';
import 'package:get/get.dart';
import 'package:get/get.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

class SignUpApi {
  static Future<SignUpModel> signUpApi({
    required String firstname,
    required String lastName,
    required String email,
    required String password,
    required String mobile,
  }) async {
    try {
      String url = Endpoints.signUp;
      Map<String, String> param = {
        "firstName": firstname,
        "userName": lastName,
        "mobileNo": mobile.removeAllWhitespace,
        "email": email.removeAllWhitespace,
        "password": password.removeAllWhitespace
      };

      http.Response? response = await HttpService.postApi(
          url: url,
          body: (param),
     );

      if (response != null && response.statusCode == 200) {
         return signUpModelFromJson(response.body);

      }
      else
        {
          errorToast(msg: jsonDecode(response!.body)['message']);
          return SignUpModel();
        }
    } catch (e) {
      if (kDebugMode) {
        print(e);
      }
      return SignUpModel();

    }
  }
}
