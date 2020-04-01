import 'package:cook_book/bloc/navigation_bloc.dart';
import 'package:cook_book/models/category.dart';
import 'package:cook_book/screens/category_screen.dart';
import 'package:cook_book/sysdata/services.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CategoryCard extends StatelessWidget {
  double width;
  double height;
  final Category currentCategory;
  CategoryCard({this.currentCategory});
  @override
  Widget build(BuildContext context) {
    width = Services.width(context);
    height = Services.height(context);
    return Container(
      width: width,
      height: height * 0.38,
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          onTap: () {
            // BlocProvider.of<NavigationBloc>(context).add(
            //   CatTapped(
            //     category: currentCategory,
            //   ),
            // );
            Navigator.of(context).push(
              MaterialPageRoute(
                builder: (_) => CategoryScreen(
                  catName: currentCategory.catName,
                  meals: currentCategory.meals,
                ),
              ),
            );
          },
          child: Center(
            child: Stack(
              children: <Widget>[
                Container(
                  height: height,
                  margin: EdgeInsets.only(bottom: 2),
                  child: Image.network(
                    "${currentCategory.catImageURL}",
                    fit: BoxFit.fitHeight,
                  ),
                ),
                Center(
                  child: Text(
                    "${currentCategory.catName}",
                    style: Theme.of(context).textTheme.title,
                  ),
                ),
                Positioned(
                  top: 10,
                  right: 10,
                  child: Container(
                    padding: EdgeInsets.all(5),
                    width: width * 0.1,
                    height: width * 0.1,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(
                        width * 0.1,
                      ),
                      gradient: LinearGradient(
                        colors: [
                          Color(0xff1290D1),
                          Color(0xff12D1C4),
                        ],
                        begin: Alignment.centerLeft,
                        end: Alignment.centerRight,
                      ),
                    ),
                    child: Center(
                      child: Text(
                        "${currentCategory.meals.length}",
                        style: TextStyle(
                          color: Colors.white,
                          fontFamily: "Angostura-Gaunt",
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
