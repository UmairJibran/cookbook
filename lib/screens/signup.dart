import 'package:auto_size_text/auto_size_text.dart';
import 'package:cook_book/components/loading.dart';
import 'package:cook_book/screens/login.dart';
import 'package:cook_book/sysdata/services.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class SignUp extends StatefulWidget {
  static final String pageRoute = "/signUp";
  final AuthServices authServices = AuthServices();
  @override
  _SignUpState createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  bool _loading = false;
  double height;
  double width;
  var _formKey;
  String _completeName = '';
  String _email = '';
  String _password = '';
  String _errorMessage = '';
  bool _wrongCred;
  @override
  void initState() {
    super.initState();
    _wrongCred = false;
    _formKey = GlobalKey<FormState>();
  }

  @override
  void dispose() {
    super.dispose();
    // _formKey.dispose();
  }

  @override
  Widget build(BuildContext context) {
    height = Services.height(context);
    width = Services.width(context);
    return Scaffold(
      body: SingleChildScrollView(
        child: _loading
            ? Loading(
                label: "Signing you Up :)",
              )
            : Container(
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
                            "Sign Up",
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
                        key: _formKey,
                        autovalidate: true,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Text(
                              "Complete Name",
                              style: TextStyle(
                                fontFamily: "SulphurPoint",
                                fontSize: 14,
                                color: Theme.of(context).accentColor,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            TextFormField(
                              initialValue: _completeName,
                              onChanged: (value) {
                                setState(() {
                                  _completeName = value;
                                });
                              },
                              validator: (value) {
                                if (value.isEmpty) {
                                  return "Please Enter a name";
                                }
                                if (value.contains('1') ||
                                    value.contains('2') ||
                                    value.contains('3') ||
                                    value.contains('4') ||
                                    value.contains('5') ||
                                    value.contains('6') ||
                                    value.contains('6') ||
                                    value.contains('7') ||
                                    value.contains('8') ||
                                    value.contains('9') ||
                                    value.contains('0')) {
                                  return "Name can not have numbers";
                                } else if (value.trim().length < 3) {
                                  return "Please Enter your Complete Name";
                                } else {
                                  return null;
                                }
                              },
                              enableSuggestions: true,
                              decoration: InputDecoration(
                                hintText: "Enter your Name",
                                enabledBorder: UnderlineInputBorder(
                                  borderSide: BorderSide(
                                    color: Theme.of(context).accentColor,
                                  ),
                                ),
                              ),
                            ),
                            SizedBox(height: 10),
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
                              initialValue: _email,
                              onChanged: (value) {
                                setState(() {
                                  _email = value;
                                });
                              },
                              validator: (value) {
                                if (value.isEmpty) {
                                  return "Please Enter your Email";
                                } else if (value.contains(' ') ||
                                    !(value.contains('@') ||
                                        value.contains('.'))) {
                                  return "Please Enter a valid Email";
                                } else {
                                  return null;
                                }
                              },
                              textCapitalization: TextCapitalization.none,
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
                            SizedBox(height: 10),
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
                              onChanged: (value) {
                                setState(() {
                                  _password = value;
                                });
                              },
                              validator: (value) {
                                if (value.isEmpty) {
                                  return "Please Enter Password";
                                } else if (value.length < 6) {
                                  return "Password Must be atleast 6 characters";
                                } else {
                                  return null;
                                }
                              },
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
                              validator: (value) {
                                if (value.isEmpty) {
                                  return "Please Enter Password";
                                } else if (value.length < 6) {
                                  return "Password Must be atleast 6 characters";
                                } else if (_password != value) {
                                  return "Password doesn't match";
                                } else {
                                  return null;
                                }
                              },
                              enableSuggestions: false,
                              obscureText: true,
                              decoration: InputDecoration(
                                hintText: "Re-Enter your Password",
                                enabledBorder: UnderlineInputBorder(
                                  borderSide: BorderSide(
                                    color: Theme.of(context).accentColor,
                                  ),
                                ),
                              ),
                            ),
                            SizedBox(height: 30),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(height: 10),
                    _wrongCred
                        ? Container(
                            width: width * 0.9,
                            margin: EdgeInsets.only(bottom: 10),
                            child: Center(
                              child: AutoSizeText(
                                '$_errorMessage',
                                maxLines: 3,
                                maxFontSize: 16,
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  color: Colors.red,
                                  fontFamily: 'SulphurPoint',
                                  fontSize: 14,
                                ),
                              ),
                            ),
                          )
                        : SizedBox(
                            height: 14,
                          ),
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
                              Navigator.of(context).pushNamed(Login.pageRoute);
                            },
                            child: Text(
                              "Log In",
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
                            onPressed: () async {
                              if (_formKey.currentState.validate()) {
                                setState(() {
                                  _loading = true;
                                });
                                _formKey.currentState.save();
                                dynamic result = await widget.authServices
                                    .registerWithEmailAndPassword(
                                  email: _email,
                                  password: _password,
                                  displayName: _completeName,
                                );
                                if (result != null) {
                                  setState(() {
                                    _errorMessage = result;
                                    _wrongCred = true;
                                    _loading = false;
                                  });
                                } else {
                                  AuthServices.isSignedIn = true;
                                  Navigator.pushReplacementNamed(context, '/');
                                }
                              }
                            },
                            child: Text(
                              "Sign Up",
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
                  ],
                ),
              ),
      ),
    );
  }
}
