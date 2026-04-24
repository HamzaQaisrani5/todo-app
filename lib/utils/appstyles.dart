import 'package:flutter/material.dart';
import 'package:app_bottom_bar/utils/size_config.dart';

class Appstyles {
  static final headingTextStyle = TextStyle(
    fontSize: SizeConfig.getProportionateHeight(22),
    fontWeight: FontWeight.w600,
    color: Colors.black,
  );

  static final titleTextStyle = TextStyle(
    fontSize: SizeConfig.getProportionateHeight(18),
    fontWeight: FontWeight.w400,
    color: Colors.black,
  );

  static final normalTextStyle = TextStyle(
    fontSize: SizeConfig.getProportionateHeight(12),
    fontWeight: FontWeight.w100,
    color: Colors.black,
  );
}
