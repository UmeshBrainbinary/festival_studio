import 'package:festiveapp_studio/screen/card_download/card_dowload_screen.dart';
import 'package:festiveapp_studio/screen/dashboard/dashboard_screen.dart';
import 'package:festiveapp_studio/screen/help&support/help&suport_screen.dart';
import 'package:festiveapp_studio/screen/home/home_controller.dart';
import 'package:festiveapp_studio/screen/home/home_screen.dart';
import 'package:festiveapp_studio/screen/tutorials/tutorials_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:persistent_bottom_nav_bar/persistent_tab_view.dart';

class DashBoardController extends GetxController{
  PersistentTabController? persistentTabController;

  bool isStyle = false;
  int currentIndex = 0;

  List<Widget> screens = [
    HomeScreen(),
    HelpScreen(),
    VideoScreen(),
    CardDownload(),
  ];

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    persistentTabController = PersistentTabController(initialIndex: 0);
  }

  onItemSelect ({value}) async {
    currentIndex = value;
    persistentTabController?.index = currentIndex;
    update(["bottom"]);
    // if(currentIndex == 0){
    //   HomeController homeController = Get.put(HomeController());
    //   if(homeController.loader.value == false) {
    //     homeController.reInit();
    //   }
    //   homeController.update(["home"]);
    // } else if(currentIndex == 1){
    //  // SpendingDetailController spendingDetailController = Get.put(SpendingDetailController());
    //  //  if(spendingDetailController.loader.value == false) {
    //  //    spendingDetailController.onInit();
    //   }
    // }else if (currentIndex == 2){
    //  // SettingController book = Get.put(SettingController());
    //  // book.onInit();
    //   // Get.delete<SettingController>(force: true);
    // }
  }
}