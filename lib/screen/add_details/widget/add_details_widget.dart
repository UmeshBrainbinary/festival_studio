import 'package:festiveapp_studio/common/common_primary_button.dart';
import 'package:festiveapp_studio/common/common_text_field.dart';
import 'package:festiveapp_studio/common/testStyle.dart';
import 'package:festiveapp_studio/screen/add_details/add_details_controller.dart';
import 'package:festiveapp_studio/screen/bottom_navigation/bottom_navigation_screen.dart';
import 'package:festiveapp_studio/screen/home/home_screen.dart';
import 'package:festiveapp_studio/utils/app_colors.dart';
import 'package:festiveapp_studio/utils/string_res.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

AddDetailsController controller = Get.find<AddDetailsController>();

Widget addDetailsTextField() {
  return SingleChildScrollView(
    child: Padding(
      padding: const EdgeInsets.all(20.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(
            height: 10,
          ),
          Center(
            child: Text(
              StringRes.addDetailsTitle,
              style: boldFontStyle(
                color: AppColors.blackColor,
                size: 18,
              ),
            ),
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
            leadingWidget: SizedBox(
              width: 0.22,
              child: Text(
                StringRes.brandName,
                style: mediumFontStyle(color: AppColors.hintColor),
              ),
            ),
            controller: controller.brandName,
          ),
          const SizedBox(
            height: 20,
          ),
          CommonTextField(
              leadingWidget: SizedBox(
                width: 0.22,
                child: Text(
                  StringRes.tagLine,
                  style: mediumFontStyle(color: AppColors.hintColor),
                ),
              ),
              controller: controller.tagLine),
          const SizedBox(
            height: 20,
          ),
          CommonTextField(
              hint: StringRes.phoneNo, controller: controller.phoneNumber),
          const SizedBox(
            height: 20,
          ),
          CommonTextField(hint: StringRes.email, controller: controller.email),
          const SizedBox(
            height: 20,
          ),
          CommonTextField(
              hint: StringRes.website, controller: controller.website),
          const SizedBox(
            height: 20,
          ),
          Container(
            height: 70,
            padding: EdgeInsets.symmetric(
                horizontal: Get.width * 0.035, vertical: 0),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8), color: AppColors.white),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  width: Get.width * 0.22,
                  child: Padding(
                    padding: const EdgeInsets.only(top: 10.0),
                    child: Text(
                      StringRes.address,
                      style:
                          mediumFontStyle(color: AppColors.hintColor, size: 16),
                    ),
                  ),
                ),
                Expanded(
                  child: TextFormField(
                    maxLines: 3,
                    controller: controller.address,
                    style: mediumFontStyle(
                        color: AppColors.blackColor, size: 16, height: 1.3),
                    decoration: InputDecoration(
                      // hintText: StringRes.address,
                      border: InputBorder.none,
                      hintStyle:
                          mediumFontStyle(color: AppColors.hintColor, size: 16),
                    ),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(
            height: 30,
          ),
          CommonPrimaryButton(
              onTap: () {
                if (controller.validate()) {
                  Get.to(BtnScreen());
                }
              },
              text: StringRes.submit)
        ],
      ),
    ),
  );
}
