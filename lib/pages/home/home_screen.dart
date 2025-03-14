import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:news_app/pages/details/news_details_screen.dart';
import 'package:news_app/pages/home/home_controller.dart';
import 'package:news_app/utility/utils.dart' as utils;

class HomeScreen extends GetView<HomeController> {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    double w = MediaQuery.of(context).size.width;
    double h = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        centerTitle: true,
        title: Text("News Articles"),
        backgroundColor: Colors.amber.shade400,
      ),
      body: GetBuilder<HomeController>(
        builder: (controller) {
          if (controller.isGettingNews.value) {
            return Center(child: CircularProgressIndicator());
          } else if (!controller.isGettingNews.value &&
              controller.listOfArticles.isEmpty) {
            return SizedBox(
              height: 200,
              child: Center(
                child: utils.TextWithDmSansFont(text: "No articles found"),
              ),
            );
          } else {
            return ListView.builder(
              itemCount: controller.listOfArticles.length,
              itemBuilder:
                  (context, index) => InkWell(
                    onTap: () {
                      Get.to(
                        () => NewsDetailsScreen(
                          article: controller.listOfArticles[index],
                        ),
                      );
                    },
                    child: Container(
                      margin: EdgeInsets.symmetric(
                        horizontal: 10,
                        vertical: 10,
                      ),
                      decoration: BoxDecoration(
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.shade300,
                            offset: const Offset(0, 4),
                            blurRadius: 10,
                            spreadRadius: 1.0,
                          ),
                          const BoxShadow(
                            color: Colors.white,
                            offset: Offset(0.0, 0.0),
                            blurRadius: 0.0,
                            spreadRadius: 0.0,
                          ),
                        ],

                        borderRadius: BorderRadius.circular(10),
                        border: Border.all(color: Color(0xffE0E2E7)),
                      ),
                      padding: EdgeInsets.symmetric(
                        horizontal: 10,
                        vertical: 15,
                      ),
                      child: Row(
                        children: [
                          Expanded(
                            flex: 7,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                utils.TextWithDmSansFont(
                                  text:
                                      controller.listOfArticles[index].title ??
                                      " ",
                                  fontSize: 17,
                                  fontWeight: FontWeight.w600,
                                  maxLines: 1,
                                ),
                                SizedBox(height: 5),
                                utils.TextWithDmSansFont(
                                  text:
                                      controller
                                          .listOfArticles[index]
                                          .description ??
                                      "",
                                  maxLines: 3,
                                ),
                                SizedBox(height: 5),
                                utils.TextWithDmSansFont(
                                  text:
                                      controller
                                                  .listOfArticles[index]
                                                  .publishedAt !=
                                              null
                                          ? utils.createCustomDateFormat(
                                            DateTime.tryParse(
                                              controller
                                                  .listOfArticles[index]
                                                  .publishedAt!,
                                            ),
                                          )
                                          : "",
                                  fontSize: 10,
                                  textColor: Colors.grey,
                                ),
                              ],
                            ),
                          ),
                          SizedBox(width: 5),
                          Expanded(
                            flex: 3,
                            child: CachedNetworkImage(
                              imageBuilder: (context, imageProvider) {
                                return ClipRRect(
                                  borderRadius: BorderRadius.circular(5),
                                  child: Image(
                                    height: 110,
                                    image: imageProvider,
                                    fit: BoxFit.fill,
                                  ),
                                );
                              },

                              placeholder:
                                  (context, url) => Center(
                                    child: SizedBox(
                                      height: 50,
                                      width: 50,
                                      child: CircularProgressIndicator(),
                                    ),
                                  ),
                              imageUrl:
                                  controller.listOfArticles[index].urlToImage!,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
            );
          }
        },
      ),
    );
  }
}
