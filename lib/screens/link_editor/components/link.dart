import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Link {
  RegExpMatch regExpMatch;
  String type;

  Link({this.regExpMatch, this.type});
}

class CustomLink {
  String regex;
  TextStyle style;
  Function(String) onTap;

  CustomLink(
      {this.regex,
      this.style = const TextStyle(color: Colors.green),
      this.onTap});
}
