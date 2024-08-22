

// ignore_for_file: avoid_function_literals_in_foreach_calls



import 'dart:typed_data';

import 'package:festiveapp_studio/common/testStyle.dart';
import 'package:festiveapp_studio/screen/card_detail/api/frame_model.dart';
import 'package:festiveapp_studio/screen/card_detail/api/frames%20_api.dart';
import 'package:festiveapp_studio/service/pref_services.dart';
import 'package:festiveapp_studio/utils/app_colors.dart';
import 'package:festiveapp_studio/utils/pref_keys.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_colorpicker/flutter_colorpicker.dart';
import 'package:flutter_share/flutter_share.dart';
import 'package:get/get.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:screenshot/screenshot.dart';
import 'package:http/http.dart' as http;
class CardDetailController extends GetxController {
ScreenshotController screenshotController = ScreenshotController();
RxInt selectedIndex = 0.obs;
TextEditingController primaryText = TextEditingController();
TextEditingController secText = TextEditingController();
TextEditingController webText = TextEditingController();
TextEditingController dateText = TextEditingController();
TextEditingController desText = TextEditingController();

/*List frames = [
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
];*/
FrameModel frameModel =FrameModel();
List framesList =[];
Uint8List? imageNew;
String? selectedImage;
int? primaryColor ;
int? secColor ;
int? dateColor ;
int? descriptionColor;
int? websiteColor;
RxBool loader = false.obs;
Future<void> share() async {
  await FlutterShare.share(
    title: 'Festival studio',
    linkUrl: 'app link attached',
  );




}

init() async {
  await inti();

  selectedIndex.value  = 1;
update(['frame']);
}
inti() async {
  loader.value =true;
  frameModel = await FrameApi.frameApi();
  if(frameModel.data != null) {
    frameModel.data!.forEach((element) async {

      final response = await http.get(Uri.parse(element.frameImg?.url ?? ''));
      if (response.statusCode == 200) {

      framesList.add( response.body);
      selectedImage = framesList[0];
      } else {

      }
    });
  }
  loader.value =false;

}

@override
  void onInit() {

    init();
    super.onInit();
  }



