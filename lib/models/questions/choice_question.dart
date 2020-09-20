import 'package:smarttomato/models/questions/question.dart';

class ChoiceQuestion extends Question {
  final String question;
  final String correctAnswer;
  final List<String> variants;

  ChoiceQuestion({this.question, this.correctAnswer, this.variants});

  @override
  bool checkIfAnswerIsCorrect(String answer) {
    return correctAnswer == answer;
  }
}
