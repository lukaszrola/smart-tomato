import 'package:audioplayers/audio_cache.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:percent_indicator/percent_indicator.dart';
import 'package:provider/provider.dart';
import 'package:smarttomato/models/question.dart';
import 'package:smarttomato/models/question_statistic.dart';
import 'package:smarttomato/screens/questions_summary_screen.dart';
import 'package:smarttomato/services/questions_service.dart';
import 'package:smarttomato/services/settings_service.dart';

class QuestionScreen extends StatefulWidget {
  QuestionsService questions = QuestionsService();

  @override
  _QuestionScreenState createState() => _QuestionScreenState();
}

enum _AnswerState { BEFORE_ANSWER, CORRECT_ANSWER, WRONG_ANSWER }

class _QuestionScreenState extends State<QuestionScreen> {
  Question question;
  _AnswerState answerState;
  var questionStatistic;
  AudioCache player = AudioCache(prefix: 'audio/');

  @override
  void initState() {
    var numberOfQuestions = Provider.of<SettingsService>(context, listen: false).numberOfQuestions;
    widget.questions.fetchData(numberOfQuestions).then((value) {
      setState(() {
        question = widget.questions.next;
        answerState = _AnswerState.BEFORE_ANSWER;
        questionStatistic = widget.questions.statistic;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    final inputController = TextEditingController();

    return Scaffold(
      appBar: AppBar(
        title: Text("Questions"),
      ),
      body: question == null
          ? Center(child: CircularProgressIndicator())
          : Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                Container(
                  padding: EdgeInsets.only(top: 10),
                  child: Column(
                    children: [
                      LinearPercentIndicator(
                        progressColor: calculateColor(context),
                        lineHeight: 20,
                        percent: questionStatistic.successAttempts /
                            questionStatistic.scheduledQuestions,
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      Text(
                          "${questionStatistic.successAttempts}/${questionStatistic.scheduledQuestions}")
                    ],
                  ),
                ),
                Container(
                  padding: EdgeInsets.all(10),
                  child: Column(
                    children: [
                      FittedBox(
                        child: Text(
                          question.question,
                          style: TextStyle(
                              fontSize: 40,
                              fontWeight: FontWeight.bold,
                              color: calculateColor(context)),
                          textAlign: TextAlign.center,
                        ),
                      ),
                      TextField(
                        autocorrect: false,
                        controller: inputController,
                        textAlign: TextAlign.center,
                        keyboardType: TextInputType.text,
                        decoration: InputDecoration(
                            hintText: "Type translation",
                            focusColor: Theme.of(context).accentColor,
                            focusedBorder: UnderlineInputBorder(
                                borderSide: BorderSide(
                                    color: calculateColor(context)))),
                      )
                    ],
                  ),
                ),
                Builder(
                  builder: (ctx) => Container(
                    height: 50,
                    child: RaisedButton(
                      color: Theme.of(context).accentColor,
                      child: Text(
                        "Answer",
                        style: TextStyle(fontSize: 20),
                      ),
                      onPressed: () async {
                        await _answerToQuestion(inputController, ctx, context);
                      },
                    ),
                  ),
                )
              ],
            ),
    );
  }

  Future _answerToQuestion(TextEditingController inputController,
      BuildContext ctx, BuildContext context) async {
    var success = widget.questions.answer(inputController.text);

    colorText(success);
    await playSound(success);
    var snackBar = showSnackBar(ctx, success, context);
    await snackBar.closed;

    resolveNextQuestion(context);
  }

  void colorText(bool success) {
    setState(() {
      answerState =
          success ? _AnswerState.CORRECT_ANSWER : _AnswerState.WRONG_ANSWER;
    });
  }

  ScaffoldFeatureController<SnackBar, SnackBarClosedReason> showSnackBar(
      BuildContext ctx, bool success, BuildContext context) {
    return Scaffold.of(ctx).showSnackBar(
      success ? successSnackBar() : failSnackBar(context),
    );
  }

  Future playSound(bool success) async {
    await player.play(success ? 'success.mp3' : 'fail.mp3');
  }

  void resolveNextQuestion(BuildContext context) {
    setState(() {
      if (widget.questions.hasNext) {
        question = widget.questions.next;
        answerState = _AnswerState.BEFORE_ANSWER;
      } else {
        QuestionStatistic questionStatistic = widget.questions.statistic;
        Navigator.of(context).pushReplacement(MaterialPageRoute(
            builder: (ctx) => QuestionsSummary(
                  questions: questionStatistic.scheduledQuestions,
                  failedAttempts: questionStatistic.failedAttempts,
                  score: questionStatistic.score,
                ),
            fullscreenDialog: true));
      }
    });
  }

  SnackBar successSnackBar() {
    return SnackBar(
      backgroundColor: Colors.green,
      action: SnackBarAction(
          label: "OK",
          onPressed: () {
            setState(() {});
          }),
      content: Row(
        children: <Widget>[
          Icon(Icons.done),
          SizedBox(
            width: 20,
          ),
          Text(
            "Correct answer!",
            style: TextStyle(fontSize: 20),
          ),
        ],
      ),
    );
  }

  SnackBar failSnackBar(BuildContext context) {
    return SnackBar(
      backgroundColor: Theme.of(context).errorColor,
      action: SnackBarAction(
        label: "OK",
        onPressed: () {},
      ),
      content: Container(
        height: 70,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Row(
              children: <Widget>[
                Icon(Icons.error),
                SizedBox(
                  width: 20,
                ),
                Text(
                  "Wrong answer!",
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
              ],
            ),
            SizedBox(
              height: 10,
            ),
            Row(
              children: [
                Text(
                  "Should be: ",
                  style: TextStyle(fontSize: 20),
                ),
                Text(
                  "${question.answer}",
                  style: TextStyle(
                      fontSize: 20, color: Theme.of(context).accentColor),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }

  Color calculateColor(BuildContext context) {
    switch (answerState) {
      case _AnswerState.CORRECT_ANSWER:
        return Colors.green;
      case _AnswerState.WRONG_ANSWER:
        return Theme.of(context).errorColor;
      default:
        return Theme.of(context).accentColor;
    }
  }
}
