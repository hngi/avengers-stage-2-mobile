import 'package:brainy/theme/theme.dart';
import 'package:brainy/page/welcome.dart';
import 'package:flutter/material.dart';

main(){

  runApp(MainThread());
}

class MainThread extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: themeLight,
      debugShowCheckedModeBanner: false,
      home: //SplashScrren() The Android Native Splash is in Use,
      WelcomeScreen(),
    );
  }
}