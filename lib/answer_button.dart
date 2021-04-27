import 'package:flutter/material.dart';

class AnswerButton extends StatelessWidget {
  final Function _onPressed;
  final String _text;

  AnswerButton(this._onPressed,this._text);

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: EdgeInsets.all(10),
        child: ElevatedButton(
            onPressed: () => _onPressed(),
            child: Text(_text))
    );
  }
}