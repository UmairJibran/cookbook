import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:cook_book/components/loading.dart';
import 'package:cook_book/models/meal.dart';

import '../../components/category_card.dart';
import '../../sysdata/services.dart';
import 'package:flutter/material.dart';

class CategoriesTab extends StatefulWidget {
  @override
  _CategoriesTabState createState() => _CategoriesTabState();
}

class _CategoriesTabState extends State<CategoriesTab> {
  List<Map<String, dynamic>> _meals = [];
  double height;
  double width;
  bool categoriesHasData = false;
  Firestore firestore = Firestore.instance;
  var categories;
  @override
  void initState() {
    super.initState();
    categories = firestore
        .collection('categories')
        .document('sp')
        .collection('meals')
        .document('sp001')
        .get()
        .then(
      (snapshot) {
        print(snapshot['mealIngredients']);
        print(snapshot['prepSteps']);
        // print(snapshot['']);
        setState(() {
          categoriesHasData = true;
        });
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    height = Services.height(context);
    width = Services.width(context);
    return Container(
      height: height,
      width: width,
      child: (!categoriesHasData)
          ? Loading(label: 'Searching for Data')
          : ListView.builder(
              itemBuilder: (_, i) {
                return;
              },
            ),
    );
  }
}
