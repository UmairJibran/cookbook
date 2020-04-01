import 'package:cook_book/screens/home_screen.dart';
import 'package:cook_book/screens/signup.dart';
import 'package:cook_book/sysdata/services.dart';
import 'package:flutter/material.dart';

class Login extends StatelessWidget {
  static String pageRoute = "/login";
  double height;
  double width;
  @override
  Widget build(BuildContext context) {
    height = Services.height(context);
    width = Services.width(context);
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          height: height - 30,
          width: width,
          margin: EdgeInsets.only(top: 24),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Container(
                margin: EdgeInsets.only(top: 30),
                width: width * 0.7,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: <Widget>[
                    Center(
                      child: Text(
                        "CookBook",
                        style: TextStyle(
                          color: Theme.of(context).primaryColor,
                          fontWeight: FontWeight.bold,
                          fontFamily: "SulphurPoint",
                          fontSize: 50,
                          letterSpacing: 2,
                        ),
                      ),
                    ),
                    Text(
                      "Log In",
                      style: TextStyle(
                        fontFamily: "SulphurPoint",
                        fontSize: 30,
                        color: Theme.of(context).accentColor,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 20),
              Container(
                width: width * 0.9,
                height: height * 0.33,
                decoration: BoxDecoration(
                  color: Colors.white,
                  boxShadow: [
                    BoxShadow(
                      blurRadius: 10,
                      color: Colors.black12,
                    ),
                  ],
                ),
                padding: EdgeInsets.only(
                  top: 10,
                  left: 20,
                  right: 20,
                ),
                child: Form(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        "Email",
                        style: TextStyle(
                          fontFamily: "SulphurPoint",
                          fontSize: 14,
                          color: Theme.of(context).accentColor,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      TextFormField(
                        enableSuggestions: false,
                        keyboardType: TextInputType.emailAddress,
                        decoration: InputDecoration(
                          hintText: "Enter your Email",
                          enabledBorder: UnderlineInputBorder(
                            borderSide: BorderSide(
                              color: Theme.of(context).accentColor,
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Text(
                        "Password",
                        style: TextStyle(
                          fontFamily: "SulphurPoint",
                          fontSize: 14,
                          color: Theme.of(context).accentColor,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      TextFormField(
                        enableSuggestions: false,
                        obscureText: true,
                        decoration: InputDecoration(
                          hintText: "Enter your Password",
                          enabledBorder: UnderlineInputBorder(
                            borderSide: BorderSide(
                              color: Theme.of(context).accentColor,
                            ),
                          ),
                        ),
                      ),
                      SizedBox(height: 10),
                      Align(
                        alignment: Alignment.centerRight,
                        child: FlatButton(
                          onPressed: () {
                            //TODO: set for Forgotten Password
                          },
                          child: Text(
                            "Forgotten Password?",
                            style: TextStyle(
                              fontFamily: "SulphurPoint",
                              fontSize: 16,
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(height: 10),
              Container(
                width: width * 0.9,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    FlatButton(
                      padding: EdgeInsets.symmetric(
                        vertical: 10,
                        horizontal: 25,
                      ),
                      onPressed: () {
                        Navigator.of(context).pushNamed(SignUp.pageRoute);
                      },
                      child: Text(
                        "Sign Up",
                        style: TextStyle(
                          fontSize: 20,
                          color: Theme.of(context).accentColor,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    FlatButton(
                      padding: EdgeInsets.symmetric(
                        vertical: 10,
                        horizontal: 25,
                      ),
                      color: Theme.of(context).accentColor,
                      onPressed: () {
                        Navigator.of(context).pushNamed("/");
                      },
                      child: Text(
                        "Log In",
                        style: TextStyle(
                          fontSize: 20,
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 20),
              Container(
                width: width * 0.9,
                color: Theme.of(context).primaryColor,
                height: 0.5,
              ),
              SizedBox(height: 20),
              Text(
                "Or use one of these Methods",
                style: TextStyle(
                  fontFamily: "SulphurPoint",
                  fontSize: 22,
                  color: Theme.of(context).accentColor,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 20),
              Container(
                width: width * 0.8,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    InkWell(
                      borderRadius: BorderRadius.circular(50),
                      onTap: () {
                        //
                      },
                      child: Container(
                        height: 80,
                        width: 80,
                        padding: EdgeInsets.all(10),
                        child: Image.asset(
                          "assets/icons/google.png",
                          color: Theme.of(context).accentColor,
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    InkWell(
                      borderRadius: BorderRadius.circular(50),
                      onTap: () {
                        //
                      },
                      child: Container(
                        height: 80,
                        width: 80,
                        padding: EdgeInsets.all(10),
                        child: Image.asset(
                          "assets/icons/facebook.png",
                          color: Theme.of(context).accentColor,
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    InkWell(
                      borderRadius: BorderRadius.circular(50),
                      onTap: () {
                        //
                      },
                      child: Container(
                        height: 80,
                        width: 80,
                        padding: EdgeInsets.all(10),
                        child: Image.asset(
                          "assets/icons/twitter.png",
                          color: Theme.of(context).accentColor,
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}