// ignore_for_file: must_be_immutable

import 'package:festiveapp_studio/common/common_back_button.dart';
import 'package:festiveapp_studio/common/common_loader.dart';
import 'package:festiveapp_studio/common/testStyle.dart';
import 'package:festiveapp_studio/screen/termsCondition/termsConditionController.dart';
import 'package:festiveapp_studio/utils/app_colors.dart';
import 'package:festiveapp_studio/utils/string_res.dart';
import 'package:flutter/material.dart';
import 'package:flutter_widget_from_html/flutter_widget_from_html.dart';
import 'package:get/get.dart';

class TermsConditionScreen extends StatelessWidget {
   TermsConditionScreen({super.key});
   TermsAndConditionController  termsConditionController = Get.put(TermsAndConditionController());
  @override
  Widget build(BuildContext context) {

    return  Scaffold(
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
                Row(
                  children: [
                    CommonBackButton(
                      onTap: () {
                        Get.back();
                      },
                    ),
                    const Spacer(),
                    Text(
                      StringRes.terms,
                      style: boldFontStyle(
                        color: AppColors.blackColor,
                        size: 20,
                      ),
                    ),
                    const Spacer(),
                    Visibility(
                      visible: false,
                      maintainSize: true,
                      maintainAnimation: true,
                      maintainState: true,
                      child: CommonBackButton(
                        onTap: () {

                        },
                      ),
                    ),

                  ],
                ),

                const SizedBox(
                  height: 30,
                ),


                Obx(
                 () {
                    return ListView.builder(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      itemCount: termsConditionController.termsConditionModel.value.data?.length ?? 0,
                      itemBuilder: (context,index){
                        return Column(
                          children: [
                            HtmlWidget(
                              termsConditionController.termsConditionModel.value.data?[index].description ?? '',
                              textStyle: regularFontStyle(
                                color: AppColors.blackColor,
                                size: 16,
                              ),
                            ),
                            const SizedBox(height: 20,)
                          ],
                        );
                      },
                    );
                  }
                ),
              ],
            ),
            Obx(()=> termsConditionController.loader.value?const CommonLoader():const SizedBox()),
          ],
        ),
      ),
    );
  }
}
