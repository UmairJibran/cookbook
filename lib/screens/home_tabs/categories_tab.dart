import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:cook_book/components/category_card.dart';
import 'package:cook_book/components/loading.dart';
import 'package:cook_book/models/category.dart';
import '../../sysdata/services.dart';
import 'package:flutter/material.dart';

Firestore firestore = Firestore.instance;

class CategoriesTab extends StatefulWidget {
  static bool categoriesHasData = false;
  static List<Category> loadedCategories;
  @override
  _CategoriesTabState createState() => _CategoriesTabState();
}

class _CategoriesTabState extends State<CategoriesTab> {
  double height;
  double width;

  @override
  Widget build(BuildContext context) {
    height = Services.height(context);
    width = Services.width(context);
    return Container(
      height: height,
      width: width,
      child: (!CategoriesTab.categoriesHasData)
          ? Loading(label: 'Searching for Data')
          : ListView.builder(
              itemBuilder: (_, i) {
                return CategoryCard(
                  currentCategory: CategoriesTab.loadedCategories[i],
                );
              },
              itemCount: CategoriesTab.loadedCategories.length,
            ),
    );
  }
}
