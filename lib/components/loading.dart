import 'dart:math';

import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:cook_book/sysdata/services.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class Loading extends StatelessWidget {
  double height;
  double width;
  final String label;

  int number = 4;
  Loading({this.label = ''});

  @override
  Widget build(BuildContext context) {
    number = new Random().nextInt(4);
    height = Services.height(context);
    width = Services.width(context);

    return Container(
      height: height,
      width: width,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          if (number == 0)
            Container(
              height: 90,
              child: SpinKitFoldingCube(
                color: Theme.of(context).accentColor,
                size: 80.0,
              ),
            ),
          if (number == 1)
            Container(
              height: 90,
              child: SpinKitPulse(
                color: Theme.of(context).accentColor,
                size: 80.0,
              ),
            ),
          if (number == 2)
            Container(
              height: 90,
              child: SpinKitWave(
                type: SpinKitWaveType.center,
                color: Theme.of(context).accentColor,
                size: 80.0,
              ),
            ),
          if (number == 3)
            Container(
              height: 90,
              child: SpinKitCubeGrid(
                color: Theme.of(context).accentColor,
                size: 80.0,
              ),
            ),
          if (number == 4)
            Container(
              height: 90,
              child: SpinKitFadingCube(
                color: Theme.of(context).accentColor,
                size: 80.0,
              ),
            ),
          SizedBox(
            height: 50.0,
          ),
          SizedBox(
            width: 250.0,
            child: ScaleAnimatedTextKit(
              // isRepeatingAnimation: true,
              totalRepeatCount: 99,
              text: [label],
              textStyle: TextStyle(
                fontSize: 50.0,
                fontFamily: "SulphurPoint",
              ),
              textAlign: TextAlign.center,
              alignment: AlignmentDirectional.topStart,
            ),
          ),
        ],
      ),
    );
  }
}
