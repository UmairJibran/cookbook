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
  bool loading = true;
  double width;
  void checkMeals() {
    if (!CategoryScreen.mealsHasData || CategoryScreen.loadedMeals.isEmpty) {
      setState(() {
        Future.delayed(Duration(milliseconds: 200)).then((_) {
          loading = true;
          checkMeals();
        });
      });
    } else {
      setState(() {
        loading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    checkMeals();
    height = Services.height(context);
    width = Services.width(context);
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "${widget.category.catName}",
        ),
      ),
      body: loading
          ? Loading(
              label: "Loading Meals",
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
    );
  }
}
