import 'package:flutter/material.dart';

class TextControl extends StatelessWidget {
  final String _btnTxt;
  final Function _btnActionHandle;

  TextControl(this._btnTxt, this._btnActionHandle);

  @override
  Widget build(BuildContext context) {
    return RaisedButton(
      child: Text(_btnTxt),
      onPressed: _btnActionHandle,
      color: Colors.blue,
      shape: RoundedRectangleBorder( borderRadius: BorderRadius.circular(18.0),
          side: BorderSide(color: Colors.black)),
    );
  }
}
