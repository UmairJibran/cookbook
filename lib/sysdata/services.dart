import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:cook_book/models/meal.dart';
import 'package:cook_book/models/user.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class Services {
  static String displayName = "NULL";
  static double height(BuildContext context) {
    return MediaQuery.of(context).removePadding(removeTop: true).size.height;
  }

  static double width(BuildContext context) {
    return MediaQuery.of(context).size.width;
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
                  print(user['name']);
                  Services.displayName = user['name'];
                }
              });
            },
          );
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
      print(exception.toString());
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
      getUserName(result.user.uid);
      return _localUser(user);
    } catch (exception) {
      print(exception.toString());
      return null;
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
      return _localUser(user);
    } catch (exception) {
      print(exception.toString());
      return null;
    }
  }

  //SignOut
  Future signOut() async {
    try {
      return _auth.signOut();
    } catch (exception) {
      print(exception.toString());
    }
  }
}
