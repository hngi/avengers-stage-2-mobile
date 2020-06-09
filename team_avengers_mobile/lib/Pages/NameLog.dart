/*
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class NameLog extends StatefulWidget {
  @override
  _NameLogState createState() => _NameLogState();
}

class _NameLogState extends State<NameLog> {
  TextEditingController nameController = new TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(
          child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                SizedBox(height: 42.0,),
                Image.asset("assets/logo.png",),
                SizedBox(height: 16.0,),
                Text("Welcome", style: Theme.of(context).textTheme.headline1,textAlign: TextAlign.center,),
                SizedBox(height: 16.0,),
                Container(
                  margin:
                  EdgeInsets.only(left: 16.0, right: 16.0, top: 8.0, bottom: 8.0),

                  child: TextField(
                    controller: nameController,
                    textCapitalization: TextCapitalization.words,
                    style: Theme.of(context).textTheme.bodyText1,
                    decoration: InputDecoration(
                      contentPadding: EdgeInsets.only(top: 8.0,bottom: 8.0, left: 16.0),
                      hintStyle: Theme.of(context).textTheme.bodyText1,
                      hintText: "Enter your name",
                      border: new OutlineInputBorder(
                        borderRadius:
                        const BorderRadius.all(const Radius.circular(24.0)),
                        borderSide: new BorderSide(
                            color: Color(0XFF030837),
                            width: 4.0,
                            style: BorderStyle.solid),
                        //gapPadding: 4.0,
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 16.0,),
                Container(
                  margin: EdgeInsets.only(left: 64.0, right: 64.0),
                  width: 250.0,
                  decoration: BoxDecoration(
                      color: Theme.of(context).buttonColor,
                      borderRadius: BorderRadius.circular(24.0),
                      shape: BoxShape.rectangle),
                  child: FlatButton(
                    onPressed: null,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[
                        Expanded(
                            child: Text(
                              "Next",textAlign: TextAlign.center,
                              style: Theme.of(context).textTheme.button,
                            )),
                        Image.asset(
                          "assets/arrowright.png",
                          height: 24.0,
                          width: 24.0,
                          color: Colors.white,
                        )
                      ],
                    ),
                  ),
                )
              ]),
        ));
  }
}
*/

import 'package:flutter/material.dart';

class WelcomeScreen extends StatefulWidget {
  @override
  _WelcomeScreenState createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {
  String validatorErrorText = null;
  double keyboardVisibleHeight = 0.5;
  TextEditingController usernameTextController = TextEditingController();
  @override
  void initState() {

    usernameTextController.clear();
    super.initState();
  }

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

      print(".........Register User...........");

    }else{

      print(".........Error...........");
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
          gradient: LinearGradient(
              colors: [Color(0xFF040c4f), Color(0xFF030837)],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,

              tileMode: TileMode.clamp

          ),
        ),
        child: SingleChildScrollView(
          child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                SizedBox(
                  height: MediaQuery.of(context).viewInsets.bottom == 0.0? MediaQuery.of(context).size.height *.2 : MediaQuery.of(context).size.height *.03,
                ),
                Text('Hi', style: TextStyle(fontSize: 40, color: Colors.white)),
                Text('I\'m Brainy\nYour IQ Evaluator\n\n',
                    style: TextStyle(fontSize: 30, color: Colors.white)),
                Text('What can i call you?',
                    style: TextStyle(fontSize: 20, color: Colors.white)),
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
                          TextStyle(color: Colors.white, fontSize: 18)),
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
                          style: TextStyle(color: Colors.white, fontSize: 18),
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