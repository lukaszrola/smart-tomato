import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:smarttomatoe/screens/timer_screen.dart';

class FixedTimePicker extends StatelessWidget {
  final buttonShape = RoundedRectangleBorder(
    borderRadius: BorderRadius.all(
      Radius.circular(10),
    ),
  );

  final buttonTextStyle = TextStyle(fontSize: 20);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.only(top: 15),
            child: Text(
              "Quick start",
              textAlign: TextAlign.center,
              style: TextStyle(
                  color: Theme.of(context).primaryColor,
                  fontSize: 30,
                  fontWeight: FontWeight.bold),
            ),
          ),
          SizedBox(
            height: 40,
          ),
          Container(
            width: 200,
            height: 200,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                buildButton(context, "SHORT 5 min", () => startTimer(context, 5)),
                buildButton(context, "MEDIUM 25 min", () => startTimer(context, 25)),
                buildButton(context, "LONG 45 min", () => startTimer(context, 45)),
              ],
            ),
          ),
        ],
      ),
    );
  }

  RaisedButton buildButton(BuildContext context, String text, Function onPressed) {
    return RaisedButton(
                child: Text(
                  text,
                  style: buttonTextStyle,
                ),
                shape: buttonShape,
                color: Theme.of(context).accentColor,
                onPressed: () {
                  onPressed();
                },
              );
  }

  void startTimer(BuildContext context, int numberOfMinutes) {
    Navigator.of(context).push(MaterialPageRoute(
        builder: (ctx) => TimerScreen(numberOfMinutes * 60),
        fullscreenDialog: true));
  }
}
