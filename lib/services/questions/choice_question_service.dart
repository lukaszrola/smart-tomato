import 'dart:convert';

import 'package:http/http.dart';
import 'package:smarttomato/models/questions/choice_question.dart';
import 'package:smarttomato/services/questions/questions_service.dart';

class ChoiceQuestionService extends QuestionsService<ChoiceQuestion> {
  @override
  Future<List<ChoiceQuestion>> getNewQuestions(int numberOfQuestions) async {
    var response = await get(
        "http://34.72.189.8/words/choiceQuestions?numberOfQuestions=$numberOfQuestions");

    var questions =
        json.decode(utf8.decode(response.bodyBytes)) as List<dynamic>;

    return questions
        .map(
          (question) => ChoiceQuestion(
            question: question["question"],
            correctAnswer: question["correctAnswer"],
            variants: question["variants"].cast<String>(),
          ),
        )
        .toList();
  }
}
