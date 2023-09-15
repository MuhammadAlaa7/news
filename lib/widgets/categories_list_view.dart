import 'package:flutter/material.dart';
import 'package:news_app_ui_setup/models/category_model.dart';

import 'category_card.dart';

class CategoriesListView extends StatelessWidget {
  const CategoriesListView({
    super.key,
  });

  final List<CategoryModel> categories = const [
    CategoryModel(
      categoryTitle: 'Business',
      image: 'assets/business.avif',
    ),
    CategoryModel(
      categoryTitle: 'Entertainment',
      image: 'assets/entertainment.avif',
    ),
    CategoryModel(
      categoryTitle: 'General',
      image: 'assets/general.avif',
    ),
    CategoryModel(
      categoryTitle: 'Health',
      image: 'assets/health.avif',
    ),
    CategoryModel(
      categoryTitle: 'Scinece',
      image: 'assets/science.avif',
    ),
    CategoryModel(
      categoryTitle: 'Sports',
      image: 'assets/sports.avif',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 130,
      child: ListView.builder(
        shrinkWrap: true,
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) => CategoryCard(
          category: categories[index],
        ),
        itemCount: categories.length,
      ),
    );
  }
}
