import 'dart:convert';
import 'package:festiveapp_studio/common/popup_message/popup_message.dart';
import 'package:festiveapp_studio/common/status_bar.dart';
import 'package:festiveapp_studio/screen/add_details/api/add_details_model.dart';
import 'package:festiveapp_studio/screen/dashboard/dashboard_screen.dart';
import 'package:festiveapp_studio/service/pref_services.dart';
import 'package:festiveapp_studio/utils/endpoints.dart';
import 'package:festiveapp_studio/utils/pref_keys.dart';
import 'package:flutter/foundation.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

class AddDetailsApi {
  static Future<BrandModel> addDetailApi({
    required String brandName,
    required String tag,
    required String email,
    required String website,
    required String address,
    required String phone,
    required String image,
  }) async {
    try {
      String url = Endpoints.updateBrand;

      var headers = {
        'Content-Type': 'application/json',
        'Authorization': "Bearer ${PrefService.getString(PrefKeys.accessToken)}",
        'Cookie': Endpoints.refreshToken
      };


      var request = http.MultipartRequest('PUT', Uri.parse(url));
      request.fields.addAll({
        "brandName": brandName,
        "tagLine": tag,
        "phoneNo": phone,
        "email": email,
        "website": website,
        "address": address
      });
      request.files.add(await http.MultipartFile.fromPath('brandImg',image));
      request.headers.addAll(headers);

      http.StreamedResponse response = await request.send();

      var d =(await response.stream.bytesToString());

      if (response.statusCode == 200) {
        lightStatusBar();
        Get.offAll(()=>DashBoardScreen())?.whenComplete(()=> lightStatusBar());
        PrefService.setValue(PrefKeys.isBrand, true);
        PrefService.setValue(PrefKeys.logo,jsonDecode(d)['user']['brandDetails']['brandImg']['url'] ?? '' );
        return brandModelFromJson(d);

      }
      else
      {
        errorToast(msg: jsonDecode(d)['message']);
        return BrandModel();
      }
    } catch (e) {
      if (kDebugMode) {
        print(e);
      }
      return BrandModel();

    }
  }
}
