import 'package:flutter/material.dart';
import 'package:todo_app/common/app_icons.dart';
import 'package:todo_app/common/app_text_style.dart';

class TodoItem extends StatelessWidget {
  const TodoItem({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.widthOf(context),
      height: 60,
      padding: EdgeInsets.only(right: 16, left: 16, top: 8, bottom: 8),
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border(bottom: BorderSide(color: Colors.grey, width: 1.0)),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,

        children: [
          Image.asset(AppIcons.icCategoryTask),
          SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text('Run 5k', style: AppTextStyle.bodyMedium),
                Text("4:00 pm", style: AppTextStyle.bodySmall),
              ],
            ),
          ),
          Image.asset(AppIcons.icCheckedTrue),
        ],
      ),
    );
  }
}
