import 'dart:convert';

import 'package:cook_book/data/dummy_data.dart';
import 'package:cook_book/models/category.dart';
import 'package:cook_book/models/meal.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class Services {
  static bool loaded = false;
  static String url = "https://cookbook-b7a86.firebaseio.com/categories.json";

  static double height(BuildContext context) {
    return MediaQuery.of(context).removePadding(removeTop: true).size.height;
  }

  static double width(BuildContext context) {
    return MediaQuery.of(context).size.width;
  }

  static List<Meal> populateMeals(dynamic meals) {
    List<Meal> temp = [];
    for (int i = 0; i < meals.length; i++) {
      var prepSteps = List<String>.from(meals[i]['prepSteps']);
      var mealIngredients = List<String>.from(meals[i]['mealIngredients']);
      temp.add(
        Meal(
          catID: meals[i]['catID'],
          affordability: meals[i]['affordability'],
          complexity: meals[i]['complexity'],
          isHalal: meals[i]['isHalal'],
          isVegan: meals[i]['isVegan'],
          isVegitarian: meals[i]['isVegitarian'],
          mealID: meals[i]['mealID'],
          mealImageUrl: meals[i]['mealImageUrl'],
          mealIngredients: mealIngredients,
          mealName: meals[i]['mealName'],
          prepSteps: prepSteps,
          prepTime: meals[i]['prepTime'],
          totalFavs: meals[i]['totalFavs'],
        ),
      );
    }
    return temp;
  }

  static Future<void> fetchData() async {
    try {
      final data = await http.get(Services.url);
      final recData = json.decode(data.body) as Map<String, dynamic>;
      recData.forEach(
        (_, cat) {
          List<Meal> temp = populateMeals(cat['meals']);
          DUMMY.dummyCategories.add(
            Category(
              catID: cat["catID"],
              catImageURL: cat["catImageURL"],
              catName: cat["catName"],
              meals: temp,
            ),
          );
        },
      );
    } catch (error) {
      throw error;
    }
  }
}
