import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Speed extends StatefulWidget {
  final String tag;

  const Speed({Key key, this.tag}) : super(key: key);

  @override
  _SpeedState createState() => _SpeedState();
}

class _SpeedState extends State<Speed> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Speed",
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
        child: Hero(tag: widget.tag, child: Column()),
      ),
    );
  }
}
