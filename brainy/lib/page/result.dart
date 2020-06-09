import 'package:brainy/page/welcome.dart';
import 'package:flutter/material.dart';
import 'package:flutter_circular_chart/flutter_circular_chart.dart';

import '../theme/theme.dart';

class ResultPage extends StatefulWidget {
  final double correctScore;
  final double wrongScore;
  final double totalScore;
  final String result;

  ResultPage(
      {this.correctScore, this.wrongScore, this.totalScore, this.result});

  @override
  _ResultPageState createState() => _ResultPageState();
}

class _ResultPageState extends State<ResultPage> {
  double wrongScorePer = 0;
  double correctScorePer = 0;
  @override
  void initState() {
    correctScorePer = (widget.correctScore / widget.totalScore) * 100.0;
    wrongScorePer = (widget.wrongScore / widget.totalScore) * 100.0;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("IQ Result", style: Theme.of(context).textTheme.headline3),
        centerTitle: true,
        backgroundColor: Color(0xFF040c4f),
      ),
      body: Container(
        padding: EdgeInsets.all(20),
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        decoration: BoxDecoration(gradient: gradientBg),
        child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Expanded(
                flex: 2,
                child: Center(
                    child: Text(
                  widget.result,
                  style: Theme.of(context).textTheme.headline3,
                )),
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
                  child: Center(
                    child: GestureDetector(
                        onTap: () => Navigator.of(context).pushReplacement(
                            MaterialPageRoute(
                                builder: (BuildContext context) =>
                                    (WelcomeScreen()))),
                        child: Container(
                          padding: EdgeInsets.symmetric(
                              vertical: 20,
                              horizontal:
                                  MediaQuery.of(context).size.width * .3),
                          decoration: BoxDecoration(
                              border: Border.all(color: Colors.white),
                              borderRadius: BorderRadius.circular(30)),
                          child: Text(
                            'Done',
                            style: Theme.of(context).textTheme.bodyText1,
                          ),
                        )),
                  ),
                ),
              ),
            ]),
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
    return new AnimatedCircularChart(
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
      holeLabel: '${correctScore.toInt()}/${totalScore.toInt()}',
      labelStyle: new TextStyle(
        color: Colors.white,
        fontWeight: FontWeight.bold,
        fontSize: 24.0,
      ),
    );
  }
}
