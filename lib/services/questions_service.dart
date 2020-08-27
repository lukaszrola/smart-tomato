import 'dart:convert';

import 'package:http/http.dart';
import 'package:smarttomato/models/question.dart';
import 'package:smarttomato/models/question_statistic.dart';

class QuestionsService {
  final List<Question> _questions = [];

  QuestionStatistic _questionStatistic;
  List<Question> _remainingQuestions;
  List<Question> _failedQuestions = [];
  Question currentQuestion;

  QuestionsService() {}

  Future<void> fetchData(int numberOfQuestions) async {
    var response = await get(
        "http://34.72.189.8/words/writingQuestions?numberOfQuestions=$numberOfQuestions");
    _questions.clear();

    var questions = json.decode(utf8.decode(response.bodyBytes)) as List<dynamic>;
    questions.forEach((element) {
      _questions.add(Question(question: element["question"], answer: element["answers"].cast<String>()));
    });

    _remainingQuestions = _questions.toList();
    _questionStatistic = QuestionStatistic(_questions.length);
  }

  bool get hasNext {
    return _remainingQuestions.isNotEmpty || _failedQuestions.isNotEmpty;
  }

  bool answer(String answer) {
    var answerWasCorrect = expectedAnswers.contains(answer);

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

  List<String> get expectedAnswers => currentQuestion.answer;
}