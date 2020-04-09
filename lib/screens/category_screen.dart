import 'package:cook_book/components/loading.dart';
import 'package:cook_book/models/category.dart';
import 'package:cook_book/models/meal.dart';

import '../components/meal_card.dart';
import '../sysdata/services.dart';
import 'package:flutter/material.dart';

class CategoryScreen extends StatefulWidget {
  static String pageRoute = "/category_screen";
  final Category category;
  static bool mealsHasData;
  static List<Meal> loadedMeals;

  CategoryScreen({this.category});

  @override
  _CategoryScreenState createState() => _CategoryScreenState();
}

class _CategoryScreenState extends State<CategoryScreen> {
  double height;

  double width;

  @override
  Widget build(BuildContext context) {
    height = Services.height(context);
    width = Services.width(context);
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "${widget.category.catName}",
        ),
      ),
      body: !CategoryScreen.mealsHasData
          ? Loading(
              label: "Loading Meals",
            )
          : Container(
              height: height,
              width: width,
              child: !CategoryScreen.mealsHasData
                  ? Center(
                      child: Loading(label: "Loading Meals"),
                    )
                  : ListView(
                      children: CategoryScreen.loadedMeals.map(
                        (meal) {
                          if (widget.category.catID == meal.catID)
                            return MealCard(
                              meal: meal,
                            );
                          return SizedBox();
                        },
                      ).toList(),
                    ),
            ),
    );
  }
}
