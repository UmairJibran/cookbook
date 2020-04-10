import 'package:cook_book/components/contact.dart';
import 'package:cook_book/components/report_a_bug.dart';
import 'package:cook_book/components/suggest_a_feature.dart';

import 'package:cook_book/screens/login.dart';
import 'package:cook_book/screens/notification_screen.dart';
import 'package:cook_book/screens/profile.dart';
import 'package:cook_book/screens/resources.dart';
import 'package:cook_book/sysdata/services.dart';
import 'package:flutter/material.dart';
import 'package:open_iconic_flutter/open_iconic_flutter.dart';

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
                                  Navigator.popAndPushNamed(
                                      context, Login.pageRoute);
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
                                leading: Icon(
                                  OpenIconicIcons.accountLogin,
                                  color: Colors.black,
                                ))
                            : ListTile(
                                onTap: () {
                                  Navigator.of(context)
                                      .pushNamed(UserProfile.pageRoute);
                                },
                                title: Text(
                                  Services.displayName,
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontFamily: "SulphurPoint",
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                leading: Icon(
                                  OpenIconicIcons.person,
                                  color: Colors.black,
                                ),
                              ),
                        ListTile(
                          onTap: () {
                            Navigator.pushNamed(
                                context, NotificationScreen.pageRoute);
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
                          leading: Icon(
                            OpenIconicIcons.bell,
                            color: Colors.black,
                          ),
                        ),
                        ListTile(
                          onTap: () {
                            Navigator.of(context)
                                .pushNamed(ResourcesPage.pageRoute);
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
                          leading: Icon(
                            OpenIconicIcons.hardDrive,
                            color: Colors.black,
                          ),
                        ),
                        ListTile(
                          onTap: () {
                            reportABug(context);
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
                          leading: Icon(
                            OpenIconicIcons.bug,
                            color: Colors.black,
                            size: 30,
                          ),
                        ),
                        ListTile(
                          onTap: () {
                            suggestAFeature(context);
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
                          leading: Icon(
                            OpenIconicIcons.plus,
                            color: Colors.black,
                          ),
                        ),
                        ListTile(
                          onTap: () {
                            contact(context);
                          },
                          title: Text(
                            "Contact",
                            style: TextStyle(
                              color: Colors.black,
                              fontFamily: "SulphurPoint",
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          leading: Icon(
                            OpenIconicIcons.phone,
                            color: Colors.black,
                          ),
                        ),
                        AuthServices.isSignedIn
                            ? ListTile(
                                onTap: () async {
                                  setState(() {
                                    _loading = true;
                                  });
                                  await _authServices.signOut();
                                  Future.delayed(
                                      const Duration(milliseconds: 500), () {
                                    setState(() {
                                      AuthServices.isSignedIn =
                                          _loading = false;
                                    });
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
                                leading: Icon(
                                  OpenIconicIcons.accountLogout,
                                  color: Colors.black,
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
