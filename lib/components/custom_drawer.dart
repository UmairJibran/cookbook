import 'package:cook_book/screens/login.dart';
import 'package:cook_book/sysdata/services.dart';
import 'package:flutter/material.dart';

import 'loading.dart';

class CustomDrawer extends StatefulWidget {
  @override
  _CustomDrawerState createState() => _CustomDrawerState();
}

class _CustomDrawerState extends State<CustomDrawer> {
  AuthServices _authServices = AuthServices();
  bool _loading = false;
  double height;

  @override
  Widget build(BuildContext context) {
    height = Services.height(context);
    return Drawer(
      child: Container(
        margin: EdgeInsets.only(
          top: height * 0.05,
        ),
        child: _loading
            ? Loading(label: "Signing Out!")
            : Column(
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
                        !AuthServices.isSignedIn
                            ? ListTile(
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
                                leading: Padding(
                                  padding: const EdgeInsets.fromLTRB(
                                      0.0, 5.0, 0.0, 5.0),
                                  child: Image.asset(
                                    "assets/icons/user.png",
                                    color: Colors.black,
                                  ),
                                ),
                              )
                            : ListTile(
                                onTap: () {
                                  //
                                },
                                title: Text(
                                  // "Umair Jibran",
                                  Services.displayName,
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontFamily: "SulphurPoint",
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                leading: Padding(
                                  padding: const EdgeInsets.fromLTRB(
                                      0.0, 5.0, 0.0, 5.0),
                                  child: Image.asset(
                                    "assets/icons/user.png",
                                    color: Colors.black,
                                  ),
                                ),
                              ),
                        ListTile(
                          onTap: () {
                            //
                          },
                          title: Text(
                            "Notifications",
                            style: TextStyle(
                              color: Colors.black,
                              fontFamily: "SulphurPoint",
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          leading: IconButton(
                            icon: Icon(
                              Icons.notifications,
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
                          leading: Padding(
                            padding: const EdgeInsets.all(15.0),
                            child: Image.asset(
                              "assets/icons/support.png",
                            ),
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
                              size: 30,
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
                        AuthServices.isSignedIn
                            ? ListTile(
                                onTap: () async {
                                  setState(() {
                                    _loading = true;
                                  });
                                  await _authServices.signOut();
                                  setState(() {
                                    AuthServices.isSignedIn = _loading = false;
                                  });
                                },
                                title: Text(
                                  "Sign Out",
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontFamily: "SulphurPoint",
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                leading: Padding(
                                  padding: const EdgeInsets.fromLTRB(
                                      0.0, 5.0, 0.0, 5.0),
                                  child: Image.asset(
                                    "assets/icons/sign_out.png",
                                    color: Colors.black,
                                  ),
                                ),
                              )
                            : SizedBox(),
                      ],
                    ),
                  ),
                ],
              ),
      ),
    );
  }
}
