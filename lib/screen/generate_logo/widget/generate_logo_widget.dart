import 'package:festiveapp_studio/common/common_back_button.dart';
import 'package:festiveapp_studio/common/common_primary_button.dart';
import 'package:festiveapp_studio/common/common_text_field.dart';
import 'package:festiveapp_studio/common/testStyle.dart';
import 'package:festiveapp_studio/screen/generate_logo/generate_logo_controller.dart';
import 'package:festiveapp_studio/screen/select_logo/select_logo_screen.dart';
import 'package:festiveapp_studio/utils/app_colors.dart';
import 'package:festiveapp_studio/utils/string_res.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

GenerateLogoController controller = Get.find<GenerateLogoController>();


Widget addDetailsTextField() {
  return SingleChildScrollView(
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(
          height: 20,
        ),
        Row(
          children: [
            CommonBackButton(onTap: () {
              Get.back();
            },),
            Spacer(),
            Text(
              StringRes.addDetailsTitle,
              style: boldFontStyle(
                color: AppColors.blackColor,
                size: 18,
              ),
            ),
            Spacer(),
          ],
        ),
        const SizedBox(
          height: 10,
        ),
        Text(
          StringRes.information,
          style: regularFontStyle(color: AppColors.detailsTitle, size: 16),
        ),
        const SizedBox(
          height: 40,
        ),
        CommonTextField(
          // leadingWidget: SizedBox(
          //   width: 0.22,
          //   child: Text(
          //     StringRes.brandName,
          //     style: mediumFontStyle(color: AppColors.hintColor),
          //   ),
          // ),
          hint: StringRes.brandName,
          controller: controller.brandName,
        ),
        const SizedBox(
          height: 20,
        ),
        CommonTextField(
            hint: StringRes.tagLine,
            controller: controller.tagLine),
        const SizedBox(
          height: 20,
        ),
        CommonTextField(
            hint: StringRes.category, controller: controller.category,textInputType: TextInputType.phone),
        const SizedBox(
          height: 20,
        ),

        CommonTextField(hint: StringRes.logoType, controller: controller.logoType),
        const SizedBox(
          height: 20,
        ),
        CommonTextField(
            hint: StringRes.primaryColor, controller: controller.primaryColor),
        const SizedBox(
          height: 20,
        ),
        CommonTextField(
            hint: StringRes.secondaryColor, controller: controller.secondaryColor),
        const SizedBox(
          height: 30,
        ),
        CommonPrimaryButton(
            onTap: () {
              if (controller.validate()) {
                Get.to(SelectLogoScreen());

              }
            },
            text: StringRes.generate)
      ],
    ),
  );
}
