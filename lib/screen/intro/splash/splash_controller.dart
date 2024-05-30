import 'package:festiveapp_studio/screen/onboarding/onboarding_screen.dart';
import 'package:get/get.dart';

class SplashController extends GetxController {
  @override
  void onInit() {
    super.onInit();
    _navigateToNextScreen();
  }

  void _navigateToNextScreen() {
    Future.delayed(const Duration(seconds: 5), () {
      Get.to(() =>
          const OnboardingScreen()); // Replace NextScreen with your actual next screen
    });
  }
}
