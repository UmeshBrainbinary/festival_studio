
import 'package:festiveapp_studio/screen/add_details/api/add_details_api.dart';
import 'package:festiveapp_studio/screen/add_details/api/add_details_model.dart';
import 'package:festiveapp_studio/utils/string_res.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:get/get_rx/get_rx.dart';

class AddDetailsController extends GetxController {
  TextEditingController brandName = TextEditingController();
  TextEditingController tagLine = TextEditingController();
  TextEditingController phoneNumber = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController website = TextEditingController();
  TextEditingController address = TextEditingController();
RxBool loader = false.obs;
  RxString brandNameError =''.obs;
  RxString tagLineError =''.obs;
  RxString mobileError =''.obs;
  RxString emailError =''.obs;
  RxString websiteError =''.obs;
  RxString addressError =''.obs;
BrandModel brandModel = BrandModel();
  brandNameValidation(){
    if (brandName.text.trim().isEmpty) {

      brandNameError.value = StringRes.brandError;
      return false;
    }
    else
    {
      brandNameError.value ='';

      return true;
    }
  }
  tagLineValidation(){
    if (tagLine.text.trim().isEmpty) {

      tagLineError.value = StringRes.tagError;
      return false;
    }
    else
    {
      tagLineError.value ='';
      return true;
    }
  }
  mobileNumberValidation(){
    if(phoneNumber.text.trim().isEmpty)
    {
      mobileError.value = StringRes.enterMobileNumber;
      return false;
    }
    else if((phoneNumber.text.trim().length < 8) || (phoneNumber.text.trim().length > 11)){
      mobileError.value = StringRes.enterValidMobileNumber;

      return false;
    }
    else{
      mobileError.value = '';
      return true;
    }
  }
  emailValidation(){
    String emailPattern = r'^[a-zA-Z0-9._%-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,4}$';
    RegExp emailRegex = RegExp(emailPattern);
    if(email.text.trim().isEmpty)
    {
      emailError.value = StringRes.emailError;
      return false;
    }
    else if(!emailRegex.hasMatch(email.text.trim())){
      emailError.value = StringRes.emailValidError;

      return false;
    }
    else{
      emailError.value = '';
      return true;
    }
  }
  websiteValidation(){
    String urlPattern =
        r'^(https?:\/\/)?([a-zA-Z0-9.-]+)\.([a-zA-Z]{2,4})([\/\w.-]*)*\/?$';
    RegExp urlRegex = RegExp(urlPattern);
    if(website.text.trim().isEmpty)
    {
      websiteError.value = StringRes.websiteError;
      return false;
    }
    else if(!urlRegex.hasMatch(website.text.trim())){
      websiteError.value = StringRes.validWebError;

      return false;
    }
    else{
      websiteError.value = '';
      return true;
    }
  }
  addressValidation(){
    if (address.text.trim().isEmpty) {

      addressError.value = StringRes.addressError;
      return false;
    }
    else
    {
      addressError.value ='';

      return true;
    }
  }


  bool validate() {

    brandNameValidation();
    tagLineValidation();
    mobileNumberValidation();
    emailValidation();
    websiteValidation();
    addressValidation();
     if (brandNameError.value =='' &&
     tagLineError.value =='' &&
     mobileError.value =='' &&
     emailError.value =='' &&
     websiteError.value =='' &&
     addressError.value =='' ) {

      return true;
    } else {
      return false;
    }
  }

onTapSubmit()async{
    loader.value =true;
    brandModel = await AddDetailsApi.addDetailApi(brandName: brandName.text,
        tag: tagLine.text, email: email.text, website: website.text, address: address.text, phone: phoneNumber.text);

    loader.value =false;
}

}
