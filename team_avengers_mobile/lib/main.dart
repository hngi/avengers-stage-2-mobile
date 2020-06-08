import 'package:flutter/material.dart';

import 'Pages/NameLog.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        buttonColor: Color(0XFF030837),
        textTheme: TextTheme(
          headline4: TextStyle(
              fontSize: 12.0, fontFamily: "Lato", color: Color(0XFF000000)),
          button: TextStyle(
              fontSize: 14.0, fontFamily: "Lato", fontWeight: FontWeight.bold, color: Color(0XFFFFFFFF)),
          headline1: TextStyle(
              fontSize: 24.0, fontFamily: "Lato", fontWeight: FontWeight.bold),
          bodyText1: TextStyle(
              fontSize: 14.0, fontFamily: "Lato", color: Color(0XFF000000)),
        ),
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: NameLog(),
    );
  }
}
