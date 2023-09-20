import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:news_app_ui_setup/models/article_model.dart';
import 'package:news_app_ui_setup/models/category_model.dart';
import 'package:news_app_ui_setup/services/news_service.dart';
import 'package:news_app_ui_setup/widgets/news_list_view.dart';

import '../widgets/app_bar_text.dart';
import '../widgets/categories_list_view.dart';

class Home2 extends StatefulWidget {
  const Home2({super.key});

  @override
  State<Home2> createState() => _Home2State();
}

class _Home2State extends State<Home2> {
  String defaultCategory = 'general';

  List<ArticleModel> articles = [];
  bool isLoading = true;
  bool isError = false;

  @override
  void initState() {
    NewsService().getNews(category: defaultCategory).then((value) {
      setState(() {
        articles = value;
        isLoading = false;
      });
    }).catchError((error) {
      setState(() {
        isError = true;
      });
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: customAppBar(),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: CustomScrollView(
          //  the main purpose of using customscrollView is to provide a list efficient for memory and performance
          // by using sliverList and by its delegate it creates the items in the list in a lazy way
          physics: const BouncingScrollPhysics(),
          slivers: [
            // it makes any widget a sliver
            SliverToBoxAdapter(
              child: CategoriesListView(
                onSelected: ( CategoryModel model) {
                  print(model.categoryName);

                  setState(() {
                    isLoading = true;
                    isError = false;
                  });

                  NewsService()
                      .getNews(
                    category: model.categoryName,
                  )
                      .then(
                    (value) {
                      setState(
                        () {
                          articles = value;
                          isLoading = false;
                        },
                      );
                    },
                  ).catchError(
                    (error) {
                      setState(
                        () {
                          isError = true;
                        },
                      );
                    },
                  );
                },
              ),
            ),                                                 
            if (isLoading) ...[
              const SliverFillRemaining(
                fillOverscroll: false,
                child: Center(
                  child: CircularProgressIndicator(),
                ),
              ),
            ] else if (articles.isNotEmpty) ...[
              NewsListView(
                articles: articles,
              ),
            ] else ...[
              const SliverToBoxAdapter(
                  child: Center(
                child: Text(
                  'Errrrrrrrrrrrrror',
                ),
              ))
            ],
          ],
        ),
      ),
    );
  }
}
