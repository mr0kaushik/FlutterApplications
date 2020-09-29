import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Discount extends StatefulWidget {
  final String tag;

  const Discount({Key key, this.tag}) : super(key: key);

  @override
  _DiscountState createState() => _DiscountState();
}

class _DiscountState extends State<Discount> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Discount",
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
