import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:mobile_computing/config/extentions.dart';
import 'package:mobile_computing/config/size_config.dart';

class MenuItem extends StatelessWidget {
  final String title;
  final String desc;
  final String asset;
  final VoidCallback onTap;

  const MenuItem({Key key, this.title, this.asset, this.onTap, this.desc})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final double defaultSize = SizeConfig.defaultSize;

    return Container(
        margin: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 8.0),
        child: Container(
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(defaultSize),
            boxShadow: [
              BoxShadow(
                offset: Offset(4.0, 4.0),
                color: Colors.grey[500].withOpacity(0.2),
                spreadRadius: 1.0,
                blurRadius: 15.0,
              ),
              BoxShadow(
                offset: Offset(-4.0, -4.0),
                color: Colors.white,
                spreadRadius: 1.0,
                blurRadius: 15.0,
              ),
            ],
          ),
          padding: EdgeInsets.symmetric(
              horizontal: defaultSize * 2, vertical: defaultSize),
          child: ListTile(
            contentPadding: const EdgeInsets.all(0),
            leading: SvgPicture.asset(
              "$asset",
              width: SizeConfig.getProportionateScreenWidth(48),
            ),
            title: Hero(
              tag: asset,
              child: Text(
                "$title",
                style: Theme.of(context)
                    .textTheme
                    .subtitle2
                    .copyWith(fontSize: SizeConfig.defaultSize * 2.0),
              ),
            ),
            subtitle: Text(
              "$desc",
              style: Theme.of(context).textTheme.bodyText1.copyWith(
                  color: Colors.grey, fontSize: SizeConfig.defaultSize * 1.5),
            ),
          ),
        ).ripple(onTap));
  }
}
