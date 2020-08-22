import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:smarttomato/screens/time_picker_screen.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Smart tomato',
      theme: ThemeData(
          primarySwatch: Colors.red, accentColor: Colors.orangeAccent),
      home: TimePicker(),
    );
  }
}
