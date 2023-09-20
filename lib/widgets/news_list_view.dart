import 'package:flutter/material.dart';
import 'package:news_app_ui_setup/models/article_model.dart';
import 'news_card.dart';

class NewsListView extends StatelessWidget {
  final List<ArticleModel> articles;

  const NewsListView({
    super.key,
    required this.articles,
  });

  @override
  Widget build(BuildContext context) {
    return SliverList(
      delegate: SliverChildBuilderDelegate(
        // the main purpose of using customscrollView is to provide a list efficient for memory and performance
        // by using sliverList and by its delegate it creates the items in the list in [ a lazy way  ]
        // it creates them only when it is needed.
        // this is only for large lists
        // you can put the two lists in a normal ListView and make the below one never scroll and just like that.

        (context, index) {
          return NewsCard(
            articleModel: articles[index],
          );
        },
        childCount: articles.length,
      ),
    );
  }
}
