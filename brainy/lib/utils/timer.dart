import 'package:flutter/material.dart';

class Timer extends StatefulWidget {
  final Function callBackFunc;
  final bool shouldDispose;
  Timer({this.callBackFunc, this.shouldDispose});
  @override
  _TimerState createState() => _TimerState();
}

class _TimerState extends State<Timer> with TickerProviderStateMixin {
  AnimationController controller;

  String get timerString {
    Duration duration = controller.duration * controller.value;
    return '0${duration.inMinutes}:${(duration.inSeconds % 60).toString().padLeft(2, '0')}';
  }

  int get timerSec {
    Duration duration = controller.duration * controller.value;
    return duration.inSeconds;
  }

  double controllerValue() {
    return controller.value;
  }

  @override
  void initState() {
    controller = AnimationController(
      vsync: this,
//if the number of questions change, the duration should be linked with it
      duration: Duration(minutes: 5, milliseconds: 1000),
    );
//if the number of questions change, the duration should be linked with it
    controller.reverse(from: 5).whenComplete(() => widget.callBackFunc());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    if (widget.shouldDispose) {
      controller.stop();
    }
    return AnimatedBuilder(
        animation: controller,
        builder: (BuildContext context, Widget child) {
          return Padding(
            padding: EdgeInsets.symmetric(vertical: 8.0, horizontal: 8.0),
            child: Text(
              timerString,
              style: timerSec < 30
                  ? TextStyle(fontSize: 18.0, color: Colors.red)
                  : TextStyle(fontSize: 18.0, color: Colors.white),
            ),
          );
        });
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }
}
