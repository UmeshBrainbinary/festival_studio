import 'package:festiveapp_studio/screen/home/home_controller.dart';
import 'package:festiveapp_studio/screen/home/widget/home_widget.dart';
import 'package:festiveapp_studio/utils/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeScreen extends StatelessWidget {
   HomeScreen({super.key});
   HomeController controller = Get.put(HomeController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.blue,
      body: Padding(
        padding: const EdgeInsets.all(15.0),
        child: SingleChildScrollView(
          child: Column(
            children: [
              const SizedBox(height: 20,),
              textField(),
              festivalListview(context: context),
              motivationalListview(context : context),
              morningQuotes(context: context),
            ],
          ),
        ),
      ),
    );
  }
}
