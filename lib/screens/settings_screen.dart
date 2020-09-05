import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:smarttomato/screens/main_drawer.dart';
import 'package:smarttomato/services/settings_service.dart';

class SettingsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var settingsService = Provider.of<SettingsService>(context);
    double numberOfQuestions = settingsService.numberOfQuestions.toDouble();

    const titleStyle = TextStyle(fontSize: 17, fontWeight: FontWeight.bold);
    return Scaffold(
      appBar: AppBar(
        title: Text("Settings"),
      ),
      drawer: MainDrawer(),
      body: Column(
        children: [
          Divider(),
          ListTile(
            title: const Text(
              'Questions type',
              style: titleStyle,
            ),
            subtitle: Column(
              children: [
                ListTile(
                  title: const Text('Writing Questions'),
                  leading: Radio(
                    value: QuestionType.WRITING_QUESTION,
                    groupValue: settingsService.questionType,
                    onChanged: (QuestionType value) {
                      settingsService.questionType = value;
                    },
                  ),
                ),
                ListTile(
                  title: const Text('Choice Questions'),
                  leading: Radio(
                    value: QuestionType.CHOICE_QUESTION,
                    groupValue: settingsService.questionType,
                    onChanged: (QuestionType value) {
                      settingsService.questionType = value;
                    },
                  ),
                )
              ],
            ),
          ),
          Divider(),
          ListTile(
            title: const Text(
              "Number of questions after iteration",
              style: titleStyle,
            ),
            subtitle: Slider(
              value: numberOfQuestions,
              onChanged: (newNumberOfQuestions) {
                settingsService.numberOfQuestions =
                    newNumberOfQuestions.toInt();
              },
              activeColor: Theme.of(context).accentColor,
              divisions: 29,
              max: 30,
              min: 1,
              label: "${numberOfQuestions.floor()}",
            ),
            trailing: Text(
              "${numberOfQuestions.floor()}",
              style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Theme
                      .of(context)
                      .accentColor),
            ),
          )
        ],
      ),
    );
  }
}
