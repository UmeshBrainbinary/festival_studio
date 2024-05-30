import 'package:festiveapp_studio/screen/onboarding/onboarding_controller.dart';
import 'package:festiveapp_studio/screen/onboarding/onboarding_widget.dart';
import 'package:festiveapp_studio/utils/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  @override
  Widget build(BuildContext context) {
    Get.put(OnBordingController());
    return Scaffold(
      backgroundColor: AppColors.blue,
      body: Column(
        children: [
          const SizedBox(
            height: 50,
          ),
          navigateContainer(),
          pageViewOnboard(),
          button(),
          const SizedBox(
            height: 50,
          ),
        ],
      ),
    );
  }
}
