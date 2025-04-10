import 'package:base_project/presentation/constants/app_text_style.dart';
import 'package:base_project/presentation/constants/colors.dart';
import 'package:base_project/presentation/gen/assets.gen.dart' show Assets;
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';

class TextFormFieldWidget extends StatefulWidget {
  TextFormFieldWidget({
    super.key,
    this.value,
    this.controller,
    this.readOnly,
    this.hintText,
    this.marginOut,
    this.marginIn,
    this.hideText,
    this.isPasswordField,
    this.inputTextStyle,
    this.border,
    this.enableBorder,
    this.textAlign = TextAlign.start,
    this.onChanged,
    this.focusBorder,
    this.maxLine,
    this.maxLength,
    this.focusNode,
    this.formatter,
  });

  String? hintText = '';
  String? value;
  EdgeInsets? marginOut = EdgeInsets.zero;
  EdgeInsets? marginIn = EdgeInsets.zero;
  bool? isPasswordField = false;
  bool? hideText = true;
  InputBorder? border = OutlineInputBorder(
    borderRadius: BorderRadius.circular(4),
  );
  InputBorder? focusBorder = OutlineInputBorder(
    borderRadius: BorderRadius.circular(4),
  );
  InputBorder? enableBorder = OutlineInputBorder(
    borderRadius: BorderRadius.circular(4),
  );
  TextAlign? textAlign;
  TextStyle? inputTextStyle;
  bool? readOnly;
  FocusNode? focusNode;
  TextEditingController? controller;
  List<TextInputFormatter>? formatter;
  void Function(String)? onChanged;
  int? maxLength;
  int? maxLine;

  @override
  State<TextFormFieldWidget> createState() => _TextFormFieldWidgetState();
}

class _TextFormFieldWidgetState extends State<TextFormFieldWidget> {
  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.centerRight,
      children: [
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 8),
          margin: widget.marginOut,
          decoration: BoxDecoration(
            color: AppColors.white,
            borderRadius: BorderRadius.circular(8),
          ),
          child: TextFormField(
            focusNode: widget.focusNode,
            inputFormatters: widget.formatter,
            controller: widget.controller,
            initialValue: widget.value,
            readOnly: widget.readOnly ?? false,
            onChanged: widget.onChanged,
            textAlign: widget.textAlign!,
            maxLines: widget.maxLine ?? 1,
            maxLength: widget.maxLength,
            obscureText:
                (widget.isPasswordField ?? false) && (widget.hideText ?? false),
            style: widget.inputTextStyle ?? context.textStyle.size12.w500.black,
            decoration: InputDecoration(
              contentPadding: widget.marginIn,
              hintText: widget.hintText,
              hintStyle: context.textStyle.size12.w500.grey,
              labelStyle: const TextStyle(color: AppColors.white),
              fillColor: AppColors.white,
              border: widget.border,
              focusedBorder: widget.focusBorder,
              enabledBorder: widget.enableBorder,
            ),
          ),
        ),
        if (widget.isPasswordField!)
          Positioned(
            right: 10,
            child: GestureDetector(
              onTap: () {
                setState(() {
                  widget.hideText = !widget.hideText!;
                });
              },
              child: SvgPicture.asset(
                widget.hideText! ? Assets.icons.eyeOff : Assets.icons.eyeOn,
              ),
            ),
          )
        else
          const SizedBox(),
      ],
    );
  }
}
