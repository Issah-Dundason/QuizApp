import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ScorePage extends StatelessWidget {
  final double _progressValue;
  final int _score;

  ScorePage(this._progressValue, this._score);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
          backgroundColor: Colors.grey,
          appBar: AppBar(title: Text('Score')),
          body: Center(
            child: Stack(alignment: AlignmentDirectional.center,
              children: [
                 SizedBox(
                   height: 279,
                   width: 282,
                   child: CircularProgressIndicator(
                     backgroundColor: Color.fromARGB(255, 27, 11, 138),
                     valueColor: AlwaysStoppedAnimation<Color>(Color.fromARGB(255, 152, 223, 27)),
                     strokeWidth: 10.0,
                     value: _progressValue,
              )),
               Center(
                 child: Text("$_score / 5", style: TextStyle(fontSize: 35, color: Colors.white),),
              )
        ],
      )),
    ));
  }
}
