import 'package:festiveapp_studio/common/app_contstant.dart';
import 'package:festiveapp_studio/common/common_loader.dart';
import 'package:festiveapp_studio/common/common_primary_button.dart';
import 'package:festiveapp_studio/common/common_text_field.dart';
import 'package:festiveapp_studio/common/testStyle.dart';
import 'package:festiveapp_studio/screen/add_details/add_details_controller.dart';
import 'package:festiveapp_studio/screen/dashboard/dashboard_screen.dart';
import 'package:festiveapp_studio/service/pref_services.dart';
import 'package:festiveapp_studio/utils/app_colors.dart';
import 'package:festiveapp_studio/utils/pref_keys.dart';
import 'package:festiveapp_studio/utils/string_res.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

AddDetailsController controller = Get.find<AddDetailsController>();

Widget addDetailsTextField(BuildContext context) {
  return SingleChildScrollView(
    child: Padding(
      padding: const EdgeInsets.all(20.0),
      child: Stack(
        alignment: Alignment.center,
        children: [
          Column(
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
                // leadingWidget: SizedBox(
                //   width: 0.22,
                //   child: Text(
                //     StringRes.brandName,
                //     style: mediumFontStyle(color: AppColors.hintColor),
                //   ),
                // ),
                hint: StringRes.brandName,
                controller: controller.brandName,
          textInputAction: TextInputAction.done,
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
                  hint: StringRes.tagLine,
                  textInputAction: TextInputAction.done,
                  controller: controller.tagLine),

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
                  hint: StringRes.phoneNo,
                  textInputAction: TextInputAction.done,
                  controller: controller.phoneNumber,textInputType: TextInputType.phone),

              Obx(
                      () {
                    return Align(
                      alignment: Alignment.centerLeft,
                      child: controller.mobileError.value !=''?Padding(
                        padding: const EdgeInsets.only(top: 10.0,left: 4),
                        child: Text(
                          controller.mobileError.value,
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

              CommonTextField(hint: StringRes.email,
                  textInputAction: TextInputAction.done,
                  textInputType: TextInputType.emailAddress,
                  controller: controller.email),

              Obx(
                      () {
                    return Align(
                      alignment: Alignment.centerLeft,
                      child: controller.emailError.value !=''?Padding(
                        padding: const EdgeInsets.only(top: 10.0,left: 4),
                        child: Text(
                          controller.emailError.value,
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
                  hint: StringRes.website,
                  textInputAction: TextInputAction.done,
                  controller: controller.website),
              Obx(
                      () {
                    return Align(
                      alignment: Alignment.centerLeft,
                      child: controller.websiteError.value !=''?Padding(
                        padding: const EdgeInsets.only(top: 10.0,left: 4),
                        child: Text(
                          controller.websiteError.value,
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
              Obx(
                      () {
                    return Align(
                      alignment: Alignment.centerLeft,
                      child: controller.addressError.value !=''?Padding(
                        padding: const EdgeInsets.only(top: 10.0,left: 4),
                        child: Text(
                          controller.addressError.value,
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
                 controller.onTapSubmit();

                    }
                  },
                  text: StringRes.submit)
            ],
          ),
          Obx(()=> controller.loader.value ?const CommonLoader():const SizedBox()),
        ],
      ),
    ),
  );
}
