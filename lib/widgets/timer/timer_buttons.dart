import 'package:flutter/material.dart';
import 'package:timer_count_down/timer_controller.dart';

class TimerButtons extends StatefulWidget {
  final CountdownController _countdownController;
  final Function onFinish;

  TimerButtons(this._countdownController, this.onFinish);

  @override
  _TimerButtonsState createState() => _TimerButtonsState();
}

class _TimerButtonsState extends State<TimerButtons> {
  bool paused = false;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: <Widget>[
        createButtonn(
            context: context,
            icon: Icon(Icons.restore),
            text: "Reset",
            onPressed: () {
              widget._countdownController.restart();
              setState(() {
                paused = false;
              });
            }),
        paused
            ? createButtonn(
                context: context,
                icon: Icon(Icons.play_arrow),
                text: "Resume",
                onPressed: () {
                  widget._countdownController.resume();
                  setState(() {
                    paused = false;
                  });
                })
            : createButtonn(
                context: context,
                icon: Icon(Icons.pause),
                text: "Pause",
                onPressed: () {
                  widget._countdownController.pause();
                  setState(() {
                    paused = true;
                  });
                }),
        createButtonn(
          context: context,
          icon: Icon(Icons.forward),
          text: "Skip",
          onPressed: widget.onFinish,
        ),
      ],
    );
  }

  RaisedButton createButtonn(
      {BuildContext context, Icon icon, String text, Function onPressed}) {
    return RaisedButton(
      color: Theme.of(context).accentColor,
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(10))),
      child: Row(
        children: <Widget>[icon, Text(text)],
      ),
      onPressed: () {
        onPressed();
      },
    );
  }
}
