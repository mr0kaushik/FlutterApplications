import 'package:flutter/material.dart';
import 'package:mobile_computing/config/size_config.dart';
import 'package:mobile_computing/screens/home/home_screen.dart';

import 'components/circular_reveal.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with TickerProviderStateMixin {
  AnimationController _revealAnimationController;
  Animation<double> _revealAnimation;

  bool isFirstBuild = true;

  @override
  void initState() {
    super.initState();

    _revealAnimationController = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 400),
    );
    _revealAnimation = CurvedAnimation(
      parent: _revealAnimationController,
      curve: Curves.easeIn,
    );

    _revealAnimationController.addStatusListener((status) {
      Navigator.of(context).pushReplacement(
          MaterialPageRoute(builder: (context) => HomeScreen()));
    });

    Future.delayed(const Duration(milliseconds: 100), () {
      _revealAnimationController.forward();
    });
  }

  @override
  void dispose() {
    _revealAnimationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    final double defaultSize = SizeConfig.defaultSize;
    return Scaffold(
        resizeToAvoidBottomPadding: false,
        resizeToAvoidBottomInset: false,
        body: Container(
          child: Stack(
            children: <Widget>[
              CircularRevealAnimation(
                minRadius: 0,
                centerAlignment: Alignment.center,
                child: Container(
                  width: double.infinity,
                  height: double.infinity,
                  color: Theme.of(context).primaryColor,
                  child: Center(
                    child: Image.asset(
                      "assets/logo/app_logo.png",
                      width: defaultSize * 20,
                    ),
                  ),
                ),
                animation: _revealAnimation,
              ),
            ],
          ),
        ));
  }
}
