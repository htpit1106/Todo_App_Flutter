import 'package:flutter/material.dart';
import 'package:todo_app/common/app_icons.dart';
import 'package:todo_app/common/app_text_style.dart';

class TodoItem extends StatelessWidget {
  const TodoItem({
    super.key,
    required this.isCompleted,
    this.titleTask,
    this.time,
    this.onTap,
    this.iconPath,
    this.borderRadius,
    this.id,
    required this.onDismissed
  });

  final bool isCompleted;
  final String? titleTask;
  final String? time;
  final VoidCallback? onTap;
  final String? iconPath;
  final BorderRadius? borderRadius;
  final String? id;
  final void Function()? onDismissed;

  @override
  Widget build(BuildContext context) {
    return Dismissible(
      key: ValueKey(id),
      direction: DismissDirection.endToStart,
      onDismissed: (direction){
        if (onDismissed != null) onDismissed!();
      },
      child: Opacity(
        opacity: isCompleted ? 0.7 : 1,
        child: Container(
          width: MediaQuery.widthOf(context),
          padding: EdgeInsets.only(right: 16, left: 16, top: 16, bottom: 16),
          decoration: BoxDecoration(
            color: Colors.white,
            border: Border(bottom: BorderSide(color: Colors.grey, width: 1.0)),
            borderRadius: borderRadius,
          ),
          child: !isCompleted
              ? Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,

                  children: [
                    Image.asset(iconPath ?? AppIcons.icCategoryEvent),
                    SizedBox(width: 16),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            titleTask ?? "no title",
                            style: AppTextStyle.bodyMedium,
                          ),
                          Text(time ?? "no time", style: AppTextStyle.bodySmall),
                        ],
                      ),
                    ),
                    InkWell(
                      onTap: onTap,
                      child: Image.asset(AppIcons.icCheckedFalse),
                    ),
                  ],
                )
              : Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,

                  children: [
                    Image.asset(iconPath ?? AppIcons.icCategoryEvent),
                    SizedBox(width: 16),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            titleTask ?? "no title",
                            style: AppTextStyle.bodyThroughMedium,
                          ),
                          Text(
                            time ?? "no time",
                            style: AppTextStyle.bodyThroughSmall,
                          ),
                        ],
                      ),
                    ),
                    InkWell(
                      onTap: onTap,
                      child: Image.asset(AppIcons.icCheckedTrue),
                    ),
                  ],
                ),
        ),
      ),
    );
  }
}
