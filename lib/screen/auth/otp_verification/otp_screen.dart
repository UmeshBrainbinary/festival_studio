// ignore_for_file: must_be_immutable

import 'package:festiveapp_studio/common/app_contstant.dart';
import 'package:festiveapp_studio/common/common_back_button.dart';
import 'package:festiveapp_studio/common/common_loader.dart';
import 'package:festiveapp_studio/common/testStyle.dart';
import 'package:festiveapp_studio/common/underline_text/common_underline_text.dart';
import 'package:festiveapp_studio/screen/auth/otp_verification/otp_controller.dart';
import 'package:festiveapp_studio/screen/termsCondition/terms_condition_screen.dart';
import 'package:festiveapp_studio/utils/app_colors.dart';
import 'package:festiveapp_studio/utils/string_res.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pinput/pinput.dart';

class OtpScreen extends StatelessWidget {

  OtpScreen({super.key,});

  OtpController controller = Get.put(OtpController());

  @override
  Widget build(BuildContext context) {
    final double width = MediaQuery.of(context).size.width;
    final double height = MediaQuery.of(context).size.height;
    return GestureDetector(
      onTap: () {
        hideKeyboard(context);
      },
      child: Scaffold(
        backgroundColor: AppColors.blue,
        resizeToAvoidBottomInset: false,
        body: Stack(
          alignment: Alignment.center,
          children: [
            Padding(
              padding: EdgeInsets.symmetric(horizontal: width * 0.04),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: height * 0.055, width: width),
                  CommonBackButton(
                    onTap: () {
                      Get.back();
                    },
                  ),
                  SizedBox(height: height * 0.05),
                  Text(
                    StringRes.otpVerification,
                    style: boldFontStyle(size: 28),
                  ),
                  SizedBox(height: height * 0.015),
                  Text(
                    StringRes.weSentOtpCodeToYourMobileNumber,
                    style:
                        regularFontStyle(size: 16, color: AppColors.descGreyColor),
                  ),
                  SizedBox(height: height * 0.065),
                  Pinput(
                    length: 6,
                    androidSmsAutofillMethod:
                        AndroidSmsAutofillMethod.smsRetrieverApi,
                    controller: controller.otpController,
                    onCompleted: (value) {
                     controller.onCompleteOtp();
                    },
                    defaultPinTheme: PinTheme(
                        height: width * 0.17,
                        width: width * 0.17,
                        textStyle: semiBoldFontStyle(
                            size: 28, color: AppColors.blackColor),
                        decoration: BoxDecoration(
                            color: AppColors.white,
                            borderRadius: BorderRadius.circular(6)),
                        margin: EdgeInsets.symmetric(horizontal: width * 0.001)),
                  ),
                  SizedBox(height: height * 0.055),
                  Center(
                    child: Text(
                      StringRes.didNotReceiveOtp,
                      textAlign: TextAlign.center,
                      style: regularFontStyle(
                          size: 16, color: AppColors.descGreyColor),
                    ),
                  ),
                  const Spacer(),
                  Center(
                    child: InkWell(
                      onTap: (){
                        Get.to(()=> TermsConditionScreen());
                      },
                      child: CustomunderLineText(
                        text: StringRes.termsAndConditions,
                        style: mediumFontStyle(
                            size: 16,
                            color: AppColors.white,
                            decoration: TextDecoration.underline),
                      ),
                    ),
                  ),
                  SizedBox(height: height * 0.07),
                ],
              ),
            ),
            Obx(()=> controller.loader.value ?const CommonLoader():const SizedBox()),
          ],
        ),
      ),
    );
  }
}
