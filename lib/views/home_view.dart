import 'package:flutter/material.dart';
import 'package:news_app_ui_setup/models/article_model.dart';
import 'package:news_app_ui_setup/services/news_service.dart';
import 'package:news_app_ui_setup/widgets/categories_list_view.dart';
import 'package:news_app_ui_setup/widgets/news_list_view.dart';
import 'package:news_app_ui_setup/widgets/news_list_view_builder.dart';
import '../widgets/app_bar_text.dart';

class HomeView extends StatelessWidget {
  List<ArticleModel> articles = [];

  HomeView({super.key});

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
            const SliverToBoxAdapter(
              child: CategoriesListView(),
            ),
            NewsListViewBuilder(),
          ],
        ),
      ),
    );
  }
}
