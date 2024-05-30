import 'package:festiveapp_studio/screen/onboarding/onboarding_controller.dart';
import 'package:festiveapp_studio/utils/app_colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

final OnBordingController controller = Get.find<OnBordingController>();

Widget navigateContainer() {
  return Column(
    children: [
      SizedBox(
        height: 200,
        width: 200,
        child: Image.asset('assets/images/box.png'),
      ),
      Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: List.generate(
          3,
          (index) => AnimatedContainer(
            duration: const Duration(microseconds: 100),
            margin: const EdgeInsets.symmetric(horizontal: 2),
            height: Get.height * 0.0099,
            width:  Get.height * 0.0099,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(25),
              color: index== controller.pageIndex.value?AppColors.lightPink:
                  AppColors.white
            ),
          ),
        ),
      ),
    ],
  );
}
Widget pageViewOnboard(){
  return Expanded(
    child: PageView.builder(
      controller: controller.pageController,
      itemCount: 3,
      onPageChanged: (value) {
        controller.select(value);
      },
      itemBuilder: (context, index) {
        return const Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Delivering Dreams',
              style:
              TextStyle(color: AppColors.white, fontSize: 25),
            ),
            SizedBox(
              height: 10,
            ),
            Padding(
              padding: EdgeInsets.only(left: 80, right: 80),
              child: Text(
                '''Add your brand details and save your
                brand. create your business related post
              and videos with your business frames.''',
                textAlign: TextAlign.center,
              ),
            )
          ],
        );
      },
    ),
  );
}