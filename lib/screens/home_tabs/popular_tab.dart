import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:cook_book/components/loading.dart';
import 'package:cook_book/components/meal_card.dart';
import 'package:cook_book/models/meal.dart';
import 'package:cook_book/sysdata/services.dart';
import 'package:flutter/material.dart';

class PopularTab extends StatefulWidget {
  @override
  _PopularTabState createState() => _PopularTabState();
}

class _PopularTabState extends State<PopularTab> {
  double height;
  double width;
  List<Meal> meals;
  bool loading;
  @override
  void initState() {
    super.initState();
    meals = [];
    loading = false;
    getMeals();
  }

  getMeals() async {
    setState(() {
      loading = true;
    });
    QuerySnapshot documents = await Firestore.instance
        .collection('meals')
        .orderBy('totalLikes', descending: true)
        .getDocuments();
    documents.documents.forEach((meal) {
      if (meal['totalLikes'] >= 1) meals.add(Meal.fromFirestore(meal));
    });
    print(meals.length);
    setState(() {
      loading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    height = Services.height(context);
    width = Services.width(context);
    return loading
        ? Loading()
        : Container(
            height: height,
            width: width,
            child: ListView.builder(
              itemCount: meals.length,
              itemBuilder: (_, index) => Stack(
                children: <Widget>[
                  MealCard(
                    meal: meals[index],
                  ),
                  Positioned(
                    right: 10,
                    top: 15,
                    child: Container(
                      height: height * 0.08,
                      width: height * 0.08,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(
                          height * 0.08,
                        ),
                        gradient: LinearGradient(
                          colors: [
                            Color(0xff1290D1),
                            Color(0xff12D1C4),
                          ],
                          begin: Alignment.bottomLeft,
                          end: Alignment.topRight,
                        ),
                      ),
                      child: Center(
                        child: Text(
                          "${meals[index].totalLikes}",
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                          ),
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
