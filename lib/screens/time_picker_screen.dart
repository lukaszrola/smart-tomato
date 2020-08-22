import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:smarttomatoe/widgets/timer/picker/custom_time_picker.dart';
import 'package:smarttomatoe/widgets/timer/picker/fixed_time_picker.dart';

class TimePicker extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          leading: Image.asset(
            "images/tomatoe.png",
            width: 50,
            height: 50,
          ),
          title: Text("Smart Tomatoe"),
          bottom: TabBar(
            tabs: [
              Tab(
                icon: Icon(Icons.timer),
                text: "Quick start",
              ),
              Tab(
                icon: Icon(Icons.access_time),
                text: "Custom time",
              )
            ],
          ),
        ),
        body: TabBarView(
          physics: NeverScrollableScrollPhysics(),
          children: [
            FixedTimePicker(),
            CustomTimePicker()
          ],
        ),
      ),
    );
  }
}
