import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:quiz_app/score_page.dart';
import 'package:quiz_app/score_page_args.dart';
import 'answer_button.dart';
import 'change_notifier.dart';

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
                              AnswerButton(() {
                                print('Button pressed!');
                                model.markAnswer(true);
                                if(model.onLastQuestion()) {
                                  Navigator.pushNamed(context, ScorePage.routeName, arguments: ScorePageArgs(model.score, model.progressScore));
                                }
                              }, 'True'),
                              AnswerButton(() {
                                model.markAnswer(false);
                                if(model.onLastQuestion()) {
                                  Navigator.pushNamed(context, ScorePage.routeName, arguments: ScorePageArgs(model.score, model.progressScore));
                                }
                              }, 'False',)
                            ]))))
          ]);
        }
        ));
  }
}