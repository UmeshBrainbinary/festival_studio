import 'package:festiveapp_studio/common/common_primary_button.dart';
import 'package:festiveapp_studio/common/testStyle.dart';
import 'package:festiveapp_studio/screen/intro/onboarding/onboarding_controller.dart';
import 'package:festiveapp_studio/utils/app_assets.dart';
import 'package:festiveapp_studio/utils/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

final OnBordingController controller = Get.find<OnBordingController>();

Widget navigateContainer() {
  return Obx(() => Row(
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
  ));
}

Widget pageViewOnboard(_opacityTween,_animationController) {
  return SizedBox(
    height: 450,
    child: PageView.builder(
      controller: controller.pageController,
      itemCount: controller.data.length,
      onPageChanged: (value) {
        controller.select(value);
      },
      itemBuilder: (context, index) {
        return  StatefulBuilder(
          builder: (context,s) {
            s.call((){});
            return Stack(
              alignment: Alignment.topRight,
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                   index ==0 || index ==1 ? Padding(
                      padding: const EdgeInsets.only(right: 20.0),
                      child: Align(
                        alignment: Alignment.centerRight,
                        child: Stack(
                          alignment: Alignment.topRight,
                          children: [
                            SizedBox(
                              height: 250,
                              width: 250,
                              child: SvgPicture.asset(controller.data[index]['image'],),
                            ),
                            AnimatedOpacity(
                              opacity: _opacityTween.evaluate(_animationController),
                              duration: const Duration(seconds: 1),
                              child:   Image.asset(AppAssets.hello,scale: 7.5,)
                            )

                          ],
                        ),
                      ),
                    ):

                    SizedBox(
                height: 250,
                width: 250,
                child: SvgPicture.asset(controller.data[index]['image'],),
                ),
                    const SizedBox(height: 40,),
                    navigateContainer(),
                    const SizedBox(height: 30,),
                    Text(
                      controller.data[index]['text'],
                      style:semiBoldFontStyle(
                        color: AppColors.white,
                        size: 22,
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 40, right: 40),
                      child: Text(
                        controller.data[index]['text1'],
                        textAlign: TextAlign.center,
                        style: mediumFontStyle(
                          size: 12,
                          color: AppColors.lightGreyTextColor,
                        ),
                      ),
                    ),
                  ],
                ),

              ],
            );
          }
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
