import 'package:flutter/material.dart';

class FailSnackBar {
  static ScaffoldFeatureController<SnackBar, SnackBarClosedReason> show(
      {BuildContext context, String expectedAnswer}) {
    return Scaffold.of(context)
        .showSnackBar(_failSnackBar(context, expectedAnswer));
  }

  static SnackBar _failSnackBar(BuildContext context, String expectedAnswer) {
    return SnackBar(
      backgroundColor: Theme.of(context).errorColor,
      action: SnackBarAction(
        label: "OK",
        onPressed: () {},
      ),
      content: Container(
        height: 70,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Row(
              children: <Widget>[
                Icon(Icons.error),
                SizedBox(
                  width: 20,
                ),
                Text(
                  "Wrong answer!",
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
              ],
            ),
            SizedBox(
              height: 10,
            ),
            FittedBox(
              child: Row(
                children: [
                  Text(
                    "Should be: ",
                    style: TextStyle(fontSize: 20),
                  ),
                  Text(
                    expectedAnswer,
                    style: TextStyle(
                        fontSize: 20, color: Theme.of(context).accentColor),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
