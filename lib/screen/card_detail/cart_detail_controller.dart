

// ignore_for_file: avoid_function_literals_in_foreach_calls

import 'package:flutter/services.dart';
import 'package:flutter_share/flutter_share.dart';
import 'package:get/get.dart';

class CardDetailController extends GetxController{

RxInt selectedIndex = 0.obs;

List frames = [
  "assets/frames/1.svg",
  "assets/frames/2.svg",
  "assets/frames/3.svg",
  "assets/frames/4.svg",
  "assets/frames/5.svg",
  "assets/frames/6.svg",
  "assets/frames/7.svg",
  "assets/frames/8.svg",
  "assets/frames/9.svg",
  "assets/frames/10.svg",
  "assets/frames/11.svg",
  "assets/frames/12.svg",
  "assets/frames/13.svg",
  "assets/frames/14.svg",
  "assets/frames/15.svg",
  "assets/frames/16.svg",
  "assets/frames/17.svg",
  "assets/frames/18.svg",
  "assets/frames/19.svg",
];

List framesList =[];

String? selectedImage;
Future<void> share() async {
  await FlutterShare.share(
    title: 'Festival studio',
    linkUrl: 'app link attached',
  );




}

init() async {
  frames.forEach((element) async {
    framesList.add(await rootBundle.loadString(element));
  });
}


@override
  void onInit() {
    init();
    super.onInit();
  }

}