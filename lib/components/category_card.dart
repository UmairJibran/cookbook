import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:cook_book/models/category.dart';
import 'package:cook_book/models/meal.dart';
import 'package:cook_book/screens/category_screen.dart';
import 'package:cook_book/screens/home_tabs/categories_tab.dart';
import 'package:cook_book/sysdata/services.dart';
import 'package:flutter/material.dart';

class CategoryCard extends StatefulWidget {
  final Category currentCategory;
  CategoryCard({this.currentCategory});

  @override
  _CategoryCardState createState() => _CategoryCardState();
}

class _CategoryCardState extends State<CategoryCard> {
  double width;
  double height;
  CollectionReference mealsReference = firestore.collection('meals');
  @override
  void initState() {
    super.initState();
    CategoryScreen.loadedMeals = [];
    getMeals();
  }

  @override
  void dispose() {
    super.dispose();
  }

  getMeals() async {
    QuerySnapshot mealDocs = await mealsReference
        .document(widget.currentCategory.catID)
        .collection('allMeals')
        .getDocuments();
    mealDocs.documents.forEach(
      (doc) {
        CategoryScreen.loadedMeals.add(Meal.fromFirestore(doc));
      },
    );
    setState(
      () {
        CategoryScreen.mealsHasData = true;
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    width = Services.width(context);
    height = Services.height(context);
    return Material(
      color: Colors.transparent,
      child: InkWell(
        onTap: () {
          Navigator.of(context).push(
            MaterialPageRoute(
              builder: (_) => CategoryScreen(
                category: widget.currentCategory,
              ),
            ),
          );
        },
        child: Container(
          width: width,
          height: height * 0.3,
          margin: EdgeInsets.only(bottom: 2),
          decoration: BoxDecoration(
            image: DecorationImage(
              image: new NetworkImage("${widget.currentCategory.catImageURL}"),
            ),
          ),
          child: Center(
            child: Container(
              color: Colors.black12,
              padding: EdgeInsets.all(15),
              child: Text(
                "${widget.currentCategory.catName}",
                style: Theme.of(context).textTheme.title,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
