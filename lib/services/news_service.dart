import 'package:dio/dio.dart';
import 'package:news_app_ui_setup/models/article_model.dart';

class NewsService {
  Dio dio = Dio();

                // THIS FUNCTION RETURNS A LIST OF ARTICLE MODELS 
                
  Future<List<ArticleModel>> getNews({String category = 'general'}) async {
    // the default news will be in the category general

    try {
      Response response = await dio.get(
        'https://newsapi.org/v2/top-headlines?country=us&category=$category&apiKey=878b76df32f04f6f825364691564edbf',
      );

      print(response.data);
      //The whole map 
      Map<String, dynamic> jsonData = response.data;

      List<dynamic> articles = jsonData['articles'];

      List<ArticleModel> modelList = articles.map((article) {
        return ArticleModel.fromJson(article);
      }).toList();

      return modelList;
    } catch (e) {
      return [];
    }
  }
}
