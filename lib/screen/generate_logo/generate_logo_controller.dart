import 'package:festiveapp_studio/common/popup_message/popup_message.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class GenerateLogoController extends GetxController{
  TextEditingController brandName = TextEditingController();
  TextEditingController tagLine = TextEditingController();
  TextEditingController category = TextEditingController();
  TextEditingController logoType = TextEditingController();
  TextEditingController primaryColor = TextEditingController();
  TextEditingController secondaryColor = TextEditingController();


  bool validate() {

    if (brandName.text.trim().isEmpty) {
      errorToast(msg: "Please enter brand name");
      return false;
    } else if (tagLine.text.trim().isEmpty) {
      errorToast(msg: "Please enter tag line");
      return false;
    } else if ((category.text.trim().isEmpty))  {
      errorToast(msg: "Please enter category");
      return false;
    } else if (logoType.text.trim().isEmpty) {
      errorToast(msg: "Please enter logoType");
      return false;
    }  else if (primaryColor.text.trim().isEmpty) {
      errorToast(msg: "Please enter primaryColor");
      return false;
    }  else if (secondaryColor.text.trim().isEmpty) {
      errorToast(msg: "Please enter secondaryColor");
      return false;
    } else {
      return true;
    }
  }

}