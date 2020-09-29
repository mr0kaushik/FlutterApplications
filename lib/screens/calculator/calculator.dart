import 'package:flutter/material.dart';

import 'components/calculator-buttons.dart';
import 'components/calculator.dart';
import 'components/number-display.dart';

class CalculatorScreen extends StatefulWidget {
  final String tag;

  CalculatorScreen({Key key, this.tag}) : super(key: key);

  @override
  _CalculatorScreenState createState() => _CalculatorScreenState();
}

class _CalculatorScreenState extends State<CalculatorScreen> {
  bool isNewEquation = true;
  List<double> values = [];
  List<String> operations = [];
  List<String> calculations = [];
  String calculatorString = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Hero(
            tag: widget.tag,
            flightShuttleBuilder:
                (flightContext, animation, direction, fromContext, toContext) =>
                    SizedBox.shrink(),
            child: Text(
              "Calculator",
            ),
          ),
          centerTitle: true,
          automaticallyImplyLeading: false,
          leading: IconButton(
            icon: Icon(
              Icons.arrow_back_ios,
              size: 22,
            ),
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
        ),
        body: SafeArea(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              NumberDisplay(value: calculatorString),
              CalculatorButtons(onTap: _onPressed),
            ],
          ),
        ));
  }

  void _onPressed({String buttonText}) {
    // Standard mathematical operations
    if (Calculations.OPERATIONS.contains(buttonText)) {
      return setState(() {
        operations.add(buttonText);
        calculatorString += " $buttonText ";
      });
    }

    // On CLEAR press
    if (buttonText == Calculations.CLEAR.value) {
      return setState(() {
        operations.add(Calculations.CLEAR.value);
        calculatorString = "";
      });
    }

    if (buttonText == Calculations.DELETE.value) {
      return setState(() {
        operations.add(Calculations.DELETE.value);
        calculatorString =
            calculatorString.substring(0, calculatorString.length - 1);
      });
    }

    // On Equals press
    if (buttonText == Calculations.EQUAL.value) {
      String newCalculatorString = Calculator.parseString(calculatorString);

      return setState(() {
        if (newCalculatorString != calculatorString) {
          // only add evaluated strings to calculations array
          calculations.add(calculatorString);
        }

        operations.add(Calculations.EQUAL.value);
        calculatorString = newCalculatorString;
        isNewEquation = false;
      });
    }

    if (buttonText == Calculations.PERIOD.value) {
      return setState(() {
        calculatorString = Calculator.addPeriod(calculatorString);
      });
    }

    setState(() {
      if (!isNewEquation &&
          operations.length > 0 &&
          operations.last == Calculations.EQUAL.value) {
        calculatorString = buttonText;
        isNewEquation = true;
      } else {
        calculatorString += buttonText;
      }
    });
  }
}
