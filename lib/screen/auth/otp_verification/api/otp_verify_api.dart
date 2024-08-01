import 'dart:convert';
import 'package:festiveapp_studio/common/popup_message/popup_message.dart';
import 'package:festiveapp_studio/screen/auth/otp_verification/api/otp_model.dart';
import 'package:festiveapp_studio/utils/endpoints.dart';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;

class OtpVerifyApi {
  static Future<OtpModel> otpVerifyApi({
    required int otp,
    required String mobile,
  }) async {
    try {
      var headers = {
        'Content-Type': 'application/json',
        'Cookie': Endpoints.refreshToken
      };
      var request = http.Request('POST', Uri.parse('https://festive-back.onrender.com/api/user/verify-otp'));
      request.body = json.encode({
        "mobileNo": mobile,
        "otp":otp
      });
      request.headers.addAll(headers);

      http.StreamedResponse response = await request.send();





      var d = (await response.stream.bytesToString());
     
   
      if (response.statusCode == 200) {
        return otpModelFromJson(d);

      }
      else
      {
        errorToast(msg: jsonDecode(d)['error']);
        return OtpModel();
      }
    } catch (e) {
      if (kDebugMode) {
        print(e);
      }
      return OtpModel();

    }
  }
}
