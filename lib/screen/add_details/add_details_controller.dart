import 'package:festiveapp_studio/common/popup_message/popup_message.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class AddDetailsController extends GetxController {
  TextEditingController brandName = TextEditingController();
  TextEditingController tagLine = TextEditingController();
  TextEditingController phoneNumber = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController website = TextEditingController();
  TextEditingController address = TextEditingController();

  bool validate() {
    String emailPattern = r'^[a-zA-Z0-9._%-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,4}$';
    RegExp emailRegex = RegExp(emailPattern);

    String urlPattern =
        r'^(https?:\/\/)?([a-zA-Z0-9.-]+)\.([a-zA-Z]{2,4})([\/\w.-]*)*\/?$';
    RegExp urlRegex = RegExp(urlPattern);

    if (brandName.text.trim().isEmpty) {
      errorToast(msg: "Please enter brand name");
      return false;
    } else if (tagLine.text.trim().isEmpty) {
      errorToast(msg: "Please enter tag line");
      return false;
    } else if ((phoneNumber.text.trim().length < 8) ||
        (phoneNumber.text.trim().length > 11)) {
      errorToast(msg: "Please enter valid mobile number");
      return false;
    } else if (email.text.trim().isEmpty) {
      errorToast(msg: "Please enter email");
      return false;
    } else if (!emailRegex.hasMatch(email.text.trim())) {
      errorToast(msg: "Please enter a valid email");
      return false;
    } else if (website.text.trim().isEmpty) {
      errorToast(msg: "Please enter website");
      return false;
    } else if (!urlRegex.hasMatch(website.text.trim())) {
      errorToast(msg: "Please enter a valid website URL");
      return false;
    } else if (address.text.trim().isEmpty) {
      errorToast(msg: "Please enter address");
      return false;
    } else {
      return true;
    }
  }
}
