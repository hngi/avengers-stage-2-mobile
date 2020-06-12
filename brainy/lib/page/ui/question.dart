import 'package:flutter/material.dart';

class Question extends StatelessWidget {
  final question;
  Question({this.question});
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
    child: Text(
      question,
      style: Theme.of(context).textTheme.bodyText1,
    ),
  );
  }
}
