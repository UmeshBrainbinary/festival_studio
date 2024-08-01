import 'package:festiveapp_studio/common/common_loader.dart';
import 'package:festiveapp_studio/screen/home/home_controller.dart';
import 'package:festiveapp_studio/screen/home/widget/home_widget.dart';
import 'package:festiveapp_studio/utils/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeScreen extends StatelessWidget {
   HomeScreen({super.key});
  @override
  Widget build(BuildContext context) {
   HomeController controller = Get.put(HomeController());
    return Scaffold(
      backgroundColor: AppColors.blue,
      body: Stack(
        alignment: Alignment.center,
        children: [
          GetBuilder<HomeController>(
            id: "home",
            builder: (context) {
              return Padding(
                padding: const EdgeInsets.all(15.0),
                child: Column(
                  children: [
                    const SizedBox(height: 20,),
                    textField(),
                    Expanded(child: ListView.builder(
                          itemCount: controller.homeModel.length,
                          itemBuilder: (context,i) {
                            return festivalListview(context: context,index :i);
                          }
                        )),


                    // motivationalListview(context : context),
                    // morningQuotes(context: context),
                  ],
                ),
              );
            }
          ),
          Obx(()=> controller.loader.value?const CommonLoader():const SizedBox()),
        ],
      ),
    );
  }
}
