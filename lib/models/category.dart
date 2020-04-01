import 'package:cook_book/models/meal.dart';
import 'package:flutter/foundation.dart';

class Category {
  String catID;
  String catName;
  String catImageURL;

  List<Meal> meals;

  Category({
    @required this.catID,
    @required this.catImageURL,
    @required this.catName,
    @required this.meals,
  });
}
