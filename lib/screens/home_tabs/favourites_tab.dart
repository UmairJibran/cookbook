import 'package:cook_book/components/loading.dart';
import 'package:cook_book/components/meal_card.dart';
import 'package:cook_book/data/user_data.dart';
import 'package:cook_book/screens/login.dart';

import '../../sysdata/services.dart';
import 'package:flutter/material.dart';

import '../category_screen.dart';

class FavouritesTab extends StatefulWidget {
  @override
  _FavouritesTabState createState() => _FavouritesTabState();
}

class _FavouritesTabState extends State<FavouritesTab> {
  double height;
  double width;
  int length;

  @override
  Widget build(BuildContext context) {
    length = CategoryScreen.loadedMeals.length;
    height = Services.height(context);
    width = Services.width(context);
    return Container(
      height: height,
      width: width,
      child: AuthServices.isSignedIn
          ? UserData.likedMealsID.isEmpty
              ? Container(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "¯\\_(ツ)_/¯",
                        style: TextStyle(
                          fontSize: 40,
                        ),
                      ),
                      Text(
                        "No Meal Favourited\nyet!",
                        textAlign: TextAlign.center,
                        style: Theme.of(context).textTheme.display4,
                      ),
                      SizedBox(height: 80),
                    ],
                  ),
                )
              : length > 0
                  ? ListView.builder(
                      itemCount: length,
                      itemBuilder: (_, index) {
                        if (UserData.likedMealsID
                            .contains(CategoryScreen.loadedMeals[index].mealID))
                          return MealCard(
                              meal: CategoryScreen.loadedMeals[index]);
                        else
                          return SizedBox();
                      },
                    )
                  : Loading()
          : Center(
              child: Column(
                children: <Widget>[
                  SizedBox(height: height * 0.2),
                  Text(
                    "Sign In to Favourite\nMeals!",
                    textAlign: TextAlign.center,
                    style: Theme.of(context).textTheme.display4,
                  ),
                  SizedBox(height: 30),
                  FlatButton(
                    color: Theme.of(context).accentColor,
                    onPressed: () {
                      Navigator.pushNamed(context, Login.pageRoute);
                    },
                    child: Padding(
                      padding: const EdgeInsets.all(20.0),
                      child: Text(
                        "Log In / Sign Up",
                        style: TextStyle(
                          color: Colors.white,
                          fontFamily: "SulphurPoint",
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
    );
  }
}
