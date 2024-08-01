import 'package:festiveapp_studio/screen/home/api/home_api.dart';
import 'package:festiveapp_studio/screen/home/api/home_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeController extends GetxController {
  TextEditingController search = TextEditingController();
  RxBool loader = false.obs;
  List<HomeModel> homeModel = [];





  init()async{
    loader.value =true;
  homeModel =   await HomeApi.homeApi();

    loader.value =false;
    update(['home']);
  }

  @override
  void onInit() {
  init();


    super.onInit();
  }
}
