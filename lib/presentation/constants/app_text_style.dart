import 'package:base_project/presentation/constants/colors.dart';
import 'package:base_project/presentation/gen/fonts.gen.dart';
import 'package:flutter/material.dart';

extension TextThemeExt on BuildContext {
  AppTextStyle get textStyle => AppTextStyle(); // context.textStyle
}

extension TextStyleExt on TextStyle {
  /// fontWeight: normal
  TextStyle get normal => copyWith(fontWeight: FontWeight.normal);

  /// fontWeight: bold
  TextStyle get bold => copyWith(fontWeight: FontWeight.bold);
  TextStyle get w200 => copyWith(fontWeight: FontWeight.w200);
  TextStyle get w300 => copyWith(fontWeight: FontWeight.w300);
  TextStyle get w400 => copyWith(fontWeight: FontWeight.w400);
  TextStyle get w500 => copyWith(fontWeight: FontWeight.w500);
  TextStyle get w600 => copyWith(fontWeight: FontWeight.w600);
  TextStyle get w700 => copyWith(fontWeight: FontWeight.w700);
  TextStyle get w800 => copyWith(fontWeight: FontWeight.w800);

  /// color: white
  TextStyle get white => copyWith(color: Colors.white);
  TextStyle get greyD2 => copyWith(color: const Color(0xffB8B8D2));
  TextStyle get blueIndigo => copyWith(color: AppColors.blueIndigo);

  /// color: black
  TextStyle get black => copyWith(color: Colors.black);
  TextStyle get red => copyWith(color: AppColors.red);
  TextStyle get blue1 => copyWith(color: AppColors.blue1);
  TextStyle get blue2 => copyWith(color: AppColors.blue2);
  TextStyle get violet => copyWith(color: AppColors.violet);
  TextStyle get grey => copyWith(color: AppColors.grey);
}

class AppTextStyle {
  factory AppTextStyle() => _instance;
  AppTextStyle._init();
  static final AppTextStyle _instance = AppTextStyle._init();

  final TextStyle size10 = const TextStyle(
    fontSize: 10,
    fontWeight: FontWeight.normal,
    fontFamily: FontFamily.inter,
  );

  final TextStyle size12 = const TextStyle(
    fontSize: 12,
    fontWeight: FontWeight.normal,
    fontFamily: FontFamily.inter,
  );

  final TextStyle size14 = const TextStyle(
    fontSize: 14,
    fontWeight: FontWeight.normal,
    fontFamily: FontFamily.inter,
  );

  final TextStyle size16 = const TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.normal,
    fontFamily: FontFamily.inter,
  );

  final TextStyle size18 = const TextStyle(
    fontSize: 18,
    fontWeight: FontWeight.normal,
    fontFamily: FontFamily.inter,
  );

  final TextStyle size20 = const TextStyle(
    fontSize: 20,
    fontWeight: FontWeight.normal,
    fontFamily: FontFamily.inter,
  );

  final TextStyle size22 = const TextStyle(
    fontSize: 22,
    fontWeight: FontWeight.normal,
    fontFamily: FontFamily.inter,
  );

  final TextStyle size24 = const TextStyle(
    fontSize: 24,
    fontWeight: FontWeight.normal,
    fontFamily: FontFamily.inter,
  );

  final TextStyle size26 = const TextStyle(
    fontSize: 26,
    fontWeight: FontWeight.normal,
    fontFamily: FontFamily.inter,
  );
  final TextStyle size28 = const TextStyle(
    fontSize: 28,
    fontWeight: FontWeight.normal,
    fontFamily: FontFamily.inter,
  );
}
