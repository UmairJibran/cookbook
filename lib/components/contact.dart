import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

contact(context) {
  showDialog(
    context: context,
    builder: (_) => Center(
      child: Material(
        child: Container(
          padding: EdgeInsets.only(left: 20),
          height: 200,
          width: 320,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(5),
            boxShadow: [
              const BoxShadow(
                color: Colors.black12,
                spreadRadius: 2,
                blurRadius: 5,
              ),
            ],
            color: Colors.white,
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              ListTile(
                leading: Icon(
                  Icons.person,
                  color: Colors.black,
                ),
                title: Text(
                  'Umair Jibran',
                  style: TextStyle(
                    fontFamily: "SulphurPoint",
                    fontSize: 17,
                    color: Colors.black,
                  ),
                ),
              ),
              ListTile(
                leading: Icon(
                  Icons.phone,
                  color: Colors.black,
                ),
                title: Text(
                  '00 92 312 0919647',
                  style: TextStyle(
                    fontFamily: "SulphurPoint",
                    fontSize: 17,
                    color: Colors.black,
                  ),
                ),
              ),
              ListTile(
                leading: Icon(
                  Icons.email,
                  color: Colors.black,
                ),
                title: Text(
                  'UmairJibran7@gmail.com',
                  style: TextStyle(
                    fontFamily: "SulphurPoint",
                    fontSize: 17,
                    color: Colors.black,
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
