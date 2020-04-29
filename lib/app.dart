import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:cook_book/data/user_data.dart';
import 'package:cook_book/screens/add_meal_screen.dart';
import 'package:cook_book/screens/category_screen.dart';
import 'package:cook_book/screens/home_screen.dart';
import 'package:cook_book/screens/home_tabs/categories_tab.dart';
import 'package:cook_book/screens/login.dart';
import 'package:cook_book/screens/notification_screen.dart';
import 'package:cook_book/screens/profile.dart';
import 'package:cook_book/screens/resources.dart';
import 'package:cook_book/sysdata/services.dart';

import 'package:cook_book/screens/meal_screen.dart';
import 'package:cook_book/screens/signup.dart';
import 'package:firebase_admob/firebase_admob.dart';
import 'package:flutter/material.dart';

import 'models/category.dart';

class MyApp extends StatefulWidget {
  final String interstitialAdUnitId = 'ca-app-pub-3311480830735309/6873850482';
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  MobileAdTargetingInfo targetingInfo;
  InterstitialAd myInterstitial;
  CollectionReference categoriesReference = firestore.collection('categories');
  @override
  void initState() {
    super.initState();
    CategoriesTab.loadedCategories = [];
    getCategories();
    targetingInfo = MobileAdTargetingInfo(
      keywords: <String>['flutterio', 'beautiful apps'],
      contentUrl: 'https://flutter.io',
      childDirected: true,
      testDevices: <String>[],
      nonPersonalizedAds: false,
    );
    myInterstitial = InterstitialAd(
      adUnitId: widget.interstitialAdUnitId,
      targetingInfo: targetingInfo,
    );
  }

  void _showInterstitialAd() {
    Future.delayed(Duration(seconds: 180)).then((_) {
      myInterstitial
        ..load()
        ..show(
          anchorType: AnchorType.bottom,
          anchorOffset: 0.0,
          horizontalCenterOffset: 0.0,
        );
    });
  }

  @override
  void dispose() {
    super.dispose();
    myInterstitial?.dispose();
    myInterstitial = null;
  }

  getCategories() async {
    QuerySnapshot catDocs = await categoriesReference
        .orderBy('timeStamp', descending: true)
        .getDocuments();
    catDocs.documents.forEach(
      (doc) {
        CategoriesTab.loadedCategories.add(Category.fromFirestore(doc));
      },
    );
    setState(
      () {
        CategoriesTab.categoriesHasData = true;
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    AuthServices.checkUser();
    _showInterstitialAd();
    return MaterialApp(
      themeMode: ThemeMode.light,
      routes: {
        "/": (ctx) => HomeScreen(),
        CategoryScreen.pageRoute: (ctx) => CategoryScreen(),
        MealScreen.pageRoute: (ctx) => MealScreen(),
        Login.pageRoute: (ctx) => Login(),
        SignUp.pageRoute: (ctx) => SignUp(),
        UserProfile.pageRoute: (ctx) => UserProfile(),
        ResourcesPage.pageRoute: (ctx) => ResourcesPage(),
        NotificationScreen.pageRoute: (ctx) => NotificationScreen(),
        AddMeal.pageRoute: (ctx) => AddMeal(),
      },
      theme: ThemeData(
        primarySwatch: Colors.purple,
        primaryColor: Color(0xff6B12D1),
        accentColor: Color(0xff1290D1),
        canvasColor: Colors.white,
        splashColor: Colors.black12,
        fontFamily: "SulphurPoint",
        appBarTheme: AppBarTheme(
          iconTheme: IconThemeData(
            color: Colors.white,
          ),
          textTheme: TextTheme(
            title: TextStyle(
              color: Colors.white,
              fontFamily: "SulphurPoint",
              fontSize: 25,
            ),
          ),
        ),
        textTheme: TextTheme(
          title: TextStyle(
            color: Colors.white,
            fontFamily: "Brushed",
            fontSize: 55,
          ),
          subtitle: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
          display1: TextStyle(
            fontSize: 28,
            fontFamily: "AtlandSketches-BB",
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
          body1: TextStyle(
            fontFamily: "SulphurPoint",
            color: Colors.black,
            fontSize: 26,
          ),
          body2: TextStyle(
            fontFamily: "Angostura-Gaunt",
            color: Colors.black,
            fontSize: 18,
          ),
          display2: TextStyle(
            fontFamily: "Angostura-Gaunt",
            color: Colors.black,
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
          display3: TextStyle(
            fontFamily: "Angostura-Gaunt",
            color: Colors.black,
            fontWeight: FontWeight.bold,
            fontSize: 18,
          ),
          display4: TextStyle(
            fontFamily: "SulphurPoint",
            color: Colors.black,
            fontWeight: FontWeight.bold,
            fontSize: 28,
            letterSpacing: 1.5,
          ),
        ),
      ),
    );
  }
}
