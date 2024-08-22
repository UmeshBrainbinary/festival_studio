import 'package:festiveapp_studio/screen/home/api/home_api.dart';
import 'package:festiveapp_studio/screen/home/api/home_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:speech_to_text/speech_recognition_result.dart';
import 'package:speech_to_text/speech_to_text.dart';

class HomeController extends GetxController {
  TextEditingController search = TextEditingController();
  RxBool loader = false.obs;
  List<HomeModel> homeModel = [];

  final SpeechToText _speechToText = SpeechToText();
List dataShow =[];
List filterData =[];
  DateFormat dateFormat = DateFormat("dd, MMMM yyyy");
  init()async{

    loader.value =true;
  homeModel =   await HomeApi.homeApi();


  for (var e in homeModel) {
    if(e.postsWithoutSubCategory?.length != 0)
      {
        dataShow.add({
        'name':e.category ?? '',
        "posts":e.postsWithoutSubCategory,
          'isSub':false,
          "subData":[],
        });

      }
    else if(e.postsGroupedBySubCategory?.length !=0)
      {
        List allPost =[];
        e.postsGroupedBySubCategory?.forEach((y){
          allPost.addAll(y.posts ?? []);
        });
        dataShow.add({
          'name':e.category ?? '',
          "posts":allPost,
          "subData":e.postsGroupedBySubCategory,
          'isSub':true,
        });
      }
  }


    loader.value =false;
await speechInit();

    update(['home']);
  }

  speechInit()async{
    if(await Permission.microphone.isGranted) {
      try {
        await _speechToText.initialize();
      }
      catch(e){

        if (kDebugMode) {
          print(e);
        }
      }
    }
    else if(await Permission.microphone.isDenied)
      {
        await Permission.microphone.request().then((v) async {
          if(await Permission.microphone.isDenied)
          {
            await Permission.microphone.request().then((v){
              openAppSettings();
            });
          }
        });
      }
    else
      {
        openAppSettings();
      }
  }

  onFilter(val){
    filterData = dataShow.where((e){
      return e['name'].toString().toLowerCase().contains(val.toString().toLowerCase());
    }).toList();
    update(['home']);

  }

  @override
  void onInit() {
  init();


    super.onInit();
  }



  void startListening() async {
    try {
      stopListening();
      await _speechToText.listen(onResult: _onSpeechResult);
      update(['home']);
    }
    catch(e){
      speechInit();
    }

  }

  void stopListening() async {
    search.clear();
    await _speechToText.stop();
    update(['home']);

  }

  void _onSpeechResult(SpeechRecognitionResult result) {

      search.text = result.recognizedWords;
      update(['home']);

  }
}
