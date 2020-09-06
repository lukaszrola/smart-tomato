import 'package:flutter/material.dart';

class QuestionText extends StatelessWidget {
  final String question;
  final Color color;

  const QuestionText(this.question, this.color);

  @override
  Widget build(BuildContext context) {
    return Text(
      question,
      style: TextStyle(fontSize: 40, fontWeight: FontWeight.bold, color: color),
      textAlign: TextAlign.center,
    );
  }
}
