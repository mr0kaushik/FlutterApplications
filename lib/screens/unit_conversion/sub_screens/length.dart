import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Length extends StatefulWidget {
  final String tag;

  const Length({Key key, this.tag}) : super(key: key);

  @override
  _LengthState createState() => _LengthState();
}

class _LengthState extends State<Length> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Length",
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
