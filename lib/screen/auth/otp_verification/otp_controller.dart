
import 'package:festiveapp_studio/common/status_bar.dart';
import 'package:festiveapp_studio/screen/auth/login/login_screen.dart';
import 'package:festiveapp_studio/screen/auth/otp_verification/api/otp_model.dart';
import 'package:festiveapp_studio/screen/auth/otp_verification/api/otp_verify_api.dart';
import 'package:festiveapp_studio/service/pref_services.dart';
import 'package:festiveapp_studio/utils/pref_keys.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class OtpController extends GetxController{
  RxBool loader = false.obs;
  TextEditingController otpController = TextEditingController();
  String mobile = Get.arguments ?? '';
  OtpModel otpModel = OtpModel();
  onCompleteOtp()async{
    loader.value =true;
   otpModel = await OtpVerifyApi.otpVerifyApi(otp: int.parse(otpController.text), mobile: mobile);
   if(otpModel.user != null)
{
  PrefService.setValue(PrefKeys.isLogin, true);
lightStatusBar();
  Get.offAll(()=>LoginScreen())?.whenComplete(()=> lightStatusBar());
}
    loader.value =false;
  }
}