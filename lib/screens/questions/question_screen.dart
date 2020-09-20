import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:smarttomato/screens/questions/choice_question_screen.dart';
import 'package:smarttomato/screens/questions/writing_question_screen.dart';
import 'package:smarttomato/services/settings_service.dart';

class QuestionScreen extends StatelessWidget {
  Map<QuestionType, Function> screens = {
    QuestionType.WRITING_QUESTION: () => WritingQuestionScreen(),
    QuestionType.CHOICE_QUESTION: () => ChoiceQuestionScreen()
  };

  @override
  Widget build(BuildContext context) {
    var questionType =
        Provider.of<SettingsService>(context, listen: false).questionType;
    return screens[questionType].call();
  }
}
