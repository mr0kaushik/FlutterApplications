import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:mobile_computing/config/extentions.dart';
import 'package:mobile_computing/config/size_config.dart';

import 'unit_item_model.dart';

class UnitItemWidget extends StatelessWidget {
  const UnitItemWidget({this.item, @required this.onTap, this.height});

  final Model item;
  final VoidCallback onTap;
  final double height;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(SizeConfig.defaultSize),
      child: Hero(
        tag: item.title,
        child: Container(
          alignment: Alignment.center,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(0),
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
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              SizedBox(
                height: height * 0.6,
                width: height * 0.6,
                child: FittedBox(
                  child: SvgPicture.asset(
                    "assets/svg/${item.path}",
                    color: Theme.of(context).primaryColor,
                  ),
                ),
              ),
              Text(
                item.title,
                style: Theme.of(context).textTheme.subtitle2.copyWith(
                      height: 3,
                      fontSize: SizeConfig.defaultSize * 1.4,
                      fontWeight: FontWeight.w500,
                      color: Theme.of(context).primaryColor,
                    ),
              ),
            ],
          ),
        ).ripple(onTap),
      ),
    );
  }
}
