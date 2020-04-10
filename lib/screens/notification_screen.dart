import 'package:cook_book/sysdata/services.dart';
import 'package:flutter/material.dart';
import 'package:line_icons/line_icons.dart';

class NotificationScreen extends StatelessWidget {
  static String pageRoute = '/notification';
  double height;
  double width;
  @override
  Widget build(BuildContext context) {
    width = Services.width(context);
    height = Services.height(context);
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Notifications',
          style: TextStyle(
            fontFamily: "SulphurPoint",
          ),
        ),
        centerTitle: true,
      ),
      body: Container(
        height: height,
        width: width,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              LineIcons.bell,
              size: 100,
            ),
            SizedBox(
              height: 20,
            ),
            Text(
              'All Caught Up',
              style: TextStyle(
                fontFamily: "SuphurPoint",
                fontSize: 35,
              ),
            )
          ],
        ),
      ),
    );
  }
}
