import 'package:festiveapp_studio/common/app_contstant.dart';
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

Widget addDetailsTextField(BuildContext context) {
  return SingleChildScrollView(
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(
          height: 20,
        ),
        Row(
          children: [
            CommonBackButton(
              onTap: () {
                Get.back();
              },
            ),
            const Spacer(),
            Text(
              StringRes.generateLogo,
              style: boldFontStyle(
                color: AppColors.blackColor,
                size: 18,
              ),
            ),
            const Spacer(),
          ],
        ),
        const SizedBox(
          height: 10,
        ),
        Text(
          StringRes.brandDetails,
          style: regularFontStyle(color: AppColors.detailsTitle, size: 16),
        ),
        const SizedBox(
          height: 40,
        ),
        CommonTextField(
          hint: StringRes.brandName,
          controller: controller.brandName,
        ),
        const SizedBox(
          height: 20,
        ),
        CommonTextField(
            hint: StringRes.tagLine, controller: controller.tagLine),
        const SizedBox(
          height: 20,
        ),
        CommonTextField(
          hint: StringRes.category,
          controller: controller.category,
        ),
        const SizedBox(
          height: 20,
        ),
        CommonTextField(
            hint: StringRes.logoType, controller: controller.logoType),
        const SizedBox(
          height: 20,
        ),
        CommonTextField(
            hint: StringRes.primaryColor, controller: controller.primaryColor),
        const SizedBox(
          height: 20,
        ),
        CommonTextField(
            hint: StringRes.secondaryColor,
            controller: controller.secondaryColor),
        const SizedBox(
          height: 30,
        ),
        CommonPrimaryButton(
            onTap: () {
              hideKeyboard(context);
              if (controller.validate()) {
                Get.to(
                  LogoSelectionPage(),
                );
              }
            },
            text: StringRes.generate)
      ],
    ),
  );
}
