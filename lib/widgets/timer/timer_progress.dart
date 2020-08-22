import 'package:flutter/material.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';

class TimerProgress extends StatelessWidget {
  final int initialTimeInSeconds;
  final double remainingTime;

  const TimerProgress({this.initialTimeInSeconds, this.remainingTime});

  @override
  Widget build(BuildContext context) {
    return CircularPercentIndicator(
      radius: 200.0,
      lineWidth: 8.0,
      percent: 1.0 - remainingTime / initialTimeInSeconds,
      center: new Text(
        "${getHours()} : ${getMinutes()} : ${getSeconds()}",
        style: TextStyle(
            color: Theme.of(context).accentColor,
            fontSize: 30,
            fontWeight: FontWeight.bold),
      ),
      progressColor: Theme.of(context).primaryColor,
    );
  }

  String getHours() {
    var hours = (remainingTime / 3600).floor();
    return hours > 9 ? hours.toString() : '0$hours';
  }

  String getMinutes() {
    var minutesValue = ((remainingTime % 3600) / 60).floor();
    return minutesValue > 9 ? minutesValue.toString() : '0$minutesValue';
  }

  String getSeconds() {
    var seconds = (remainingTime % 60).floor();
    return seconds > 9 ? seconds.toString() : '0$seconds';
  }
}
