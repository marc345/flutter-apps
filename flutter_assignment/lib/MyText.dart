import 'package:flutter/material.dart';

class MyText extends StatelessWidget {
  final String _text;

  MyText(this._text);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100,
      width: double.infinity,
      color: Colors.amber,
      child: Center(
        child: Text(
          _text,
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}
