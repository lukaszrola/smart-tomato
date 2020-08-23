import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:smarttomato/widgets/timer/picker/custom_time_picker.dart';
import 'package:smarttomato/widgets/timer/picker/fixed_time_picker.dart';

import 'main_drawer.dart';

class TimePicker extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    return DefaultTabController(
      length: 2,
      child: Scaffold(
        drawer: MainDrawer(),
        appBar: AppBar(
//          leading: MainIcon(),
          title: Text("Time picker"),
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
