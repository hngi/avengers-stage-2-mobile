import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class NameLog extends StatefulWidget {
  @override
  _NameLogState createState() => _NameLogState();
}

class _NameLogState extends State<NameLog> {
  TextEditingController nameController = new TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(
          child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                SizedBox(height: 42.0,),
                Image.asset("assets/logo.png",),
                SizedBox(height: 16.0,),
                Text("Welcome", style: Theme.of(context).textTheme.headline1,textAlign: TextAlign.center,),
                SizedBox(height: 16.0,),
                Container(
                  margin:
                  EdgeInsets.only(left: 16.0, right: 16.0, top: 8.0, bottom: 8.0),

                  child: TextField(
                    controller: nameController,
                    textCapitalization: TextCapitalization.words,
                    style: Theme.of(context).textTheme.bodyText1,
                    decoration: InputDecoration(
                      contentPadding: EdgeInsets.only(top: 8.0,bottom: 8.0, left: 16.0),
                      hintStyle: Theme.of(context).textTheme.bodyText1,
                      hintText: "Enter your name",
                      border: new OutlineInputBorder(
                        borderRadius:
                        const BorderRadius.all(const Radius.circular(24.0)),
                        borderSide: new BorderSide(
                            color: Color(0XFF030837),
                            width: 4.0,
                            style: BorderStyle.solid),
                        //gapPadding: 4.0,
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 16.0,),
                Container(
                  margin: EdgeInsets.only(left: 64.0, right: 64.0),
                  width: 250.0,
                  decoration: BoxDecoration(
                      color: Theme.of(context).buttonColor,
                      borderRadius: BorderRadius.circular(24.0),
                      shape: BoxShape.rectangle),
                  child: FlatButton(
                    onPressed: null,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[
                        Expanded(
                            child: Text(
                              "Next",textAlign: TextAlign.center,
                              style: Theme.of(context).textTheme.button,
                            )),
                        Image.asset(
                          "assets/arrowright.png",
                          height: 24.0,
                          width: 24.0,
                          color: Colors.white,
                        )
                      ],
                    ),
                  ),
                )
              ]),
        ));
  }
}
