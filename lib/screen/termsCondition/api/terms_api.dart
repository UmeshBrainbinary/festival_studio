import 'dart:convert';
import 'package:festiveapp_studio/common/popup_message/popup_message.dart';
import 'package:festiveapp_studio/screen/auth/signup/api/signup_model.dart';
import 'package:festiveapp_studio/screen/termsCondition/api/terms_model.dart';
import 'package:festiveapp_studio/service/http_services.dart';
import 'package:festiveapp_studio/utils/endpoints.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

class TermsApi {
  static Future<TermsConditionModel> termsApi() async {
    try {
      String url = Endpoints.policy;


      http.Response? response = await HttpService.getApi(
        url: url,
      );

      if (response != null && response.statusCode == 200) {
        return termsConditionModelFromJson(response.body);

      }
      else
      {
        errorToast(msg: jsonDecode(response!.body)['message']);
        return TermsConditionModel();
      }
    } catch (e) {
      if (kDebugMode) {
        print(e);
      }
      return TermsConditionModel();

    }
  }
}
