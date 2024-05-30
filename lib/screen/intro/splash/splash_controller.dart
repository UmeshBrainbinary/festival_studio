import 'package:festiveapp_studio/screen/add_details/add_details_screen.dart';
import 'package:festiveapp_studio/screen/auth/login/login_screen.dart';
import 'package:festiveapp_studio/screen/bottom_navigation/bottom_navigation_screen.dart';
import 'package:get/get.dart';

class SplashController extends GetxController {
  @override
  void onInit() {
    super.onInit();
    _navigateToNextScreen();
  }

  void _navigateToNextScreen() {

    Future.delayed(const Duration(seconds: 2), () {
      Get.to(() =>  LoginScreen());

    // Future.delayed(const Duration(seconds: 4), () {
    //   Get.to(() =>  BtnScreen());

      // Get.to(() => const OnboardingScreen());
    });
  }
}
