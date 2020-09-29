import 'number-formatter.dart';

class CalculatorKey {
  final String value;
  final int length;

  const CalculatorKey(this.value, {this.length = 1});
}

class Calculations {
  static const CalculatorKey PERIOD = const CalculatorKey('.');
  static const CalculatorKey MULTIPLY = const CalculatorKey('*');
  static const CalculatorKey SUBTRACT = const CalculatorKey('-');
  static const CalculatorKey ADD = const CalculatorKey('+');
  static const CalculatorKey DIVIDE = const CalculatorKey('/');
  static const CalculatorKey CLEAR = const CalculatorKey('CLEAR', length: 2);
  static const CalculatorKey EQUAL = const CalculatorKey('=', length: 2);
  static const CalculatorKey DELETE = const CalculatorKey('\u232B');

  static const OPERATIONS = [
    Calculations.ADD,
    Calculations.MULTIPLY,
    Calculations.SUBTRACT,
    Calculations.DIVIDE,
    Calculations.DELETE,
  ];

  static double add(double a, double b) => a + b;

  static double subtract(double a, double b) => a - b;

  static double divide(double a, double b) => a / b;

  static double multiply(double a, double b) => a * b;
}

class Calculator {
  static String parseString(String text) {
    List<String> numbersToAdd;
    double a, b, result;
    if (text.contains(Calculations.ADD.value)) {
      numbersToAdd = text.split(Calculations.ADD.value);
      a = double.parse(numbersToAdd[0]);
      b = double.parse(numbersToAdd[1]);

      result = Calculations.add(a, b);
    } else if (text.contains(Calculations.MULTIPLY.value)) {
      numbersToAdd = text.split(Calculations.MULTIPLY.value);
      a = double.parse(numbersToAdd[0]);
      b = double.parse(numbersToAdd[1]);

      result = Calculations.multiply(a, b);
    } else if (text.contains(Calculations.DIVIDE.value)) {
      numbersToAdd = text.split(Calculations.DIVIDE.value);
      a = double.parse(numbersToAdd[0]);
      b = double.parse(numbersToAdd[1]);

      result = Calculations.divide(a, b);
    } else if (text.contains(Calculations.SUBTRACT.value)) {
      numbersToAdd = text.split(Calculations.SUBTRACT.value);
      a = double.parse(numbersToAdd[0]);
      b = double.parse(numbersToAdd[1]);

      result = Calculations.subtract(a, b);
    } else {
      return text;
    }

    return NumberFormatter.format(result.toString());
  }

  static String addPeriod(String calculatorString) {
    if (calculatorString.isEmpty) {
      return calculatorString = '0${Calculations.PERIOD}';
    }

    RegExp exp = new RegExp(r"\d\.");
    Iterable<Match> matches = exp.allMatches(calculatorString);
    int maxMatches = Calculator.includesOperation(calculatorString) ? 2 : 1;

    return matches.length == maxMatches
        ? calculatorString
        : calculatorString += Calculations.PERIOD.value;
  }

  static bool includesOperation(String calculatorString) {
    for (var operation in Calculations.OPERATIONS) {
      if (calculatorString.contains(operation.value)) {
        return true;
      }
    }

    return false;
  }
}
