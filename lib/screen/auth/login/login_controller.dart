import 'package:festiveapp_studio/common/popup_message/popup_message.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_rx/get_rx.dart';

class LoginController extends GetxController{
  RxBool loader = false.obs;
  TextEditingController countryCodeController = TextEditingController();
  TextEditingController phoneController = TextEditingController();

  RxString countryCode = "+44".obs;
  RxString countryName = "India".obs;
  RxString countryNameCode = "IN".obs;


  bool validate() {
    if(countryName.value.isEmpty || countryCode.value.isEmpty)
      {
        errorToast(msg: "Please select country code");
        return false;
      }
    else if(phoneController.text.trim().isEmpty)
      {
        errorToast(msg: "Please enter mobile number");
        return false;
      }
    else if((phoneController.text.trim().length < 8) || (phoneController.text.trim().length > 11)){
      errorToast(msg: "Please enter valid mobile number");
      return false;
    }
    else{
      return true;
    }
  }



}