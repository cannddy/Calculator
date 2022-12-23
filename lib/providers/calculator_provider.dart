import 'package:flutter/foundation.dart';
import 'package:math_expressions/math_expressions.dart';

class CalculatorProvider extends ChangeNotifier {
  String _userInput = '';
  String _answer = '';

  String get userInput => _userInput;
  String get answer => _answer;

  void buttonPressed(String val) {
    _userInput += val;
    notifyListeners();
  }

  void equalPressed() {
    _userInput = _userInput.replaceAll('x', '*');
    Parser p = Parser();
    Expression exp = p.parse(_userInput);
    ContextModel cm = ContextModel();
    double eval = exp.evaluate(EvaluationType.REAL, cm);
    _answer = eval.toString();
    notifyListeners();
  }
  void clear(){
    _userInput = '';
    _answer = '';
    notifyListeners();
  }
}
