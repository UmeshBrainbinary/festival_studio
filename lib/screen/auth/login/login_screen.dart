// ignore_for_file: must_be_immutable

import 'package:auto_size_text/auto_size_text.dart';
import 'package:country_picker/country_picker.dart';
import 'package:festiveapp_studio/common/app_contstant.dart';
import 'package:festiveapp_studio/common/common_loader.dart';
import 'package:festiveapp_studio/common/common_primary_button.dart';
import 'package:festiveapp_studio/common/common_text_field.dart';
import 'package:festiveapp_studio/common/status_bar.dart';
import 'package:festiveapp_studio/common/testStyle.dart';
import 'package:festiveapp_studio/common/underline_text/common_underline_text.dart';
import 'package:festiveapp_studio/screen/auth/login/login_controller.dart';
import 'package:festiveapp_studio/screen/auth/signup/signup_screen.dart';
import 'package:festiveapp_studio/screen/termsCondition/terms_condition_screen.dart';
import 'package:festiveapp_studio/utils/app_assets.dart';
import 'package:festiveapp_studio/utils/app_colors.dart';
import 'package:festiveapp_studio/utils/string_res.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';


class LoginScreen extends StatelessWidget {
  LoginScreen({super.key});
  LoginController controller = Get.put(LoginController());

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
        resizeToAvoidBottomInset: true,
        body: Stack(
          alignment: Alignment.center,
          children: [
            Padding(
              padding: EdgeInsets.symmetric(horizontal: width * 0.04),
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    SizedBox(height: height * 0.15, width: width),
                    SvgPicture.asset(AppAssets.logoFestival,
                        height: height * 0.15, width: height * 0.15),
                    SizedBox(height: height * 0.018),
                    Text(
                      StringRes.loginToYourAcc,
                      style: boldFontStyle(size: 28),
                    ),
                    SizedBox(height: height * 0.015),
                    Text(
                      StringRes.takeYourBrandToTheNextLevel,
                      style: regularFontStyle(
                          size: 16, color: AppColors.descGreyColor),
                    ),
                    SizedBox(height: height * 0.035),

                    GestureDetector(
                      onTap: () {
                        showCountryPicker(
                          context: context,
                          favorite: <String>['IN'],
                          showPhoneCode: true,
                          onSelect: (Country country) {
                            debugPrint(country.flagEmoji);
                            debugPrint('Select country: ${country.displayName}');
                            // flagImage.value = country.flagEmoji;
                            controller.countryCode.value = "+${country.phoneCode}";
                            controller.countryName.value = country.name;
                            controller.countryNameCode.value = country.countryCode;
                          },
                          countryListTheme: CountryListThemeData(
                            bottomSheetHeight: Get.height * 0.65,
                            flagSize: 20,
                            borderRadius: const BorderRadius.only(
                              topLeft: Radius.circular(20.0),
                              topRight: Radius.circular(20.0),
                            ),
                            inputDecoration: InputDecoration(
                              labelText: 'Search',
                              hintText: 'Start typing to search',
                              prefixIcon: const Icon(Icons.search),
                              border: OutlineInputBorder(
                                borderSide: BorderSide(
                                  color: const Color(0xFF8C98A8).withOpacity(0.2),
                                ),
                              ),
                            ),
                            searchTextStyle: const TextStyle(
                              color: Colors.black,
                              fontSize: 16,
                            ),
                          ),
                        );
                      },
                      child: Container(
                        height: 48,
                        padding:
                            EdgeInsets.symmetric(horizontal: Get.width * 0.035),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8),
                            color: AppColors.white),
                        child: Row(
                          children: [
                            SizedBox(
                              width:  Get.width * 0.220,
                              child: Obx(
                                () => AutoSizeText(
                                  maxLines: 1,
                                  minFontSize: 12,
                                  controller.countryName.value,
                                  style: mediumFontStyle(
                                      color: AppColors.hintColor, size: 14),
                                ),
                              ),
                            ),
                            SizedBox(width: width*0.005),
                            Expanded(
                              child: Obx(
                                () => Text(
                                  controller.countryCode.value,
                                  style: mediumFontStyle(
                                      color: AppColors.blackColor, size: 16),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Obx(
                            () {
                          return Align(
                            alignment: Alignment.centerLeft,
                            child: controller.country.value !=''?Padding(
                              padding: const EdgeInsets.only(top: 10.0,left: 4),
                              child: Text(
                                controller.country.value,
                                style: regularFontStyle(
                                    color: AppColors.errorColor, size: 14
                                ),

                              ),
                            ):const SizedBox(),

                          );
                        }
                    ),
                    // CommonTextField(
                    //   controller: controller.countryCodeController,
                    //   hint: "India",
                    //   inputFormator: [CountryInputFormatter()],
                    //   textInputType: TextInputType.phone,
                    // ),
                    SizedBox(height: height * 0.022),
                    CommonTextField(
                      controller: controller.phoneController,
                      hint: "Mobile",
                      textInputType: TextInputType.number,
                    ),
                    Obx(
                       () {
                        return Align(
                          alignment: Alignment.centerLeft,
                          child: controller.mobileError.value !=''?Padding(
                            padding: const EdgeInsets.only(top: 10.0,left: 4),
                            child: Text(
                              controller.mobileError.value,
                              style: regularFontStyle(
                                  color: AppColors.errorColor, size: 14
                              ),

                            ),
                          ):const SizedBox(),

                        );
                      }
                    ),

                    SizedBox(height: height * 0.022),
                    Obx(
                       () {
                        return CommonTextField(
                          controller: controller.passwordController,
                          hint: "Password",
                          maxLines: 1,
                          textInputType: TextInputType.text,
                          showPwd: controller.isShowPassword.value,
                          onHideButtonTap: controller.onHideTap,
                        );
                      }
                    ),
                    Obx(
                            () {
                          return Align(
                            alignment: Alignment.centerLeft,
                            child: controller.passwordError.value !=''?Padding(
                              padding: const EdgeInsets.only(top: 10.0,left: 4),
                              child: Text(
                                controller.passwordError.value,
                                style: regularFontStyle(
                                    color: AppColors.errorColor, size: 14
                                ),

                              ),
                            ):const SizedBox(),

                          );
                        }
                    ),
                    SizedBox(height: height * 0.027),
                    const CustomunderLineText(text: StringRes.haveAReferralCode),
                    SizedBox(height: height * 0.025),
                    Obx(() => CommonPrimaryButton(
                        onTap: () {
                          hideKeyboard(context);
                          if (controller.validate()) {
            controller.onTapLogin();
                          }
                        },
                        text: StringRes.submit,
                        isLoading: controller.loader.value)),
                    SizedBox(height: height * 0.022),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          StringRes.doeNot,
                          style: regularFontStyle(
                              size: 16, color: AppColors.descGreyColor),
                        ),
                        const SizedBox(width: 4,),
                        InkWell(
                          onTap: (){
                            lightStatusBar();
                            Get.to(()=>SignUpScreen())?.whenComplete(()=> lightStatusBar());
                          },
                          child: Text(
                            StringRes.signUp,
                            style: boldFontStyle(
                                size: 16, color: AppColors.descGreyColor),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: height * 0.2),
                    InkWell(
                      onTap: (){
                        darkStatusBar();
                        Get.to(()=> TermsConditionScreen())?.whenComplete(()=> lightStatusBar());
                      },
                      child: CustomunderLineText(
                        text: StringRes.termsAndConditions,
                        style: mediumFontStyle(
                            size: 16,
                            color: AppColors.white,
                            decoration: TextDecoration.underline),
                      ),
                    ),
                    SizedBox(height: height * 0.022),

                  ],
                ),
              ),
            ),
            Obx(()=> controller.loader.value ?const CommonLoader():const SizedBox()),
          ],
        ),
      ),
    );
  }
}
