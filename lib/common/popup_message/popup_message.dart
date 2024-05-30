
import 'package:festiveapp_studio/utils/app_colors.dart';
import 'package:get/get.dart';

errorToast({required String msg}){
  Get.snackbar("Error", msg,  colorText: AppColors.errorColor);
}

showToast({required String msg}){
  Get.snackbar("Success", msg,  colorText: AppColors.lightPink);
}