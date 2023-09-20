import 'package:flutter/material.dart';
import 'package:news_app_ui_setup/models/category_model.dart';

import 'category_card.dart';

class CategoriesListView extends StatelessWidget {
  const CategoriesListView({
    super.key,
    required this.onSelected,
  });

    final Function(CategoryModel selectedModel ) onSelected;


  final List<CategoryModel> categories = const [
    CategoryModel(
      categoryTitle: 'Business',
      image: 'assets/business.avif',
      categoryName: 'business',
    ),
    CategoryModel(
      categoryTitle: 'Entertainment',
      image: 'assets/entertainment.avif',
      categoryName: 'entertainment',
    ),
    CategoryModel(
      categoryTitle: 'General',
      image: 'assets/general.avif',
      categoryName: 'general',
    ),
    CategoryModel(
      categoryTitle: 'Health',
      image: 'assets/health.avif',
      categoryName: 'health',
    ),
    CategoryModel(
      categoryTitle: 'Scinece',
      image: 'assets/science.avif',
      categoryName: 'science',
    ),
    CategoryModel(
      categoryTitle: 'Sports',
      image: 'assets/sports.avif',
      categoryName: 'sports',
    ),
  ];


  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.sizeOf(context).height / 4,
      child: ListView.builder(
     
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) => GestureDetector(
          onTap: () {
                        onSelected( categories[index]); 
                        print('tapped ');
                    },
          child: CategoryCard(
            category: categories[index],
          ),
        ),
        itemCount: categories.length,
      ),
    );
  }
}
