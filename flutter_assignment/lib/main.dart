// 1) Create a new Flutter App (in this project) and output an AppBar and some text
// below it
// 2) Add a button which changes the text (to any other text of your choice)
// 3) Split the app into three widgets: App, TextControl & Text

import 'package:flutter/material.dart';

import './MyText.dart';
import './TextControl.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  int pressed_cnt = 0;
  String buttonText = '0 times pressed';

  void changeText() {
    setState(() {
      buttonText = '${++pressed_cnt} times pressed';
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.blue,
        appBar: AppBar(
          title: Center(
            child: Text(
              'Cozy Smart Home',
            ),
          ),
          titleTextStyle: TextStyle(
            color: Colors.blue,
            backgroundColor: Colors.black,
            fontSize: 28,
          ),
        ),
        body: Column(children: [
          MyText('Configure your Cozy smart home device here.'),
          TextControl(buttonText, changeText)
        ]),
      ),
    );
  }
}
