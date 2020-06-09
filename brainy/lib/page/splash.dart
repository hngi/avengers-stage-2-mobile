import 'dart:async';
import 'package:brainy/page/welcome.dart';
import 'package:brainy/theme/theme.dart';
import 'package:flutter/material.dart';

class SplashScrren extends StatefulWidget {
  @override
  _SplashScrrenState createState() => _SplashScrrenState();
}

class _SplashScrrenState extends State<SplashScrren> {
  @override
  void initState() {
    super.initState();
    Timer(
        Duration(seconds: 1),
        () => Navigator.of(context).pushReplacement(MaterialPageRoute(
            builder: (BuildContext context) => (WelcomeScreen()))));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        alignment: Alignment.center,
        padding: EdgeInsets.all(20),
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        decoration: BoxDecoration(
          gradient: gradientBg,
        ),
        child: Stack(children: <Widget>[
          Align(
            alignment: Alignment.center,
            child: Image(
                height: 100,
                width: 100,
                image: ExactAssetImage("assets/splash.png")),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Padding(
              padding: const EdgeInsets.only(bottom: 10.0),
              child: CircularProgressIndicator(
                backgroundColor: Colors.white,
                valueColor: AlwaysStoppedAnimation<Color>(Color(0xFF040c4f)),
              ),
            ),
          ),
        ]),
      ),
    );
  }
}
