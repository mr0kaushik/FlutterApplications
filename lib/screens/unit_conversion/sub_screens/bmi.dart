import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mobile_computing/config/extentions.dart';
import 'package:mobile_computing/config/size_config.dart';
import 'package:toggle_switch/toggle_switch.dart';

enum Gender { MALE, FEMALE }

class BMI extends StatefulWidget {
  final String tag;

  const BMI({Key key, this.tag}) : super(key: key);

  @override
  _BMIState createState() => _BMIState();
}

class _BMIState extends State<BMI> {
  static double minHeight = 20.0;
  static double maxHeight = 250;
  static int minAge = 1;
  static int maxAge = 150;
  static int minWeight = 2;
  static int maxWeight = 300;

  Gender gender = Gender.MALE;

  double height;
  int age;
  int weight;

  @override
  void initState() {
    height = maxHeight / 2;
    age = 20;
    weight = 50;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "BMI",
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
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Hero(
          tag: widget.tag,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            children: [
              Center(
                child: ToggleSwitch(
                  activeBgColor: Theme.of(context).primaryColor,
                  minWidth: SizeConfig.screenWidth * 0.3,
                  fontSize: SizeConfig.defaultSize * 1.8,
                  activeFgColor: Colors.white,
                  inactiveBgColor: Colors.black26,
                  minHeight: SizeConfig.defaultSize * 6,
                  initialLabelIndex: gender.index,
                  labels: [
                    "Male",
                    "Female",
                  ],
                  onToggle: (index) {
                    switch (index) {
                      case 0:
                        setState(() {
                          gender = Gender.MALE;
                        });
                        break;
                      case 1:
                        setState(() {
                          gender = Gender.FEMALE;
                        });
                        break;
                    }
                  },
                ),
              ),
              Container(
                margin: const EdgeInsets.only(top: 16.0),
                child: Container(
                  padding: const EdgeInsets.all(8.0),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(SizeConfig.defaultSize),
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
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        "Height",
                        style: Theme.of(context).textTheme.subtitle2.copyWith(
                              fontWeight: FontWeight.w500,
                              color: Colors.black38,
                              fontSize: SizeConfig.defaultSize * 2.4,
                            ),
                      ),
                      RichText(
                        textAlign: TextAlign.center,
                        text: TextSpan(
                            text: "$height",
                            style:
                                Theme.of(context).textTheme.subtitle2.copyWith(
                                      fontWeight: FontWeight.w500,
                                      fontSize: SizeConfig.defaultSize * 4.8,
                                      color: Theme.of(context).primaryColor,
                                    ),
                            children: [
                              TextSpan(
                                  text: " cm",
                                  style: TextStyle(
                                    fontSize: SizeConfig.defaultSize * 2.4,
                                  ))
                            ]),
                      ),
                      Slider(
                        min: minHeight,
                        max: maxHeight,
                        value: height,
                        onChanged: (val) => setState(() {
                          height = val.floorToDouble();
                        }),
                      )
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: SizeConfig.defaultSize * 2,
              ),
              Row(
                children: [
                  Picker(
                    title: "Age",
                    unit: "in Years",
                    minValue: minAge,
                    maxValue: maxAge,
                    onPickerValueChange: (val) => setState(() {
                      age = val;
                    }),
                  ),
                  Picker(
                    title: "Weight",
                    unit: "in Kg",
                    minValue: minWeight,
                    maxValue: maxWeight,
                    onPickerValueChange: (val) => setState(() {
                      weight = val;
                    }),
                  )
                ],
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: Container(
        padding: EdgeInsets.all(8.0),
        height: 60.0,
        width: double.infinity,
        alignment: Alignment.center,
        decoration: BoxDecoration(
          color: Theme.of(context).primaryColor,
          boxShadow: [
            BoxShadow(
              color: Colors.black26,
              offset: Offset(1.0, 0.0), //(x,y)
              blurRadius: 6.0,
            ),
          ],
        ),
        child: Text(
          "Calculate",
          style: Theme.of(context).textTheme.headline6.copyWith(
                color: Colors.white,
                fontSize: SizeConfig.defaultSize * 2.4,
              ),
        ),
      ).ripple(() {
        _calculate(context);
      }),
    );
  }

  void _calculate(BuildContext context) {
    List<String> val = BMIProcessor.calculate(age, height, weight.toDouble());
    showCupertinoModalPopup(
        context: context,
        builder: (context) {
          return Container(
            width: double.infinity,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(24.0),
                topRight: Radius.circular(24.0),
              ),
            ),
            padding: const EdgeInsets.all(16.0),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Container(
                  margin: const EdgeInsets.all(8.0),
                  height: 7.0,
                  width: 50.0,
                  decoration: BoxDecoration(
                    color: Colors.black26,
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                Text(
                  "BMI Value",
                  textAlign: TextAlign.center,
                  style: Theme.of(context).textTheme.subtitle2.copyWith(
                        fontWeight: FontWeight.w500,
                        color: Colors.black38,
                        fontSize: SizeConfig.defaultSize * 2.4,
                      ),
                ),
                SizedBox(
                  height: SizeConfig.defaultSize * 2,
                ),
                RichText(
                  textAlign: TextAlign.center,
                  text: TextSpan(
                      text: "${val[0]}",
                      style: Theme.of(context).textTheme.subtitle2.copyWith(
                            fontWeight: FontWeight.w500,
                            fontSize: SizeConfig.defaultSize * 4.8,
                            color: Theme.of(context).primaryColor,
                          ),
                      children: [
                        TextSpan(
                            text: " Kg/m\u00B2",
                            style: TextStyle(
                              fontSize: SizeConfig.defaultSize * 2.4,
                            ))
                      ]),
                ),
                Text(
                  "${val[1]}",
                  style: Theme.of(context).textTheme.subtitle2.copyWith(
                        fontWeight: FontWeight.w500,
                        fontSize: SizeConfig.defaultSize * 2.4,
                        color: Theme.of(context).primaryColor,
                      ),
                ),
                SizedBox(
                  height: SizeConfig.defaultSize * 2,
                ),
                Divider(
                  indent: 16.0,
                  endIndent: 16.0,
                  height: 12.0,
                )
              ],
            ),
          );
        });
  }
}

