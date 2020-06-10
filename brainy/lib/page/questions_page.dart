import 'package:flutter/material.dart';
import '../brainy.dart';
import '../theme/theme.dart';
import 'result.dart';

Brainy brainy = Brainy();

class QuestionsPage extends StatefulWidget {
  @override
  _QuestionsPageState createState() => _QuestionsPageState();
}

class _QuestionsPageState extends State<QuestionsPage> {
  
  String userResponse = "";
  int currentQ = brainy.currentQuestion();

  void checkAnswer(String option) {
    String correctAnswer = brainy.getCorrectAnswer();

    setState(() {
      userResponse = option;
        
       if (userResponse == correctAnswer) {
        brainy.incrementScore();
        if (brainy.isFinished() == true) {
//        Navigator.sth to the results page
//      Throw an alert to the user that evaluation has finished
  
        Navigator.of(context).pushReplacement(MaterialPageRoute(
            builder: (ctx) => ResultPage(
                  correctScore: brainy.correctResponse,
                  wrongScore: brainy.wrongResponse,
                  totalScore: brainy.numberOfQuestions().floorToDouble(),
                  result: "Output Will be displayed here\nThanks",
                )));}
        brainy.nextQuestion();
      } else {
        brainy.decrementScore();
        brainy.nextQuestion();
        if (brainy.isFinished() == true) {
//        Navigator.sth to the results page
//      Throw an alert to the user that evaluation has finished
  
        Navigator.of(context).pushReplacement(MaterialPageRoute(
            builder: (ctx) => ResultPage(
                  correctScore: brainy.correctResponse,
                  wrongScore: brainy.wrongResponse,
                  totalScore: brainy.numberOfQuestions().floorToDouble(),
                  result: "Output Will be displayed here\nThanks",
                )));}
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: primarylightColor,
      appBar: customAppbar(context, "${brainy.currentQuestion()+1}", brainy.totalQuestions),
      body: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Container(
              height: MediaQuery.of(context).size.height * .3,
              width: MediaQuery.of(context).size.width * .8,
              alignment: Alignment.center,
              child: question(brainy.getQuestionText(), context),
            ),
            Container(
              height: MediaQuery.of(context).size.height * .55,
              width: MediaQuery.of(context).size.width,
              child: SingleChildScrollView(
                  child: Column(
                children: <Widget>[
                  Option(
                      option: brainy.getOptions()[0],
                      selected: "",
                      onTap: () {
                        setState(() {
                          checkAnswer(brainy.getOptions()[0]);
                        });
                      }),
                  Option(
                      option: brainy.getOptions()[1],
                      selected: "",
                      onTap: () {
                        setState(() {
                          checkAnswer(brainy.getOptions()[1]);
                        });
                      }),
                  Option(
                      option: brainy.getOptions()[2],
                      selected: "",
                      onTap: () {
                        setState(() {
                          checkAnswer(brainy.getOptions()[2]);
                        });
                      }),
                  Option(
                      option: brainy.getOptions()[3],
                      selected: "",
                      onTap: () {
                        setState(() {
                          checkAnswer(brainy.getOptions()[3]);
                        });
                      }),

                  /*ListView.builder(
                      itemCount: questionOptions.length,
                      itemBuilder: (BuildContext ctx, int index) {
                        return Option(
                          option: questionOptions[index],
                        );
                      })*/
                ],
              )),
            ),
          ]),
    );
  }
}

AppBar customAppbar(BuildContext context, currentQuestion, int totalQuestions) {
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

Text question(String question, BuildContext ctx) {
  return Text(
    question,
    style: Theme.of(ctx).textTheme.bodyText1,
  );
}

class Option extends StatelessWidget {
  final String option;
  final String selected;
  final Function onTap;
  Option({this.option, this.selected, this.onTap});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: GestureDetector(
          onTap: onTap,
          /*() {
            print("The answer is: $option");
            */ /*Navigator.of(context).pushReplacement(MaterialPageRoute(
                builder: (ctx) => ResultPage(
                      correctScore: 70.0,
                      wrongScore: 30.0,
                      totalScore: 100,
                      result: "Output Will be displayed here\nThanks",
                    )))*/ /*
          }*/
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