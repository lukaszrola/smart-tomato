import 'package:flutter/material.dart';
import 'package:smarttomato/screens/settings_screen.dart';
import 'package:smarttomato/screens/time_picker_screen.dart';

class MainDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
          Container(
            height: 120,
            width: double.infinity,
//            padding: EdgeInsets.all(20),
            alignment: Alignment.centerLeft,
            color: Theme.of(context).accentColor,
            child: ListTile(
              leading: Image.asset(
                "images/tomato.png",
                height: 50,
                width: 50,
              ),
              title: Text(
                "Smart Tomato",
                style: TextStyle(
                    fontWeight: FontWeight.w900,
                    fontSize: 30,
                    color: Theme.of(context).primaryColor),
              ),
            ),
          ),
          SizedBox(
            height: 20,
          ),
          buildListTile("Time picker", Icons.timer, () {
            Navigator.of(context).pushReplacement(
                MaterialPageRoute(builder: (ctx) => TimePicker()));
          }),
          SizedBox(
            height: 20,
          ),
          buildListTile("Settings", Icons.settings, () {
            Navigator.of(context).pushReplacement(
                MaterialPageRoute(builder: (ctx) => SettingsScreen()));
          }),
        ],
      ),
    );
  }

  ListTile buildListTile(String title, IconData iconData, Function onPush) {
    return ListTile(
      leading: Icon(
        iconData,
        size: 26,
      ),
      title: Text(
        title,
        style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
      ),
      onTap: onPush,
    );
  }
}
