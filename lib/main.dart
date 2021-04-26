import 'package:quiz_app/change_notifier.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() => runApp(MaterialApp(
        home: Scaffold(
          appBar: AppBar(title: Text('Quiz')),
          body: QuizApp(),
    )));

class QuizApp extends StatelessWidget {
  Widget questionIcon() {
    return Container(
      child: Icon(CupertinoIcons.question_circle_fill, size: 34.88),
      margin: EdgeInsets.only(top: 227, bottom: 21),
      padding: EdgeInsets.only(left: 24),
    );
  }

  Widget questionText(String text) {
    return Container(
        child: Text(text, style: TextStyle(fontSize: 25)),
        padding: EdgeInsets.only(left: 25));
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => TFQuestionViewModel(),
      child: Consumer<TFQuestionViewModel>(builder: (context, model, child) {
        return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          questionIcon(),
          questionText(model.question.text),
          Expanded(
              child: Container(
                  margin: EdgeInsets.only(top: 100),
                  child: ColoredBox(
                      color: Colors.grey,
                      child: Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                           AnswerButton(model.markAnswer, 'True', true),
                            AnswerButton(model.markAnswer, 'False', false)
                          ]))))
        ]);
    }
    ));
  }
}

class AnswerButton extends StatelessWidget {
  final Function _markAnswer;
  final String _text;
  final bool _answer;

  AnswerButton(this._markAnswer,this._text, this._answer);

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: EdgeInsets.all(10),
        child: ElevatedButton(
            onPressed: () => _markAnswer(_answer),
            child: Text(_text))
    );
  }
}






