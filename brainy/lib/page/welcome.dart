import 'package:brainy/page/about_app.dart';
import 'package:brainy/page/home.dart';
import 'package:brainy/page/questions_page.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

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

  void registerUser() async{
    
    validateUserInput();
    if (validatorErrorText == null && usernameTextController.text.isNotEmpty) {
      SharedPreferences pref = await SharedPreferences.getInstance();
     await pref.setString("username", usernameTextController.text);
      Navigator.of(context).pushReplacement(MaterialPageRoute(
          builder: (ctx) =>
              HomeScreen()
              ));
    }
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScopeNode currentFocus = FocusScope.of(context);
        if (!currentFocus.hasPrimaryFocus) {
          currentFocus.unfocus();
        }
      },
      child: Scaffold(
        body: Container(
          padding: EdgeInsets.all(20),
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          decoration: BoxDecoration(gradient: gradientBg),
          child: SingleChildScrollView(
            child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  SizedBox(
                    height: MediaQuery.of(context).viewInsets.bottom == 0.0
                        ? MediaQuery.of(context).size.height * .05
                        : 0,
                  ),
                  Align(
                    alignment: Alignment.topRight,
                    child: IconButton(
                      iconSize: 30,
                      onPressed: () => showAboutPage(context),
                      icon: Icon(
                        Icons.info,
                        color: Theme.of(context).colorScheme.secondary,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).viewInsets.bottom == 0.0
                        ? MediaQuery.of(context).size.height * .1
                        : MediaQuery.of(context).size.height * .03,
                  ),
                  Text(
                    'Hi',
                    style: Theme.of(context).textTheme.headline1,
                  ),
                  Text('I\'m Brainy\nYour IQ Evaluator\n\n',
                      style: Theme.of(context).textTheme.headline2),
                  Text('What can I call you?',
                      style: Theme.of(context).textTheme.headline3),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * .03,
                  ),
                  Center(
                    child: Container(
                      width: MediaQuery.of(context).size.width * .8,
                      child: TextField(
                        textCapitalization: TextCapitalization.words,
                        controller: usernameTextController,
                        cursorColor: Colors.white,
                        style: TextStyle(color: Colors.white, fontSize: 20),
                        textInputAction: TextInputAction.go,
                        onSubmitted: (_) {
                          registerUser();
                        },
                        onEditingComplete: () {
                          validateUserInput();
                        },
                        decoration: InputDecoration(
                            focusedBorder: UnderlineInputBorder(
                                borderSide: BorderSide(color: Colors.white)),
                            border: UnderlineInputBorder(
                                borderSide: BorderSide(color: Colors.white)),
                            errorText: validatorErrorText,
                            focusColor: Colors.white,
                            enabledBorder: UnderlineInputBorder(
                              borderSide: BorderSide(color: Colors.white),
                            ),
                            labelText: "Call me",
                            labelStyle: Theme.of(context).textTheme.headline4),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * .05,
                  ),
                  Container(
                    alignment: Alignment.center,
                    width: MediaQuery.of(context).size.width * .9,
                    margin: EdgeInsets.symmetric(vertical: 10),
                    padding: EdgeInsets.all(3),
                    child: InkWell(
                      borderRadius: BorderRadius.circular(35),
                      highlightColor: Colors.green,
                      onTap: () {
                        registerUser();
                      },
                      child: Container(
                        width: MediaQuery.of(context).size.width * .9,
                        padding: EdgeInsets.symmetric(
                          vertical: 20,
                        ),
                        decoration: BoxDecoration(
                            border: Border.all(color: Colors.white),
                            borderRadius: BorderRadius.circular(30)),
                        child: Center(
                          child: Text(
                            'Proceed',
                            style: Theme.of(context).textTheme.bodyText1,
                          ),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).viewInsets.bottom == 0.0
                        ? 0.0
                        : MediaQuery.of(context).viewInsets.bottom,
                  ),
                ]),
          ),
        ),
      ),
    );
  }
}
