import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:cook_book/data/user_data.dart';
import 'package:cook_book/models/user.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class Services {
  static String displayName;
  static String email;
  static String userID;
  static double height(BuildContext context) {
    return MediaQuery.of(context).removePadding(removeTop: true).size.height;
  }

  static double width(BuildContext context) {
    return MediaQuery.of(context).size.width;
  }

  static getFavMeals(String userID) async {
    DocumentSnapshot favMealsFromFirestore =
        await Firestore.instance.collection('users').document(userID).get();

    await favMealsFromFirestore.data['favMeals'].forEach(
      (mealID) {
        UserData.likedMealsID.add(mealID);
      },
    );
  }
}

class AuthServices {
  static bool isSignedIn;
  //get user's display name
  void getUserName(String uid) {
    Firestore.instance.collection("users").getDocuments().then(
      (QuerySnapshot snapshot) {
        snapshot.documents.forEach(
          (user) {
            if (user.documentID == uid) {
              print(user['name']);
              Services.displayName = user['name'];
            }
          },
        );
      },
    );
  }

  //Get User's Email
  static void getEmail() async {
    String userEmail;
    await FirebaseAuth.instance.currentUser().then((user) {
      userEmail = user.email.toString();
    });

    Services.email = userEmail;
  }

  //Get User's ID
  static void getUserID() async {
    String userID;
    await FirebaseAuth.instance.currentUser().then((user) {
      userID = user.uid.toString();
    });
    Services.userID = userID;
  }

  //Check if user is signed in or not
  static void checkUser() {
    FirebaseAuth.instance.currentUser().then(
      (firebaseUser) {
        if (firebaseUser == null) {
          AuthServices.isSignedIn = false;
        } else {
          AuthServices.isSignedIn = true;
          Firestore.instance.collection("users").getDocuments().then(
            (QuerySnapshot snapshot) {
              snapshot.documents.forEach((user) {
                if (user.documentID == firebaseUser.uid) {
                  Services.displayName = user['name'];
                  Services.email = user['email'];
                  Services.getFavMeals(firebaseUser.uid.toString());
                }
              });
            },
          );
          getEmail();
          getUserID();
        }
      },
    );
  }

  FirebaseAuth _auth = FirebaseAuth.instance;

  //User object based on FirebaseUser
  User _localUser(FirebaseUser user) {
    return user != null ? User(uid: user.uid) : null;
  }

  //forgotten Password
  bool forgottenPassword(String email) {
    try {
      _auth.sendPasswordResetEmail(email: email);
      return true;
    } catch (exception) {
      return false;
    }
  }

  //Sign Up with email and password
  Future registerWithEmailAndPassword({
    @required String email,
    @required String password,
    @required String displayName,
  }) async {
    try {
      AuthResult result = await _auth
          .createUserWithEmailAndPassword(
            email: email,
            password: password,
          )
          .timeout(
            Duration(seconds: 15),
          );
      FirebaseUser user = result.user;
      await Firestore.instance.collection("users").document(user.uid).setData(
        {
          'name': displayName,
          'email': email,
          'favMeals': [],
        },
      ).timeout(
        Duration(seconds: 10),
      );

      getEmail();
      getUserID();
      getUserName(result.user.uid);
      _localUser(user);
      return null;
    } catch (exception) {
      print(exception.toString());
      return exception.message;
    }
  }

  //TODO: Sign Up with Google

  //TODO: Sign Up with Facebook

  //TODO: Sign Up with Twitter

  //Sign in with email and password
  Future loginWithEmailAndPassword({
    @required String email,
    @required String password,
  }) async {
    try {
      AuthResult result = await _auth
          .signInWithEmailAndPassword(
            email: email,
            password: password,
          )
          .timeout(
            Duration(seconds: 15),
          );
      FirebaseUser user = result.user;
      getUserName(result.user.uid);
      Services.getFavMeals(result.user.uid);

      getEmail();
      getUserID();
      _localUser(user);
      return null;
    } catch (exception) {
      return exception.message;
    }
  }

  //SignOut
  Future signOut() async {
    try {
      UserData.likedMealsID = [];
      return _auth.signOut();
    } catch (exception) {
      print(exception.toString());
    }
  }
}
