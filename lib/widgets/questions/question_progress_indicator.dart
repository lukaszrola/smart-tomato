import 'package:flutter/material.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';

class QuestionProgressIndicator extends StatelessWidget {
  @required
  final Color color;
  @required
  final int successAttempts;
  @required
  final int scheduledQuestions;

  const QuestionProgressIndicator(
      {@required this.color,
      @required this.successAttempts,
      @required this.scheduledQuestions});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(top: 10),
      child: Column(
        children: [
          LinearPercentIndicator(
            progressColor: color,
            lineHeight: 20,
            percent: successAttempts / scheduledQuestions,
          ),
          SizedBox(
            height: 5,
          ),
          Text("${successAttempts}/${scheduledQuestions}")
        ],
      ),
    );
  }
}
