import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:smarttomato/widgets/questions/summary_row.dart';

class QuestionsSummary extends StatelessWidget {
  final int questions;
  final int failedAttempts;
  final double score;

  const QuestionsSummary(
      {@required this.questions,
      @required this.failedAttempts,
      @required this.score});

  @override
  Widget build(BuildContext context) {
    final titleStyle = TextStyle(
        color: Theme.of(context).primaryColor,
        fontSize: 30,
        fontWeight: FontWeight.bold);

    return Scaffold(
      appBar: AppBar(
        title: Text("Summary"),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Text(
            "Iteration finished!",
            style: titleStyle,
            textAlign: TextAlign.center,
          ),
          Image.asset(
            "images/tomato.png",
          ),
          Card(
            child: Container(
              alignment: Alignment.center,
              padding: EdgeInsets.symmetric(vertical: 20, horizontal: 40),
              child: Column(

                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SummaryRow(
                    title: "Score",
                    icon: Icons.equalizer,
                    value: "${score.toStringAsFixed(2)}%",
                  ),
                  SummaryRow(
                    title: "Questions",
                    icon: Icons.blur_circular,
                    value: "$questions",
                  ),
                  SummaryRow(
                    title: "Failed attempts",
                    icon: Icons.error_outline,
                    value: "$failedAttempts",
                  ),
                ],
              ),
            ),
          ),
          Container(
            height: 50,
            child: RaisedButton(
              child:
                  Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                Icon(Icons.home),
                Text(
                  "Menu",
                  style: TextStyle(fontSize: 20),
                )
              ]),
              onPressed: () {Navigator.of(context).pop();},
              color: Theme.of(context).accentColor,
            ),
          )
        ],
      ),
    );
  }

  Row buildSummaryRow(BuildContext context, TextStyle textStyle) {
    return Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
      Row(
        children: [
          Icon(
            Icons.blur_circular,
            color: Theme.of(context).primaryColor,
          ),
          Text(
            "Questions:",
            style: textStyle,
          ),
        ],
      ),
      Text(
        "$questions",
        style: textStyle,
      ),
    ]);
  }
}
