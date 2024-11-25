
import 'package:festiveapp_studio/common/testStyle.dart';
import 'package:festiveapp_studio/screen/add_details/api/add_details_model.dart';
import 'package:festiveapp_studio/service/pref_services.dart';
import 'package:festiveapp_studio/utils/app_colors.dart';
import 'package:festiveapp_studio/utils/pref_keys.dart';
import 'package:festiveapp_studio/utils/string_res.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_rx/get_rx.dart';
import 'package:image_picker/image_picker.dart';

import '../add_details/api/add_details_api.dart';

class GenerateLogoController extends GetxController{
  TextEditingController brandName = TextEditingController();
  TextEditingController tagLine = TextEditingController();
  TextEditingController category = TextEditingController();
  TextEditingController logoType = TextEditingController();
  TextEditingController primaryColorText = TextEditingController();
  TextEditingController secColorText = TextEditingController();
  TextEditingController logo = TextEditingController();



  int? primaryColor;
  int? secondaryColor;
  BrandModel brandModel = BrandModel();

  RxString brandNameError =''.obs;
  RxString tagLineError =''.obs;
  RxString categoryError =''.obs;
  RxString logoTypeError =''.obs;
  RxString primaryColorError =''.obs;
  RxString secondaryColorError =''.obs;
  RxString logoError =''.obs;
  RxBool loader =false.obs;

  Rx<String> logoImage =''.obs;
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

  categoryValidation(){
    if (category.text.trim().isEmpty) {

      categoryError.value = StringRes.categoryError;
      return false;
    }
    else
    {
      categoryError.value ='';

      return true;
    }
  }
  logoTypeValidation(){
    if (logoType.text.trim().isEmpty) {

      logoTypeError.value = StringRes.logoTypeError;
      return false;
    }
    else
    {
      logoTypeError.value ='';
      return true;
    }
  }

  primaryColorValidation(){
    if (primaryColor == null) {

      primaryColorError.value = StringRes.primaryColorError;
      return false;
    }
    else
    {
      primaryColorError.value ='';

      return true;
    }
  }
  secondaryColorValidation(){
    if (secondaryColor == null) {

      secondaryColorError.value = StringRes.secondaryColorError;
      return false;
    }
    else
    {
      secondaryColorError.value ='';
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
    categoryValidation();
    logoTypeValidation();
    primaryColorValidation();
    secondaryColorValidation();
    logoValidation();
    if (brandNameError.value =='' &&
        tagLineError.value =='' &&
        categoryError.value =='' &&
        logoTypeError.value =='' &&
        primaryColorError.value =='' &&
        secondaryColorError.value =='' &&
        logoError.value =='') {
      PrefService.setValue(PrefKeys.primaryColor,primaryColor);
      PrefService.setValue(PrefKeys.secondaryColor, secondaryColor);
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
        tag: tagLine.text, email:PrefService.getString(PrefKeys.email), website:PrefService.getString(PrefKeys.website), address:PrefService.getString(PrefKeys.address),
        phone: PrefService.getString(PrefKeys.phoneNumner),image: logoImage.value);

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