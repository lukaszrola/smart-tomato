import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:smarttomato/screens/time_picker_screen.dart';
import 'package:smarttomato/services/settings_service.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    WidgetsFlutterBinding.ensureInitialized();
    SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
    return ChangeNotifierProvider(
      create: (_) => SettingsService(),
      child: MaterialApp(
        title: 'Smart tomato',
        theme: ThemeData(
            primarySwatch: Colors.red, accentColor: Colors.orangeAccent),
        home: TimePicker(),
      ),
    );
  }
}
