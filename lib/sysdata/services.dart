import 'package:flutter/material.dart';

class Services {
  static double height(BuildContext context) {
    return MediaQuery.of(context).removePadding(removeTop: true).size.height;
  }

  static double width(BuildContext context) {
    return MediaQuery.of(context).size.width;
  }
}
