import 'package:festiveapp_studio/common/app_contstant.dart';
import 'package:festiveapp_studio/common/common_back_button.dart';
import 'package:festiveapp_studio/common/common_primary_button.dart';
import 'package:festiveapp_studio/common/common_text_field.dart';
import 'package:festiveapp_studio/common/status_bar.dart';
import 'package:festiveapp_studio/common/testStyle.dart';
import 'package:festiveapp_studio/screen/generate_logo/generate_logo_controller.dart';
import 'package:festiveapp_studio/screen/select_logo/select_logo_screen.dart';
import 'package:festiveapp_studio/utils/app_colors.dart';
import 'package:festiveapp_studio/utils/string_res.dart';
import 'package:flutter/material.dart';
import 'package:flutter_color_picker_wheel/flutter_color_picker_wheel.dart';
import 'package:flutter_color_picker_wheel/models/models.dart';
import 'package:get/get.dart';

GenerateLogoController controller = Get.find<GenerateLogoController>();

Widget addDetailsTextField(BuildContext context) {
  return SingleChildScrollView(
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(
          height: 20,
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
          textInputAction: TextInputAction.done,
          hint: StringRes.brandName,
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
        GetBuilder<GenerateLogoController>(
            id: "generate",
            builder: (con) {
              return InkWell(
                onTap: () {
                  FocusScope.of(context).unfocus();

                  showDialog(
                      context: context,
                      builder: (context) {
                        return StatefulBuilder(builder: (context, s) {
                          return AlertDialog(
                            content: Column(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                const Text(
                                  "Tap and select color",
                                  style: TextStyle(
                                      fontSize: 16, color: Colors.black),
                                ),
                                const SizedBox(
                                  height: 20,
                                ),
                                WheelColorPicker(
                                  onSelect: (Color newColor) {
                                    controller.primaryColor = newColor.value;
                                    controller.update(['generate']);
                                  },
                                  behaviour: ButtonBehaviour.clickToOpen,
                                  defaultColor: Colors.black,
                                  animationConfig: const FanAnimationConfig(
                                      animationDurationInMillisecond: 1000,
                                      rayAnimationConfig: RayAnimationConfig(
                                        curve: Curves.easeInQuad,
                                        enabled: false,
                                      ),
                                      scaleAnimationConfig:
                                          ScaleAnimationConfig(
                                        curve: Curves.easeInOutCubic,
                                        enabled: true,
                                        animationStartDelay: 0,
                                        animationFinishDelay: 0.2,
                                      ),
                                      opacityAnimationConfig:
                                          OpacityAnimationConfig(
                                        curve: Curves.linear,
                                        enabled: true,
                                        animationStartDelay: 0.2,
                                        animationFinishDelay: 0,
                                      ),
                                      rotationAnimationConfig:
                                          RotationAnimationConfig(
                                              curve: Curves.easeInQuad,
                                              enabled: true,
                                              animationFinishDelay: 0.4)),
                                  colorList: defaultAvailableColors,
                                  buttonSize: 40,
                                  pieceHeight: 25,
                                  innerRadius: 80,
                                  onTap: (c) {
                                    controller.primaryColor = c.value;
                                  },
                                  stickToButton: false,
                                ),
                                const SizedBox(
                                  height: 20,
                                ),
                                InkWell(
                                  onTap: () {
                                    Get.back();
                                  },
                                  child: Container(
                                    height: 40,
                                    width: 100,
                                    alignment: Alignment.center,
                                    decoration: BoxDecoration(
                                      color: Colors.deepPurpleAccent
                                          .withOpacity(0.2),
                                      borderRadius: BorderRadius.circular(20),
                                    ),
                                    child: const Text(
                                      "Next",
                                      style: TextStyle(
                                          fontSize: 16, color: Colors.black),
                                    ),
                                  ),
                                )
                              ],
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

                          showDialog(
                              context: context,
                              builder: (context) {
                                return StatefulBuilder(builder: (context, s) {
                                  return AlertDialog(
                                    content: Column(
                                      mainAxisSize: MainAxisSize.min,
                                      children: [
                                        const Text(
                                          "Tap and select color",
                                          style: TextStyle(
                                              fontSize: 16,
                                              color: Colors.black),
                                        ),
                                        const SizedBox(
                                          height: 20,
                                        ),
                                        WheelColorPicker(
                                          onSelect: (Color newColor) {
                                            controller.primaryColor =
                                                newColor.value;
                                            controller.update(['generate']);
                                          },
                                          behaviour:
                                              ButtonBehaviour.clickToOpen,
                                          defaultColor: Colors.black,
                                          animationConfig:
                                              const FanAnimationConfig(
                                                  animationDurationInMillisecond:
                                                      1000,
                                                  rayAnimationConfig:
                                                      RayAnimationConfig(
                                                    curve: Curves.easeInQuad,
                                                    enabled: false,
                                                  ),
                                                  scaleAnimationConfig:
                                                      ScaleAnimationConfig(
                                                    curve:
                                                        Curves.easeInOutCubic,
                                                    enabled: true,
                                                    animationStartDelay: 0,
                                                    animationFinishDelay: 0.2,
                                                  ),
                                                  opacityAnimationConfig:
                                                      OpacityAnimationConfig(
                                                    curve: Curves.linear,
                                                    enabled: true,
                                                    animationStartDelay: 0.2,
                                                    animationFinishDelay: 0,
                                                  ),
                                                  rotationAnimationConfig:
                                                      RotationAnimationConfig(
                                                          curve:
                                                              Curves.easeInQuad,
                                                          enabled: true,
                                                          animationFinishDelay:
                                                              0.4)),
                                          colorList: defaultAvailableColors,
                                          buttonSize: 40,
                                          pieceHeight: 25,
                                          innerRadius: 80,
                                          onTap: (c) {
                                            controller.primaryColor = c.value;
                                          },
                                          stickToButton: false,
                                        ),
                                        const SizedBox(
                                          height: 20,
                                        ),
                                        InkWell(
                                          onTap: () {
                                            Get.back();
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
                                  );
                                });
                              });
                        },
                        maxLines: 1,
                        readOnly: true,
                        textInputAction: TextInputAction.done,
                        hint: StringRes.primaryColor,
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
                  showDialog(
                      context: context,
                      builder: (context) {
                        return StatefulBuilder(builder: (context, s) {
                          return AlertDialog(
                            content: Column(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                const Text(
                                  "Tap and select color",
                                  style: TextStyle(
                                      fontSize: 16, color: Colors.black),
                                ),
                                const SizedBox(
                                  height: 20,
                                ),
                                WheelColorPicker(
                                  onSelect: (Color newColor) {
                                    controller.secondaryColor = newColor.value;
                                    controller.update(['secondary']);
                                  },
                                  behaviour: ButtonBehaviour.clickToOpen,
                                  defaultColor: Colors.black,
                                  animationConfig: const FanAnimationConfig(
                                      animationDurationInMillisecond: 1000,
                                      rayAnimationConfig: RayAnimationConfig(
                                        curve: Curves.easeInQuad,
                                        enabled: false,
                                      ),
                                      scaleAnimationConfig:
                                          ScaleAnimationConfig(
                                        curve: Curves.easeInOutCubic,
                                        enabled: true,
                                        animationStartDelay: 0,
                                        animationFinishDelay: 0.2,
                                      ),
                                      opacityAnimationConfig:
                                          OpacityAnimationConfig(
                                        curve: Curves.linear,
                                        enabled: true,
                                        animationStartDelay: 0.2,
                                        animationFinishDelay: 0,
                                      ),
                                      rotationAnimationConfig:
                                          RotationAnimationConfig(
                                              curve: Curves.easeInQuad,
                                              enabled: true,
                                              animationFinishDelay: 0.4)),
                                  colorList: defaultAvailableColors,
                                  buttonSize: 40,
                                  pieceHeight: 25,
                                  innerRadius: 80,
                                  onTap: (c) {
                                    controller.secondaryColor = c.value;
                                  },
                                  stickToButton: false,
                                ),
                                const SizedBox(
                                  height: 20,
                                ),
                                InkWell(
                                  onTap: () {
                                    Get.back();
                                  },
                                  child: Container(
                                    height: 40,
                                    width: 100,
                                    alignment: Alignment.center,
                                    decoration: BoxDecoration(
                                      color: Colors.deepPurpleAccent
                                          .withOpacity(0.2),
                                      borderRadius: BorderRadius.circular(20),
                                    ),
                                    child: const Text(
                                      "Next",
                                      style: TextStyle(
                                          fontSize: 16, color: Colors.black),
                                    ),
                                  ),
                                )
                              ],
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
                          onTap: () {
                            FocusScope.of(context).unfocus();

                            showDialog(
                                context: context,
                                builder: (context) {
                                  return StatefulBuilder(builder: (context, s) {
                                    return AlertDialog(
                                      content: Column(
                                        mainAxisSize: MainAxisSize.min,
                                        children: [
                                          const Text(
                                            "Tap and select color",
                                            style: TextStyle(
                                                fontSize: 16,
                                                color: Colors.black),
                                          ),
                                          const SizedBox(
                                            height: 20,
                                          ),
                                          WheelColorPicker(
                                            onSelect: (Color newColor) {
                                              controller.secondaryColor =
                                                  newColor.value;
                                              controller.update(['secondary']);
                                            },
                                            behaviour:
                                                ButtonBehaviour.clickToOpen,
                                            defaultColor: Colors.black,
                                            animationConfig:
                                                const FanAnimationConfig(
                                                    animationDurationInMillisecond:
                                                        1000,
                                                    rayAnimationConfig:
                                                        RayAnimationConfig(
                                                      curve: Curves.easeInQuad,
                                                      enabled: false,
                                                    ),
                                                    scaleAnimationConfig:
                                                        ScaleAnimationConfig(
                                                      curve:
                                                          Curves.easeInOutCubic,
                                                      enabled: true,
                                                      animationStartDelay: 0,
                                                      animationFinishDelay: 0.2,
                                                    ),
                                                    opacityAnimationConfig:
                                                        OpacityAnimationConfig(
                                                      curve: Curves.linear,
                                                      enabled: true,
                                                      animationStartDelay: 0.2,
                                                      animationFinishDelay: 0,
                                                    ),
                                                    rotationAnimationConfig:
                                                        RotationAnimationConfig(
                                                            curve: Curves
                                                                .easeInQuad,
                                                            enabled: true,
                                                            animationFinishDelay:
                                                                0.4)),
                                            colorList: defaultAvailableColors,
                                            buttonSize: 40,
                                            pieceHeight: 25,
                                            innerRadius: 80,
                                            onTap: (c) {
                                              controller.secondaryColor =
                                                  c.value;
                                            },
                                            stickToButton: false,
                                          ),
                                          const SizedBox(
                                            height: 20,
                                          ),
                                          InkWell(
                                            onTap: () {
                                              Get.back();
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
                                    );
                                  });
                                });
                          },
                          textInputAction: TextInputAction.done,
                          hint: StringRes.secondaryColor,
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
            onTap: () {
              hideKeyboard(context);
              if (controller.validate()) {
                darkStatusBar();
                Get.to(
                  () => LogoSelectionPage(),
                )?.whenComplete(() => darkStatusBar());
              }
            },
            text: StringRes.generate)
      ],
    ),
  );
}
