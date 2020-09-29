import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:mobile_computing/config/scroll_behavior.dart';
import 'package:mobile_computing/config/simple_message_dialog.dart';
import 'package:mobile_computing/config/size_config.dart';
import 'package:mobile_computing/screens/calculator/calculator.dart';
import 'package:mobile_computing/screens/digital_clock/clock.dart';
import 'package:mobile_computing/screens/phone_book/phone_book.dart';
import 'package:mobile_computing/screens/unit_conversion/unit_conversion.dart';
import 'package:permission_handler/permission_handler.dart';

import 'components/menu_item.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  DateTime currentBackPressTime;

  Future<bool> _onBackPressed() {
    DateTime now = DateTime.now();
    if (currentBackPressTime == null ||
        now.difference(currentBackPressTime) > Duration(seconds: 2)) {
      currentBackPressTime = now;
      Fluttertoast.showToast(msg: 'Press again to Exit');
      return Future.value(false);
    }
    return Future.value(true);
  }

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      appBar: AppBar(
        title: Text(
          "Apps",
          style: Theme.of(context).primaryTextTheme.headline6,
        ),
        centerTitle: true,
      ),
      body: WillPopScope(
        onWillPop: _onBackPressed,
        child: ScrollConfiguration(
          behavior: MobileScrollBehavior(),
          child: SingleChildScrollView(
            padding: EdgeInsets.only(bottom: SizeConfig.defaultSize * 5),
            child: Column(
              children: [
                MenuItem(
                  title: "Calculator",
                  desc: "A simple Calculator application",
                  asset: "assets/svg/calculator.svg",
                  onTap: () {
                    _getNextScreen(context,
                        CalculatorScreen(tag: "assets/svg/calculator.svg"));
                  },
                ),
                MenuItem(
                  title: "Clock",
                  desc: "An Analog & Digital Clock",
                  asset: "assets/svg/clock.svg",
                  onTap: () {
                    _getNextScreen(
                        context, ClockPage(tag: "assets/svg/clock.svg"));
                  },
                ),
                MenuItem(
                  title: "Phone Book",
                  desc: "A contact book application to save contacts",
                  asset: "assets/svg/phone_book.svg",
                  onTap: _getPhoneBook,
                ),
                MenuItem(
                  title: "Unit Conversion",
                  desc: "A unit conversion application",
                  asset: "assets/svg/unit.svg",
                  onTap: () {
                    _getNextScreen(context,
                        UnitConversionScreen(tag: "assets/svg/unit.svg"));
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void _getNextScreen(BuildContext context, Widget nextScreen) {
    Navigator.of(context)
        .push(MaterialPageRoute(builder: (context) => nextScreen));
  }

  Future<void> _getPhoneBook({PermissionStatus status}) async {
    if (status == null) {
      status = await Permission.contacts.status;
    }
    if (status.isGranted) {
      _getNextScreen(context, PhoneBook(tag: "assets/svg/phone_book.svg"));
    } else if (status.isDenied || status.isUndetermined) {
      MsgDialog.showMsgDialog(
          context: context,
          title: "Need Contacts Permission",
          msg:
              "This app requires contact permission, please tap allow to ask permission",
          positiveText: "Allow",
          negativeText: "Cancel",
          onPositivePressed: () async {
            PermissionStatus reqStatus = await Permission.contacts.request();
            _getPhoneBook(status: reqStatus);
          });
    } else {
      MsgDialog.showMsgDialog(
        context: context,
        title: "Contacts Permission Required !!",
        msg:
            "This app requires contact permission, please grant permissions on Settings",
        positiveText: "Okay",
        negativeText: '',
      );
    }
  }
}
