import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:cook_book/data/user_data.dart';
import 'package:cook_book/models/meal.dart';
import 'package:cook_book/screens/login.dart';
import 'package:cook_book/sysdata/services.dart';
import 'package:firebase_admob/firebase_admob.dart';
import 'package:flutter/material.dart';

class MealScreen extends StatefulWidget {
  static String pageRoute = "/meal_screen";
  final Meal meal;
  String bannerAdUnitId = 'ca-app-pub-3311480830735309/5053308832';
  MealScreen({this.meal});
  @override
  _MealScreenState createState() => _MealScreenState();
}

class _MealScreenState extends State<MealScreen> {
  double height;
  double width;
  int selected = 0;
  bool liked;
  String userID = Services.userID;
  // MobileAdTargetingInfo targetingInfo;
  BannerAd myBanner;
  bool checkIfLiked() {
    return UserData.likedMealsID.contains(widget.meal.mealID);
  }

  @override
  void initState() {
    super.initState();
    liked = false;
    myBanner = BannerAd(
      adUnitId: widget.bannerAdUnitId,
      size: AdSize.fullBanner,
    );
  }

  @override
  void dispose() {
    super.dispose();
    myBanner?.dispose();
    myBanner = null;
  }

  void _showBannerAd() {
    myBanner
      ..load()
      ..show(
        anchorOffset: 0.0,
        horizontalCenterOffset: 0.0,
        anchorType: AnchorType.bottom,
      );
  }

  void showModal(context) {
    showModalBottomSheet(
      context: context,
      builder: (_) {
        return Container(
          height: height * 0.37,
          margin: EdgeInsets.only(bottom: 30),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Container(
                  width: width,
                  height: height * 0.165,
                  child: Text(
                    "Sign In to Favourite\n${widget.meal.mealName}",
                    textAlign: TextAlign.center,
                    overflow: TextOverflow.ellipsis,
                    style: Theme.of(context).textTheme.display4,
                  ),
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
      },
    );
  }

  void toggleLike() {
    if (liked) {
      UserData.likedMealsID.removeWhere((mealID) {
        if (mealID == widget.meal.mealID)
          return true;
        else
          return false;
      });
      Firestore.instance
          .collection('meals')
          .document(widget.meal.mealID)
          .updateData({
        'totalLikes': widget.meal.totalLikes - 1,
      });
    } else {
      UserData.likedMealsID.add(widget.meal.mealID);
      Firestore.instance
          .collection('meals')
          .document(widget.meal.mealID)
          .updateData({
        'totalLikes': widget.meal.totalLikes + 1,
      });
    }
    setState(() {
      checkIfLiked();
      Firestore.instance
          .collection('users')
          .document(Services.userID)
          .updateData({'favMeals': UserData.likedMealsID});
    });
  }

  @override
  Widget build(BuildContext context) {
    print(widget.meal.totalLikes);
    liked = checkIfLiked();
    _showBannerAd();
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
                (widget.meal.isVegan)
                    ? Text(
                        "Vegan",
                        style: TextStyle(
                          fontSize: 20,
                          color: Color(0xff12D132),
                        ),
                      )
                    : Text(
                        "Non-Vegan",
                        style: TextStyle(
                          fontSize: 20,
                          color: Color(0xffFF0000),
                        ),
                      ),
                (widget.meal.isVegitarian)
                    ? Text(
                        "Vegitarian",
                        style:
                            TextStyle(fontSize: 20, color: Color(0xff12D132)),
                      )
                    : Text(
                        "Non Vegitarian",
                        style:
                            TextStyle(fontSize: 20, color: Color(0xffFF0000)),
                      ),
                (widget.meal.isHalal)
                    ? Text(
                        "Halal",
                        style: TextStyle(
                          fontSize: 20,
                          color: Color(0xff12D132),
                        ),
                      )
                    : Text(
                        "Halal",
                        style: TextStyle(
                          fontSize: 20,
                          color: Color(0xffFF0000),
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
            height: height * 0.41,
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
                          Padding(
                            padding: const EdgeInsets.only(left: 60.0),
                            child: Text(
                              widget.meal.serving == 1
                                  ? "for ${widget.meal.serving.toString()} person"
                                  : "for ${widget.meal.serving.toString()} people",
                              style: TextStyle(
                                fontFamily: "SulphurPoint",
                                color: Colors.black54,
                                fontWeight: FontWeight.bold,
                                fontSize: 14,
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Container(
                            height: height * 0.29,
                            child: Scrollbar(
                              child: ListView(
                                children: widget.meal.mealIngredients.map(
                                  (ingredient) {
                                    return Text(
                                      ingredient.toString(),
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
                            height: height * 0.325,
                            child: Scrollbar(
                              child: ListView(
                                children: widget.meal.prepSteps.map(
                                  (step) {
                                    return Text(
                                      "- ${step.toString()}",
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
                  child: IconButton(
                    onPressed: AuthServices.isSignedIn
                        ? toggleLike
                        : () => showModal(context),
                    icon: Icon(
                      liked ? Icons.favorite : Icons.favorite_border,
                      color: liked ? Colors.red : Colors.black38,
                      size: 25,
                    ),
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
