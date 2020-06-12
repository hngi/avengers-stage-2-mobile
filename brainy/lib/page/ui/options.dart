import 'package:flutter/material.dart';

class Option extends StatelessWidget {
  final String option;
  final Function onTap;
  Option({this.option, this.onTap});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width * .9,
      margin: EdgeInsets.symmetric(
          vertical: MediaQuery.of(context).size.height * .015),
      //padding: EdgeInsets.all(3),
      child: InkWell(
        borderRadius: BorderRadius.circular(35),
        onTap: onTap,
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
              option,
              style: Theme.of(context).textTheme.bodyText1,
            ),
          ),
        ),
      ),
    );
  }
}
