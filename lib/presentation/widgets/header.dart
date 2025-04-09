import 'package:base_project/presentation/constants/app_text_style.dart';
import 'package:base_project/presentation/constants/values.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class Header extends StatelessWidget {
  final String title;
  final String? iconLeft;
  final String? iconRight;
  final Function? functionLeft;
  final Function? functionRight;
  const Header({
    super.key,
    required this.title,
    this.iconLeft,
    this.iconRight,
    this.functionLeft,
    this.functionRight,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        top: AppValue.paddingTop(context) + 18,
        bottom: 18,
        right: 16,
        left: 16,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          iconLeft != null
              ? GestureDetector(
                onTap: () => functionLeft != null ? functionLeft!() : null,
                child: SvgPicture.asset(iconLeft!, width: 24, height: 24),
              )
              : const SizedBox(height: 24, width: 24),
          Text(title, style: context.textStyle.size16.w500.black),
          iconRight != null
              ? GestureDetector(
                onTap: () => functionRight != null ? functionRight!() : null,
                child: SvgPicture.asset(iconRight!, width: 24, height: 24),
              )
              : const SizedBox(height: 24, width: 24),
        ],
      ),
    );
  }
}
