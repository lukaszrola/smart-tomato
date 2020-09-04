import 'dart:convert';

import 'package:http/http.dart';
import 'package:smarttomato/models/questions/writing_question.dart';
import 'package:smarttomato/services/questions/questions_service.dart';

class WritingQuestionsService extends QuestionsService<WritingQuestion> {
  Future<List<WritingQuestion>> getNewQuestions(int numberOfQuestions) async {
    var response = await get(
        "http://34.72.189.8/words/writingQuestions?numberOfQuestions=$numberOfQuestions");

    var questions =
        json.decode(utf8.decode(response.bodyBytes)) as List<dynamic>;

    return questions.map((element) {
      return WritingQuestion(
          question: element["question"],
          answers: element["answers"].cast<String>());
    }).toList();
  }
}
