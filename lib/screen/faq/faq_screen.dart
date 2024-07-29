import 'package:festiveapp_studio/common/common_loader.dart';
import 'package:festiveapp_studio/common/testStyle.dart';
import 'package:festiveapp_studio/screen/faq/faq_controller.dart';
import 'package:festiveapp_studio/utils/app_colors.dart';
import 'package:festiveapp_studio/utils/string_res.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class FaqScreen extends StatelessWidget {
   FaqScreen({Key? key}) : super(key: key);
FaqController faqController = Get.put(FaqController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Stack(
          alignment: Alignment.center,
          children: [
            Column(
              children: [
                const SizedBox(
                  height: 10,
                ),
                Center(
                  child: Text(
                    StringRes.faq,
                    style: boldFontStyle(
                      color: AppColors.blackColor,
                      size: 20,
                    ),
                  ),
                ),
                const SizedBox(
                  height: 30,
                ),


Obx(() =>(faqController.faqModel.value.data ==null && faqController.loader.value==false)?
Center(child:  Text("No FAQ Found",style: mediumFontStyle(
    size: 18, color: AppColors.blackColor),))
    :GetBuilder<FaqController>(
  id: "faq",
      builder: (con) {
        return ListView.builder(
          physics: const BouncingScrollPhysics(),
          itemCount:
          faqController.faqModel.value.data == null
          ? 0
          :
          faqController.faqModel.value.data!.length,
          shrinkWrap: true,
          itemBuilder: (BuildContext context, int index) {
        return GestureDetector(
          onTap: () => faqController.onChange(index),
          child: Container(
            margin: const EdgeInsets.only(bottom: 10),
            padding: const EdgeInsets.symmetric(
                horizontal: 20, vertical: 20),
            width: Get.width,
            decoration: BoxDecoration(
              color: Colors.white,
              boxShadow: [
                BoxShadow(color: Colors.grey.withOpacity(0.1),
                    blurRadius: 1,
                    offset: const Offset(0,1),
                    spreadRadius: 1
                )
              ],
              borderRadius: BorderRadius.circular(15),
              border: Border.all(
                  color: faqController.selected[index]
                      ? AppColors.blackColor
                      : Colors.transparent),
            ),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment:
                  MainAxisAlignment.spaceBetween,
                  children: [
                    SizedBox(
                      width: Get.width * 0.64,
                      child: Text(
                        faqController.faqModel.value.data?[index].question ?? ''
                            .toString(),
                        style: mediumFontStyle(
                            size: 15,
                            color:AppColors.blackColor),
                      ),
                    ),
                    InkWell(
                      child: faqController.selected[index]
                          ? const Icon(
                        Icons
                            .keyboard_arrow_down_rounded,
                        color: AppColors.blackColor,
                        size: 27,
                      )
                          : const Icon(
                        Icons.keyboard_arrow_right,
                        color: AppColors.blackColor,
                        size: 27,
                      ),
                    )
                  ],
                ),
                faqController.selected[index]
                    ? Column(
                  mainAxisAlignment:
                  MainAxisAlignment.start,
                  crossAxisAlignment:
                  CrossAxisAlignment.start,
                  children: [
                    const SizedBox(
                      height: 10,
                    ),
                    SizedBox(
                      width: Get.width,
                      child: Text(
                          faqController.faqModel.value.data?[index]
                              .answer ?? '',

                          style: regularFontStyle(
                              size: 14,
                              height: 2,
                              color: AppColors.blackColor)),
                    )
                  ],
                )
                    : const SizedBox()
              ],
            ),
          ),
        );
          },
        );
      }
    ),),
              ],
            ),
            Obx(()=> faqController.loader.value?const CommonLoader():const SizedBox()),
          ],
        ),
      ),
    );
  }
}
