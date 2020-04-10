import 'package:cook_book/sysdata/services.dart';
import 'package:firebase_admob/firebase_admob.dart';
import 'package:flutter/material.dart';

class ResourcesPage extends StatefulWidget {
  static String pageRoute = '/resourcesPage';
  String bannerAdUnitId = 'ca-app-pub-3311480830735309/5053308832';
  @override
  _ResourcesPageState createState() => _ResourcesPageState();
}

class _ResourcesPageState extends State<ResourcesPage> {
  double height;
  double width;
  List<String> resources;
  BannerAd myBanner;
  @override
  void initState() {
    super.initState();
    myBanner = BannerAd(
      adUnitId: widget.bannerAdUnitId,
      size: AdSize.fullBanner,
    );
    resources = [
      "Free Pik",
      "Icons 8",
      "BBC Recipes",
      "HUM Masala TV",
      "Just a Name",
      "BBC Recipes",
      "HUM Masala TV",
      "Just a Name",
      "BBC Recipes",
      "HUM Masala TV",
      "Just a Name",
      "BBC Recipes",
      "HUM Masala TV",
      "Just a Name",
      "BBC Recipes",
      "HUM Masala TV",
      "Just a Name",
      "BBC Recipes",
      "HUM Masala TV",
      "Just a Name",
    ];
  }

  @override
  void dispose() {
    super.dispose();
    myBanner?.dispose();
    myBanner = null;
  }

  void _showBanner() {
    myBanner
      ..load()
      ..show(
        anchorOffset: 0.0,
        horizontalCenterOffset: 0.0,
        anchorType: AnchorType.bottom,
      );
  }

  @override
  Widget build(BuildContext context) {
    height = Services.height(context);
    width = Services.width(context);
    _showBanner();
    return Scaffold(
      appBar: AppBar(
        title: Text('Resources'),
        centerTitle: true,
      ),
      body: Container(
        height: height * 0.82,
        width: width,
        padding: EdgeInsets.only(
          top: 20,
        ),
        color: Colors.white,
        child: ListView.builder(
          itemCount: resources.length,
          itemBuilder: (_, index) => Center(
            child: Container(
              height: height * 0.1,
              width: width * 0.8,
              decoration: BoxDecoration(
                color: Colors.white,
                boxShadow: [
                  const BoxShadow(
                    color: Colors.black12,
                    spreadRadius: 1,
                    blurRadius: 2,
                  ),
                ],
              ),
              margin: EdgeInsets.only(top: 10),
              padding: EdgeInsets.only(
                top: height * 0.03,
                left: width * 0.03,
              ),
              child: Text(
                "${resources[index]}",
                style: TextStyle(
                  fontFamily: "SulphurPoint",
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
