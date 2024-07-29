import 'package:festiveapp_studio/common/popup_message/popup_message.dart';
import 'package:festiveapp_studio/utils/string_res.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_rx/get_rx.dart';
import 'package:get/get_rx/src/rx_types/rx_types.dart';

class LoginController extends GetxController{
  RxBool loader = false.obs;
  TextEditingController countryCodeController = TextEditingController();
  TextEditingController phoneController = TextEditingController();

  RxString countryCode = "+91".obs;
  RxString countryName = "India".obs;
  RxString countryNameCode = "IN".obs;

RxString mobileError =''.obs;
RxString country =''.obs;

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
    country.value = '';
    return true;
  }
}


  bool validate() {

  countryValidation();
  mobileNumberValidation();
  if(mobileError.value =='' && country.value =='')
    {
      return true;
    }
  else
    {
      return false;
    }


  }



}