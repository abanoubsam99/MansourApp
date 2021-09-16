import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

showAlertErrorDialog({BuildContext context,String erorrtext}) {
  // set up the button
  Widget okButton = FlatButton(
    child: Text("Ok"),
    onPressed: () { Navigator.pop(context);},
  );

  // set up the AlertDialog
  AlertDialog alert = AlertDialog(
    title: Center(child: Text("خطأ",style: TextStyle(color: Colors.red),)),
    content: Row(mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(erorrtext),
      ],
    ),
    actions: [
      okButton,
    ],
  );
  // show the dialog
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return alert;
    },
  );
}
