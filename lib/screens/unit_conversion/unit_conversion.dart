import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mobile_computing/config/size_config.dart';

import 'components/unit_item_model.dart';
import 'components/unit_item_widget.dart';
import 'sub_screens/age.dart';
import 'sub_screens/bmi.dart';
import 'sub_screens/date.dart';
import 'sub_screens/discount.dart';
import 'sub_screens/length.dart';
import 'sub_screens/percentage.dart';
import 'sub_screens/speed.dart';
import 'sub_screens/temperature.dart';
import 'sub_screens/weight.dart';

class UnitConversionScreen extends StatefulWidget {
  final String tag;

  const UnitConversionScreen({Key key, this.tag}) : super(key: key);

  @override
  _UnitConversionScreenState createState() => _UnitConversionScreenState();
}

class _UnitConversionScreenState extends State<UnitConversionScreen> {
  List<Model> items = [
    Model("bmi.svg", "BMI", UnitItemType.BMI),
    Model("age.svg", "Age", UnitItemType.AGE),
    Model("discount.svg", "Discount", UnitItemType.DISCOUNT),
    Model("percentage.svg", "Percentage", UnitItemType.PERCENTAGE),
    Model("date.svg", "Date", UnitItemType.DATE),
    Model("length.svg", "Length", UnitItemType.LENGTH),
    Model("temperature.svg", "Temperature", UnitItemType.TEMPERATURE),
    Model("weight.svg", "Weight", UnitItemType.WEIGHT),
    Model("speed.svg", "speed", UnitItemType.SPEED),
  ];

  @override
  Widget build(BuildContext context) {
    final itemWidth = SizeConfig.screenWidth / 4;
    return Scaffold(
      appBar: AppBar(
        title: Hero(
          tag: widget.tag,
          flightShuttleBuilder:
              (flightContext, animation, direction, fromContext, toContext) =>
                  SizedBox.shrink(),
          child: Text(
            "Unit Conversions",
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
        child: GridView.count(
            crossAxisCount: 3,
            childAspectRatio: 4 / 5,
            padding: const EdgeInsets.all(4.0),
            mainAxisSpacing: 4.0,
            crossAxisSpacing: 4.0,
            children: items.map((Model item) {
              return UnitItemWidget(
                height: itemWidth,
                item: item,
                onTap: () {
                  _navigate(item.type, item.title);
                },
              );
            }).toList()),
      ),
    );
  }

  void _navigate(UnitItemType type, String tag) {
    Widget nextScreen;
    switch (type) {
      case UnitItemType.BMI:
        nextScreen = BMI(tag: tag);
        break;
      case UnitItemType.AGE:
        nextScreen = Age(tag: tag);
        break;
      case UnitItemType.DISCOUNT:
        nextScreen = Discount(tag: tag);
        break;
      case UnitItemType.PERCENTAGE:
        nextScreen = Percentage(tag: tag);
        break;
      case UnitItemType.DATE:
        nextScreen = Date(tag: tag);
        break;
      case UnitItemType.LENGTH:
        nextScreen = Length(tag: tag);
        break;
      case UnitItemType.TEMPERATURE:
        nextScreen = Temperature(tag: tag);
        break;
      case UnitItemType.WEIGHT:
        nextScreen = Weight(tag: tag);
        break;
      case UnitItemType.SPEED:
        nextScreen = Speed(tag: tag);
        break;
    }
    Navigator.of(context).push(MaterialPageRoute(
      builder: (context) => nextScreen,
    ));
  }
}
