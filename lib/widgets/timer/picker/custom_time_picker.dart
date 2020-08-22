import 'package:flutter/material.dart';
import 'package:flutter_duration_picker/flutter_duration_picker.dart';
import 'package:smarttomatoe/screens/question_screen.dart';
import 'package:smarttomatoe/screens/timer_screen.dart';

class CustomTimePicker extends StatefulWidget {
  @override
  _CustomTimePickerState createState() => _CustomTimePickerState();
}

class _CustomTimePickerState extends State<CustomTimePicker> {
  Duration _duration = Duration(hours: 0, minutes: 0);

  @override
  Widget build(BuildContext context) {
    return new Center(
      child: new Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.only(top: 15),
            child: Text(
              "Select custom time",
              style: TextStyle(
                  color: Theme.of(context).primaryColor,
                  fontSize: 30,
                  fontWeight: FontWeight.bold),
            ),
          ),
          new Expanded(
              // Use it from the context of a stateful widget, passing in
              // and saving the duration as a state variable.
              child: DurationPicker(
            duration: _duration,
            onChange: (val) {
              this.setState(() => _duration = val);
            },
            snapToMins: 1.0,
          )),
          Row(children: [
            Expanded(
              child: Container(
                height: 50,
                child: RaisedButton(
                  color: Theme.of(context).accentColor,
                  child: Text(
                    "START",
                    style: TextStyle(fontSize: 20),
                  ),
                  onPressed: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (ctx) => _duration.inSeconds > 0 ? TimerScreen(_duration.inSeconds) : QuestionScreen(),
                      fullscreenDialog: true
                      ),
                    );
                  },
                ),
              ),
            )
          ])
        ],
      ),
    );
  }
}
