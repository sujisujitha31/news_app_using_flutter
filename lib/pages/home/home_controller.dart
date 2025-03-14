import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:news_app/pages/home/news_list_model.dart';
import 'package:news_app/services/data_provider.dart';

class HomeController extends GetxController {
  var listOfArticles = <Articles>[].obs;
  var isGettingNews = false.obs;
  getNews() {
    isGettingNews.value = true;
    update();
    DataProvider().getNewsWithApiKey(
      onSuccess: (response) {
        listOfArticles.value = response.articles ?? [];
        isGettingNews.value = false;
        update();
      },
      onError: (error) {
        isGettingNews.value = false;
        update();
        Get.defaultDialog(
          title: "Error!",
          content: Text("Failed to load articles.Please try again"),
          actions: [
            ElevatedButton(
              onPressed: () {
                Get.back();
                getNews();
              },
              child: Text("Retry"),
            ),
          ],
        );
      },
    );
  }
}
