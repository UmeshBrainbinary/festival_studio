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
          textInputAction: TextInputAction.done,
          hint: StringRes.brandName,
          controller: controller.brandName,
        ),
        Obx(
                () {
              return Align(
                alignment: Alignment.centerLeft,
                child: controller.brandNameError.value !=''?Padding(
                  padding: const EdgeInsets.only(top: 10.0,left: 4),
                  child: Text(
                    controller.brandNameError.value,
                    style: regularFontStyle(
                        color: AppColors.errorColor, size: 14
                    ),

                  ),
                ):const SizedBox(),

              );
            }
        ),


        const SizedBox(
          height: 20,
        ),
        CommonTextField(
            textInputAction: TextInputAction.done,
            hint: StringRes.tagLine, controller: controller.tagLine),
        Obx(
                () {
              return Align(
                alignment: Alignment.centerLeft,
                child: controller.tagLineError.value !=''?Padding(
                  padding: const EdgeInsets.only(top: 10.0,left: 4),
                  child: Text(
                    controller.tagLineError.value,
                    style: regularFontStyle(
                        color: AppColors.errorColor, size: 14
                    ),

                  ),
                ):const SizedBox(),

              );
            }
        ),
        const SizedBox(
          height: 20,
        ),
        CommonTextField(
          textInputAction: TextInputAction.done,
          hint: StringRes.category,
          controller: controller.category,
        ),
        Obx(
                () {
              return Align(
                alignment: Alignment.centerLeft,
                child: controller.categoryError.value !=''?Padding(
                  padding: const EdgeInsets.only(top: 10.0,left: 4),
                  child: Text(
                    controller.categoryError.value,
                    style: regularFontStyle(
                        color: AppColors.errorColor, size: 14
                    ),

                  ),
                ):const SizedBox(),

              );
            }
        ),
        const SizedBox(
          height: 20,
        ),
        CommonTextField(
            textInputAction: TextInputAction.done,
            hint: StringRes.logoType, controller: controller.logoType),
        Obx(
                () {
              return Align(
                alignment: Alignment.centerLeft,
                child: controller.logoTypeError.value !=''?Padding(
                  padding: const EdgeInsets.only(top: 10.0,left: 4),
                  child: Text(
                    controller.logoTypeError.value,
                    style: regularFontStyle(
                        color: AppColors.errorColor, size: 14
                    ),

                  ),
                ):const SizedBox(),

              );
            }
        ),
        const SizedBox(
          height: 20,
        ),
        CommonTextField(
            textInputAction: TextInputAction.done,
            hint: StringRes.primaryColor, controller: controller.primaryColor),
        Obx(
                () {
              return Align(
                alignment: Alignment.centerLeft,
                child: controller.primaryColorError.value !=''?Padding(
                  padding: const EdgeInsets.only(top: 10.0,left: 4),
                  child: Text(
                    controller.primaryColorError.value,
                    style: regularFontStyle(
                        color: AppColors.errorColor, size: 14
                    ),

                  ),
                ):const SizedBox(),

              );
            }
        ),
        const SizedBox(
          height: 20,
        ),
        CommonTextField(
          textInputAction: TextInputAction.done,
            hint: StringRes.secondaryColor,
            controller: controller.secondaryColor),
        Obx(
                () {
              return Align(
                alignment: Alignment.centerLeft,
                child: controller.secondaryColorError.value !=''?Padding(
                  padding: const EdgeInsets.only(top: 10.0,left: 4),
                  child: Text(
                    controller.secondaryColorError.value,
                    style: regularFontStyle(
                        color: AppColors.errorColor, size: 14
                    ),

                  ),
                ):const SizedBox(),

              );
            }
        ),
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
