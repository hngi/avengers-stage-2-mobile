import 'package:brainy/page/iq.dart';
import 'package:flutter/material.dart';

import '../theme/theme.dart';

class WelcomeScreen extends StatefulWidget {
  @override
  _WelcomeScreenState createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {
  String validatorErrorText;
  double keyboardVisbleHeight = 0.5;
  TextEditingController usernameTextController = TextEditingController();
  
  void validateUserInput() {
    var username = usernameTextController.text.toString().trim();
    final RegExp nameRegExp = RegExp('[a-zA-Z]');
  setState(() {
    if (username.isEmpty) {
      validatorErrorText = "Required";
    } else if (nameRegExp.matchAsPrefix(username) == null) {
      validatorErrorText = "Name not valid";
    } else {
      validatorErrorText = null;
    }
  });
    
  }

  void registerUser(){
    validateUserInput();
    if(validatorErrorText == null && usernameTextController.text.isNotEmpty){
      Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (ctx)=>IQTestScreen()));
      print(".........Register User...........");
      
            
    }
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Container(
        padding: EdgeInsets.all(20),
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        decoration: BoxDecoration(
          gradient: gradientBg
        ),
        child: SingleChildScrollView(
          child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                SizedBox(
                  height: MediaQuery.of(context).viewInsets.bottom == 0.0? MediaQuery.of(context).size.height *.2 : MediaQuery.of(context).size.height *.03,
                ),
                Text('Hi', style: Theme.of(context).textTheme.headline1,),
                Text('I\'m Brainy\nYour IQ Evaluator\n\n',
                    style:Theme.of(context).textTheme.headline2),
                Text('What can i call you?',
                    style: Theme.of(context).textTheme.headline3),
                SizedBox(
                  height: MediaQuery.of(context).size.height * .03,
                ),
                Center(
                  child: Container(
                    width: MediaQuery.of(context).size.width * .7,
                    child: TextField(
                      controller: usernameTextController,
                      cursorColor: Colors.white,
                      style: TextStyle(color: Colors.white, fontSize: 20),
                      
                      textInputAction: TextInputAction.go,
                      onSubmitted: (_){registerUser();},
                      onEditingComplete: () {
                        validateUserInput();
                      },
                      decoration: InputDecoration(
                        focusedBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: Colors.white)
                        ),
                        border: UnderlineInputBorder(
                          borderSide: BorderSide(color: Colors.white)
                        ),
                          errorText: validatorErrorText,
                          focusColor: Colors.white,
                          enabledBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: Colors.white),
                          ),
                          labelText: "Call me",
                          labelStyle:
                              Theme.of(context).textTheme.headline4),
                    ),
                  ),
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * .05,
                ),
                Center(
                  child: GestureDetector(
                      onTap: () {
                        registerUser();
                      },
                      child: Container(
                        padding: EdgeInsets.symmetric(
                            vertical: 20,
                            horizontal: MediaQuery.of(context).size.width * .3),
                        decoration: BoxDecoration(
                            border: Border.all(color: Colors.white),
                            borderRadius: BorderRadius.circular(30)),
                        child: Text(
                          'Proceed',
                          style: Theme.of(context).textTheme.bodyText1,
                        ),
                      )),
                ),
                SizedBox(
                  height: MediaQuery.of(context).viewInsets.bottom == 0.0
                      ? 0.0
                      : MediaQuery.of(context).viewInsets.bottom,
                ),
              ]),
        ),
      ),
    );
  }
}