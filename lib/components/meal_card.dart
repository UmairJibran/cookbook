import 'package:cook_book/bloc/navigation_bloc.dart';
import 'package:cook_book/screens/meal_screen.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../models/meal.dart';

import '../sysdata/services.dart';
import 'package:flutter/material.dart';

class MealCard extends StatelessWidget {
  final Meal meal;
  double width;
  double height;
  MealCard({this.meal});
  @override
  Widget build(BuildContext context) {
    width = Services.width(context);
    height = Services.height(context);
    return Material(
      color: Colors.transparent,
      child: InkWell(
        onTap: () {
          // BlocProvider.of<NavigationBloc>(context).add(
          //   MealTapped(
          //     meal: meal,
          //   ),
          // );
          Navigator.of(context).push(
            MaterialPageRoute(
              builder: (_) => MealScreen(
                meal: meal,
              ),
            ),
          );
        },
        child: Stack(
          children: <Widget>[
            Container(
              height: height * 0.3,
              width: double.infinity,
              child: Image.network(
                "${meal.mealImageUrl}",
                fit: BoxFit.cover,
              ),
            ),
            Positioned(
              bottom: 0,
              child: Container(
                height: height * 0.08,
                width: width,
                color: (meal.liked) ? Color(0xbfFCFECC) : Color(0xbfEBF4FF),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: <Widget>[
                        Padding(
                          padding: EdgeInsets.only(
                            left: 5,
                          ),
                        ),
                        Icon(
                          Icons.timer,
                          size: 20,
                        ),
                        Text(
                          "  ${meal.prepTime} Minutes",
                          style: Theme.of(context).textTheme.display2,
                        )
                      ],
                    ),
                    Padding(
                      padding: EdgeInsets.only(right: 20),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: <Widget>[
                              Text(
                                "Complexity: ${meal.complexity}",
                                style: Theme.of(context).textTheme.display3,
                              )
                            ],
                          ),
                          Divider(
                            height: 1,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: <Widget>[
                              Text(
                                "Afforadability: ${meal.affordability}",
                                style: Theme.of(context).textTheme.display3,
                              )
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Positioned(
              bottom: 0,
              left: width * 0.3,
              child: Container(
                width: width * 0.4,
                height: height * 0.14,
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: [
                      Color(0xff1290D1),
                      Color(0xff12D1C4),
                    ],
                    begin: Alignment.centerLeft,
                    end: Alignment.centerRight,
                  ),
                ),
                child: Center(
                  child: Text(
                    "${meal.mealName}",
                    style: Theme.of(context).textTheme.display1,
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
