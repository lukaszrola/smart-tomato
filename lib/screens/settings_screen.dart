import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:smarttomato/screens/main_drawer.dart';
import 'package:smarttomato/services/settings_service.dart';

class SettingsScreen extends StatelessWidget {


  @override
  Widget build(BuildContext context) {
    var settingsService = Provider.of<SettingsService>(context);
    double numberOfQuestions =  settingsService.numberOfQuestions.toDouble();

    return Scaffold(
      appBar: AppBar(
        title: Text("Settings"),
      ),
      drawer: MainDrawer(),
      body: Column(
        children: [
          SizedBox(
            height: 5,
          ),
          ListTile(
            title: Text(
              "Number of questions after iteration",
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            subtitle: Slider(
              value: numberOfQuestions,
              onChanged: (newNumberOfQuestions) {
                settingsService.numberOfQuestions = newNumberOfQuestions.toInt();
              },
              activeColor: Theme.of(context).accentColor,
              divisions: 29,
              max: 30,
              min: 1,
              label: "${numberOfQuestions.floor()}",
            ),
            trailing: Text(
              "${numberOfQuestions.floor()}",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Theme.of(context).accentColor),
            ),
          )
        ],
      ),
    );
  }
}
