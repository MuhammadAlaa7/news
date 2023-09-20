import 'package:flutter/material.dart';
import 'package:news_app_ui_setup/models/article_model.dart';
import 'package:news_app_ui_setup/services/news_service.dart';
import '../widgets/app_bar_text.dart';
import '../widgets/news_list_view.dart';



/*

This page can not provide the idea of making the change of the list according to 
the category selected because the function that gets the data from api 
is in the child not in the parenet so I can't give the access or the change to the another 
child , so the function getNews must be in the top so I can pass it to any child below
 
 - so if you need to use this , you have to pass the two children to another screen 
 to view the list change in it , but if you need to make the change in the same screen 
 you have to put the function resposible for getting the data from api in the top of the 
 widgets tree....


*/

class HomeView extends StatefulWidget {
  HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  List<ArticleModel> articles = [];
  String category = 'general';
  var future;
  @override
  void initState() {
    future = NewsService().getNews(category: category);

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
            // const SliverToBoxAdapter(
            //   child: CategoriesListView(),
            // ),
            SliverToBoxAdapter(
              child: ElevatedButton(
                  onPressed: () {
                    NewsService().getNews(category: 'sports').then((value) {
                      print(value);
                    });
                  },
                  child: Text('Test')),
            ),
            FutureBuilder<List<ArticleModel>>(
              future:
                  future, // here, we write the request that bring the data from the future
              builder: (context, snapshot) {
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
            ),

            //  NewsListViewBuilder(category: category),
          ],
        ),
      ),
    );
  }
}
