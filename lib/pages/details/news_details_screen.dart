import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:news_app/pages/home/news_list_model.dart';
import 'package:news_app/utility/utils.dart' as utils;

class NewsDetailsScreen extends StatelessWidget {
  const NewsDetailsScreen({super.key, required this.article});
  final Articles article;
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.amber.shade400,
        centerTitle: true,
        title: Text("Details"),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CachedNetworkImage(
              imageBuilder: (context, imageProvider) {
                return ClipRRect(
                  // borderRadius: BorderRadius.circular(5),
                  child: Image(
                    fit: BoxFit.fill,
                    image: imageProvider,
                    height: height * .35,
                    width: width,
                  ),
                );
              },
              imageUrl: article.urlToImage!,
              placeholder: (context, url) => CircularProgressIndicator(),
            ),

            Padding(
              padding: EdgeInsets.symmetric(horizontal: 8, vertical: 10),
              child: utils.TextWithDmSansFont(
                text:
                    "Published at ${utils.createCustomDateFormat(DateTime.tryParse(article.publishedAt!))}",
              ),
            ),

            Padding(
              padding: const EdgeInsets.all(8.0),
              child: utils.TextWithDmSansFont(
                text: article.title ?? "",
                maxLines: 10,
                fontSize: 30,
                fontWeight: FontWeight.w600,
              ),
            ),
            SizedBox(height: 10),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: utils.TextWithDmSansFont(
                text: article.description ?? "",
                maxLines: 5000,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
