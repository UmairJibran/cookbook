import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:cook_book/screens/category_screen.dart';
import 'package:cook_book/screens/home_screen.dart';
import 'package:cook_book/screens/home_tabs/categories_tab.dart';
import 'package:cook_book/screens/login.dart';
import 'package:cook_book/screens/profile.dart';
import 'package:cook_book/sysdata/services.dart';

import 'package:cook_book/screens/meal_screen.dart';
import 'package:cook_book/screens/signup.dart';
import 'package:flutter/material.dart';

import 'models/category.dart';

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  CollectionReference categoriesReference = firestore.collection('categories');
  @override
  void initState() {
    super.initState();
    CategoriesTab.loadedCategories = [];
    getCategories();
  }

  @override
  void dispose() {
    super.dispose();
  }

  getCategories() async {
    QuerySnapshot catDocs = await categoriesReference.getDocuments();
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
    return MaterialApp(
      routes: {
        "/": (ctx) => HomeScreen(),
        CategoryScreen.pageRoute: (ctx) => CategoryScreen(),
        MealScreen.pageRoute: (ctx) => MealScreen(),
        Login.pageRoute: (ctx) => Login(),
        SignUp.pageRoute: (ctx) => SignUp(),
        UserProfile.pageRoute: (ctx) => UserProfile(),
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
            fontFamily: "Angostura-Gaunt",
            color: Colors.black,
            fontSize: 26,
          ),
          body2: TextStyle(
            fontFamily: "Angostura-Gaunt",
            color: Colors.black,
            fontSize: 20,
          ),
          display2: TextStyle(
            fontFamily: "Angostura-Gaunt",
            color: Colors.black,
            fontSize: 22,
            fontWeight: FontWeight.bold,
          ),
          display3: TextStyle(
            fontFamily: "Angostura-Gaunt",
            color: Colors.black,
            fontWeight: FontWeight.bold,
            fontSize: 17,
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
      // home: BlocBuilder<NavigationBloc, NavigationState>(
      //   builder: (_, state) {
      //     print("State is -> $state");
      //     if (state is NavigationInitial) {
      //       return HomeScreen();
      //     } else if (state is NavigateToAllMeals) {
      //       return CategoryScreen(
      //         catName: state.category.catName,
      //         meals: state.category.meals,
      //       );
      //     } else if (state is NavigateToSingleMeal) {
      //       return MealScreen(
      //         meal: state.meal,
      //       );
      //     } else {
      //       return Scaffold(
      //         body: Center(
      //           child: CircularProgressIndicator(),
      //         ),
      //       );
      //     }
      //   },
      // ),
    );
  }
}
