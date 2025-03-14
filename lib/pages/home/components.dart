import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:news_app/pages/home/home_controller.dart';

showError() {
  Get.defaultDialog(
    title: "Error!",
    content: Text("Failed to load articles.Please try again"),
    actions: [
      ElevatedButton(
        onPressed: () {
          Get.back();
          Get.find<HomeController>().getNews();
        },
        child: Text("Retry"),
      ),
    ],
  );
}
