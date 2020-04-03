import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:cook_book/sysdata/services.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class Loading extends StatelessWidget {
  double height;
  double width;
  final String label;

  Loading({this.label = ''});

  @override
  Widget build(BuildContext context) {
    height = Services.height(context);
    width = Services.width(context);
    return Container(
      height: height,
      width: width,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          SpinKitFoldingCube(
            color: Theme.of(context).accentColor,
            size: 80.0,
          ),
          SizedBox(
            height: 50.0,
          ),
          SizedBox(
            width: 250.0,
            child: ScaleAnimatedTextKit(
                text: [label, label, label],
                textStyle: TextStyle(
                  fontSize: 50.0,
                  fontFamily: "SulphurPoint",
                ),
                textAlign: TextAlign.center,
                alignment: AlignmentDirectional.topStart // or Alignment.topLeft
                ),
          ),
        ],
      ),
    );
  }
}
