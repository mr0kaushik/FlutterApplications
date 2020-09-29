import 'package:flutter/material.dart';
import 'package:mobile_computing/config/size_config.dart';

import 'constants.dart';

class ClockContainer extends StatelessWidget {
  final Widget child;

  ClockContainer({this.child});

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: <Widget>[
        Center(
          child: Container(
            width: SizeConfig.defaultSize * 30,
            height: SizeConfig.defaultSize * 30,
            decoration: BoxDecoration(
              color: Color(darkSilver),
              shape: BoxShape.circle,
              boxShadow: [
                BoxShadow(
                  color: Colors.grey[300],
                  offset: Offset(4.0, 4.0),
                  blurRadius: 5.0,
                  spreadRadius: 0.5,
                ),
                BoxShadow(
                  color: Color(darkSilver),
                  offset: Offset(-4.0, -4.0),
                  blurRadius: 15.0,
                  spreadRadius: 1.0,
                ),
              ],
            ),
          ),
        ),
        Center(
          child: Container(
            width: SizeConfig.defaultSize * 22,
            height: SizeConfig.defaultSize * 22,
            decoration: BoxDecoration(
              color: Color(silver),
              shape: BoxShape.circle,
              boxShadow: [
                BoxShadow(
                  color: Colors.grey[400],
                  offset: Offset(4.0, 4.0),
                  blurRadius: 5.0,
                  spreadRadius: 1.0,
                ),
                BoxShadow(
                  color: Color(silver),
                  offset: Offset(-4.0, -4.0),
                  blurRadius: 15.0,
                  spreadRadius: 1.0,
                ),
              ],
            ),
          ),
        ),
        Center(
          child: Container(
            width: SizeConfig.defaultSize * 8,
            height: SizeConfig.defaultSize * 8,
            decoration: BoxDecoration(
              color: Color(silver),
              shape: BoxShape.circle,
              boxShadow: [
                BoxShadow(
                  color: Colors.grey[400],
                  offset: Offset(4.0, 4.0),
                  blurRadius: 5.0,
                  spreadRadius: 1.0,
                ),
                BoxShadow(
                  color: Color(silver),
                  offset: Offset(-4.0, -4.0),
                  blurRadius: 15.0,
                  spreadRadius: 1.0,
                ),
              ],
            ),
          ),
        ),
        Center(
          child: this.child,
        ),
        Center(
          child: Container(
            width: SizeConfig.defaultSize * 1.5,
            height: SizeConfig.defaultSize * 1.5,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: Color(red),
            ),
          ),
        ),
      ],
    );
  }
}
