import 'package:flutter/material.dart';

class Timer extends StatefulWidget {
  @override
  _TimerState createState() => _TimerState();
}

class _TimerState extends State<Timer> with TickerProviderStateMixin {
  AnimationController controller;

  String get timerString {
    Duration duration = controller.duration * controller.value;
    return '${duration.inMinutes}:${(duration.inSeconds % 60).toString().padLeft(2, '0')}';
  }

  double controllerValue() {
    return controller.value;
  }

  @override
  void initState() {
    controller = AnimationController(
      vsync: this,

//if the number of questions change, the duration should be linked with it
      duration: Duration(minutes: 3, seconds: 1),
    );
//if the number of questions change, the duration should be linked with it
    controller.reverse(from: 3);

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
        animation: controller,
        builder: (BuildContext context, Widget child) {
          return Padding(
            padding: EdgeInsets.symmetric(vertical: 8.0, horizontal: 8.0),
            child: Text(
              timerString,
              style: TextStyle(fontSize: 50.0, color: Colors.white),
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
