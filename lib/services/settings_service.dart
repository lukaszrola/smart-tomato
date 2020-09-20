

import 'package:flutter/foundation.dart';

enum QuestionType { WRITING_QUESTION, CHOICE_QUESTION }

class SettingsService with ChangeNotifier {
  var _numberOfQuestions = 5;
  var _questionType = QuestionType.WRITING_QUESTION;

  set numberOfQuestions(int numberOfQuestions) {
    _numberOfQuestions = numberOfQuestions;
    notifyListeners();
  }

  int get numberOfQuestions {
    return _numberOfQuestions;
  }

  set questionType(QuestionType questionType) {
    _questionType = questionType;
    notifyListeners();
  }

  QuestionType get questionType {
    return _questionType;
  }
}