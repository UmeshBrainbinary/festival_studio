import 'package:festiveapp_studio/common/testStyle.dart';
import 'package:festiveapp_studio/utils/app_assets.dart';
import 'package:festiveapp_studio/utils/app_colors.dart';
import 'package:festiveapp_studio/utils/string_res.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_navigation/get_navigation.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final double width = MediaQuery.of(context).size.width;
    final double height = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: AppColors.blue,
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: width * 0.035),
        child: Column(
          children: [
            SizedBox(height: height * 0.08, width: width),
            Image.asset(AppAssets.logo,
                height: height * 0.15, width: height * 0.15),
            SizedBox(height: height * 0.015),
            Text(
              StringRes.loginToYourAcc,
              style: boldFontStyle(size: 28),
            ),
            SizedBox(height: height * 0.015),
            Text(
              StringRes.takeYourBrandToTheNextLevel,
              style: regularFontStyle(size: 16, color: AppColors.descGreyColor),
            ),
            SizedBox(height: height * 0.015),
            CommonTextField(controller: TextEditingController(),hint: "India",),
          ],
        ),
      ),
    );
  }
}

class CommonTextField extends StatelessWidget {
  final TextEditingController controller;
  final String? hint;
  final Widget? leadingWidget;
  const CommonTextField({
    super.key, required this.controller,this.hint, this.leadingWidget,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 48,
      padding: EdgeInsets.symmetric(horizontal: Get.width*0.035),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          color: AppColors.white),
      child: Row(
        children: [
          leadingWidget ??
          SizedBox(
            width: Get.width*0.22,
            child: Text(hint ?? "",style: mediumFontStyle(color: AppColors.hintColor,size: 16),),),
          Expanded(
            child: TextFormField(
              controller: controller,
              style: mediumFontStyle(color: AppColors.blackColor,size: 16,height: 1.3),
              decoration: InputDecoration(border: InputBorder.none,hintStyle: mediumFontStyle(color: AppColors.hintColor,size: 16)),
            ),
          ),
        ],
      ),
    );
  }
}
