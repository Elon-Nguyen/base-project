import 'package:base_project/presentation/constants/app_text_style.dart';
import 'package:base_project/presentation/constants/colors.dart';
import 'package:base_project/presentation/constants/values.dart';
import 'package:flutter/material.dart';

class DialogConfirm extends StatelessWidget {
  final String? header;
  final String title;
  final String? textLeft;
  final String? textRight;
  final void Function()? functionLeft;
  final void Function()? functionRight;

  const DialogConfirm({
    required this.title,
    super.key,
    this.textLeft,
    this.textRight,
    this.functionLeft,
    this.functionRight,
    this.header,
  });

  @override
  Widget build(BuildContext context) {
    return Dialog(
      insetPadding: EdgeInsets.zero,
      shape: const RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(12))),
      child: Container(
        width: AppValue.width(context) * 0.74,
        padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 12),
        decoration: BoxDecoration(borderRadius: BorderRadius.circular(12), color: AppColors.white),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Visibility(
              visible: header != null,
              child: Text(header ?? '', style: context.textStyle.size16.w600.black, textAlign: TextAlign.center),
            ),
            AppValue.vSpaceTiny,
            Text(title, style: context.textStyle.size12.w400.black, textAlign: TextAlign.center),
            AppValue.vSpace(24),
            Row(
              children: [
                Expanded(
                  child: GestureDetector(
                    onTap: () => functionLeft != null ? functionLeft!() : Navigator.pop(context),
                    child: Container(
                      padding: const EdgeInsets.symmetric(vertical: 8),
                      decoration: BoxDecoration(borderRadius: BorderRadius.circular(8), color: AppColors.grey),
                      child: Center(child: Text(textLeft ?? 'Cancel', style: context.textStyle.size12.w500.black)),
                    ),
                  ),
                ),
                AppValue.hSpaceTiny,
                Expanded(
                  child: GestureDetector(
                    onTap: () => functionRight!(),
                    child: Container(
                      padding: const EdgeInsets.symmetric(vertical: 8),
                      decoration: BoxDecoration(borderRadius: BorderRadius.circular(8), color: AppColors.lightBlue),
                      child: Center(child: Text(textRight ?? 'OK', style: context.textStyle.size12.w500.blue2)),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
