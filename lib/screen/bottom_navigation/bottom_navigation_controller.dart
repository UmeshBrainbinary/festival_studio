
import 'package:festiveapp_studio/screen/card_download/card_dowload_screen.dart';
import 'package:festiveapp_studio/screen/home/home_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

class BtnController extends GetxController {
  var currentIndex = 0.obs;

  final List<Widget> screens = [
    HomeScreen(),
    SizedBox(),
    SizedBox(),
    CardDownload(),
  ];
}
