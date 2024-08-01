import 'dart:convert';
import 'package:festiveapp_studio/common/popup_message/popup_message.dart';
import 'package:festiveapp_studio/screen/auth/signup/api/signup_model.dart';
import 'package:festiveapp_studio/screen/faq/api/faq_model.dart';
import 'package:festiveapp_studio/screen/home/api/home_model.dart';
import 'package:festiveapp_studio/screen/termsCondition/api/terms_model.dart';
import 'package:festiveapp_studio/service/http_services.dart';
import 'package:festiveapp_studio/service/pref_services.dart';
import 'package:festiveapp_studio/utils/endpoints.dart';
import 'package:festiveapp_studio/utils/pref_keys.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

class HomeApi {
  static Future<List<HomeModel>> homeApi() async {
    try {
      String url = Endpoints.getCategory;

      var headers = {
        'Content-Type': 'application/json',
        'Authorization': "Bearer ${PrefService.getString(PrefKeys.accessToken)}",
        'Cookie': Endpoints.refreshToken
      };
      http.Response? response = await HttpService.getApi(
        url: url,
        header: headers
      );

      if (response != null && response.statusCode == 200) {
        return homeModelFromJson(response.body);

      }
      else
      {
        errorToast(msg: jsonDecode(response!.body)['message']);
        return [];
      }
    } catch (e) {
      if (kDebugMode) {
        print(e);
      }
      return [];

    }
  }
}
