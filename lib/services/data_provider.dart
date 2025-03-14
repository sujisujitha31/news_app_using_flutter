import 'package:news_app/services/api_request.dart';

import '../pages/home/news_list_model.dart';

class DataProvider {
  void getNewsWithApiKey({
    Function(NewsListModel data)? onSuccess,
    Function(dynamic error)? onError,
  }) {
    ApiRequest(
      url:
          "https://newsapi.org/v2/everything?q=apple&from=2025-03-12&to=2025-03-12&sortBy=popularity&apiKey=ca640dab05fc4e05a50185d29504e23d",
      query: {},
      data: {},
    ).get(
      onSuccess: (data) {
        onSuccess!(NewsListModel.fromJson(data));
      },
      onError: (error) {
        onError!(error);
      },
    );
  }
}
