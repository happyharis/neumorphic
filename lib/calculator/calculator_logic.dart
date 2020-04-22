import 'package:flutter/material.dart';
import 'package:math_expressions/math_expressions.dart';

class Calculator extends ChangeNotifier {
  // Part 4.a. from having to check whether if the list is empty,
  // add this in, it will save a lot of life. Explain the list
  // of actions.
  List<CalculatorVariable> _actions = [CalculatorNumber('0')];

  // part of 1.
  num _value = 0;
  num get value => _value;
  // end part of .1

  CalculatorVariable get currentVariable => _actions.last;

// Part 4.a : Simple use case: user press 1 + 1 =
  void simpleAdd() {
    _actions.add(CalculatorAdd());
  }

  void simpleResult() {
    // part 4.b must create parseCalculatorActions()
    _value = parseCalculatorActions(_actions);
    notifyListeners();
  }
  // Part 5.a : Moderate difficulty use case: user press 1 + 1 + shows result
  // when pressed at 2nd +, you have to show result already

  void add() {
    takeAction(
      CalculatorAdd(),
      when: _actions.last is! CalculatorAdd,
    );
  }

  void deduct() {
    takeAction(
      CalculatorDeduct(),
      when: _actions.last is! CalculatorDeduct,
    );
  }

  void multiply() {
    takeAction(
      CalculatorMultiply(),
      when: _actions.last is! CalculatorMultiply,
    );
  }

  void divide() {
    takeAction(
      CalculatorDivide(),
      when: _actions.last is! CalculatorDivide,
    );
  }

  void takeAction(
    CalculatorVariable action, {
    @required bool when,
  }) {
    if (when) {
      if (_actions.last is MathOperator) {
        _actions.removeLast();
      } else {
        _value = parseCalculatorActions(_actions);
      }
      _actions.add(action);
    }
    notifyListeners();
  }

  void reset() {
    _actions = [CalculatorNumber('0')];
    _value = 0;
    notifyListeners();
  }

  void showResult() {
    _value = parseCalculatorActions(_actions);
    notifyListeners();
  }

  void setValue(num number) {
    if (_actions.last is! CalculatorNumber) {
      _value = 0;
    }
    // 1. Create the number value and go to calcutor view for provider
    // use and see if it works.
    final stringifyedValue = _value.toString();
    if (_value == 0) {
      _value = number;
    } else {
      _value = int.parse(stringifyedValue + number.toString());
    }

    notifyListeners();

    //end 1.

    // 2. Explain my approach on solving the calculator problem
    // A user on the calculator has somewhat predictable actions
    // Why? Because they only have one screen and the only thing that
    // they want to do is some math calculation
    // So, having a list of actions according to the arithmetic operators
    // and typed numbers
    // In programming terms, create a list of objects that can be converted
    // to strings and mash them up to be an equation to

    final lastAction = _actions.last;
    if (lastAction is CalculatorNumber) _actions.removeLast();

    _actions.add(CalculatorNumber(_value.toString()));
  }
}

// 3. create an inteface, or the replicatable mould of the different
// calculator variable. As I said earlier, you have to have property,
// so that when you calculate, it is easier debug and see.
// For the calculator number, it is different as you want to input the
// numbers la!
// Add in the value for the different operator

abstract class CalculatorVariable {
  CalculatorVariable({this.value});

  final String value;
}

abstract class MathOperator {}

class CalculatorAdd extends CalculatorVariable with MathOperator {
  String value = '+';
}

class CalculatorMultiply extends CalculatorVariable with MathOperator {
  String value = '*';
}

class CalculatorDivide extends CalculatorVariable with MathOperator {
  String value = '/';
}

class CalculatorDeduct extends CalculatorVariable with MathOperator {
  String value = '-';
}

class CalculatorNumber extends CalculatorVariable {
  CalculatorNumber(this.value);

  final String value;
}

num parseCalculatorActions(List<CalculatorVariable> actions) {
  final List<String> mathVariables = [];

  actions.forEach((action) => mathVariables.add(action.value));

  final variablesLength = mathVariables.length;

  if (variablesLength.isEven) mathVariables.removeLast();

  final equation = mathVariables.join(' ');

  final num result = Parser().parse(equation).evaluate(
        EvaluationType.REAL,
        ContextModel(),
      );
  print('$equation = $result');

  final prettierResult = isInteger(result) ? result.round() : result;

  return prettierResult;
}

bool isInteger(num value) {
  return value is int || value == value.roundToDouble();
}
