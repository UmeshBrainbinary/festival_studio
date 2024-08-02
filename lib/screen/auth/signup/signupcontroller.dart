import 'package:festiveapp_studio/common/status_bar.dart';
import 'package:festiveapp_studio/screen/auth/otp_verification/otp_screen.dart';
import 'package:festiveapp_studio/screen/auth/signup/api/signup_api.dart';
import 'package:festiveapp_studio/screen/auth/signup/api/signup_model.dart';
import 'package:festiveapp_studio/utils/string_res.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SignUpController extends GetxController{


  RxBool loader = false.obs;
  TextEditingController firstNameController = TextEditingController();
  TextEditingController lastNameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController countryCodeController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  RxBool isShowPassword = true.obs;

  RxString countryCode = "+91".obs;
  RxString countryName = "India".obs;
  RxString countryNameCode = "IN".obs;

  RxString firstNameError =''.obs;
  RxString lastNameError =''.obs;
  RxString emailError =''.obs;
  RxString passwordError =''.obs;
  RxString mobileError =''.obs;
  RxString country =''.obs;

  SignUpModel signUpModel = SignUpModel();
  onHideTap(){
    if(isShowPassword.value)
    {
      isShowPassword.value = false;
    }
    else{
      isShowPassword.value = true;

    }
  }
  firstNameValidation(){
    if(firstNameController.text.isEmpty)
    {
      firstNameError.value = StringRes.firstNameError;
      return false;
    } else{

      firstNameError.value = '';
      return true;
    }
  }
  lastNameValidation(){
    if(lastNameController.text.isEmpty)
    {
      lastNameError.value = StringRes.lastNameError;
      return false;
    } else{

      lastNameError.value = '';
      return true;
    }
  }

  passwordValidation(){
    if(passwordController.text.isEmpty)
    {
      passwordError.value = StringRes.passwordError;
      return false;
    } else{

      passwordError.value = '';
      return true;
    }
  }

  emailValidation(){
    String emailPattern = r'^[a-zA-Z0-9._%-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,4}$';
    RegExp emailRegex = RegExp(emailPattern);
    if(emailController.text.trim().isEmpty)
    {
      emailError.value = StringRes.emailError;
      return false;
    }
    else if(!emailRegex.hasMatch(emailController.text.trim())){
      emailError.value = StringRes.emailValidError;

      return false;
    }
    else{
      emailError.value = '';
      return true;
    }
  }

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

    firstNameValidation();
    lastNameValidation();
    passwordValidation();
    emailValidation();
    countryValidation();
    mobileNumberValidation();
    if(
    mobileError.value =='' && country.value ==''&&
    firstNameError.value =='' && lastNameError.value ==''&&
    emailError.value =='' && passwordError.value ==''
    )
    {
      return true;
    }
    else
    {
      return false;
    }


  }

  onTapSignUp()async{
    loader.value =true;
   signUpModel =  await SignUpApi.signUpApi(firstname: firstNameController.text,
        lastName: lastNameController.text
        , email: emailController.text,
        password: passwordController.text, mobile: "${countryCode.value}${phoneController.text}");
   if(signUpModel.success ==true)
     {
       lightStatusBar();
       Get.to(()=>OtpScreen(),arguments: "${countryCode.value}${phoneController.text}")?.whenComplete(()=> lightStatusBar());
     }
    loader.value =false;
  }
}