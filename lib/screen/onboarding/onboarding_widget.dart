import 'package:festiveapp_studio/screen/onboarding/onboarding_controller.dart';
import 'package:festiveapp_studio/utils/app_assets.dart';
import 'package:festiveapp_studio/utils/app_colors.dart';
import 'package:festiveapp_studio/utils/string_res.dart';
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
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: List.generate(
              3,
              (index) => AnimatedContainer(
                duration: const Duration(microseconds: 100),
                margin: const EdgeInsets.symmetric(horizontal: 2),
                height: Get.height * 0.0099,
                width: Get.height * 0.0099,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(25),
                    color: index == controller.pageIndex.value
                        ? AppColors.lightPink
                        : AppColors.white),
              ),
            ),
          ),
        ],
      ));
}

Widget pageViewOnboard() {
  return Expanded(
    child: PageView.builder(
      controller: controller.pageController,
      itemCount: 3,
      onPageChanged: (value) {
        controller.select(value);
      },
      itemBuilder: (context, index) {
        return  Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              controller.data[index]['text'],
              style: TextStyle(color: AppColors.white, fontSize: 25),
            ),
            SizedBox(
              height: 10,
            ),
            Padding(
              padding: EdgeInsets.only(left: 80, right: 80),
              child: Text(
                controller.data[index]['text1'],
                textAlign: TextAlign.center,
              ),
            )
          ],
        );
      },
    ),
  );
}

Widget button() {
  return InkWell(
    onTap: () {
      controller.homeToLogin();
    },
    child: Container(
      height: 50,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10), color: AppColors.white),
      child: const Center(child: Text('Next')),
    ),
  );
}
