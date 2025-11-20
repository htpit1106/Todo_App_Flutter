import 'package:flutter/material.dart';

import '../../common/app_colors.dart';
import '../../common/app_text_style.dart';

class ButtonPurple extends StatelessWidget {
  final VoidCallback? onTap;
  final String? textButton;

  const ButtonPurple({super.key, this.onTap, this.textButton});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.widthOf(context),

      child: ElevatedButton(
        onPressed: onTap,
        style: ElevatedButton.styleFrom(

            backgroundColor: AppColors.buttonPurple),
        child: Text(textButton ?? "no title", style: AppTextStyle.titleSmall),
      ),
    );
  }
}
