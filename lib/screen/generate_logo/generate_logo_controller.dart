
import 'package:festiveapp_studio/utils/string_res.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class GenerateLogoController extends GetxController{
  TextEditingController brandName = TextEditingController();
  TextEditingController tagLine = TextEditingController();
  TextEditingController category = TextEditingController();
  TextEditingController logoType = TextEditingController();
  TextEditingController primaryColor = TextEditingController();
  TextEditingController secondaryColor = TextEditingController();



  RxString brandNameError =''.obs;
  RxString tagLineError =''.obs;
  RxString categoryError =''.obs;
  RxString logoTypeError =''.obs;
  RxString primaryColorError =''.obs;
  RxString secondaryColorError =''.obs;

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
    if (primaryColor.text.trim().isEmpty) {

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
    if (secondaryColor.text.trim().isEmpty) {

      secondaryColorError.value = StringRes.secondaryColorError;
      return false;
    }
    else
    {
      secondaryColorError.value ='';
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
    if (brandNameError.value =='' &&
        tagLineError.value =='' &&
        categoryError.value =='' &&
        logoTypeError.value =='' &&
        primaryColorError.value =='' &&
        secondaryColorError.value =='' ) {

      return true;
    } else {
      return false;
    }
  }






}