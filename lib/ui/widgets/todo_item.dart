import 'package:flutter/material.dart';
import 'package:todo_app/common/app_icons.dart';
import 'package:todo_app/common/app_text_style.dart';

class TodoItem extends StatelessWidget {
  const TodoItem({
    super.key,
    required this.isCompleted,
    this.titleTask,
    this.time,
  });

  final bool isCompleted;
  final String? titleTask;
  final String? time;

  @override
  Widget build(BuildContext context) {
    return Opacity(
      opacity: isCompleted ? 0.7 : 1,
      child: Container(
        width: MediaQuery.widthOf(context),
        height: 60,
        padding: EdgeInsets.only(right: 16, left: 16, top: 8, bottom: 8),
        decoration: BoxDecoration(
          color: Colors.white,
          border: Border(bottom: BorderSide(color: Colors.grey, width: 1.0)),
        ),
        child: !isCompleted
            ? Row(
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
                        Text(
                          titleTask ?? "no title",
                          style: TextStyle(
                            decoration: TextDecoration.lineThrough,
                            color: Color(0xFF1B1B1D),
                            fontSize: 14,
                            fontWeight: FontWeight.w300,
                          ),
                        ),
                        Text(time ?? "no time", style: AppTextStyle.bodySmall),
                      ],
                    ),
                  ),
                  Image.asset(AppIcons.icCheckedFalse),
                ],
              )
            : Row(
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
      )
    );
  }
}
