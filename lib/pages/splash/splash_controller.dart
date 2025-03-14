import 'package:get/get.dart';
import 'package:news_app/utility/utils.dart' as utils;

import '../home/home_controller.dart';
import '../home/home_screen.dart';

class SplashController extends GetxController {
  getInitialData() async {
    bool isConnectedToInternet = await utils.checkInternetConnection();
    if (!isConnectedToInternet) {
      Get.find<HomeController>().getFromLocal();
    } else {
      Get.find<HomeController>().getNews();
    }
    Get.offAll(() => HomeScreen());
  }
}
