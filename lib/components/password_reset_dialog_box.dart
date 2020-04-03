import 'package:cook_book/screens/login.dart';
import 'package:flutter/material.dart';
import '../sysdata/services.dart';

import 'loading.dart';

class PasswordReset extends StatefulWidget {
  final double height;
  final double width;

  const PasswordReset({this.height, this.width});

  @override
  _PasswordResetState createState() => _PasswordResetState();
}

class _PasswordResetState extends State<PasswordReset> {
  AuthServices _auth = AuthServices();
  String _email;
  var _resetKey = GlobalKey<FormState>();
  bool _loading = false;
  @override
  Widget build(BuildContext context) {
    return _loading
        ? Loading()
        : Center(
            child: Material(
              color: Colors.transparent,
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 20),
                height: widget.height * 0.3,
                width: widget.width * 0.85,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(15),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text(
                      "Please Enter your email",
                      style: TextStyle(
                        fontFamily: "SulphurPoint",
                        fontSize: 22,
                      ),
                    ),
                    Text(
                      "Password Reset Link will be sent to you over there",
                      style: TextStyle(
                        fontFamily: "SulphurPoint",
                        fontSize: 14,
                      ),
                    ),
                    Form(
                      key: _resetKey,
                      child: Column(
                        children: [
                          TextFormField(
                            onChanged: (value) {
                              setState(() {
                                _email = value;
                              });
                            },
                            validator: (value) {
                              if (value.isEmpty) {
                                return "Please enter an Email";
                              } else if (!(value.contains('@') &&
                                      value.contains('.')) ||
                                  value.contains(' ')) {
                                return "Please Enter a Valid Email";
                              } else {
                                return null;
                              }
                            },
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
                          Align(
                            alignment: Alignment.centerRight,
                            child: FlatButton(
                              color: Theme.of(context).accentColor,
                              onPressed: () async {
                                if (_resetKey.currentState.validate()) {
                                  setState(() {
                                    _loading = true;
                                  });
                                  Future.delayed(Duration(seconds: 2));
                                  if (_auth.forgottenPassword(_email)) {
                                    showDialog(
                                      context: context,
                                      builder: (_) => Material(
                                        color: Colors.transparent,
                                        child: Center(
                                          child: Container(
                                            decoration: BoxDecoration(
                                              color: Colors.white,
                                              borderRadius:
                                                  BorderRadius.circular(15),
                                            ),
                                            height: widget.height * 0.3,
                                            width: widget.width * 0.85,
                                            child: Align(
                                              alignment: Alignment.center,
                                              child: Padding(
                                                padding:
                                                    const EdgeInsets.symmetric(
                                                        horizontal: 20),
                                                child: Column(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceAround,
                                                  children: <Widget>[
                                                    Text(
                                                      "A Password Reset Link has been sent to your email, kindly check your inbox",
                                                      textAlign:
                                                          TextAlign.center,
                                                      style: TextStyle(
                                                        fontFamily:
                                                            "SulphurPoint",
                                                        fontSize: 16,
                                                      ),
                                                    ),
                                                    FlatButton(
                                                      color: Theme.of(context)
                                                          .primaryColorLight,
                                                      onPressed: () {
                                                        Navigator
                                                            .pushReplacement(
                                                          context,
                                                          MaterialPageRoute(
                                                            builder: (_) =>
                                                                Login(),
                                                          ),
                                                        );
                                                      },
                                                      child: Padding(
                                                        padding:
                                                            const EdgeInsets
                                                                .all(
                                                          15,
                                                        ),
                                                        child: Text(
                                                          "Log in",
                                                          style: TextStyle(
                                                            fontFamily:
                                                                "SulphurPoint",
                                                            color: Colors.white,
                                                            fontSize: 20,
                                                          ),
                                                        ),
                                                      ),
                                                    )
                                                  ],
                                                ),
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                    );
                                  }
                                }
                              },
                              child: Text(
                                'Send Reset Link',
                                style: TextStyle(color: Colors.white),
                              ),
                            ),
                          )
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
