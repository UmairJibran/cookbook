import 'package:flutter/foundation.dart';

class Meal {
  String mealID;
  String catID;
  String mealName;
  String mealImageUrl;
  int prepTime;
  int complexity;
  int affordability;
  bool isHalal;
  bool isVegan;
  bool isVegitarian;
  bool liked;
  int totalFavs;
  List<String> mealIngredients;
  List<String> prepSteps;

  Meal({
    @required this.catID,
    @required this.affordability,
    @required this.complexity,
    @required this.isHalal,
    @required this.isVegan,
    @required this.isVegitarian,
    @required this.mealID,
    @required this.mealImageUrl,
    @required this.mealIngredients,
    @required this.mealName,
    @required this.prepSteps,
    @required this.prepTime,
    @required this.totalFavs,
    this.liked = false,
  });
}
