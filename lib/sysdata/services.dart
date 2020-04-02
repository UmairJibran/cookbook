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

  FirebaseAuth _auth = FirebaseAuth.instance;

  //User object based on FirebaseUser

  User _localUser(FirebaseUser user) {
    return user != null
        ? User(uid: user.uid, userName: user.displayName)
        : null;
  }
  //TODO: forgotten Password

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
      UserUpdateInfo updateInfo = UserUpdateInfo();
      updateInfo.displayName = displayName;
      await user.updateProfile(updateInfo);
      await user.reload();
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
