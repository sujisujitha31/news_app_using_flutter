import 'dart:convert';

import 'package:get/get.dart';
import 'package:news_app/pages/home/components.dart';
import 'package:news_app/pages/home/news_list_model.dart';
import 'package:news_app/services/data_provider.dart';
import 'package:news_app/utility/utils.dart' as utils;

class HomeController extends GetxController {
  var listOfArticles = <Articles>[].obs;
  var isGettingNews = false.obs;
  getNews() {
    isGettingNews.value = true;
    update();
    DataProvider().getNewsWithApiKey(
      onSuccess: (response) {
        listOfArticles.value = response.articles ?? [];
        if (listOfArticles.isNotEmpty) {
          utils.storeData(jsonEncode(listOfArticles));
        }
        isGettingNews.value = false;
        update();
      },
      onError: (error) {
        getFromLocal();
        print(error);
        isGettingNews.value = false;
        update();
        showError();
      },
    );
  }

  getFromLocal() async {
    String data = await utils.retrieveData("articles");
    if (data.isNotEmpty) {
      List list = jsonDecode(data);
      for (Map<String, dynamic> element in list) {
        listOfArticles.add(Articles.fromJson(element));
      }
      update();
    }
  }
}
