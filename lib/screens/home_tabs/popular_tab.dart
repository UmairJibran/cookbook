import 'package:cook_book/data/dummy_data.dart';

import '../../components/meal_card.dart';
import '../../sysdata/services.dart';
import 'package:flutter/material.dart';

class PopularTab extends StatelessWidget {
  double height;
  double width;
  @override
  Widget build(BuildContext context) {
    height = Services.height(context);
    width = Services.width(context);
    return Container(
      height: height,
      width: width,
      child: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            // MealCard(
            //   meal: DUMMY.dummyMeals[0],
            // ),
            // MealCard(
            //   meal: DUMMY.dummyMeals[1],
            // ),
            // MealCard(
            //   meal: DUMMY.dummyMeals[2],
            // ),
            Padding(
              padding: EdgeInsets.only(top: 20),
              child: Text(
                //TODO: Work on it
                "Not Ready Yet",
                style: TextStyle(
                  fontFamily: "SulphurPoint",
                  fontSize: 25,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
