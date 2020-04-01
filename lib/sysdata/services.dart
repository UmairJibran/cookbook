import 'package:cook_book/models/user.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class Services {
  static double height(BuildContext context) {
    return MediaQuery.of(context).removePadding(removeTop: true).size.height;
  }

  static double width(BuildContext context) {
    return MediaQuery.of(context).size.width;
  }
}

class AuthServices {
  static bool isSignedIn = false;

  FirebaseAuth _auth = FirebaseAuth.instance;

  //User object based on FirebaseUser

  User _localUser(FirebaseUser user) {
    return user != null
        ? User(uid: user.uid, userName: user.displayName)
        : null;
  }
  //TODO: forgotten Password

  //TODO: Sign Up with email and password

  //TODO: Sign Up with Google

  //TODO: Sign Up with Facebook

  //TODO: Sign Up with Twitter

  //Sign in with email and password
  Future loginWithEmailAndPassword({
    @required String email,
    @required String password,
  }) async {
    try {
      AuthResult result = await _auth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      FirebaseUser user = result.user;
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
