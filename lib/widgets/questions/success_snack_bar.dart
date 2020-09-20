import 'package:flutter/material.dart';

class SuccessSnackBar {
  static ScaffoldFeatureController<SnackBar, SnackBarClosedReason> show(
      BuildContext ctx) {
    return Scaffold.of(ctx).showSnackBar(_successSnackBar());
  }

  static SnackBar _successSnackBar() {
    return SnackBar(
      backgroundColor: Colors.green,
      action: SnackBarAction(label: "OK", onPressed: () {}),
      content: Row(
        children: <Widget>[
          Icon(Icons.done),
          SizedBox(
            width: 20,
          ),
          Text(
            "Correct answer!",
            style: TextStyle(fontSize: 20),
          ),
        ],
      ),
    );
  }
}
