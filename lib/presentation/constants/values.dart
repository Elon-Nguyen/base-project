import 'dart:io' show Platform;

import 'package:flutter/material.dart';

class AppValue {
  AppValue._();

  static const Widget emptyWidget = SizedBox();

  static Widget hSpace(double width) => SizedBox(width: width);
  static const Widget hSpaceTiny = SizedBox(width: 8.0);
  static const Widget hSpaceSmall = SizedBox(width: 16.0);
  static const Widget hSpaceMedium = SizedBox(width: 32.0);
  static const Widget hSpaceLarge = SizedBox(width: 64.0);
  static const Widget hSpaceMassive = SizedBox(width: 128.0);

  static Widget vSpace(double height) => SizedBox(height: height);
  static const Widget vSpaceTiny = SizedBox(height: 8.0);
  static const Widget vSpaceSmall = SizedBox(height: 16.0);
  static const Widget vSpaceMedium = SizedBox(height: 32.0);
  static const Widget vSpaceLarge = SizedBox(height: 64.0);
  static const Widget vSpaceMassive = SizedBox(height: 128.0);

  static double height(context) {
    return MediaQuery.of(context).size.height;
  }

  static double width(context) {
    return MediaQuery.of(context).size.width;
  }

  static double paddingTop(context) {
    return MediaQuery.of(context).padding.top;
  }

  static double paddingBottom(context) {
    return MediaQuery.of(context).padding.bottom;
  }

  static bool isIOS() => Platform.isIOS;
}
