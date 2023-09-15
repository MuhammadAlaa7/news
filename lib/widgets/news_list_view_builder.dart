import 'package:flutter/material.dart';
import 'package:news_app_ui_setup/models/article_model.dart';
import 'package:news_app_ui_setup/services/news_service.dart';
import 'package:news_app_ui_setup/widgets/news_list_view.dart';

class NewsListViewBuilder extends StatelessWidget {
  NewsListViewBuilder({super.key});

  final future = NewsService().getNews();
  @override
  Widget build(BuildContext context) {
    // THE FUTURE BUILDER WIDGET IS USED TO BUILD SOMETHING WILL COME IN THE FUTURE
    // AND THE DATA COMING .. WILL COME INTO THE snapshot  PROPERTY .>>> snapshot.data
    return FutureBuilder<List<ArticleModel>>(
      future:
          future, // here, we write the request that bring the data from the future
      builder: (
        context,
        snapshot,
      ) {
        if (snapshot.hasData) {
          return NewsListView(
            articles: snapshot.data!,
          );
        } else if (snapshot.hasError) {
          return const SliverToBoxAdapter(
            child: Center(
                child: Text(
              'Something Wrong Happened',
              style: TextStyle(
                fontSize: 30,
              ),
            )),
          );
        } else {
          return const SliverFillRemaining(
            fillOverscroll: false,
            child: Center(
              child: CircularProgressIndicator(),
            ),
          );
        }
      },
    );
  }
}
