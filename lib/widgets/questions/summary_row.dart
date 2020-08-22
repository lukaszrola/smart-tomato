import 'package:flutter/material.dart';

class SummaryRow extends StatelessWidget {
  final String title;
  final IconData icon;
  final String value;

  const SummaryRow({this.title, this.icon, this.value});


  @override
  Widget build(BuildContext context) {
    final textStyle = TextStyle(
      color: Theme.of(context).primaryColor,

      fontSize: 20,
    );

    return Padding(
      padding: const EdgeInsets.all(2.0),
      child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                Icon(
                  icon,
                  color: Theme.of(context).primaryColor,
                ),
                Text(
                  title,
                  style: textStyle,
                ),
              ],
            ),
            Text(
              value,
              style: textStyle,
            ),
          ]),
    );
  }
}
