import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/foundation.dart';

class Category {
  String catID;
  String catName;
  String catImageURL;

  Category({
    @required this.catID,
    @required this.catImageURL,
    @required this.catName,
  });

  factory Category.fromFirestore(DocumentSnapshot doc) {
    return Category(
      catID: doc['catID'],
      catImageURL: doc['catImageURL'],
      catName: doc['catName'],
    );
  }
  //TODO: calculate number of meals for each category
}
