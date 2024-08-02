

import 'package:festiveapp_studio/screen/faq/api/faq_api.dart';
import 'package:festiveapp_studio/screen/faq/api/faq_model.dart';
import 'package:get/get.dart';

class FaqController extends GetxController{
  RxBool loader = false.obs;
  Rx<FaqModel> faqModel = FaqModel().obs;
  List selected = [];
  @override
  void onInit() {
    init();
    super.onInit();
  }

  init()async{
    loader.value =true;
    faqModel.value =  await FaqApi.faqApi();
    selected = List.generate(faqModel.value.data?.length ?? 0, (index)=>false);
    loader.value =false;
    update(['faq']);

  }
  onChange(index){
    if(selected[index] ==true){

    selected[index] = false;
    }
    else{
    selected = List.generate(faqModel.value.data?.length ?? 0, (index)=>false);
      selected[index] = true;
    }

update(['faq']);
    }
}