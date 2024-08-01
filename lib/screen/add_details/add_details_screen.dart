// ignore_for_file: must_be_immutable

import 'package:festiveapp_studio/screen/add_details/add_details_controller.dart';
import 'package:festiveapp_studio/screen/add_details/widget/add_details_widget.dart';
import 'package:festiveapp_studio/utils/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AddDetailsScreen extends StatelessWidget {
   AddDetailsScreen({super.key});
  AddDetailsController addDetailsController = Get.put(AddDetailsController());

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: AppColors.gray,
        body: addDetailsTextField(context),
      ),
    );
  }
}
