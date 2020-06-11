import 'package:flutter/material.dart';

import '../result.dart';


class IQEnds {
final username;
final double correctScore;
  final double wrongScore;
  final double totalScore;
  
IQEnds({this.username, this.correctScore, this.totalScore, this.wrongScore});

showEndMsg(context){

showDialog<void>(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        backgroundColor: Theme.of(context).colorScheme.primaryVariant,
        title: Text('Hi $username', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),),
        content: const Text('You have successfully completed the test proceed for the result', style: TextStyle(color: Colors.white, fontSize: 16)),
        actions: <Widget>[
          FlatButton(
            child: Text('Proceed', style: Theme.of(context).textTheme.bodyText2,),
            onPressed: (){
              Navigator.of(context).pop();
              Navigator.of(context).pushReplacement(MaterialPageRoute(
              builder: (ctx) => ResultPage(
                    correctScore: correctScore,
                    wrongScore: wrongScore,
                    totalScore: totalScore,
                    username: username,
                  )));},
          ),
        ],
      );
    },
  );

}
}