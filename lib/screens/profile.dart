import 'package:cook_book/components/loading.dart';
import 'package:cook_book/sysdata/services.dart';
import 'package:flutter/material.dart';

class UserProfile extends StatefulWidget {
  static String pageRoute = "/userProfile";

  @override
  _UserProfileState createState() => _UserProfileState();
}

class _UserProfileState extends State<UserProfile> {
  double height;
  double width;

  @override
  Widget build(BuildContext context) {
    height = Services.height(context);
    width = Services.width(context);
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("Profile"),
      ),
      body: SingleChildScrollView(
        child: Container(
          height: height * 0.8,
          width: width,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Container(
                margin: EdgeInsets.only(top: 30),
                height: height * 0.3,
                child: Center(
                  child: Image.asset(
                    "assets/images/cookie.png",
                    color: Theme.of(context).primaryColor,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              Container(
                margin: EdgeInsets.only(top: 5),
                width: width * 0.7,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    SizedBox(height: 30),
                    Text(
                      Services.displayName,
                      style: TextStyle(
                        fontFamily: "SulphurPoint",
                        color: Theme.of(context).accentColor,
                        fontWeight: FontWeight.bold,
                        fontSize: 30,
                      ),
                    ),
                    Text(
                      Services.email,
                      style: TextStyle(
                        fontFamily: "SulphurPoint",
                        color: Theme.of(context).accentColor.withOpacity(0.7),
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
