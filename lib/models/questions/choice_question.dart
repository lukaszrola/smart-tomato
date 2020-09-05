import 'package:smarttomato/models/questions/question.dart';

class ChoiceQuestion extends Question {
  final String question;
  final String correctAnswer;
  final String variants;

  ChoiceQuestion({this.question, this.correctAnswer, this.variants});

  @override
  bool checkIfAnswerIsCorrect(String answer) {
    throw correctAnswer == answer;
  }
}
