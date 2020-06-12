import 'package:brainy/page/welcome.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class OnBoarding extends StatefulWidget {
  @override
  _OnBoardingState createState() => _OnBoardingState();
}

class _OnBoardingState extends State<OnBoarding> {
  @override
  void initState() {
    super.initState();

    SystemUiOverlayStyle.light.copyWith(
      statusBarColor: Colors.transparent,
    );
//        systemNavigationBarColor: Colors.transparent);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
          Container(
            margin: EdgeInsets.only(top: 42.0, bottom: 42.0),
            child: Image.asset(
              'assets/brain.png',
              height: 100.0,
            ),
          ),
          Text(
            'Welcome to \n Brainy!',
            textAlign: TextAlign.center,
            style: TextStyle(
                fontSize: 28.0,
                fontFamily: 'Lato',
                fontWeight: FontWeight.w900,
                color: Colors.black),
          ),
          Container(
            margin:
                EdgeInsets.only(left: 24.0, right: 24.0, top: 36, bottom: 36),
            child: Text(
              'Test your IQ, Boost your memory and understand your intellectual strengths',
              textAlign: TextAlign.center,
              style: TextStyle(
                  fontSize: 20.0,
                  fontFamily: 'Lato',
                  fontWeight: FontWeight.w600,
                  color: Colors.black),
            ),
          ),
          InkWell(
            child: Container(
              width: 200.0,
              margin: EdgeInsets.only(left: 8.0, right: 8.0, top: 40.0),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(8.0)),
                  color: Color(0xFF040c4f)),
              child: FlatButton(
                onPressed: () {
                  Navigator.pushReplacement(context,
                      MaterialPageRoute(builder: (context) => WelcomeScreen()));
                },
                child: Text(
                  "Go",
                  style: TextStyle(
                      fontSize: 20.0,
                      color: Color(0XFFFFFFFF),
                      fontWeight: FontWeight.w600),
                ),
              ),
            ),
          )
        ]));
  }
}
