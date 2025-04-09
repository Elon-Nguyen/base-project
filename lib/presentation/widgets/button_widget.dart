import 'package:base_project/presentation/constants/app_text_style.dart';
import 'package:flutter/material.dart';

import '../constants/colors.dart';

class ButtonWidget extends StatefulWidget {
  String? text = "";
  bool? canTap;
  double? width;
  double? borderRadius;
  EdgeInsets? margin = EdgeInsets.symmetric(vertical: 30);
  Color? primaryColor = AppColors.blueIndigo;
  TextStyle? textStyle;
  bool? isLoading;
  Function()? onTap;

  ButtonWidget({
    super.key,
    this.text,
    this.canTap = true,
    this.onTap,
    this.width,
    this.borderRadius = 8,
    this.primaryColor,
    this.margin,
    this.isLoading = false,
    this.textStyle,
  });

  @override
  State<ButtonWidget> createState() => _ButtonWidgetState();
}

class _ButtonWidgetState extends State<ButtonWidget> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        if (widget.canTap == true && widget.onTap != null) {
          widget.onTap!();
        }
      },
      child: Container(
        margin: widget.margin,
        padding: EdgeInsets.symmetric(vertical: 7, horizontal: 12),
        width: widget.width != null ? widget.width : null,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(widget.borderRadius!),
          color:
              widget.canTap == true
                  ? (widget.primaryColor != null ? widget.primaryColor : AppColors.blue2)
                  : AppColors.grey,
        ),
        child: Center(
          child:
              widget.isLoading == false
                  ? Text(widget.text!, style: widget.textStyle ?? context.textStyle.size16.w400.white)
                  : Container(height: 15, width: 15, child: Center(child: CircularProgressIndicator())),
        ),
      ),
    );
  }
}
