import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:smarttomato/screens/question_screen.dart';
import 'package:smarttomato/screens/timer_screen.dart';

class FixedTimePicker extends StatelessWidget {
  final buttonShape = RoundedRectangleBorder(
    borderRadius: BorderRadius.all(
      Radius.circular(20),
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
            width: 250,
            height: 280,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                buildButton(
                    context, "ONLY QUESTIONS", () => goToQuestions(context)),
                buildButton(
                    context, "TIMER 5 min", () => startTimer(context, 5)),
                buildButton(
                    context, "TIMER 25 min", () => startTimer(context, 25)),
                buildButton(
                    context, "TIMER 45 min", () => startTimer(context, 45)),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Future goToQuestions(BuildContext context) {
    return Navigator.of(context).push(MaterialPageRoute(
        builder: (ctx) => QuestionScreen(), fullscreenDialog: true));
  }

  Widget buildButton(
      BuildContext context, String text, Function onPressed) {
    return Container(
      height: 45,
      child: RaisedButton(
        child: Text(
          text,
          style: buttonTextStyle,
        ),
        shape: buttonShape,
        color: Theme.of(context).accentColor,
        onPressed: () {
          onPressed();
        },
      ),
    );
  }

  void startTimer(BuildContext context, int numberOfMinutes) {
    Navigator.of(context).push(MaterialPageRoute(
        builder: (ctx) => TimerScreen(numberOfMinutes * 60),
        fullscreenDialog: true));
  }
}
