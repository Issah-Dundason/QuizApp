import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:quiz_app/score_page.dart';
import 'home_page.dart';

void main() => runApp(MaterialApp(
    routes: {ScorePage.routeName :(context) => ScorePage()},
    home: Scaffold(
      appBar: AppBar(title: Text('Quiz')),
      body: QuizApp(),
    )));