class BMIProcessor {
  static List<String> calculate(int age, double height, double weight) {
    double bmi = ((weight * 10000) / (height * height));
    String tag;
    // if (age >= 2 && age < 18) {
    if (bmi < 18.5) {
      tag = "Underweight";
    } else if (bmi <= 24.9) {
      tag = "Normal";
    } else if (bmi <= 29) {
      tag = "Overweight";
    } else if (bmi < 40) {
      tag = "Obese";
    } else {
      tag = "Extreme Obese";
    }
    // }

    return ["${bmi.toStringAsFixed(2)}", tag];
  }
}

class Picker extends StatefulWidget {
  final int minValue;
  final void Function(int value) onPickerValueChange;
  final int maxValue;
  final double iconSize;
  final double textSize;
  final String title;
  final String unit;

  const Picker(
      {Key key,
      this.onPickerValueChange,
      this.minValue = 0,
      this.maxValue = 10,
      this.iconSize = 16.0,
      this.textSize = 16.0,
      this.title,
      this.unit})
      : super(key: key);

  @override
  _PickerState createState() => _PickerState();
}

class _PickerState extends State<Picker> {
  int _value;

  @override
  void initState() {
    super.initState();
    _value = widget.minValue;
  }

  void increment() {
    if (_value < widget.maxValue && mounted) {
      setState(() {
        _value++;
      });
    }
    onChange();
  }

  void onChange() {
    if (widget.onPickerValueChange != null) {
      widget.onPickerValueChange(_value);
    }
  }

  void decrement() {
    if (_value > widget.minValue && mounted) {
      setState(() {
        _value--;
      });
    }
    onChange();
  }

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        margin: EdgeInsets.all(SizeConfig.defaultSize),
        child: Container(
          padding: EdgeInsets.all(SizeConfig.defaultSize),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(SizeConfig.defaultSize),
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
          child: Column(
            children: [
              RichText(
                textAlign: TextAlign.center,
                text: TextSpan(
                  text: "${widget.title}",
                  style: Theme.of(context).textTheme.subtitle2.copyWith(
                        fontWeight: FontWeight.w500,
                        color: Colors.black38,
                        fontSize: SizeConfig.defaultSize * 2.4,
                      ),
                  children: [
                    TextSpan(
                      text: "\n(${widget.unit})",
                      style: TextStyle(
                        fontSize: SizeConfig.defaultSize * 1.8,
                      ),
                    )
                  ],
                ),
              ),
              Text(
                "$_value",
                textAlign: TextAlign.center,
                style: Theme.of(context).textTheme.subtitle2.copyWith(
                      fontWeight: FontWeight.w500,
                      fontSize: SizeConfig.defaultSize * 4.8,
                      color: Theme.of(context).primaryColor,
                    ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  ActionButton(
                    icon: Icons.remove,
                    size: SizeConfig.defaultSize * 3.6,
                    color: Theme.of(context).primaryColor,
                    onTap: decrement,
                  ),
                  ActionButton(
                    size: SizeConfig.defaultSize * 3.6,
                    icon: Icons.add,
                    color: Theme.of(context).primaryColor,
                    onTap: increment,
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}

class ActionButton extends StatelessWidget {
  final IconData icon;
  final Color color;
  final double size;
  final VoidCallback onTap;

  const ActionButton(
      {Key key,
      this.icon,
      this.color = Colors.grey,
      this.onTap,
      this.size = 24.0})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
      onPressed: onTap,
      constraints: BoxConstraints(),
      elevation: 4.0,
      fillColor: color,
      child: Icon(
        icon,
        size: size,
        color: Colors.white,
      ),
      padding: EdgeInsets.all(4.0),
      shape: CircleBorder(),
    );
  }
}
