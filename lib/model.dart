class TFQuestion {
  final String _text;
  final bool _answer;

  TFQuestion(this._text, this._answer);

  String get text => _text;

  bool get answer => _answer;

  static final List<TFQuestion> sampleQuestions = [
    TFQuestion('Binary search is always faster than linear search', false),
    TFQuestion(
        'An objective way to compare two algorithms is by comparing their execution time irrespective of the machines',
        false),
    TFQuestion(
        'When an array is passed to a function, the function receives a copy of the array (call by value)',
        false),
    TFQuestion(
        'The parameter to a copy constructor must be passed by reference',
        true),
    TFQuestion(
        'The largest value in a binary search tree is always stored at the right most node of the tree',
        true)
  ];
}
