import 'package:flutter/material.dart';
import 'package:smarttomato/screens/questions/question_screen.dart';
import 'package:smarttomato/widgets/timer/count_down_timer.dart';
import 'package:smarttomato/widgets/timer/timer_buttons.dart';
import 'package:timer_count_down/timer_controller.dart';

class TimerScreen extends StatelessWidget {
  final int timeInSeconds;
  final CountdownController _countdownController = CountdownController();

  TimerScreen(this.timeInSeconds);

  void _onFinish(BuildContext context) {
    Navigator.of(context).pushReplacement(MaterialPageRoute(
        builder: (ctx) => QuestionScreen(), fullscreenDialog: true));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Timer"),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Text(
            "Time is started!",
            textAlign: TextAlign.center,
            style: TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.bold,
                color: Theme.of(context).primaryColor),
          ),
          CountDownTimer(timeInSeconds, _countdownController, () => _onFinish(context)),
          TimerButtons(_countdownController, () => _onFinish(context))
        ],
      ),
    );
  }
}
