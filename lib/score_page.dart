import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:quiz_app/score_page_args.dart';

class ScorePage extends StatelessWidget {
  static const routeName = '/showScore';

  Widget buildAlertDialog(BuildContext context) {
    return CupertinoAlertDialog(title: Text('Alert !!'),
        content: Center(child: Text('Please use the retry button to retry')),
        actions: [CupertinoButton(child: Text('OK'), onPressed: () => Navigator.of(context).pop())]);
  }

  Widget buildScoreIndicator(double value) {
    return CircularProgressIndicator(
        backgroundColor: Color.fromARGB(255, 27, 11, 138),
        valueColor: AlwaysStoppedAnimation<Color>(
            Color.fromARGB(255, 152, 223, 27)),
        strokeWidth: 10.0,
        value: value
    );
  }

  @override
  Widget build(BuildContext context) {
    final ScorePageArgs args =
        ModalRoute.of(context).settings.arguments as ScorePageArgs;

    return WillPopScope(
        onWillPop: () async {
          showDialog(context: context, builder: (builder){
            return buildAlertDialog(context);
          });
         return false;
        },
        child: Scaffold(
          appBar: AppBar(title: Text('Score'),),
          body: Column(mainAxisAlignment: MainAxisAlignment.center, crossAxisAlignment: CrossAxisAlignment.center,
          children: [Center(
              child: Stack(alignment: AlignmentDirectional.center,
                children: [ SizedBox(
                    height: 279,
                    width: 282,
                    child: buildScoreIndicator(args.progressValue)),
                  Center(child: Text(
                    "${args.score} / 5",
                    style: TextStyle(fontSize: 35),
                  ))
                ],
              )), Container(margin: EdgeInsets.only(top: 20), child: ElevatedButton(onPressed: () { Navigator.pushNamed( context, '/'); },
            child: Text('Retry'),),)],),));
  }


}




