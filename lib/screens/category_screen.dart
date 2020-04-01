import 'package:cook_book/bloc/navigation_bloc.dart';
import 'package:cook_book/models/meal.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../components/meal_card.dart';
import '../sysdata/services.dart';
import 'package:flutter/material.dart';

class CategoryScreen extends StatelessWidget {
  static String pageRoute = "/category_screen";
  final List<Meal> meals;
  final String catName;
  double height;
  double width;

  CategoryScreen({this.meals, this.catName});

  @override
  Widget build(BuildContext context) {
    height = Services.height(context);
    width = Services.width(context);
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "$catName",
          // style: Theme.of(context).textTheme.body1,
        ),
      ),
      body: Container(
        height: height,
        width: width,
        child: ListView(
          children: meals.map(
            (meal) {
              return MealCard(
                meal: meal,
              );
            },
          ).toList(),
        ),
      ),
    );
  }
}
