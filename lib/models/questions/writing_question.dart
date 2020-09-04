import 'package:flutter/cupertino.dart';
import 'package:smarttomato/models/questions/question.dart';

class WritingQuestion implements Question {
  final String question;
  final List<String> answers;

  WritingQuestion({@required this.question, @required this.answers});

  bool checkIfAnswerIsCorrect(String answer) {
    return this.answers.contains(answer);
  }
}
