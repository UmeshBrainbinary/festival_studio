import 'dart:convert';
import 'package:festiveapp_studio/common/popup_message/popup_message.dart';
import 'package:festiveapp_studio/screen/card_detail/api/frame_model.dart';
import 'package:festiveapp_studio/service/http_services.dart';
import 'package:festiveapp_studio/service/pref_services.dart';
import 'package:festiveapp_studio/utils/endpoints.dart';
import 'package:festiveapp_studio/utils/pref_keys.dart';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;

class FrameApi {
  static Future<FrameModel> frameApi() async {
    try {
      String url = Endpoints.getFrames;
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
        return frameModelFromJson(response.body);

      }
      else
      {
        errorToast(msg: jsonDecode(response!.body)['message']);
        return FrameModel();
      }
    } catch (e) {
      if (kDebugMode) {
        print(e);
      }
      return FrameModel();

    }
  }
}
