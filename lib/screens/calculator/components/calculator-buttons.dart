import 'package:flutter/material.dart';

import 'calculator-button.dart';
import 'calculator-row.dart';
import 'calculator.dart';

class CalculatorButtons extends StatelessWidget {
  CalculatorButtons({@required this.onTap});

  final CalculatorButtonTapCallback onTap;
  final List<List<CalculatorKey>> calculatorButtonRows = [
    [Calculations.CLEAR, Calculations.DELETE, Calculations.DIVIDE],
    [
      CalculatorKey('7'),
      CalculatorKey('8'),
      CalculatorKey('9'),
      Calculations.MULTIPLY
    ],
    [
      CalculatorKey('4'),
      CalculatorKey('5'),
      CalculatorKey('6'),
      Calculations.SUBTRACT
    ],
    [
      CalculatorKey('1'),
      CalculatorKey('2'),
      CalculatorKey('3'),
      Calculations.ADD
    ],
    [CalculatorKey('0'), Calculations.PERIOD, Calculations.EQUAL],
    // ['<', Calculations.CLEAR, Calculations.EQUAL]
  ];

  @override
  Widget build(BuildContext context) {
    return Column(
        children: calculatorButtonRows.map((calculatorRowButtons) {
      return CalculatorRow(
        buttons: calculatorRowButtons,
        onTap: onTap,
      );
    }).toList());
  }
}
