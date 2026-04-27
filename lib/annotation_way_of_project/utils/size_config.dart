import 'package:flutter/material.dart';

class SizeConfig {
  static double screenHeight = 0.0;
  static double screenWidht = 0.0;

  static void init(BuildContext context) {
    screenHeight = MediaQuery.of(context).size.height;
    screenWidht = MediaQuery.of(context).size.width;
  }

  static double getProportionateHeight(double inputHeight) {
    return ((inputHeight / 812) * screenHeight);
  }

  static double getProportionateWidth(double inputWidth) {
    return ((inputWidth / 375) * screenWidht);
  }
}
