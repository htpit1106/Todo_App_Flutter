import 'package:flutter/material.dart';
import 'package:todo_app/common/app_colors.dart';
import 'package:todo_app/common/app_text_style.dart';


class ButtonPurple extends StatelessWidget {
  final VoidCallback? onTap;
  final String? textButton;

  const ButtonPurple({super.key, this.onTap, this.textButton});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.widthOf(context),
      height: 56,
      child: ElevatedButton(
        onPressed: onTap,
        style: ElevatedButton.styleFrom(

            backgroundColor: AppColors.buttonPurple),
        child: Text(textButton ?? "no title", style: AppTextStyle.titleSmall),
      ),
    );
  }
}
