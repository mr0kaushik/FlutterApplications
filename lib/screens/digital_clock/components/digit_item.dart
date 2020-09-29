import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mobile_computing/config/size_config.dart';

class DigitalItem extends StatelessWidget {
  final String value;

  const DigitalItem({Key key, this.value}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double defaultSize = SizeConfig.defaultSize;

    return Container(
      margin: EdgeInsets.all(defaultSize * 1),
      padding: EdgeInsets.all(defaultSize * 2),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8.0),
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
        "$value",
        style: Theme.of(context).textTheme.bodyText2.copyWith(
            fontSize: defaultSize * 5.0,
            fontWeight: FontWeight.bold,
            color: Theme.of(context).primaryColor),
      ),
    );
  }
}
