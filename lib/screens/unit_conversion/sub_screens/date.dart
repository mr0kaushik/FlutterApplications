import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Date extends StatefulWidget {
  final String tag;

  const Date({Key key, this.tag}) : super(key: key);

  @override
  _DateState createState() => _DateState();
}

class _DateState extends State<Date> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Date",
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
