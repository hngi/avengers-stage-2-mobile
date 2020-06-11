import 'dart:ui';

import 'package:brainy/page/about_app.dart';
import 'package:brainy/page/welcome.dart';
import 'package:flutter/material.dart';
import 'package:flutter_circular_chart/flutter_circular_chart.dart';

import '../theme/theme.dart';

class ResultPage extends StatefulWidget {
  final double correctScore;
  final double wrongScore;
  final double totalScore;
  final String username;

  ResultPage(
      {this.username, this.correctScore, this.wrongScore, this.totalScore});

  @override
  _ResultPageState createState() => _ResultPageState();
}

class _ResultPageState extends State<ResultPage> {
  double wrongScorePer = 0;
  double correctScorePer = 0;
  String resultStatement = "";
  
  @override
  void initState() {
    
    correctScorePer = (widget.correctScore / widget.totalScore) * 100.0;
    
    wrongScorePer = (widget.wrongScore / widget.totalScore) * 100.0;
    
    if (correctScorePer <= 69) {
      resultStatement = "I see no future in you.";
    } else if (correctScorePer > 69.0 && correctScorePer <= 79.0) {
      resultStatement = "You definitely need to up your game, try again";
    } else if (correctScorePer > 79.0 && correctScorePer <= 89.0) {
      resultStatement = "Keep playing and you'd surely improve!";
    } else if (correctScorePer > 89.0 && correctScorePer <= 109.0) {
      resultStatement = "You are as smart as the next person.";
    } else if (correctScorePer > 109.0 && correctScorePer <= 119.0) {
      resultStatement = "You have an IQ above average.";
    } else if (correctScorePer > 119.0 && correctScorePer <= 129.0) {
      resultStatement = "You are incredibly smart";
    } else if (correctScorePer > 130) {
      resultStatement = "You are a genius!";
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context);
    PreferredSize appBar = PreferredSize(
      preferredSize: Size(mediaQuery.size.width, mediaQuery.size.height*.1),
      child:AppBar(
        title: Text("IQ Result", style: Theme.of(context).textTheme.headline3),
        centerTitle: true,
        backgroundColor: Theme.of(context).accentColor,
        actions: <Widget>[
          IconButton(
            iconSize: 25,
            onPressed: ()=>showAboutPage(context),
            icon: Icon(Icons.info),
            ),
          
        ],

      )
    );
    return Scaffold(
      appBar: appBar,
      body: SingleChildScrollView(
        child: Container(
          width: mediaQuery.size.width,
          height: mediaQuery.size.height-appBar.preferredSize.height-mediaQuery.padding.top,
          decoration: BoxDecoration(gradient: gradientBg),
          child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                SizedBox(height: mediaQuery.size.height*.03,),
                Expanded(
                  flex: 1,
                  child: Container(
                    width: mediaQuery.size.width*.8,
                    child: Column(
                      children: <Widget>[
                        Align(
                          alignment: Alignment.topLeft,
                          child: Text("Dear ${widget.username},", style: Theme.of(context).textTheme.bodyText1,)),
                        Center(
                            child: Text(
                          resultStatement,
                          style: Theme.of(context).textTheme.headline3,
                        )),
                      ],
                    ),
                  ),
                ),
                Expanded(
                  flex: 3,
                  child: ResultChart(
                    correctScore: widget.correctScore,
                    correctScorePer: correctScorePer,
                    wrongScore: widget.wrongScore,
                    wrongScorePer: wrongScorePer,
                    totalScore: widget.totalScore,
                  ),
                ),
                Expanded(
                  flex: 1,
                  child: Align(
                    alignment: Alignment.bottomCenter,
                    child: Container(
                      alignment: Alignment.center,
                      height: mediaQuery.size.height*.1,
                      width: mediaQuery.size.width * .9,
                      margin: EdgeInsets.symmetric(vertical: 10),
                      
                      child: InkWell(
                        borderRadius: BorderRadius.circular(35),
                        highlightColor: Colors.green,
                        onTap: () {
                          Navigator.of(context).pushReplacement(
                              MaterialPageRoute(
                                  builder: (BuildContext context) =>
                                      (WelcomeScreen())));
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
                              'Done',
                              style: Theme.of(context).textTheme.bodyText1,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ]),
        ),
      ),
    );
  }
}

class ResultChart extends StatelessWidget {
  final GlobalKey<AnimatedCircularChartState> _chartKey =
      new GlobalKey<AnimatedCircularChartState>();

  final _chartSize = const Size(300.0, 300.0);

  final double correctScore;
  final double wrongScore;
  final double totalScore;
  final double correctScorePer;
  final double wrongScorePer;
  ResultChart(
      {this.correctScore,
      this.correctScorePer,
      this.wrongScorePer,
      this.wrongScore,
      this.totalScore});

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: <Widget>[
        
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children:<Widget>[
          Image(
            image: ExactAssetImage("assets/brain.png"),
            width: 150,
            height: 150,
            ),
            Text("% ${correctScorePer.toString()}", style: Theme.of(context).textTheme.headline2,)
        ]),
        new AnimatedCircularChart(
          key: _chartKey,
          size: _chartSize,
          initialChartData: <CircularStackEntry>[
            new CircularStackEntry(
              <CircularSegmentEntry>[
                new CircularSegmentEntry(
                  correctScorePer,
                  Colors.green,
                  rankKey: 'Correct Score',
                ),
                new CircularSegmentEntry(
                  wrongScorePer,
                  Colors.red,
                  rankKey: 'Wrong Score',
                ),
              ],
              rankKey: 'Ranking',
            ),
          ],
          chartType: CircularChartType.Radial,
          percentageValues: true,
        ),
      ],
    );
  }
}
