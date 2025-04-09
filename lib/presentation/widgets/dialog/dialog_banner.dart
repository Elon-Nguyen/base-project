import 'package:base_project/presentation/constants/app_text_style.dart';
import 'package:base_project/presentation/constants/colors.dart';
import 'package:flutter/material.dart';

class DialogBanned extends StatelessWidget {
  String? title;
  TextStyle? style;
  Function()? onTap;

  DialogBanned({super.key, this.title, this.onTap, this.style});

  @override
  Widget build(BuildContext context) {
    return (AlertDialog(
      backgroundColor: Colors.white,
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            textAlign: TextAlign.center,
            title ?? 'Done!',
            style: style ?? context.textStyle.size12.w500.black,
          ),
          const SizedBox(height: 16),
          GestureDetector(
            onTap: onTap,
            child: Container(
              // margin: EdgeInsets.symmetric(horizontal: 50),
              padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 50),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                color: AppColors.blue2,
              ),
              child: Text("OK", style: context.textStyle.size12.w500.white),
            ),
          ),
        ],
      ),
    ));
  }
}
