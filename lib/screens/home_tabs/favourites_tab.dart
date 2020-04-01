import 'package:cook_book/components/meal_card.dart';
import 'package:cook_book/data/dummy_data.dart';

import '../../sysdata/services.dart';
import 'package:flutter/material.dart';

class FavouritesTab extends StatelessWidget {
  double height;
  double width;
  @override
  Widget build(BuildContext context) {
    height = Services.height(context);
    width = Services.width(context);
    return Container(
      height: height,
      width: width,
      child: (DUMMY.favMeals.length > 0)
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
            ),
    );
  }
}
