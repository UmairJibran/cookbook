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
  int serving;
  // int totalFavs;
  List<dynamic> mealIngredients;
  List<dynamic> prepSteps;

  Meal({
    @required this.affordability,
    @required this.complexity,
    @required this.isHalal,
    @required this.isVegan,
    @required this.isVegitarian,
    @required this.mealID,
    @required this.catID,
    @required this.mealImageUrl,
    @required this.mealIngredients,
    @required this.mealName,
    @required this.prepSteps,
    @required this.prepTime,
    @required this.serving,
    // @required this.totalFavs,
  });

  factory Meal.fromFirestore(doc) {
    return Meal(
      mealID: doc.documentID,
      catID: doc['catID'],
      mealName: doc['mealName'],
      mealImageUrl: doc['mealImageUrl'],
      prepTime: doc['prepTime'],
      complexity: doc['complexity'],
      affordability: doc['affordability'],
      isHalal: doc['isHalal'],
      isVegan: doc['isVegan'],
      isVegitarian: doc['isVegitarian'],
      mealIngredients: doc['mealIngredients'],
      prepSteps: doc['prepSteps'],
      serving: doc['serving'],
    );
  }
}
