import 'dart:convert';

import 'package:http/http.dart';
import 'package:smarttomatoe/models/question.dart';
import 'package:smarttomatoe/models/question_statistic.dart';

class QuestionsService {
  final List<Question> _questions = [
    Question(question: "pies", answer: "dog"),
    Question(question: "ptak", answer: "bird"),
    Question(question: "świnka morska", answer: "guinea pig"),
    Question(question: "kot", answer: "cat")
  ];

  QuestionStatistic _questionStatistic;
  List<Question> _remainingQuestions;
  List<Question> _failedQuestions = [];
  Question currentQuestion;

  QuestionsService() {}

  Future<void> fetchData() async {
    var response = await get(
        "http://34.72.189.8/words/writingQuestions?numberOfQuestions=4");
    _questions.clear();

    var questions = json.decode(utf8.decode(response.bodyBytes)) as List<dynamic>;
    questions.forEach((element) {
      _questions.add(Question(question: element["question"], answer: element["answers"][0]));
    });

    _remainingQuestions = _questions.toList();
    _questionStatistic = QuestionStatistic(_questions.length);
  }

  bool get hasNext {
    return _remainingQuestions.isNotEmpty || _failedQuestions.isNotEmpty;
  }

  bool answer(String answer) {
    var answerWasCorrect = answer == expectedAnswer;

    if (answerWasCorrect) {
      _questionStatistic.addSuccessAttempt();
    }
    else {
      _questionStatistic.addFailedAttempt();
      _failedQuestions.add(currentQuestion);
    }

    return answerWasCorrect;
  }

  Question get next {
    if (_remainingQuestions.isEmpty) {
      _remainingQuestions = _failedQuestions;
      _failedQuestions = [];
    }
    currentQuestion = _remainingQuestions.removeAt(0);
    return currentQuestion;
  }

  QuestionStatistic get statistic => _questionStatistic;

  String get expectedAnswer => currentQuestion.answer;
}