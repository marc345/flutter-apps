import 'package:flutter/material.dart';

class Result extends StatelessWidget {
  final int resultScore;
  final Function resetHandler;

  Result(this.resultScore, this.resetHandler);

  String get resultPhrase {
    var resultText = 'You did it';
    if (resultScore <= 8) {
      resultText = 'You are boring AF';
    } else if (resultScore <= 12) {
      resultText = 'Interesting';
    } else if (resultScore <= 16) {
      resultText = 'Awesome';
    } else {
      resultText = 'Unbelievable';
    }
    return resultText;
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: <Widget>[
          Text(resultPhrase,
              style: TextStyle(fontSize: 36, fontWeight: FontWeight.bold),
          ),
          FlatButton(
            child: Text('Restart Quiz!',
            ),
            textColor: Colors.blue,
            hoverColor: Colors.black,
            onPressed: resetHandler,
          )
        ],
      ),
    );
  }
}
