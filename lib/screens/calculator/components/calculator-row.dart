import 'package:flutter/material.dart';
import 'package:mobile_computing/screens/calculator/components/calculator.dart';

import 'calculator-button.dart';

class CalculatorRow extends StatelessWidget {
  CalculatorRow({@required this.buttons, @required this.onTap});

  final List<CalculatorKey> buttons;
  final CalculatorButtonTapCallback onTap;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: rowButtons(),
      mainAxisAlignment: MainAxisAlignment.spaceAround,
    );
  }

  List<Widget> rowButtons() {
    List<Widget> rowButtons = [];

    buttons.forEach((CalculatorKey button) {
      rowButtons.add(
        CalculatorButton(
          cKey: button,
          onTap: onTap,
        ),
      );
    });

    return rowButtons;
  }
}
