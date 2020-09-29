import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mobile_computing/config/size_config.dart';

import 'components/linkable.dart';

class LinkEditorScreen extends StatefulWidget {
  final String tag;

  const LinkEditorScreen({Key key, this.tag}) : super(key: key);

  @override
  _LinkEditorScreenState createState() => _LinkEditorScreenState();
}

class _LinkEditorScreenState extends State<LinkEditorScreen> {
  @override
  Widget build(BuildContext context) {
    final itemWidth = SizeConfig.screenWidth / 4;
    return Scaffold(
      appBar: AppBar(
        title: Hero(
          tag: widget.tag,
          flightShuttleBuilder:
              (flightContext, animation, direction, fromContext, toContext) =>
                  SizedBox.shrink(),
          child: Text(
            "Text Editor",
          ),
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
      body: SafeArea(
        child: Container(
          margin: const EdgeInsets.all(16.0),
          padding: const EdgeInsets.all(8.0),
          decoration: BoxDecoration(
              border: Border.all(color: Theme.of(context).primaryColor),
              borderRadius: BorderRadius.circular(8.0)),
          child: LinkEditor(
            text:
                "Hi!\nI'm Deepak Kaushik, pursuing MTech from NSUT\n\nConnect me at kaushik875@gmail.com \nOr just ping me at @ +91-1234567891.\n\nDon't forget to visit my \nGithub Profile: github.com/mr0kaushik \nLinkedIn Profile: https://www.linkedin.com/in/mr0kaushik/\nPortfolio: mr0kaushik.github.io",
          ),
        ),
      ),
    );
  }
}
