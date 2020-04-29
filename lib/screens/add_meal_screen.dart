import 'dart:io';
import 'dart:async';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:cook_book/sysdata/services.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:image/image.dart' as im;
import 'package:image_picker/image_picker.dart';
import 'package:path_provider/path_provider.dart';
import 'package:uuid/uuid.dart';

class AddMeal extends StatefulWidget {
  static String pageRoute = '/AddMealScreen';
  @override
  _AddMealState createState() => _AddMealState();
}

class _AddMealState extends State<AddMeal> {
  double height;
  double width;
  File _file;
  String mealID;
  Map<String, String> tempMap;
  Firestore _firestore = Firestore.instance;
  var _key = GlobalKey<FormState>();
  TextEditingController _myIngController = new TextEditingController();
  TextEditingController _myStepsController = new TextEditingController();
  String _mealName;
  bool _isHalal;
  bool _isVegan;
  bool _isVegitarian;
  String _mealCategory;
  String _mealURL;
  double _mealAffordability;
  double _mealComplexity;
  double _mealServing;
  int _mealPrepTime;
  List<String> _mealPrepSteps;
  List<String> _mealIngredients;

  @override
  void initState() {
    super.initState();
    _mealName = '';
    _mealPrepSteps = [];
    _mealAffordability = 0.0;
    _mealComplexity = 0.0;
    _mealCategory = '';
    _mealIngredients = [];
    _mealPrepTime = 0;
    _mealServing = 0.0;
    _isVegitarian = false;
    _isHalal = false;
    _isVegan = false;
  }

