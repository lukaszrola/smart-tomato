

import 'package:flutter/foundation.dart';

class SettingsService with ChangeNotifier {
  var _numberOfQuestions = 5;

  set numberOfQuestions(int numberOfQuestions) {
    _numberOfQuestions = numberOfQuestions;
    notifyListeners();
  }

  int get numberOfQuestions {
    return _numberOfQuestions;
  }
}