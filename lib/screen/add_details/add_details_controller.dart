

import 'package:festiveapp_studio/common/testStyle.dart';
import 'package:festiveapp_studio/screen/add_details/api/add_details_api.dart';
import 'package:festiveapp_studio/screen/add_details/api/add_details_model.dart';
import 'package:festiveapp_studio/service/pref_services.dart';
import 'package:festiveapp_studio/utils/app_colors.dart';
import 'package:festiveapp_studio/utils/pref_keys.dart';
import 'package:festiveapp_studio/utils/string_res.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

class AddDetailsController extends GetxController {
  TextEditingController brandName = TextEditingController();
  TextEditingController tagLine = TextEditingController();
  TextEditingController phoneNumber = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController website = TextEditingController();
  TextEditingController address = TextEditingController();
  TextEditingController logo = TextEditingController();
RxBool loader = false.obs;
  RxString brandNameError =''.obs;
  RxString tagLineError =''.obs;
  RxString mobileError =''.obs;
  RxString emailError =''.obs;
  RxString websiteError =''.obs;
  RxString addressError =''.obs;
  RxString logoError =''.obs;

  Rx<String> logoImage =''.obs;

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
  logoValidation(){
    if (logoImage.value.trim().isEmpty) {

      logoError.value = StringRes.logoError;
      return false;
    }
    else
    {
      logoError.value ='';

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
    logoValidation();
     if (brandNameError.value =='' &&
     tagLineError.value =='' &&
     mobileError.value =='' &&
     emailError.value =='' &&
     websiteError.value =='' &&
     addressError.value =='' &&
     logoError.value =='') {

       PrefService.setValue(PrefKeys.website, website.text);
       PrefService.setValue(PrefKeys.brandName, brandName.text);
       PrefService.setValue(PrefKeys.tagLine, tagLine.text);
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



  cameraDialog(context) async {
    await showModalBottomSheet(
        elevation: 10,
        barrierColor: AppColors.blackColor.withOpacity(0.4),
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
            topRight: Radius.circular(30.0),
            topLeft: Radius.circular(30.0),
          ),
        ),
        backgroundColor: AppColors.white,
        context: context,
        builder: (context) {
          return SafeArea(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                GestureDetector(
                  onTap: () async {
                    Get.back();
                    pickImage(source: ImageSource.camera);
                  },
                  // child: customListTile(icon: Icons.camera, name: StringRes.camera.tr)
                  child: ListTile(
                    leading: const Icon(
                      Icons.camera,
                      color: AppColors.lightPink,
                    ),
                    title: Text(StringRes.camera.tr, style: mediumFontStyle(size: 18, color: AppColors.lightPink)),
                  ),
                ),
                Container(
                  height: 0.5,
                  width: Get.width,
                  color: AppColors.white,
                ),
                GestureDetector(
                  onTap: () async {
                    Get.back();
                    pickImage(source: ImageSource.gallery);
                  },
                  child: ListTile(
                    leading: const Icon(
                      Icons.photo_size_select_actual_outlined,
                      color: AppColors.lightPink,
                    ),
                    title: Text(StringRes.gallery.tr,
                        style:  mediumFontStyle(size: 18, color: AppColors.lightPink))
                  ),
                ),
              ],
            ),
          );
        });
  }


  Future<void> pickImage({required ImageSource source}) async {
    ImagePicker imagePicker =ImagePicker();
    final pickImage = await imagePicker.pickImage(source: source);
    if (pickImage != null) {
      logoImage.value = (pickImage.path);

    }

  }


}
