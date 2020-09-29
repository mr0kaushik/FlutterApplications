import 'package:flutter/material.dart';
import 'package:mobile_computing/config/size_config.dart';

class NumberDisplay extends StatelessWidget {
  NumberDisplay({this.value: ''});

  final String value;

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: EdgeInsets.only(
          top: SizeConfig.defaultSize,
          right: SizeConfig.defaultSize * 2,
        ),
        child: Row(
          children: <Widget>[
            Flexible(
              child: Text(
                value,
                textAlign: TextAlign.end,
                style: TextStyle(fontSize: 40, fontWeight: FontWeight.bold),
              ),
            ),
          ],
          mainAxisAlignment: MainAxisAlignment.end,
        ));
  }
}
