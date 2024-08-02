import 'dart:convert';
import 'package:festiveapp_studio/common/popup_message/popup_message.dart';
import 'package:festiveapp_studio/screen/faq/api/faq_model.dart';
import 'package:festiveapp_studio/service/http_services.dart';
import 'package:festiveapp_studio/utils/endpoints.dart';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;

class FaqApi {
  static Future<FaqModel> faqApi() async {
    try {
      String url = Endpoints.faq;


      http.Response? response = await HttpService.getApi(
        url: url,
      );

      if (response != null && response.statusCode == 200) {
        return faqModelFromJson(response.body);

      }
      else
      {
        errorToast(msg: jsonDecode(response!.body)['message']);
        return FaqModel();
      }
    } catch (e) {
      if (kDebugMode) {
        print(e);
      }
      return FaqModel();

    }
  }
}
