import 'package:cook_book/screens/login.dart';
import 'package:flutter/material.dart';

class NotSignedIn extends StatelessWidget {
  const NotSignedIn({
    Key key,
    @required this.height,
  }) : super(key: key);

  final double height;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: <Widget>[
          SizedBox(height: height * 0.2),
          Text(
            "Sign In to Favourite\nMeals!",
            textAlign: TextAlign.center,
            style: Theme.of(context).textTheme.display4,
          ),
          SizedBox(height: 30),
          FlatButton(
            color: Theme.of(context).accentColor,
            onPressed: () {
              Navigator.pushNamed(context, Login.pageRoute);
            },
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Text(
                "Log In / Sign Up",
                style: TextStyle(
                  color: Colors.white,
                  fontFamily: "SulphurPoint",
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
