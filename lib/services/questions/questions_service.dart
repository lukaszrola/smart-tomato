import 'package:smarttomato/models/questions/question.dart';
import 'package:smarttomato/models/questions/question_statistic.dart';

abstract class QuestionsService<T extends Question> {
  QuestionStatistic _questionStatistic;
  List<T> _remainingQuestions;
  List<T> _failedQuestions = [];
  T currentQuestion;

  QuestionsService() {}

  Future<void> fetchData(int numberOfQuestions) async {
    _remainingQuestions = await getNewQuestions(numberOfQuestions);
    _questionStatistic = QuestionStatistic(_remainingQuestions.length);
  }

  Future<List<T>> getNewQuestions(int numberOfQuestions);

  bool get hasNext {
    return _remainingQuestions.isNotEmpty || _failedQuestions.isNotEmpty;
  }

  bool answer(String answer) {
    var answerWasCorrect = currentQuestion.checkIfAnswerIsCorrect(answer);

    if (answerWasCorrect) {
      _questionStatistic.addSuccessAttempt();
    } else {
      _questionStatistic.addFailedAttempt();
      _failedQuestions.add(currentQuestion);
    }

    return answerWasCorrect;
  }

  T get next {
    if (_remainingQuestions.isEmpty) {
      _remainingQuestions = _failedQuestions;
      _failedQuestions = [];
    }
    currentQuestion = _remainingQuestions.removeAt(0);
    return currentQuestion;
  }

  QuestionStatistic get statistic => _questionStatistic;

}