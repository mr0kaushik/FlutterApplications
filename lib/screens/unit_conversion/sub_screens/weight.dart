import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Weight extends StatefulWidget {
  final String tag;

  const Weight({Key key, this.tag}) : super(key: key);

  @override
  _WeightState createState() => _WeightState();
}

class _WeightState extends State<Weight> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Weight",
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
