import 'package:festiveapp_studio/common/common_primary_button.dart';
import 'package:festiveapp_studio/common/testStyle.dart';
import 'package:festiveapp_studio/screen/intro/onboarding/onboarding_controller.dart';

import 'package:festiveapp_studio/utils/app_assets.dart';
import 'package:festiveapp_studio/utils/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

final OnBordingController controller = Get.find<OnBordingController>();

Widget navigateContainer() {
  return Obx(() => Column(
        children: [
          SizedBox(
            height: 200,
            width: 200,
            child: Image.asset(AppAssets.logo),
          ),
          const SizedBox(height: 40,),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: List.generate(
              3,
              (index) => AnimatedContainer(
                duration: const Duration(microseconds: 100),
                margin: const EdgeInsets.symmetric(horizontal: 2),
                height: Get.height * 0.02,
                width: Get.height * 0.02,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(25),
                    color: index == controller.pageIndex.value
                        ? AppColors.lightPink
                        : AppColors.cream),
              ),
            ),
          ),
        ],
      ));
}

Widget pageViewOnboard() {
  return SizedBox(
    height: 150,
    child: PageView.builder(
      controller: controller.pageController,
      itemCount: controller.data.length,
      onPageChanged: (value) {
        controller.select(value);
      },
      itemBuilder: (context, index) {
        return  Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              controller.data[index]['text'],
              style:semiBoldFontStyle(
                color: AppColors.white,
                size: 22,
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 40, right: 40),
              child: Text(
                controller.data[index]['text1'],
                textAlign: TextAlign.center,
                style: mediumFontStyle(
                  size: 12,
                  color: AppColors.darkWhite,
                ),
              ),
            ),
          ],
        );
      },
    ),
  );
}

Widget button() {
  return Obx(() => CommonPrimaryButton(onTap: () {
controller.homeToLogin();
  }, text:controller.pageIndex.value == 2?'Get Started': 'Next'));
}
