import 'package:festiveapp_studio/screen/auth/login/login_screen.dart';
import 'package:festiveapp_studio/utils/string_res.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class OnBordingController extends GetxController {
  List<Map> data = [
    {
      'text': StringRes.discover,
      'text1': StringRes.businessCategories,
    },
    {
      'text': StringRes.create,
      'text1': StringRes.digitalDetails,
    },{
      'text': StringRes.share,
      'text1': StringRes.poster,
    },
  ];
  var pageIndex = 0.obs;
  int index = 0;
  int index1 = 1;
  int index2 = 2;
  PageController pageController = PageController();

  void homeToLogin() {
    if (pageIndex.value != 2) {
      pageController.nextPage(
          duration: const Duration(milliseconds: 500), curve: Curves.linear);
    } else if (pageIndex.value == 2) {
      Get.to( LoginScreen());
    }
  }

  void select(dynamic value) {
    pageIndex.value = value;
    update();
  }
}
