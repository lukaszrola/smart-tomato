import 'package:flutter/material.dart';
import 'package:flutter_ringtone_player/flutter_ringtone_player.dart';
import 'package:timer_count_down/timer_controller.dart';
import 'package:timer_count_down/timer_count_down.dart';

import 'timer_progress.dart';

class CountDownTimer extends StatelessWidget {
  final int timeInSeconds;
  final CountdownController _countdownController;
  final Function _onFinish;

  const CountDownTimer(this.timeInSeconds, this._countdownController, this._onFinish);

  @override
  Widget build(BuildContext context) {
    return Countdown(
      controller: _countdownController,
      seconds: timeInSeconds,
      build: (BuildContext context, double time) => Center(
          child: TimerProgress(
        initialTimeInSeconds: timeInSeconds,
        remainingTime: time,
      )),
      interval: Duration(milliseconds: 100),
      onFinished: () async {
        FlutterRingtonePlayer.play(
          android: AndroidSounds.alarm,
          ios: IosSounds.glass,
          volume: 0.1,
          asAlarm: true,
          looping: true,
        );
        await showDialog(
            context: context,
            builder: (BuildContext context) {
              return AlertDialog(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(20))),
                title: Text("Timer finished"),
                content: Text(
                    "Iteration has finished now you can answer to questions"),
                actions: <Widget>[
                  RaisedButton(
                    color: Theme.of(context).accentColor,
                    child: Text("OK"),
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                  )
                ],
              );
            });
        FlutterRingtonePlayer.stop();
        _onFinish();
      },
    );
  }
}
