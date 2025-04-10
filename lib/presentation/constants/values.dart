import 'dart:io' show Platform;

import 'package:flutter/material.dart';

class AppValue {
  AppValue._();

  static const Widget emptyWidget = SizedBox();

  static Widget hSpace(double width) => SizedBox(width: width);
  static const Widget hSpaceTiny = SizedBox(width: 8);
  static const Widget hSpaceSmall = SizedBox(width: 16);
  static const Widget hSpaceMedium = SizedBox(width: 32);
  static const Widget hSpaceLarge = SizedBox(width: 64);
  static const Widget hSpaceMassive = SizedBox(width: 128);

  static Widget vSpace(double height) => SizedBox(height: height);
  static const Widget vSpaceTiny = SizedBox(height: 8);
  static const Widget vSpaceSmall = SizedBox(height: 16);
  static const Widget vSpaceMedium = SizedBox(height: 32);
  static const Widget vSpaceLarge = SizedBox(height: 64);
  static const Widget vSpaceMassive = SizedBox(height: 128);

  static double height(BuildContext cxt) {
    return MediaQuery.of(cxt).size.height;
  }

  static double width(BuildContext cxt) {
    return MediaQuery.of(cxt).size.width;
  }

  static double paddingTop(BuildContext cxt) {
    return MediaQuery.of(cxt).padding.top;
  }

  static double paddingBottom(BuildContext cxt) {
    return MediaQuery.of(cxt).padding.bottom;
  }

  static bool isIOS() => Platform.isIOS;
}
