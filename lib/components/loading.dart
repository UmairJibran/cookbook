import 'package:cook_book/sysdata/services.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class Loading extends StatelessWidget {
  double height;
  double width;

  @override
  Widget build(BuildContext context) {
    height = Services.height(context);
    width = Services.width(context);
    return Container(
      height: height,
      width: width,
      child: Center(
        child: SpinKitFoldingCube(
          color: Theme.of(context).accentColor,
          size: 80.0,
        ),
      ),
    );
  }
}
