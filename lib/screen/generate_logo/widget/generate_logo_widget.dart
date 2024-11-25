import 'dart:io';

import 'package:festiveapp_studio/common/app_contstant.dart';
import 'package:festiveapp_studio/common/common_back_button.dart';
import 'package:festiveapp_studio/common/common_loader.dart';
import 'package:festiveapp_studio/common/common_primary_button.dart';
import 'package:festiveapp_studio/common/common_text_field.dart';
import 'package:festiveapp_studio/common/status_bar.dart';
import 'package:festiveapp_studio/common/testStyle.dart';
import 'package:festiveapp_studio/screen/generate_logo/generate_logo_controller.dart';
import 'package:festiveapp_studio/screen/select_logo/select_logo_screen.dart';
import 'package:festiveapp_studio/utils/app_colors.dart';
import 'package:festiveapp_studio/utils/string_res.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_colorpicker/flutter_colorpicker.dart';
import 'package:get/get.dart';
import 'package:hexcolor/hexcolor.dart';

GenerateLogoController controller = Get.find<GenerateLogoController>();

Widget addDetailsTextField(BuildContext context) {
  return SingleChildScrollView(
    child: Stack(
      alignment: Alignment.center,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(
              height: 40,
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
                  StringRes.generateLogo,
                  style: boldFontStyle(
                    color: AppColors.blackColor,
                    size: 18,
                  ),
                ),
                const Spacer(),
                Visibility(
                  visible: false,
                  maintainSize: true,
                  maintainAnimation: true,
                  maintainState: true,
                  child: CommonBackButton(
                    onTap: () {},
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 10,
            ),
            Text(
              StringRes.brandDetails,
              style: regularFontStyle(color: AppColors.detailsTitle, size: 16),
            ),
            const SizedBox(
              height: 40,
            ),
            CommonTextField(
              maxLines: 1,
              leadingWidget: SizedBox(
                width: Get.width *0.25,
                child: Text(
                  StringRes.brandName,
                  style: mediumFontStyle(color: AppColors.hintColor,size: 14),
                ),
              ),
              textInputAction: TextInputAction.done,
             // hint: StringRes.brandName,
              controller: controller.brandName,
            ),
            Obx(() {
              return Align(
                alignment: Alignment.centerLeft,
                child: controller.brandNameError.value != ''
                    ? Padding(
                        padding: const EdgeInsets.only(top: 10.0, left: 4),
                        child: Text(
                          controller.brandNameError.value,
                          style: regularFontStyle(
                              color: AppColors.errorColor, size: 14),
                        ),
                      )
                    : const SizedBox(),
              );
            }),
            const SizedBox(
              height: 20,
            ),
            CommonTextField(
                maxLines: 1,
                textInputAction: TextInputAction.done,
                hint: StringRes.tagLine,
                controller: controller.tagLine),
            Obx(() {
              return Align(
                alignment: Alignment.centerLeft,
                child: controller.tagLineError.value != ''
                    ? Padding(
                        padding: const EdgeInsets.only(top: 10.0, left: 4),
                        child: Text(
                          controller.tagLineError.value,
                          style: regularFontStyle(
                              color: AppColors.errorColor, size: 14),
                        ),
                      )
                    : const SizedBox(),
              );
            }),
            const SizedBox(
              height: 20,
            ),
            CommonTextField(
              maxLines: 1,
              textInputAction: TextInputAction.done,
              hint: StringRes.category,
              controller: controller.category,
            ),
            Obx(() {
              return Align(
                alignment: Alignment.centerLeft,
                child: controller.categoryError.value != ''
                    ? Padding(
                        padding: const EdgeInsets.only(top: 10.0, left: 4),
                        child: Text(
                          controller.categoryError.value,
                          style: regularFontStyle(
                              color: AppColors.errorColor, size: 14),
                        ),
                      )
                    : const SizedBox(),
              );
            }),
            const SizedBox(
              height: 20,
            ),
            CommonTextField(
                maxLines: 1,
                textInputAction: TextInputAction.done,
                hint: StringRes.logoType,
                controller: controller.logoType),
            Obx(() {
              return Align(
                alignment: Alignment.centerLeft,
                child: controller.logoTypeError.value != ''
                    ? Padding(
                        padding: const EdgeInsets.only(top: 10.0, left: 4),
                        child: Text(
                          controller.logoTypeError.value,
                          style: regularFontStyle(
                              color: AppColors.errorColor, size: 14),
                        ),
                      )
                    : const SizedBox(),
              );
            }),
            const SizedBox(
              height: 20,
            ),
            InkWell(
              onTap:(){
                controller.cameraDialog(context);
              },
              child: Container(
                height: 48,
                padding: EdgeInsets.symmetric(horizontal: Get.width * 0.035),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8), color: AppColors.white),
                child: Row(
                  children: [
                    SizedBox(
                      width: Get.width * 0.220,
                      child: Text(
                        StringRes.brandLogo,
                        maxLines: 1,
                        style: mediumFontStyle(color: AppColors.hintColor, size: 14),
                      ),
                    ),
                    Expanded(
                      child: TextFormField(
                        maxLines: 1,
                        onTap: (){
                          controller.cameraDialog(context);
                        },
                        controller: controller.logo,
                        readOnly: true,
                        style: mediumFontStyle(
                            color: AppColors.blackColor, size: 16, height: 1.3),
                        decoration: InputDecoration(
                          border: InputBorder.none,
                          hintStyle:
                          mediumFontStyle(color: AppColors.hintColor, size: 16),
                          contentPadding: const EdgeInsets.only(top: 12),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Obx(()=>   (controller.logoImage.value !='')? Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10.0,vertical: 10),
              child: Container(
                height: 150,
                width: Get.width,
                alignment: Alignment.centerLeft,
                child:Stack(
                  alignment: Alignment.topRight,
                  children: [
                    Container(
                      alignment: Alignment.center,
                      margin: const EdgeInsets.only(top: 5),
                      height: 150,
                      width: 150,
                      decoration: BoxDecoration(
                        color: AppColors.white,
                        border: Border.all(color: AppColors.white),
                        image: DecorationImage(
                            image: FileImage(File(controller.logoImage.value)),
                            fit: BoxFit.cover
                        ),
                        boxShadow:  [
                          BoxShadow(
                              blurRadius: 3,
                              offset: const Offset(1, 1),
                              spreadRadius: 0,
                              color: AppColors.blackColor.withOpacity(0.2)),
                        ],
                        borderRadius: const BorderRadius.all(
                          Radius.circular(20),
                        ),
                      ),),
                    InkWell(
                      splashColor: Colors.transparent,
                      splashFactory: NoSplash.splashFactory,
                      focusColor: Colors.transparent,
                      hoverColor: Colors.transparent,
                      highlightColor: Colors.transparent,
                      onTap: (){
                        controller.logoImage.value = '';
                      },
                      child: Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: Container(
                          height: 20,
                          width: 20,
                          alignment: Alignment.center,
                          decoration: const BoxDecoration(
                            color: AppColors.lightPink,
                            shape: BoxShape.circle,
                          ),
                          child: const Icon(Icons.close,color: Colors.white,size: 15,),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ):const SizedBox(),),

            Obx(
                    () {
                  return Align(
                    alignment: Alignment.centerLeft,
                    child: controller.logoError.value !=''?Padding(
                      padding: const EdgeInsets.only(top: 10.0,left: 4),
                      child: Text(
                        controller.logoError.value,
                        style: regularFontStyle(
                            color: AppColors.errorColor, size: 14
                        ),

                      ),
                    ):const SizedBox(),

                  );
                }
            ),
            const SizedBox(
              height: 20,
            ),

            GetBuilder<GenerateLogoController>(
                id: "generate",
                builder: (con) {
                  return InkWell(
                    onTap: () {
                      FocusScope.of(context).unfocus();
        con.primaryColorText.clear();
                      showDialog(
                          context: context,
                          builder: (context) {
                            return StatefulBuilder(builder: (context, s) {
                              return AlertDialog(
                                content: SingleChildScrollView(
                                  child: Column(
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      ColorPicker(
                                        pickerColor:
                                        const Color(0xff443a49),
                                        onColorChanged: (val) {
                                          controller.primaryColor =
                                              val.value;
                                          con.update(['generate']);
                                        },
                                      ),
                                      const SizedBox(
                                        height: 20,
                                      ),
                                      TextFormField(
                                        controller: con.primaryColorText,
                                        decoration: InputDecoration(
                                            border: OutlineInputBorder(
                                                borderRadius:
                                                BorderRadius.circular(
                                                    30)),
                                            hintText: "#ff0000"),
                                        maxLines: 1,
                                        inputFormatters: [
                                          LengthLimitingTextInputFormatter(
                                              6)
                                        ],
                                        keyboardType: TextInputType.text,
                                        textInputAction:
                                        TextInputAction.done,
                                      ),
                                      const SizedBox(
                                        height: 20,
                                      ),
                                      InkWell(
                                        onTap: () {
                                          Get.back();
                                          if (con.primaryColorText.text !=
                                              '') {
                                            controller
                                                .primaryColor = HexColor(
                                                '#${con.primaryColorText.text.toLowerCase()}')
                                                .value;
                                            con.update(['generate']);
                                          }
                                        },
                                        child: Container(
                                          height: 40,
                                          width: 100,
                                          alignment: Alignment.center,
                                          decoration: BoxDecoration(
                                            color: Colors.deepPurpleAccent
                                                .withOpacity(0.2),
                                            borderRadius:
                                            BorderRadius.circular(20),
                                          ),
                                          child: const Text(
                                            "Next",
                                            style: TextStyle(
                                                fontSize: 16,
                                                color: Colors.black),
                                          ),
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                              );
                            });
                          });
                    },
                    child: (controller.primaryColor != null)
                        ? Container(
                            height: 48,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: AppColors.white,
                            ),
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  CircleAvatar(
                                    radius: 20,
                                    backgroundColor:
                                        Color(controller.primaryColor!),
                                  ),
                                  InkWell(
                                    onTap: () {
                                      controller.primaryColor = null;
                                      controller.update(['generate']);
                                    },
                                    child: Container(
                                      height: 20,
                                      width: 20,
                                      decoration: BoxDecoration(
                                          shape: BoxShape.circle,
                                          color: Colors.black.withOpacity(0.3)),
                                      alignment: Alignment.center,
                                      child: const Icon(
                                        Icons.close,
                                        size: 15,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          )
                        : CommonTextField(
                            onTap: () {
                              FocusScope.of(context).unfocus();
        con.primaryColorText.clear();
                              showDialog(
                                  context: context,
                                  builder: (context) {
                                    return StatefulBuilder(builder: (context, s) {
                                      return AlertDialog(
                                        content: SingleChildScrollView(
                                          child: Column(
                                            mainAxisSize: MainAxisSize.min,
                                            children: [
                                              ColorPicker(
                                                pickerColor:
                                                    const Color(0xff443a49),
                                                onColorChanged: (val) {
                                                  controller.primaryColor =
                                                      val.value;
                                                  con.update(['generate']);
                                                },
                                              ),
                                              const SizedBox(
                                                height: 20,
                                              ),
                                              TextFormField(
                                                controller: con.primaryColorText,
                                                decoration: InputDecoration(
                                                    border: OutlineInputBorder(
                                                        borderRadius:
                                                            BorderRadius.circular(
                                                                30)),
                                                    hintText: "#ff0000"),
                                                maxLines: 1,
                                                inputFormatters: [
                                                  LengthLimitingTextInputFormatter(
                                                      6)
                                                ],
                                                keyboardType: TextInputType.text,
                                                textInputAction:
                                                    TextInputAction.done,
                                              ),
                                              const SizedBox(
                                                height: 20,
                                              ),
                                              InkWell(
                                                onTap: () {
                                                  Get.back();
                                                  if (con.primaryColorText.text !=
                                                      '') {
                                                    controller
                                                        .primaryColor = HexColor(
                                                            '#${con.primaryColorText.text.toLowerCase()}')
                                                        .value;
                                                    con.update(['generate']);
                                                  }
                                                },
                                                child: Container(
                                                  height: 40,
                                                  width: 100,
                                                  alignment: Alignment.center,
                                                  decoration: BoxDecoration(
                                                    color: Colors.deepPurpleAccent
                                                        .withOpacity(0.2),
                                                    borderRadius:
                                                        BorderRadius.circular(20),
                                                  ),
                                                  child: const Text(
                                                    "Next",
                                                    style: TextStyle(
                                                        fontSize: 16,
                                                        color: Colors.black),
                                                  ),
                                                ),
                                              )
                                            ],
                                          ),
                                        ),
                                      );
                                    });
                                  });
                            },
                            maxLines: 1,
                            readOnly: true,
                      leadingWidget: SizedBox(
                        width: Get.width *0.25,
                        child: Text(
                          StringRes.primaryColor,
                          style: mediumFontStyle(color: AppColors.hintColor,size: 14),
                        ),
                      ),
                            textInputAction: TextInputAction.done,
                           // hint: StringRes.primaryColor,
                            controller: TextEditingController(),
                          ),
                  );
                }),
            Obx(() {
              return Align(
                alignment: Alignment.centerLeft,
                child: controller.primaryColorError.value != ''
                    ? Padding(
                        padding: const EdgeInsets.only(top: 10.0, left: 4),
                        child: Text(
                          controller.primaryColorError.value,
                          style: regularFontStyle(
                              color: AppColors.errorColor, size: 14),
                        ),
                      )
                    : const SizedBox(),
              );
            }),
            const SizedBox(
              height: 20,
            ),
            GetBuilder<GenerateLogoController>(
                id: "secondary",
                builder: (con) {
                  return InkWell(
                    onTap: () {
                      FocusScope.of(context).unfocus();
                      con.secColorText.clear();
                      showDialog(
                          context: context,
                          builder: (context) {
                            return StatefulBuilder(builder: (context, s) {
                              return AlertDialog(
                                content: SingleChildScrollView(
                                  child: Column(
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      ColorPicker(
                                        pickerColor:
                                        const Color(0xff443a49),
                                        onColorChanged: (val) {
                                          controller.secondaryColor =
                                              val.value;
                                          con.update(['secondary']);
                                        },
                                      ),
                                      const SizedBox(
                                        height: 20,
                                      ),
                                      TextFormField(
                                        controller: con.secColorText,
                                        decoration: InputDecoration(
                                            border: OutlineInputBorder(
                                                borderRadius:
                                                BorderRadius.circular(
                                                    30)),
                                            hintText: "#ff0000"),
                                        maxLines: 1,
                                        inputFormatters: [
                                          LengthLimitingTextInputFormatter(
                                              6)
                                        ],
                                        keyboardType: TextInputType.text,
                                        textInputAction:
                                        TextInputAction.done,
                                      ),
                                      const SizedBox(
                                        height: 20,
                                      ),
                                      InkWell(
                                        onTap: () {
                                          Get.back();
                                          if (con.secColorText.text !=
                                              '') {
                                            controller
                                                .secondaryColor = HexColor(
                                                '#${con.primaryColorText.text.toLowerCase()}')
                                                .value;
                                            con.update(['secondary']);
                                          }
                                        },
                                        child: Container(
                                          height: 40,
                                          width: 100,
                                          alignment: Alignment.center,
                                          decoration: BoxDecoration(
                                            color: Colors.deepPurpleAccent
                                                .withOpacity(0.2),
                                            borderRadius:
                                            BorderRadius.circular(20),
                                          ),
                                          child: const Text(
                                            "Next",
                                            style: TextStyle(
                                                fontSize: 16,
                                                color: Colors.black),
                                          ),
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                              );
                            });
                          });
                    },
                    child: Container(
                      height: 48,
                      width: Get.width,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: AppColors.white),
                      child: (controller.secondaryColor != null)
                          ? Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  CircleAvatar(
                                    radius: 20,
                                    backgroundColor:
                                        Color(controller.secondaryColor!),
                                  ),
                                  InkWell(
                                    onTap: () {
                                      controller.secondaryColor = null;
                                      controller.update(['secondary']);
                                    },
                                    child: Container(
                                      height: 20,
                                      width: 20,
                                      decoration: BoxDecoration(
                                          shape: BoxShape.circle,
                                          color: Colors.black.withOpacity(0.3)),
                                      alignment: Alignment.center,
                                      child: const Icon(
                                        Icons.close,
                                        size: 15,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            )
                          : CommonTextField(
                              maxLines: 1,
                              readOnly: true,
                        leadingWidget: SizedBox(
                          width: Get.width *0.34,
                          child: Text(
                            StringRes.secondaryColor,
                            style: mediumFontStyle(color: AppColors.hintColor,size: 14),
                          ),
                        ),
                              onTap: () {
                                FocusScope.of(context).unfocus();
                                con.secColorText.clear();
                                showDialog(
                                    context: context,
                                    builder: (context) {
                                      return StatefulBuilder(builder: (context, s) {
                                        return AlertDialog(
                                          content: SingleChildScrollView(
                                            child: Column(
                                              mainAxisSize: MainAxisSize.min,
                                              children: [
                                                ColorPicker(
                                                  pickerColor:
                                                  const Color(0xff443a49),
                                                  onColorChanged: (val) {
                                                    controller.secondaryColor =
                                                        val.value;
                                                    con.update(['secondary']);
                                                  },
                                                ),
                                                const SizedBox(
                                                  height: 20,
                                                ),
                                                TextFormField(
                                                  controller: con.secColorText,
                                                  decoration: InputDecoration(
                                                      border: OutlineInputBorder(
                                                          borderRadius:
                                                          BorderRadius.circular(
                                                              30)),
                                                      hintText: "#ff0000"),
                                                  maxLines: 1,
                                                  inputFormatters: [
                                                    LengthLimitingTextInputFormatter(
                                                        6)
                                                  ],
                                                  keyboardType: TextInputType.text,
                                                  textInputAction:
                                                  TextInputAction.done,
                                                ),
                                                const SizedBox(
                                                  height: 20,
                                                ),
                                                InkWell(
                                                  onTap: () {
                                                    Get.back();
                                                    if (con.secColorText.text !=
                                                        '') {
                                                      controller
                                                          .secondaryColor = HexColor(
                                                          '#${con.primaryColorText.text.toLowerCase()}')
                                                          .value;
                                                      con.update(['secondary']);
                                                    }
                                                  },
                                                  child: Container(
                                                    height: 40,
                                                    width: 100,
                                                    alignment: Alignment.center,
                                                    decoration: BoxDecoration(
                                                      color: Colors.deepPurpleAccent
                                                          .withOpacity(0.2),
                                                      borderRadius:
                                                      BorderRadius.circular(20),
                                                    ),
                                                    child: const Text(
                                                      "Next",
                                                      style: TextStyle(
                                                          fontSize: 16,
                                                          color: Colors.black),
                                                    ),
                                                  ),
                                                )
                                              ],
                                            ),
                                          ),
                                        );
                                      });
                                    });

                              },
                              textInputAction: TextInputAction.done,
                              //hint: StringRes.secondaryColor,
                              controller: TextEditingController(),
                            ),
                    ),
                  );
                }),
            Obx(() {
              return Align(
                alignment: Alignment.centerLeft,
                child: controller.secondaryColorError.value != ''
                    ? Padding(
                        padding: const EdgeInsets.only(top: 10.0, left: 4),
                        child: Text(
                          controller.secondaryColorError.value,
                          style: regularFontStyle(
                              color: AppColors.errorColor, size: 14),
                        ),
                      )
                    : const SizedBox(),
              );
            }),
            const SizedBox(
              height: 30,
            ),
            CommonPrimaryButton(
                onTap: () async {
                  hideKeyboard(context);
                  if (controller.validate()) {
                    darkStatusBar();
                    await controller.onTapSubmit();
                    Get.to(
                      () => LogoSelectionPage(),
                    )?.whenComplete(() => darkStatusBar());
                  }
                },
                text: StringRes.generate)
          ],
        ),
        Obx(()=> controller.loader.value ?const CommonLoader():const SizedBox()),
      ],
    ),
  );
}
