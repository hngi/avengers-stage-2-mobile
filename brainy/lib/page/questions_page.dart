import 'package:brainy/page/ui/iq_question_end.dart';
import 'package:brainy/page/ui/options.dart';
import 'package:brainy/page/ui/question.dart';
import 'package:brainy/utils/timer.dart';
import 'package:flutter/material.dart';
import '../brainy.dart';
import '../theme/theme.dart';

class QuestionsPage extends StatefulWidget {
  final String username;
  QuestionsPage({this.username});

  @override
  _QuestionsPageState createState() => _QuestionsPageState();
}

class _QuestionsPageState extends State<QuestionsPage> {
  Brainy brainy;
  int currentQ;
  bool stopTimer = false;

  @override
  void initState() {
    brainy = Brainy(username: widget.username);
    currentQ = brainy.currentQuestion();
    super.initState();
  }

  void timeOutTimer() {
    int leftQuestion = brainy.totalQuestions - brainy.currentQuestion();
    int wrongResponse = leftQuestion * 15;
    brainy.decrementScore(score: wrongResponse);
    IQEnds(
      msg: 'You have run out of time, proceed for the result',
      correctScore: brainy.correctResponse,
      wrongScore: brainy.wrongResponse,
      totalScore: brainy.totalScore,
      username: brainy.player,
    ).showEndMsg(context);

    brainy.reset();
  }

  void checkAnswer(String option, ctx) {
    String correctAnswer = brainy.getCorrectAnswer();
    brainy.response = option;
    if (brainy.response == correctAnswer) {
      brainy.incrementScore();
      if (brainy.isFinished()) {
        stopTimer = true;
//        Navigator.sth to the results page
//      Throw an alert to the user that evaluation has finished
        IQEnds(
          msg:
              'You have successfully completed the test proceed for the result',
          correctScore: brainy.correctResponse,
          wrongScore: brainy.wrongResponse,
          totalScore: brainy.totalScore,
          username: brainy.player,
        ).showEndMsg(ctx);
        //brainy.reset();
      }

      brainy.nextQuestion();
    } else {
      brainy.decrementScore();
      if (brainy.isFinished()) {
        stopTimer = true;
//        Navigator.sth to the results page
//      Throw an alert to the user that evaluation has finished
        IQEnds(
          msg:
              'You have successfully completed the test proceed for the result',
          correctScore: brainy.correctResponse,
          wrongScore: brainy.wrongResponse,
          totalScore: brainy.totalScore,
          username: brainy.player,
        ).showEndMsg(ctx);
        //brainy.reset();
      }

      brainy.nextQuestion();
    }
  }

  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context);
    return Scaffold(
      backgroundColor: primarylightColor,
      appBar: customAppbar(
          stopTimer: stopTimer,
          timeOut: timeOutTimer,
          context: context,
          currentQuestion: "${brainy.currentQuestion() + 1}",
          totalQuestions: brainy.totalQuestions,
          size: Size(mediaQuery.size.width, mediaQuery.size.height * .09)),
      body: SingleChildScrollView(
        child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Container(
                height: MediaQuery.of(context).size.height * .3,
                width: MediaQuery.of(context).size.width * .8,
                alignment: Alignment.center,
                child: Question(question: brainy.getQuestionText()),
              ),
              Container(
                height: MediaQuery.of(context).size.height * .55,
                width: MediaQuery.of(context).size.width,
                child: SingleChildScrollView(
                    child: Column(
                  children: <Widget>[
                    Option(
                        option: brainy.getOptions()[0],
                        onTap: () {
                          setState(() {
                            checkAnswer(brainy.getOptions()[0], context);
                          });
                        }),
                    Option(
                        option: brainy.getOptions()[1],
                        onTap: () {
                          setState(() {
                            checkAnswer(brainy.getOptions()[1], context);
                          });
                        }),
                    Option(
                        option: brainy.getOptions()[2],
                        onTap: () {
                          setState(() {
                            checkAnswer(brainy.getOptions()[2], context);
                          });
                        }),
                    Option(
                        option: brainy.getOptions()[3],
                        onTap: () {
                          setState(() {
                            checkAnswer(brainy.getOptions()[3], context);
                          });
                        }),
                  ],
                )),
              ),
            ]),
      ),
    );
  }
}

PreferredSize customAppbar(
    {stopTimer,
    Function timeOut,
    BuildContext context,
    currentQuestion,
    int totalQuestions,
    Size size}) {
  return PreferredSize(
    preferredSize: size,
    child: AppBar(
      elevation: 10,
      backgroundColor: primarylightColor,
      title: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Text(
            'Question $currentQuestion',
            style: Theme.of(context).textTheme.bodyText2,
          ),
          Text(""),
          Text(""),
          Text(""),
          Timer(
            callBackFunc: timeOut,
            shouldDispose: stopTimer,
          ),
          Text(""),
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
          "${totalQuestions.toString()}   ",
          style: Theme.of(context).textTheme.bodyText2,
        )),
      ],
    ),
  );
}
