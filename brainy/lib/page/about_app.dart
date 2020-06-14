import 'package:flutter/material.dart';

void showAboutPage(context) {
  showAboutDialog(
    context: context,
    applicationName: "Brainy IQ",
    applicationIcon: Image(
      height: 50,
      width: 50,
      image: ExactAssetImage("assets/icon.png"),
    ),
    applicationLegalese: "© 2020 Team Avengers",
    applicationVersion: "Beta Stage",
    children: <Widget>[
      RichText(
          text: TextSpan(
        children: <TextSpan>[
          TextSpan(
              text:
                  "The goal of Brainy is to determine human's intelligence level by asking some specific questions. It collates the selected options and attempts to measure the user's level of intelligence based on a 0 - 150 grade scale.",
              style: TextStyle(
                  color: Colors.black, fontSize: 14, fontFamily: "Lato"))
        ],
      )),
    ],
  );
}
