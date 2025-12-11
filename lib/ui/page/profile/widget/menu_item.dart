import 'package:flutter/material.dart';
import 'package:todo_app/common/app_colors.dart';
import 'package:todo_app/common/app_text_style.dart';

class MenuItem extends StatelessWidget {
  final IconData? icon;
  final String? title;
  final VoidCallback? onTap;
  final bool isDestructive;

  const MenuItem({super.key, this.icon, this.title, this.onTap, this.isDestructive = false});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Icon(icon, color: isDestructive ? AppColors.redIconColor : AppColors.primaryIconColor,),
      title:  Text(title?? "no title", style: isDestructive ? AppTextStyle.bodyMediumRed : AppTextStyle.bodyMedium),
     trailing: const Icon(Icons.arrow_forward_ios) ,
      onTap: onTap,
    );
  }
}
