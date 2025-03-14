import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:news_app/pages/home/home_controller.dart';
import 'package:news_app/pages/splash/splash_controller.dart';
import 'package:news_app/pages/splash/splash_screen.dart';

void main() {
  Get.put(SplashController());
  Get.put(HomeController());
  runApp(
    GetMaterialApp(debugShowCheckedModeBanner: false, home: SplashScreen()),
  );
}
