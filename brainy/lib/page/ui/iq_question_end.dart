import 'package:flutter/material.dart';

import '../result.dart';

class IQEnds {
  final username;
  final double correctScore;
  final double wrongScore;
  final double totalScore;
  final String msg;

  IQEnds({this.username, this.correctScore, this.totalScore, this.wrongScore, this.msg});

  showEndMsg(context) {
    
    showDialog<void>(
      barrierDismissible: false,
      context: context,
      builder: (BuildContext context) {
        return WillPopScope(
          onWillPop: () {
            return Future.value(false);
          },
          child: AlertDialog(
            elevation: 10,
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
            backgroundColor: Theme.of(context).colorScheme.secondary,
            title: Text(
              'Hi $username',
              style:
                  TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
            ),
            content:  Text(
                msg,
                style: TextStyle(color: Colors.black, fontSize: 16)),
            actions: <Widget>[
              FlatButton(
                child: Text(
                  'Proceed',
                  style: TextStyle(fontSize: 18),
                ),
                onPressed: () {
                  Navigator.of(context).pop();
                  Navigator.of(context).pushReplacement(MaterialPageRoute(
                      builder: (ctx) => ResultPage(
                            correctScore: correctScore,
                            wrongScore: wrongScore,
                            totalScore: totalScore,
                            username: username,
                          )));
                },
              ),
            ],
          ),
        );
      },
    );
  }
}
