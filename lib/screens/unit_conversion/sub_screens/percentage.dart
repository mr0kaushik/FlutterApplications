import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Percentage extends StatefulWidget {
  final String tag;

  const Percentage({Key key, this.tag}) : super(key: key);

  @override
  _PercentageState createState() => _PercentageState();
}

class _PercentageState extends State<Percentage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Percentage",
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
