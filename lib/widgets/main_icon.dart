import 'package:flutter/material.dart';

class MainIcon extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: ConstrainedBox(
        constraints: BoxConstraints.expand(),
        child: FlatButton(
          padding: EdgeInsets.all(0),
          child: Image.asset(
            "images/tomato.png",
            height: 50,
            width: 50,
          ),
          onPressed: (){
            Scaffold.of(context).openDrawer();
          },
        ),
      ),
    );
  }
}
