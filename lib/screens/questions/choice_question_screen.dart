import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:smarttomato/models/questions/choice_question.dart';
import 'package:smarttomato/models/questions/question_statistic.dart';
import 'package:smarttomato/services/questions/choice_question_service.dart';
import 'package:smarttomato/services/settings_service.dart';
import 'package:smarttomato/widgets/questions/question_progress_indicator.dart';

class ChoiceQuestionScreen extends StatefulWidget {
  @override
  _ChoiceQuestionScreenState createState() => _ChoiceQuestionScreenState();
}

class _ChoiceQuestionScreenState extends State<ChoiceQuestionScreen> {
  ChoiceQuestionService _questionsService = ChoiceQuestionService();
  ChoiceQuestion _currentQuestion;
  QuestionStatistic _questionStatistic;

  @override
  void initState() {
    var numberOfQuestions =
        Provider.of<SettingsService>(context, listen: false).numberOfQuestions;
    _questionsService.fetchData(numberOfQuestions).then((_) {
      setState(() {
        _currentQuestion = _questionsService.next;
        _questionStatistic = _questionsService.statistic;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Questions"),
      ),
      body: _currentQuestion == null
          ? Center(
              child: CircularProgressIndicator(),
            )
          : Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          QuestionProgressIndicator(
            color: Theme
                .of(context)
                .accentColor,
            successAttempts: _questionStatistic.successAttempts,
            scheduledQuestions: _questionStatistic.scheduledQuestions,
          ),
          Text(_currentQuestion.question)],
            ),
    );
  }
}
