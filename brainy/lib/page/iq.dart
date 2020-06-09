import 'package:brainy/page/result.dart';
import 'package:brainy/theme/theme.dart';
import "package:flutter/material.dart";

class IQTestScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: primarylightColor,
      appBar: customeAppbar(context, "02", 20),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
        
        
          Container(
            height: MediaQuery.of(context).size.height*.3,
          width: MediaQuery.of(context).size.width*.8,
          alignment: Alignment.center,
            
              child: question(
                  "Which state has the highest percentage of contribution to all revenue in Nigeria",
                  context),
          ),
        Container(
          
          height: MediaQuery.of(context).size.height*.55,
          width: MediaQuery.of(context).size.width,
          child: SingleChildScrollView(
            child: Column(children: <Widget>[
              Option(option: "Ogun State", selected: ""),
              Option(option: "Benue State", selected: ""),
              Option(option: "Delta State", selected: ""),
              Option(option: "Lagos State", selected: ""),
            ],)
          ),
        ),

      ]),
    );
  }
}

Text question(String question, BuildContext ctx) {
  return Text(
    question,
    style: Theme.of(ctx).textTheme.bodyText1,
  );
}

class Option extends StatelessWidget {
  final String option;
  final String selected;
  Option({this.option, this.selected});
  @override
  Widget build(BuildContext context) {
    return Center(
      child: GestureDetector(
          onTap: () {
            print("The answer is: $option");
            Navigator.of(context).pushReplacement(MaterialPageRoute(
                builder: (ctx) => ResultPage(
                      correctScore: 70.0,
                      wrongScore: 30.0,
                      totalScore: 100,
                      result: "Output Will be displayed here\nThanks",
                    )));
          },
          child: Container(
            margin: EdgeInsets.symmetric(vertical: 10),
            padding: EdgeInsets.symmetric(
                vertical: 20,
                horizontal: MediaQuery.of(context).size.width * .3),
            decoration: BoxDecoration(
                border: selected != option
                    ? Border.all(color: Colors.white)
                    : Border.all(color: Colors.green),
                borderRadius: BorderRadius.circular(30)),
            child: Text(
              option,
              style: Theme.of(context).textTheme.bodyText1,
            ),
          )),
    );
  }
}

AppBar customeAppbar(
    BuildContext context, currentQuestion, int totalQuestions) {
  return AppBar(
    backgroundColor: primarylightColor,
    title: Row(
      children: <Widget>[
        Text(
          'Question ',
          style: Theme.of(context).textTheme.bodyText2,
        ),
        Text(
          currentQuestion,
          style: Theme.of(context).textTheme.bodyText2,
        ),
      ],
    ),
    actions: <Widget>[
      Center(
          child: Text(
        'Total Questions ',
        style: Theme.of(context).textTheme.bodyText2,
      )),
      Center(
          child: Text(
        totalQuestions.toString(),
        style: Theme.of(context).textTheme.bodyText2,
      )),
    ],
  );
}
