import 'package:basics/result.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import './quiz.dart';

//void main() {
//  runApp(MyApp());
//}

void main() => runApp(MyApp()); // => is an abbreviation for function with
//    exactly one expression

class MyApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return MyAppState();
  }
}

// state is persistent and is not recreated like for example a widget
// thus it is a separate class
class MyAppState extends State<MyApp> {
  var _questionIndex = 0;
  var _totalScore = 0;

  final _questions = const [
    {
      'question': 'What\'s your favorite color?',
      'answers': [
        {'text': 'Black', 'score': 10},
        {'text': 'Red', 'score': 5},
        {'text': 'Green', 'score': 3},
        {'text': 'White', 'score': 1}
      ]
    },
    {
      'question': 'What\'s your favorite animal?',
      'answers': [
        {'text': 'Lion', 'score': 1},
        {'text': 'Zebra', 'score': 3},
        {'text': 'Gnu', 'score': 9},
        {'text': 'Elephant', 'score': 0}
      ]
    },
    {
      'question': 'What\'s your favorite actor?',
      'answers': [
        {'text': 'DeNiro', 'score': 3},
        {'text': 'Pacino', 'score': 5},
        {'text': 'Keitel', 'score': 7},
        {'text': 'Pesci', 'score': 10}
      ]
    }
  ];

  void _answerQuestion(int score) {

    _totalScore += score;

    setState(() {
      _questionIndex += 1;
      print(_questionIndex);
    });
    if (_questionIndex < _questions.length) {
      print('We have more questions!');
    } else {
      print('No more questions!');
    }
  }

  void _restartQuiz() {
    setState(() {
      _totalScore = 0;
      _questionIndex = 0;
    });
  }

  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(centerTitle: true, title: Text('COzy')),
        body: _questionIndex < _questions.length
            ? Quiz(
                answerQuestion: _answerQuestion,
                questionIndex: _questionIndex,
                questions: _questions)
            : Result(_totalScore, _restartQuiz),
      ),
    );
  }
}
