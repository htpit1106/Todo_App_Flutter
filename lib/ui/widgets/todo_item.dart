import 'package:flutter/material.dart';
import 'package:todo_app/common/app_icons.dart';
import 'package:todo_app/common/app_text_style.dart';
import 'package:todo_app/model/entities/todo_entity.dart';
import 'package:todo_app/model/enum/category.dart';
import 'package:todo_app/utils/app_date_utils.dart';

class TodoItem extends StatelessWidget {
  final TodoEntity todo;
  final VoidCallback? onTap;
  final VoidCallback? onDismissed;
  final VoidCallback? toggleCompleteStatus;
  final BorderRadius? borderRadius;

  const TodoItem({
    super.key,
    required this.todo,
    this.onTap,
    this.onDismissed,
    this.toggleCompleteStatus,
    this.borderRadius,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Dismissible(
        key: ValueKey(todo.id),
        direction: DismissDirection.endToStart,
        onDismissed: (_) => onDismissed?.call(),
        child: _buildContent(),
      ),
    );
  }

  Widget _buildContent() {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        border: const Border(
          bottom: BorderSide(color: Colors.grey),
        ),
        borderRadius: borderRadius,
      ),
      child: Row(
        children: [
          Expanded(
            child: Opacity(
              opacity: todo.isCompleted ? 0.7 : 1,
              child: Row(
                children: [
                  Image.asset(getIcPath(todo.category?? Category.task)),
                  const SizedBox(width: 16),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(todo.title ?? "no title",
                          style: AppTextStyle.bodyMedium),
                      Text(AppDateUtils.stringToOclock(todo.time ?? DateTime.now().toString()),
                          style: AppTextStyle.bodySmall),
                    ],
                  ),
                ],
              ),
            ),
          ),
          InkWell(
            onTap: toggleCompleteStatus,
            child: Image.asset(
              todo.isCompleted
                  ? AppIcons.icCheckedTrue
                  : AppIcons.icCheckedFalse,
            ),
          ),
        ],
      ),
    );
  }
}

