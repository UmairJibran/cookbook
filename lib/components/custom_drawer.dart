import 'package:cook_book/screens/login.dart';
import 'package:cook_book/sysdata/services.dart';
import 'package:flutter/material.dart';

class CustomDrawer extends StatelessWidget {
  double height;
  @override
  Widget build(BuildContext context) {
    height = Services.height(context);
    return Drawer(
      child: Container(
        margin: EdgeInsets.only(
          top: height * 0.05,
        ),
        child: Column(
          children: <Widget>[
            Container(
              height: height * 0.3,
              child: Center(
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
            ),
            Container(
              height: height * 0.6,
              child: Column(
                children: <Widget>[
                  Divider(),
                  ListTile(
                    onTap: () {
                      Navigator.pushNamed(context, Login.pageRoute);
                    },
                    title: Text(
                      "Log In / Sign Up",
                      style: TextStyle(
                        color: Colors.black,
                        fontFamily: "SulphurPoint",
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    leading: IconButton(
                      icon: Image.asset("assets/icons/Profile_Picture.png"),
                      onPressed: () {
                        //
                      },
                    ),
                  ),
                  ListTile(
                    onTap: () {
                      //
                    },
                    title: Text(
                      "Announcment",
                      style: TextStyle(
                        color: Colors.black,
                        fontFamily: "SulphurPoint",
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    leading: IconButton(
                      // icon: Icon(Icons.assignment),
                      icon: Icon(
                        Icons.settings_input_antenna,
                        color: Colors.black,
                      ),
                      onPressed: () {
                        //
                      },
                    ),
                  ),
                  ListTile(
                    onTap: () {
                      //
                    },
                    title: Text(
                      "Resources",
                      style: TextStyle(
                        color: Colors.black,
                        fontFamily: "SulphurPoint",
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    leading: IconButton(
                      icon: Image.asset(
                        "assets/icons/support.png",
                      ),
                      onPressed: () {
                        //
                      },
                    ),
                  ),
                  ListTile(
                    onTap: () {
                      //
                    },
                    title: Text(
                      "Report a Bug",
                      style: TextStyle(
                        color: Colors.black,
                        fontFamily: "SulphurPoint",
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    leading: IconButton(
                      icon: Icon(
                        Icons.bug_report,
                        color: Colors.black,
                      ),
                      onPressed: () {
                        //
                      },
                    ),
                  ),
                  ListTile(
                    onTap: () {
                      //
                    },
                    title: Text(
                      "Suggest a Feature",
                      style: TextStyle(
                        color: Colors.black,
                        fontFamily: "SulphurPoint",
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    leading: IconButton(
                      icon: Icon(
                        Icons.comment,
                        color: Colors.black,
                      ),
                      onPressed: () {
                        //
                      },
                    ),
                  ),
                ],
              ),
            ),
            Container(
              height: height * 0.05,
              child: Align(
                alignment: Alignment.bottomCenter,
                child: Text(
                  "Umair Jibran",
                  style: TextStyle(
                    color: Colors.black,
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
  }
}
