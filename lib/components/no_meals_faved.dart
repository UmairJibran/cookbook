import 'package:flutter/material.dart';

class NoMealsFaved extends StatelessWidget {
  const NoMealsFaved({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            "¯\\_(ツ)_/¯",
            style: TextStyle(
              fontSize: 40,
            ),
          ),
          Text(
            "No Meal Favourited\nyet!",
            textAlign: TextAlign.center,
            style: Theme.of(context).textTheme.display4,
          ),
          SizedBox(height: 80),
        ],
      ),
    );
  }
}