  @override
  Widget build(BuildContext context) {
    height = Services.height(context);
    width = Services.width(context);
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          'Add Meal',
        ),
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.all(30),
          child: Form(
            key: _key,
            child: Column(
              children: <Widget>[
                Row(
                  children: <Widget>[
                    Container(
                      width: width * 0.7,
                      child: TextFormField(
                        decoration: InputDecoration(
                          hintText: 'Meal Name',
                        ),
                        onChanged: (value) {
                          _mealName = value;
                        },
                        validator: (value) {
                          if (value.isEmpty) {
                            return 'please Enter a meal name';
                          }
                          return null;
                        },
                      ),
                    ),
                    Container(
                      child: IconButton(
                        onPressed: () => imageProcessing(context),
                        icon: Icon(
                          _file == null ? Icons.camera_enhance : Icons.done,
                          size: 30,
                          color: _file == null
                              ? Theme.of(context).primaryColorDark
                              : Colors.green,
                        ),
                      ),
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: <Widget>[
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Text(
                          'Halal',
                          style: TextStyle(
                            fontSize: 20,
                          ),
                        ),
                        Checkbox(
                          value: _isHalal,
                          onChanged: (value) {
                            setState(
                              () {
                                _isHalal = value;
                              },
                            );
                          },
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Text(
                          'Vegan',
                          style: TextStyle(
                            fontSize: 20,
                          ),
                        ),
                        Checkbox(
                          value: _isVegan,
                          onChanged: (value) {
                            setState(
                              () {
                                _isVegan = value;
                              },
                            );
                          },
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Text(
                          'Vegitarian',
                          style: TextStyle(
                            fontSize: 20,
                          ),
                        ),
                        Checkbox(
                          value: _isVegitarian,
                          onChanged: (value) {
                            setState(
                              () {
                                _isVegitarian = value;
                              },
                            );
                          },
                        ),
                      ],
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Text('Affordability'),
                    Slider(
                      label: '${_mealAffordability.toInt()}',
                      min: 0,
                      max: 3,
                      divisions: 3,
                      value: _mealAffordability,
                      onChanged: (value) {
                        setState(
                          () {
                            _mealAffordability = value;
                          },
                        );
                      },
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Text('Complexity'),
                    Slider(
                      min: 0,
                      max: 3,
                      divisions: 3,
                      label: '${_mealComplexity.toInt()}',
                      value: _mealComplexity,
                      onChanged: (value) {
                        setState(
                          () {
                            _mealComplexity = value;
                          },
                        );
                      },
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Text('Servings'),
                    Slider(
                      min: 0,
                      max: 12,
                      divisions: 12,
                      label: '${_mealServing.toInt()}',
                      value: _mealServing,
                      onChanged: (value) {
                        setState(
                          () {
                            _mealServing = value;
                          },
                        );
                      },
                    ),
                  ],
                ),
                TextFormField(
                  decoration: InputDecoration(
                    hintText: 'Preperation Time',
                    helperText: 'Please Enter time in minutes',
                    suffixText: 'Minutes',
                  ),
                  keyboardType: TextInputType.number,
                  onChanged: (value) {
                    _mealPrepTime = int.parse(value);
                  },
                  validator: (value) {
                    if (value.isEmpty) {
                      return 'please Enter Duration';
                    } else if (value.contains(' ')) {
                      return 'Please don\'t enter spaces';
                    } else if (value.contains(',')) {
                      return 'Please don\'t enter comma';
                    } else if (value.contains('.')) {
                      return 'Please don\'t enter periods';
                    } else if (value.contains('-')) {
                      return 'Please don\'t enter dashes';
                    } else if (value == '0' ||
                        value == '00' ||
                        value == '0000' ||
                        value == '000') {
                      return 'Time Can\'t be Zero';
                    }
                    return null;
                  },
                ),
                TextFormField(
                  controller: _myIngController,
                  textCapitalization: TextCapitalization.sentences,
                  validator: (_) {
                    if (_mealIngredients.isEmpty) {
                      return 'please Enter ingredients';
                    } else {
                      return null;
                    }
                  },
                  decoration: InputDecoration(
                    hintText: "Ingredients",
                  ),
                  onFieldSubmitted: (value) {
                    _mealIngredients.add(value);
                    if (value.isNotEmpty) _myIngController.clear();
                    print(_mealIngredients);
                  },
                ),
                TextFormField(
                  controller: _myStepsController,
                  textCapitalization: TextCapitalization.sentences,
                  validator: (_) {
                    if (_mealPrepSteps.isEmpty) {
                      return 'please Enter Steps to prepare';
                    } else {
                      return null;
                    }
                  },
                  decoration: InputDecoration(
                    hintText: "Prep Steps",
                  ),
                  onFieldSubmitted: (value) {
                    if (value.isNotEmpty) _mealPrepSteps.add(value);
                    _myStepsController.clear();
                    print(_mealPrepSteps);
                  },
                ),
                Align(
                  alignment: Alignment.centerRight,
                  child: FlatButton(
                    onPressed: () => submitData(),
                    child: Text(
                      'Add Meal',
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

  void submitData() async {
    if (_key.currentState.validate() && _file != null) {
      _key.currentState.save();
      print('uploading');
      _mealURL = await uploadImage();
      print('here');
      var _newMeal = await _firestore.collection('meals').add({
        'affordability': _mealAffordability.toInt(),
        'catID': "UserSpecial",
        'complexity': _mealComplexity.toInt(),
        'isHalal': _isHalal,
        'isVegan': _isVegan,
        'isVegitarian': _isVegitarian,
        'mealImageUrl': _mealURL,
        'mealIngredients': _mealIngredients,
        'mealName': _mealName,
        'prepSteps': _mealPrepSteps,
        'prepTime': _mealPrepTime.toInt(),
        'serving': _mealServing.toInt(),
        'timeStamp': DateTime.now(),
        'totalLikes': 0,
        'addedBy': Services.userID,
      }).timeout(Duration(seconds: 10));
      await _newMeal.updateData({
        'mealID': _newMeal.documentID,
      });
      _key.currentState.reset();
    } else {
      print('not uploading');
    }
  }

  Future<String> uploadImage() async {
    StorageUploadTask uploadTask = FirebaseStorage.instance
        .ref()
        .child("meals/${_mealName}_$mealID.jpg")
        .putFile(_file);
    print('b');
    StorageTaskSnapshot storagesnap = await uploadTask.onComplete;
    print('a');
    String imageURL = await storagesnap.ref.getDownloadURL();
    print('download URL: $imageURL');
    return imageURL;
  }

  compressImage() async {
    final _tempDir = await getTemporaryDirectory();
    final _path = _tempDir.path;
    im.Image imageFile = im.decodeImage(_file.readAsBytesSync());
    mealID = Uuid().v4();
    final compressedImageFile = File('$_path/img_$mealID.jpg')
      ..writeAsBytesSync(im.encodeJpg(imageFile, quality: 80));
    setState(() {
      _file = compressedImageFile;
    });
  }

  Future getImageFromCamera() async {
    Navigator.pop(context);
    var image = await ImagePicker.pickImage(
      source: ImageSource.camera,
      imageQuality: 50,
    );
    setState(() {
      _file = image;
    });
    await compressImage();
  }

  Future getImageFromGallery() async {
    Navigator.pop(context);
    var image = await ImagePicker.pickImage(
      source: ImageSource.gallery,
      imageQuality: 50,
    );
    setState(() {
      _file = image;
    });
    await compressImage();
  }

  imageProcessing(context) {
    showModalBottomSheet(
      context: context,
      builder: (_) => Container(
        padding: EdgeInsets.only(top: 30),
        height: height * 0.3,
        child: Column(
          children: <Widget>[
            Text('Select Source'),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: <Widget>[
                Column(
                  children: <Widget>[
                    Container(
                      height: 60,
                      width: 60,
                      child: IconButton(
                        icon: Icon(
                          Icons.camera_alt,
                          size: 50,
                        ),
                        onPressed: getImageFromCamera,
                      ),
                    ),
                    Text("Capture"),
                  ],
                ),
                Column(
                  children: <Widget>[
                    Container(
                      height: 60,
                      width: 60,
                      child: IconButton(
                        icon: Icon(
                          Icons.photo,
                          size: 50,
                        ),
                        onPressed: getImageFromGallery,
                      ),
                    ),
                    Text('Gallery'),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
