
import 'package:festiveapp_studio/common/status_bar.dart';
import 'package:festiveapp_studio/screen/add_details/add_details_screen.dart';
import 'package:festiveapp_studio/screen/auth/login/api/login_api.dart';
import 'package:festiveapp_studio/screen/auth/login/api/login_model.dart';
import 'package:festiveapp_studio/service/pref_services.dart';
import 'package:festiveapp_studio/utils/pref_keys.dart';
import 'package:festiveapp_studio/utils/string_res.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoginController extends GetxController{
  RxBool loader = false.obs;
  TextEditingController countryCodeController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  RxString countryCode = "+91".obs;
  RxString countryName = "India".obs;
  RxString countryNameCode = "IN".obs;

RxString mobileError =''.obs;
RxString passwordError =''.obs;
RxString country =''.obs;
LoginModel loginModel = LoginModel();
countryValidation(){
  if(countryName.value.isEmpty || countryCode.value.isEmpty)
  {
    country.value = StringRes.selectCountryCode;
    return false;
  } else{

    country.value = '';
    return true;
  }
}

mobileNumberValidation(){
  if(phoneController.text.trim().isEmpty)
  {
    mobileError.value = StringRes.enterMobileNumber;
    return false;
  }
  else if((phoneController.text.trim().length < 8) || (phoneController.text.trim().length > 11)){
    mobileError.value = StringRes.enterValidMobileNumber;

    return false;
  }
  else{
    mobileError.value = '';
    return true;
  }
}

 passwordValidation(){
    if(passwordController.text.trim().isEmpty)
    {
      passwordError.value = StringRes.passwordError;
      return false;
    }
    else{
      passwordError.value = '';
      return true;
    }
  }

  bool validate() {

  countryValidation();
  mobileNumberValidation();
  passwordValidation();
  if(mobileError.value =='' && country.value =='' && passwordError.value == '')
    {
      return true;
    }
  else
    {
      return false;
    }


  }

  onTapLogin()async{
  loader.value =true;
  loginModel = await LoginApi.loginApi(password: passwordController.text, mobile: "${countryCode.value}${phoneController.text}");
  if(loginModel.success ==true){
    PrefService.setValue(PrefKeys.userId, loginModel.data?.id ?? '');
    PrefService.setValue(PrefKeys.isLogin, true);
    PrefService.setValue(PrefKeys.accessToken, loginModel.data?.token ?? '');
    darkStatusBar();
    Get.offAll(()=> AddDetailsScreen())?.whenComplete(()=> lightStatusBar());
  }
  loader.value =false;
  }



}