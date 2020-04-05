import 'package:cook_book/components/loading.dart';
import '../../sysdata/services.dart';
import 'package:flutter/material.dart';

class CategoriesTab extends StatefulWidget {
  @override
  _CategoriesTabState createState() => _CategoriesTabState();
}

class _CategoriesTabState extends State<CategoriesTab> {
  double height;
  double width;
  bool categoriesHasData = false;

  @override
  Widget build(BuildContext context) {
    height = Services.height(context);
    width = Services.width(context);
    return Container(
      height: height,
      width: width,
      child: (!categoriesHasData)
          ? Loading(label: 'Searching for Data')
          : ListView.builder(
              itemBuilder: (_, i) {
                return;
              },
            ),
    );
  }
}
