import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:news_app/pages/home/home_controller.dart';
import 'package:news_app/utility/utils.dart' as utils;
import '../home/home_screen.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Future.delayed(Duration(seconds: 3), () {
      Get.find<HomeController>().getNews();
      Get.offAll(() => HomeScreen());
    });
    return Scaffold(
      backgroundColor: Colors.amber.shade400,
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Spacer(),
            utils.TextWithDmSansFont(
              text: "News\n  App",
              fontSize: 30,
              fontWeight: FontWeight.w600,
            ),
            Spacer(),
            CircularProgressIndicator(color: Colors.white),
            SizedBox(height: 5),
          ],
        ),
      ),
    );
  }
}
