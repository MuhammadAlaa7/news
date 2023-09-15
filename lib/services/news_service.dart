import 'package:dio/dio.dart';
import 'package:news_app_ui_setup/models/article_model.dart';

class NewsService {
  Dio dio = Dio();

  Future<List<ArticleModel>> getNews() async {
    try {
      Response response = await dio.get(
        'https://newsapi.org/v2/top-headlines?country=us&category=business&apiKey=878b76df32f04f6f825364691564edbf',
      );

      Map<String, dynamic> jsonData = response.data;

      List<dynamic> newsList = jsonData['articles'];

      List<ArticleModel> modelList = newsList.map((articleMap) {
        return ArticleModel(
          image: articleMap['urlToImage'],
          title: articleMap['title'],
          subTitle: articleMap['description'],
        );
      }).toList();

      return modelList;
    } catch (e) {
      return [];
    }
  }
}
