import '../../components/category_card.dart';
import '../../data/dummy_data.dart';
import '../../sysdata/services.dart';
import 'package:flutter/material.dart';

class CategoriesTab extends StatelessWidget {
  double height;
  double width;
  @override
  Widget build(BuildContext context) {
    height = Services.height(context);
    width = Services.width(context);
    return Container(
      height: height,
      width: width,
      child: (DUMMY.dummyCategories.length < 1)
          ? Container(
              child: Center(
                child: Text(
                  "Nothing Found",
                ),
              ),
            )
          : ListView.builder(
              itemCount: DUMMY.dummyCategories.length,
              itemBuilder: (_, index) {
                return CategoryCard(
                  currentCategory: DUMMY.dummyCategories[index],
                );
              },
            ),
    );
  }
}
