import 'package:flutter/material.dart';
import 'package:todo_app/common/app_icons.dart';

class ButtonCategory extends StatelessWidget {
  const ButtonCategory({super.key, this.borderColor, this.onTap, this.icPosition});
  final Color? borderColor;
  final VoidCallback? onTap;
  final String? icPosition;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.zero,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        border: Border.all(
          width: 2,
          color: borderColor?? Colors.white
        ),
    
      ),
      child:  InkWell(
          onTap: onTap,
          child: Image.asset(icPosition?? AppIcons.icCategoryTask, fit: BoxFit.cover,))
    );
  }
}
