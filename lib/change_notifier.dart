import 'package:flutter/cupertino.dart';
import 'model.dart';

class TFQuestionViewModel extends ChangeNotifier {
  final questions = TFQuestion.sampleQuestions;
  var _currentQuestion;
  int _currentIndex = 0;
  int _score = 0;

  TFQuestionViewModel() {
    _currentQuestion = questions[_currentIndex];
  }

  int get score => _score;
  TFQuestion get question => _currentQuestion;


  void markAnswer(bool answer) {
    print(_currentQuestion);
    if(answer == _currentQuestion.answer)
      _increaseScore();
    updateQuestion();
    notifyListeners();
  }

  void _increaseScore() => _score++;

   void updateQuestion() {
    print('Calling update question');
    _currentIndex++;
    if(_currentIndex < questions.length)
      _currentQuestion = questions[_currentIndex];
  }

}