  primary(context) async {
  primaryText.clear();

  await  showDialog(
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
                 primaryColor = val.value;
                  },
                ),
                const SizedBox(
                  height: 20,
                ),
                TextFormField(
                  controller: primaryText,
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
                  keyboardType: TextInputType.number,
                  textInputAction:
                  TextInputAction.done,
                ),
                const SizedBox(
                  height: 20,
                ),
                InkWell(
                  onTap: () {
                    Get.back();
                    if (primaryText.text !=
                        '') {

                          primaryColor = HexColor(
                          '#${primaryText.text.toLowerCase()}')
                          .value;

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
      });});
  }
  secondary(context){
  secText.clear();

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
                 secColor = val.value;
                  },
                ),
                const SizedBox(
                  height: 20,
                ),
                TextFormField(
                  controller: secText,
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
                  keyboardType: TextInputType.number,
                  textInputAction:
                  TextInputAction.done,
                ),
                const SizedBox(
                  height: 20,
                ),
                InkWell(
                  onTap: () {
                    Get.back();
                    if (secText.text !=
                        '') {

                          secColor = HexColor(
                          '#${secText.text.toLowerCase()}')
                          .value;

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
      });});
  }
  date(context){
    dateText.clear();

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
                        dateColor = val.value;
                      },
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    TextFormField(
                      controller: secText,
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
                      keyboardType: TextInputType.number,
                      textInputAction:
                      TextInputAction.done,
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    InkWell(
                      onTap: () {
                        Get.back();
                        if (dateText.text !=
                            '') {

                          dateColor = HexColor(
                              '#${dateText.text.toLowerCase()}')
                              .value;

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
          });});
  }
  web(context){
    webText.clear();

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
                        websiteColor = val.value;
                      },
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    TextFormField(
                      controller: webText,
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
                      keyboardType: TextInputType.number,
                      textInputAction:
                      TextInputAction.done,
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    InkWell(
                      onTap: () {
                        Get.back();
                        if (webText.text !=
                            '') {

                          websiteColor = HexColor(
                              '#${webText.text.toLowerCase()}')
                              .value;

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
          });});
  }
  des(context){
    desText.clear();

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
                        descriptionColor = val.value;
                      },
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    TextFormField(
                      controller: webText,
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
                      keyboardType: TextInputType.number,
                      textInputAction:
                      TextInputAction.done,
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    InkWell(
                      onTap: () {
                        Get.back();
                        if (desText.text !=
                            '') {

                          descriptionColor = HexColor(
                              '#${desText.text.toLowerCase()}')
                              .value;

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
          });});
  }
  edit(context){
    showDialog(
        context: context,
        builder: (context) {
          return StatefulBuilder(builder: (context, s) {
            s.call((){});
            return AlertDialog(
              content: SingleChildScrollView(
                child: GetBuilder<CardDetailController>(
                  id: "card",
                  builder: (con) {
                    return Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [

                        Container(
                          height: 40,
                          width: Get.width,
                          alignment: Alignment.centerLeft,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text("Primary Color",style: mediumFontStyle(
                              size: 15,
                              color:AppColors.blackColor),),
                    const SizedBox(height: 10,),
                              InkWell(
                                onTap: () async {
                                  await primary(context);

                                },
                                child: (primaryColor != null)?Container(
                                    height: 20,
                                    width: 20,
                                    decoration: BoxDecoration(
                                        shape: BoxShape.circle,
                                        color: Color(primaryColor!)
                                    )):Container(
                                  height: 20,
                                  width: 20,
                                  alignment: Alignment.center,
                                  child: Icon(Icons.edit),
                                ),
                              ),



                            ],
                          ),
                        ),
                        const SizedBox(height: 20,),
                        Container(
                          height: 40,
                          width: Get.width,
                          alignment: Alignment.centerLeft,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text("Secondary Color",style: mediumFontStyle(
                                  size: 15,
                                  color:AppColors.blackColor),),
                              const SizedBox(height: 10,),
                              InkWell(
                                onTap: (){
                                  secondary(context);
                                },
                                child: (secColor != null)?Container(
                                    height: 20,
                                    width: 20,
                                    decoration: BoxDecoration(
                                        shape: BoxShape.circle,
                                        color: Color(secColor!)
                                    )):Container(
                                  height: 20,
                                  width: 20,
                                  alignment: Alignment.center,
                                  child: Icon(Icons.edit),
                                ),
                              ),



                            ],
                          ),
                        ),
                        const SizedBox(height: 20,),
                        Container(
                          height: 40,
                          width: Get.width,
                          alignment: Alignment.centerLeft,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text("Date Color",style: mediumFontStyle(
                                  size: 15,
                                  color:AppColors.blackColor),),
                              const SizedBox(height: 10,),
                              InkWell(
                                onTap: (){
                                  date(context);
                                },
                                child: (secColor != null)?Container(
                                    height: 20,
                                    width: 20,
                                    decoration: BoxDecoration(
                                        shape: BoxShape.circle,
                                        color: Color(secColor!)
                                    )):Container(
                                  height: 20,
                                  width: 20,
                                  alignment: Alignment.center,
                                  child: Icon(Icons.edit),
                                ),
                              ),



                            ],
                          ),
                        ),
                        const SizedBox(height: 20,),
                        Container(
                          height: 40,
                          width: Get.width,
                          alignment: Alignment.centerLeft,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text("Website Color",style: mediumFontStyle(
                                  size: 15,
                                  color:AppColors.blackColor),),
                              const SizedBox(height: 10,),
                              InkWell(
                                onTap: (){
                                  web(context);
                                },
                                child: (websiteColor != null)?Container(
                                    height: 20,
                                    width: 20,
                                    decoration: BoxDecoration(
                                        shape: BoxShape.circle,
                                        color: Color(websiteColor!)
                                    )):Container(
                                  height: 20,
                                  width: 20,
                                  alignment: Alignment.center,
                                  child: Icon(Icons.edit),
                                ),
                              ),



                            ],
                          ),
                        ),
                        const SizedBox(height: 20,),
                        Container(
                          height: 40,
                          width: Get.width,
                          alignment: Alignment.centerLeft,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text("Description Color",style: mediumFontStyle(
                                  size: 15,
                                  color:AppColors.blackColor),),
                              const SizedBox(height: 10,),
                              InkWell(
                                onTap: (){
                                  des(context);
                                },
                                child: (descriptionColor != null)?Container(
                                    height: 20,
                                    width: 20,
                                    decoration: BoxDecoration(
                                        shape: BoxShape.circle,
                                        color: Color(descriptionColor!)
                                    )):Container(
                                  height: 20,
                                  width: 20,
                                  alignment: Alignment.center,
                                  child: Icon(Icons.edit),
                                ),
                              ),



                            ],
                          ),
                        ),
                      ],
                    );
                  }
                ),
              ),
            );
          });});
  }

}