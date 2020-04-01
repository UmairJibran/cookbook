import 'package:cook_book/components/custom_drawer.dart';
import 'package:share/share.dart';

import '../screens/home_tabs/categories_tab.dart';
import '../screens/home_tabs/popular_tab.dart';
import '../screens/home_tabs/favourites_tab.dart';
import '../sysdata/services.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  double height;
  double width;
  @override
  Widget build(BuildContext context) {
    width = Services.width(context);
    height = Services.height(context);
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          elevation: 10,
          bottom: TabBar(
            indicatorColor: Colors.white,
            tabs: [
              Padding(
                padding: const EdgeInsets.only(
                  bottom: 10,
                  top: 10,
                ),
                child: Text(
                  "Categories",
                  style: Theme.of(context).textTheme.subtitle,
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(
                  bottom: 10,
                  top: 10,
                ),
                child: Text(
                  "Favourites",
                  style: Theme.of(context).textTheme.subtitle,
                ),
              ),
              // Padding(
              //   padding: const EdgeInsets.only(
              //     bottom: 10,
              //     top: 10,
              //   ),
              //   child: Text(
              //     "Popular",
              //     style: Theme.of(context).textTheme.subtitle,
              //   ),
              // ),
            ],
          ),
          title: Center(
            child: Text(
              "CookBook",
            ),
          ),
          actions: <Widget>[
            IconButton(
              icon: Icon(
                Icons.share,
              ),
              onPressed: () {
                Share.share('Share it!');
              },
            )
          ],
        ),
        drawer: CustomDrawer(),
        body: TabBarView(
          children: [
            CategoriesTab(),
            FavouritesTab(),
            // PopularTab(), //TODO: Complete the Logic
          ],
        ),
      ),
    );
  }
}
