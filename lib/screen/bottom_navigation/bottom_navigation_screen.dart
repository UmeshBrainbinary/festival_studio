import 'package:festiveapp_studio/common/testStyle.dart';
import 'package:festiveapp_studio/screen/bottom_navigation/bottom_navigation_controller.dart';
import 'package:festiveapp_studio/utils/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class BtnScreen extends StatelessWidget {
  BtnScreen({Key? key}) : super(key: key);

  final BtnController controller = Get.put(BtnController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Obx(
        () => Center(
          child: controller.screens.elementAt(controller.currentIndex.value),
        ),
      ),
      bottomNavigationBar: Obx(
        () => SizedBox(
          height: Get.height * 0.1,
          child: BottomNavigationBar(
            currentIndex: controller.currentIndex.value,
            type: BottomNavigationBarType.fixed,
            backgroundColor: AppColors.white,
            selectedItemColor: Colors.pink,
            unselectedItemColor: Colors.black87,
            selectedFontSize: 14,
            unselectedFontSize: 14,
            selectedLabelStyle:
                mediumFontStyle(color: Colors.green, size: 14, height: 1),
            unselectedLabelStyle:
                mediumFontStyle(color: Colors.blue, size: 14, height: 1),
            onTap: (index) {
              controller.currentIndex.value = index;
            },
            items: [
              BottomNavigationBarItem(
                label: 'home',
                icon: Image.asset(
                  'assets/images/box.png',
                  height: Get.height * 0.048,
                  // color: controller.currentIndex.value == 0
                  //     ? Colors.green
                  //     : Colors.purple,
                ),
              ),
              BottomNavigationBarItem(
                label: "explore",
                icon: Image.asset(
                  'assets/images/box.png',
                  height: Get.height * 0.048,
                  // color: controller.currentIndex.value == 1
                  //     ? Colors.green
                  //     : Colors.purple,
                ),
              ),
              BottomNavigationBarItem(
                label: 'feed',
                icon: Image.asset(
                  'assets/images/box.png',
                  height: Get.height * 0.048,
                  // color: controller.currentIndex.value == 2
                  //     ? Colors.green
                  //     : Colors.purple,
                ),
              ),
              BottomNavigationBarItem(
                label: 'profile',
                icon: Image.asset(
                  'assets/images/box.png',
                  height: Get.height * 0.048,
                  // color: controller.currentIndex.value == 3
                  //     ? Colors.green
                  //     : Colors.purple,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
