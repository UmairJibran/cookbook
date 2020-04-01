import 'package:cook_book/components/meal_card.dart';
import 'package:cook_book/data/dummy_data.dart';
import 'package:cook_book/screens/login.dart';

import '../../sysdata/services.dart';
import 'package:flutter/material.dart';

class FavouritesTab extends StatefulWidget {
  @override
  _FavouritesTabState createState() => _FavouritesTabState();
}

class _FavouritesTabState extends State<FavouritesTab> {
  double height;

  double width;

  @override
  Widget build(BuildContext context) {
    height = Services.height(context);
    width = Services.width(context);
    return Container(
      height: height,
      width: width,
      child: AuthServices.isSignedIn
          ? DUMMY.favMeals.length > 0
              ? ListView(
                  children: DUMMY.favMeals.map(
                    (meal) {
                      return MealCard(meal: meal);
                    },
                  ).toList(),
                )
              : Container(
                  child: Center(
                    child: Text(
                      "No Meal Favourited\nyet!",
                      textAlign: TextAlign.center,
                      style: Theme.of(context).textTheme.display4,
                    ),
                  ),
                )
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
