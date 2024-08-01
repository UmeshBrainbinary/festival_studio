import 'dart:convert';
import 'package:festiveapp_studio/common/popup_message/popup_message.dart';
import 'package:festiveapp_studio/screen/auth/login/api/login_model.dart';
import 'package:festiveapp_studio/service/http_services.dart';
import 'package:festiveapp_studio/utils/endpoints.dart';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;

class LoginApi {
  static Future<LoginModel> loginApi({
    required String password,
    required String mobile,
  }) async {
    try {
      String url = Endpoints.logIn;
      Map<String, String> param = {
        "mobileNo": mobile,
        "password": password
      };

      http.Response? response = await HttpService.postApi(
          url: url,
          body: (param),);

      if (response != null && response.statusCode == 200) {
        return loginModelFromJson(response.body);

      }
      else
      {
        errorToast(msg: jsonDecode(response!.body)['message']);
        return LoginModel();
      }
    } catch (e) {
      if (kDebugMode) {
        print(e);
      }
      return LoginModel();

    }
  }
}
