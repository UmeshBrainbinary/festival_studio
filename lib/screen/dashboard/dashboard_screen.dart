import 'dart:io';
import 'package:festiveapp_studio/screen/dashboard/dashboard_controller.dart';
import 'package:festiveapp_studio/utils/app_assets.dart';
import 'package:festiveapp_studio/utils/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:persistent_bottom_nav_bar/persistent_tab_view.dart';

class DashBoardScreen extends StatelessWidget {
  DashBoardScreen({super.key});

  final DashBoardController dashBoardController = Get.put(DashBoardController());

  @override
  Widget build(BuildContext context) {
    return  WillPopScope(
      onWillPop: ()async{
        showDialog(
            context: context,
            builder: (BuildContext context) {
              return Theme(
                data: ThemeData(dialogBackgroundColor: Colors.white),
                child: AlertDialog(
                  title: Text(
                    'exit',
                   // StringRes.exit.tr,
                    style: const TextStyle(fontSize: 24,fontWeight: FontWeight.bold, color: AppColors.lightPink),
                  ),
                  content: Text(
                    'exitdes',
                    // StringRes.exitDes.tr,
                    style: const TextStyle(fontSize: 18, color: AppColors.lightPink),
                  ),
                  actions: <Widget>[
                    ElevatedButton(
                      style: ButtonStyle(
                        shape: MaterialStateProperty.resolveWith<OutlinedBorder>(
                              (Set<MaterialState> states) {
                            return RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(
                                100,
                              ),
                            );
                          },
                        ),
                        side: MaterialStateProperty.all( const BorderSide(color: AppColors.lightPink)),
                        backgroundColor: MaterialStateProperty.all<Color>(Colors.white),
                      ),
                      onPressed: () {
                        return Navigator.of(context).pop(false);
                      },
                      child: Text(
                        'cancel',
                        //StringRes.cancel.tr,
                        style: const TextStyle(fontSize: 18, color: AppColors.lightPink),
                      ),
                    ),
                    ElevatedButton(
                      onPressed: () {
                        exit(0);
                      },
                      style: ButtonStyle(
                        shape: MaterialStateProperty.resolveWith<OutlinedBorder>(
                              (Set<MaterialState> states) {
                            return RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(
                                100,
                              ),
                            );
                          },
                        ),
                        backgroundColor: MaterialStateProperty.all<Color>(AppColors.lightPink),
                      ),
                      child: Text(
                        'exit',
                        // StringRes.exit.tr,
                        style: const TextStyle(fontSize: 18, color: AppColors.lightPink),
                      ),
                    ),
                    const SizedBox(width: 2),
                  ],
                ),
              );
            });
        return false;
      },
      child: Scaffold(
        body: GetBuilder<DashBoardController>(
          id: "bottom",
          builder: (controller) => PersistentTabView(
            selectedTabScreenContext: (context){},
            backgroundColor: AppColors.white,
            context,
            navBarHeight: 60,
            decoration: const NavBarDecoration(
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(20),
                topRight: Radius.circular(20),
              ),
              gradient: LinearGradient(
                colors: [
                  Color(0xff352062),
                  Color(0xff2E036E),
                ],
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                stops: [0.0, 0.8],
                tileMode: TileMode.clamp,
              ),
            ),
            controller: dashBoardController.persistentTabController,
            onItemSelected: (value) async {
              dashBoardController.onItemSelect(value: value);
              dashBoardController.update(["bottom"]);
            },
            screens: dashBoardController.screens,
            items: [
              PersistentBottomNavBarItem(
                icon: dashBoardController.currentIndex == 0 ? Image.asset(AppAssets.home,scale: 2.5) :  Image.asset(AppAssets.picture,scale: 2.5),
              ),
              PersistentBottomNavBarItem(
                icon: dashBoardController.currentIndex == 1 ? Image.asset(AppAssets.picture,scale: 5) :  Image.asset(AppAssets.picture,scale:5),
              ),
              PersistentBottomNavBarItem(
                icon: dashBoardController.currentIndex == 2 ? Image.asset(AppAssets.video,scale: 2.5) :  Image.asset(AppAssets.video,scale: 2.5),
              ),
              PersistentBottomNavBarItem(
                icon: dashBoardController.currentIndex == 2 ? Image.asset(AppAssets.user,scale: 2.5) :  Image.asset(AppAssets.user,scale: 2.5),
              ),
            ],
            confineInSafeArea: true,
            handleAndroidBackButtonPress: true,
            resizeToAvoidBottomInset: true,
            stateManagement: true,
            hideNavigationBarWhenKeyboardShows: true,
            popAllScreensOnTapOfSelectedTab: true,//
            popAllScreensOnTapAnyTabs: true,
            itemAnimationProperties: const ItemAnimationProperties(
              duration: Duration(milliseconds: 200),
              curve: Curves.ease,
            ),
            screenTransitionAnimation: const ScreenTransitionAnimation(
              animateTabTransition: true,
              curve: Curves.ease,
              duration: Duration(milliseconds: 200),
            ),

            navBarStyle: NavBarStyle.style2,  // 2
            padding: const NavBarPadding.all(5),
          ),
        ),
      ),
    );
  }
}