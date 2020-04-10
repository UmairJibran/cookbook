import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:cook_book/sysdata/services.dart';
import 'package:flutter/material.dart';

void reportABug(context) {
  String bugMessage = '';
  var _key = GlobalKey<FormState>();
  showModalBottomSheet(
    context: context,
    builder: (_) => Container(
      width: MediaQuery.of(context).size.width,
      height: 450,
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          const BoxShadow(
            color: Colors.black12,
            spreadRadius: 2,
            offset: Offset(
              1.0,
              1.0,
            ),
          ),
        ],
      ),
      padding: EdgeInsets.only(left: 30, right: 30),
      child: Column(
        children: <Widget>[
          SizedBox(height: 10),
          Text(
            "Report a Bug",
            style: TextStyle(
              fontFamily: "SulphurPoint",
            ),
          ),
          Form(
            child: TextFormField(
              autovalidate: true,
              autocorrect: true,
              autofocus: true,
              textCapitalization: TextCapitalization.sentences,
              enableSuggestions: true,
              minLines: 1,
              maxLines: 20,
              validator: (value) {
                if (value.isEmpty) {
                  return "Please Tell us about the bug!";
                } else if (value.length < 20) {
                  return "Please explain it a bit more";
                } else {
                  return null;
                }
              },
              onChanged: (value) {
                bugMessage = value;
              },
            ),
            key: _key,
          ),
          Align(
            alignment: Alignment.bottomRight,
            child: FlatButton(
              onPressed: () async {
                if (_key.currentState.validate()) {
                  _key.currentState.save();
                  await Firestore.instance.collection('bugbucket').add({
                    'requester': Services.displayName ?? 'Anonymous',
                    'suggesion': bugMessage,
                  });
                  Navigator.pop(context);
                }
              },
              child: Text("Report"),
            ),
          ),
        ],
      ),
    ),
  );
}
