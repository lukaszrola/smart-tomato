import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:smarttomato/models/questions/choice_question.dart';
import 'package:smarttomato/models/questions/question_statistic.dart';
import 'package:smarttomato/services/questions/choice_question_service.dart';
import 'package:smarttomato/services/settings_service.dart';
import 'package:smarttomato/widgets/questions/question_progress_indicator.dart';
import 'package:smarttomato/widgets/questions/question_text.dart';

class ChoiceQuestionScreen extends StatefulWidget {
  @override
  _ChoiceQuestionScreenState createState() => _ChoiceQuestionScreenState();
}

class _ChoiceQuestionScreenState extends State<ChoiceQuestionScreen> {
  final buttonShape = RoundedRectangleBorder(
    borderRadius: BorderRadius.all(
      Radius.circular(20),
    ),
  );

  final buttonTextStyle = TextStyle(fontSize: 20);

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
          QuestionText(
              _currentQuestion.question, Theme
              .of(context)
              .accentColor),
          ..._currentQuestion.variants.map((variant) =>
              Container(
                width: 45,
                child: RaisedButton(
                  onPressed: () {},
                  color: Theme
                      .of(context)
                      .accentColor,
                  child: Text(
                    variant,
                    style: buttonTextStyle,
                  ),
                  shape: buttonShape,
                ),
              ),
          )
        ],
      ),
    );
  }
}
