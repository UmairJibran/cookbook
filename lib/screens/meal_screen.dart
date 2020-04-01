import 'package:cook_book/data/dummy_data.dart';
import 'package:cook_book/models/category.dart';
import 'package:cook_book/models/meal.dart';
import 'package:cook_book/sysdata/services.dart';
import 'package:flutter/material.dart';

class MealScreen extends StatefulWidget {
  static String pageRoute = "/meal_screen";
  final Meal meal;
  MealScreen({this.meal});
  @override
  _MealScreenState createState() => _MealScreenState();
}

class _MealScreenState extends State<MealScreen> {
  double height;
  double width;
  int selected = 0;
  @override
  Widget build(BuildContext context) {
    height = Services.height(context);
    width = Services.width(context);
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "${widget.meal.mealName}",
        ),
      ),
      body: Column(
        children: <Widget>[
          Container(
            height: height * 0.3,
            width: width,
            child: Image.network(
              "${widget.meal.mealImageUrl}",
              fit: BoxFit.cover,
            ),
          ),
          Container(
            color: Color(0xffEBF4FF),
            height: height * 0.065,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: <Widget>[
                Text(
                  "Vegan",
                  style: TextStyle(
                    fontSize: 20,
                    color: (widget.meal.isVegan)
                        ? Color(0xff12D132)
                        : Color(0xffFF0000),
                  ),
                ),
                Text(
                  "Vegitarian",
                  style: TextStyle(
                    fontSize: 20,
                    color: (widget.meal.isVegitarian)
                        ? Color(0xff12D132)
                        : Color(0xffFF0000),
                  ),
                ),
                Text(
                  "Halal",
                  style: TextStyle(
                    fontSize: 20,
                    color: (widget.meal.isHalal)
                        ? Color(0xff12D132)
                        : Color(0xffFF0000),
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Icon(
                      Icons.timer,
                    ),
                    Text(
                      " ${widget.meal.prepTime} Minutes",
                      style: Theme.of(context).textTheme.body2,
                    ),
                  ],
                )
              ],
            ),
          ),
          Container(
            width: width * 0.9,
            height: height * 0.42,
            margin: EdgeInsets.only(
              top: 10,
            ),
            decoration: BoxDecoration(
              color: Colors.white,
              boxShadow: [
                const BoxShadow(
                  color: Colors.black12,
                  blurRadius: 10,
                  spreadRadius: 2,
                ),
              ],
            ),
            child: Stack(
              children: <Widget>[
                PageView(
                  onPageChanged: (currentPage) {
                    setState(() {
                      selected = currentPage;
                    });
                  },
                  children: <Widget>[
                    Container(
                      padding: EdgeInsets.only(
                        left: 20,
                        right: 20,
                        top: 10,
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text(
                            "Ingredients",
                            style: Theme.of(context).textTheme.display4,
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Container(
                            height: height * 0.30,
                            child: Scrollbar(
                              child: ListView(
                                children: widget.meal.mealIngredients.map(
                                  (ingredient) {
                                    return Text(
                                      ingredient,
                                      style: TextStyle(
                                        fontSize: 18,
                                        fontFamily: "SulphurPoint",
                                      ),
                                    );
                                  },
                                ).toList(),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.only(
                        left: 20,
                        right: 20,
                        top: 10,
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text(
                            "Steps",
                            style: Theme.of(context).textTheme.display4,
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Container(
                            height: height * 0.3,
                            child: Scrollbar(
                              child: ListView(
                                children: widget.meal.prepSteps.map(
                                  (step) {
                                    return Text(
                                      "$step",
                                      style: TextStyle(
                                        fontFamily: "SulphurPoint",
                                        fontSize: 18,
                                      ),
                                    );
                                  },
                                ).toList(),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                Positioned(
                  right: 10,
                  top: 10,
                  child: Stack(
                    children: <Widget>[
                      Icon(
                        (widget.meal.liked)
                            ? Icons.favorite
                            : Icons.favorite_border,
                        color: Color(0xffFF0000),
                        size: 28,
                      ),
                      InkWell(
                        onTap: () {
                          setState(
                            () {
                              final existingIndex = DUMMY.favMeals.indexWhere(
                                  (meal) => meal.mealID == widget.meal.mealID);
                              if (widget.meal.liked) {
                                print("Unliked");
                                DUMMY.favMeals.removeAt(existingIndex);
                                print("Lenght: ${DUMMY.favMeals.length}");
                              } else {
                                DUMMY.favMeals.add(widget.meal);
                                print("Liked");
                                print("Lenght: ${DUMMY.favMeals.length}");
                              }

                              widget.meal.liked = !widget.meal.liked;
                            },
                          );
                        },
                        child: Icon(
                          Icons.favorite_border,
                          color: Colors.black,
                          size: 28,
                        ),
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [0, 1].map(
              (index) {
                return Container(
                  margin: EdgeInsets.only(top: 10, left: 5),
                  height: (selected == index) ? 12 : 8,
                  width: (selected == index) ? 12 : 8,
                  decoration: BoxDecoration(
                    color: (selected == index)
                        ? Theme.of(context).primaryColor
                        : Theme.of(context).accentColor,
                    borderRadius: BorderRadius.circular(
                      20,
                    ),
                  ),
                );
              },
            ).toList(),
          ),
        ],
      ),
    );
  }
}
