import 'package:flutter/material.dart';
import 'package:mobile_computing/config/extentions.dart';
import 'package:mobile_computing/screens/calculator/components/calculator.dart';

typedef void CalculatorButtonTapCallback({String buttonText});

class CalculatorButton extends StatelessWidget {
  CalculatorButton({this.cKey, @required this.onTap});

  final CalculatorKey cKey;
  final CalculatorButtonTapCallback onTap;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size.width / 4;
    final height = MediaQuery.of(context).size.height / 10;
    return Container(
      width: size * cKey.length,
      height: height,
      alignment: Alignment.center,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(0),
        boxShadow: [
          BoxShadow(
            offset: Offset(4.0, 4.0),
            color: Colors.grey[500].withOpacity(0.2),
            spreadRadius: 1.0,
            blurRadius: 15.0,
          ),
          BoxShadow(
            offset: Offset(-4.0, -4.0),
            color: Colors.white,
            spreadRadius: 1.0,
            blurRadius: 15.0,
          ),
        ],
      ),
      child: Text(
        cKey.value,
        style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
      ),
    ).ripple(() {
      onTap(buttonText: cKey.value);
    });
  }
}
