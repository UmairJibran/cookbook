import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:cook_book/components/loading.dart';
import 'package:cook_book/components/report_a_bug.dart';
import 'package:cook_book/models/category.dart';
import 'package:cook_book/models/meal.dart';
import 'package:open_iconic_flutter/open_iconic_flutter.dart';

import '../components/meal_card.dart';
import '../sysdata/services.dart';
import 'package:flutter/material.dart';

List<Meal> meals = [];

class CategoryScreen extends StatefulWidget {
  static String pageRoute = "/category_screen";
  final Category category;
  static bool mealsHasData;

  CategoryScreen({this.category});

  @override
  _CategoryScreenState createState() => _CategoryScreenState();
}

class _CategoryScreenState extends State<CategoryScreen> {
  double height;
  bool loading;
  double width;
  @override
  void initState() {
    super.initState();
    checkMeals();
  }

  @override
  void dispose() {
    super.dispose();
    meals = [];
  }

  checkMeals() {
    if (meals.isEmpty) {
      setState(() {
        loading = true;
      });
      loadMeals();
    } else {
      setState(() {
        loading = false;
      });
    }
  }

  void loadMeals() async {
    Firestore _firestore = Firestore.instance;
    var documents = await _firestore.collection('meals').getDocuments();
    documents.documents.forEach((doc) {
      String a = widget.category.catID.trim();
      String b = doc['catID'].toString().trim();
      if (a == b) {
        meals.add(Meal.fromFirestore(doc));
        print('Matched');
      } else {
        print('Miss Matched');
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
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "${widget.category.catName}",
        ),
      ),
      body: loading
          ? Loading(
              label: "Loading Meals",
            )
          : (meals.isEmpty)
              ? Container(
                  width: width,
                  height: height,
                  padding: EdgeInsets.only(bottom: 25, left: 15, right: 15),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      Icon(
                        OpenIconicIcons.ban,
                        color: Theme.of(context).accentColor.withOpacity(0.5),
                        size: width * .4,
                      ),
                      SizedBox(height: 15),
                      Text(
                        'That\'s Strange we couldn\'t find any meal for this category',
                        textAlign: TextAlign.center,
                        style: Theme.of(context).textTheme.subhead.copyWith(
                              fontSize: 20,
                            ),
                      ),
                      SizedBox(height: 15),
                      FlatButton(
                        onPressed: () => reportABug(context),
                        child: Text(
                          'Report',
                          style: Theme.of(context).textTheme.subhead.copyWith(
                                color: Colors.white,
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                              ),
                        ),
                        color: Theme.of(context).accentColor.withOpacity(.8),
                        padding:
                            EdgeInsets.symmetric(vertical: 20, horizontal: 50),
                      )
                    ],
                  ),
                )
              : ListView.builder(
                  itemBuilder: (_, index) => MealCard(
                    meal: meals[index],
                  ),
                  itemCount: meals.length,
                ),
    );
  }
}
