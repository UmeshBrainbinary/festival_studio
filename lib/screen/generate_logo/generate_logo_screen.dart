import 'package:festiveapp_studio/screen/generate_logo/generate_logo_controller.dart';
import 'package:festiveapp_studio/screen/generate_logo/widget/generate_logo_widget.dart';
import 'package:festiveapp_studio/utils/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class GenerateLogoScreen extends StatelessWidget {
   GenerateLogoScreen({super.key});
  GenerateLogoController controller = Get.put(GenerateLogoController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundCard,
      body: Padding(
        padding: const EdgeInsets.all(15.0),
        child: addDetailsTextField(context),
      ),
    );
  }
}
