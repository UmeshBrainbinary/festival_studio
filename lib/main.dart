import 'package:festiveapp_studio/screen/intro/splash/splash_screen.dart';
import 'package:festiveapp_studio/screen/tutorials/tutorials_screen.dart';
import 'package:festiveapp_studio/service/pref_services.dart';
import 'package:festiveapp_studio/utils/app_colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get_navigation/get_navigation.dart';

Future<void> main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await PrefService.init();
  runApp(
    const MyApp(),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  static const MaterialColor customPrimaryColor = MaterialColor(
    0xFFC94C9A,
    <int, Color>{
      50: Color(0xFFe0e0e0),
      100: Color(0xFFb3b3b3),
      200: Color(0xFF808080),
      300: Color(0xFF4d4d4d),
      400: Color(0xFF262626),
      500: AppColors.lightPink,
      600: Color(0xFF000000),
      700: Color(0xFF000000),
      800: Color(0xFF000000),
      900: Color(0xFF000000),
    },
  );
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: customPrimaryColor,
        colorScheme: ColorScheme.fromSeed(
          seedColor: AppColors.lightPink,

          brightness: Brightness.light,
        ),

      ),
      home: SplashScreen(),

    );
  }
}
