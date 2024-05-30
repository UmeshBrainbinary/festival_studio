import 'package:festiveapp_studio/screen/intro/splash/splash_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get_navigation/get_navigation.dart';

void main() {
  runApp(
    const MyApp(),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      home: SplashScreen(),
    );
  }
}
