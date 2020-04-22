import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:cook_book/components/loading.dart';
import 'package:cook_book/components/meal_card.dart';
import 'package:cook_book/components/no_meals_faved.dart';
import 'package:cook_book/components/not_signed_in.dart';
import 'package:cook_book/data/user_data.dart';
import 'package:cook_book/models/meal.dart';
import '../../sysdata/services.dart';
import 'package:flutter/material.dart';

class FavouritesTab extends StatefulWidget {
  @override
  _FavouritesTabState createState() => _FavouritesTabState();
}

class _FavouritesTabState extends State<FavouritesTab> {
  double height;
  double width;
  List<Meal> allLikedMeals;
  bool loading;

  @override
  void initState() {
    super.initState();
    loading = true;
    allLikedMeals = [];
    getMeals();
  }

  getMeals() async {
    QuerySnapshot _documents =
        await Firestore.instance.collection('meals').getDocuments();
    _documents.documents.forEach((document) {
      if (UserData.likedMealsID.contains(document.documentID)) {
        allLikedMeals.add(Meal.fromFirestore(document));
      }
    });
    setState(() {
      loading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    height = Services.height(context);
    width = Services.width(context);
    return Container(
      height: height,
      width: width,
      child: AuthServices.isSignedIn
          ? UserData.likedMealsID.isEmpty
              ? NoMealsFaved()
              : loading
                  ? Loading()
                  : ListView.builder(
                      itemCount: allLikedMeals.length,
                      itemBuilder: (_, index) {
                        return MealCard(
                          meal: allLikedMeals[index],
                        );
                      },
                    )
          : NotSignedIn(height: height),
    );
  }
}
