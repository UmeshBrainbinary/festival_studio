import 'package:festiveapp_studio/screen/termsCondition/api/terms_api.dart';
import 'package:festiveapp_studio/screen/termsCondition/api/terms_model.dart';
import 'package:get/get.dart';

class TermsAndConditionController extends GetxController{
  RxBool loader = false.obs;
Rx<TermsConditionModel> termsConditionModel =TermsConditionModel().obs;
  @override
  void onInit() {
    init();
    super.onInit();
  }

  init()async{
    loader.value =true;
  termsConditionModel.value =   await TermsApi.termsApi();
    loader.value =false;
  }

}