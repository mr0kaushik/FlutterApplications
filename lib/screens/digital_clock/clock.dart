import 'dart:async';

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:mobile_computing/config/size_config.dart';
import 'package:mobile_computing/screens/digital_clock/components/digit_item.dart';

import 'components/clock_container.dart';
import 'components/current_time_clock_hands.dart';

class ClockPage extends StatefulWidget {
  final String tag;

  const ClockPage({Key key, this.tag}) : super(key: key);

  @override
  ClockPageState createState() => ClockPageState();
}

class ClockPageState extends State<ClockPage> {
  String _formattedTime = '';
  String hr = '';
  String min = '';
  String mer = '';

  @override
  void initState() {
//    _getLocationFromSharedPref();
    Timer.periodic(Duration(seconds: 1), (Timer t) => _getTime());
    super.initState();
  }

  void _getTime() {
    String formattedDateTime = DateFormat("hh:mm a").format(DateTime.now());
    if (this.mounted) {
      setState(() {
        _formattedTime = formattedDateTime;
        hr = _formattedTime.split(" ")[0];
        mer = _formattedTime.split(" ")[1];
      });
    }
  }

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
            "Clock",
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
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                ClockContainer(
                  child: CustomPaint(
                    painter: CurrentTimeClockHands(),
                  ),
                ),
                SizedBox(
                  height: SizeConfig.defaultSize * 2,
                ),
                Wrap(
                  alignment: WrapAlignment.center,
                  children: [
                    DigitalItem(value: "$hr"),
                    DigitalItem(value: "$mer"),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
