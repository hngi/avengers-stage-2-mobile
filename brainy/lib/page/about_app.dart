import 'package:flutter/material.dart';




void showAboutPage(context){
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
                    "The goal of Brainy is to determine human's intelligence level by answering or solving some specific questions, it collate the selected options then measure it with a standard prediction technique to evaluate the level of human intelligenc.",
                style: TextStyle(
                    color: Colors.black, fontSize: 14, fontFamily: "Lato"))
          ],
        )),
      ],
    );
}