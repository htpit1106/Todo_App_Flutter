import 'package:flutter/material.dart';
import 'package:todo_app/model/entities/todo_entity.dart';

import '../../../main.dart';
import '../../../model/enum/category.dart';
import '../../../utils/app_date_utils.dart';
import '../home/home_provider.dart';

class AddTaskProvider extends ChangeNotifier {
  String? titleTask;
  String? notes;
  DateTime date = DateTime.now();
  TimeOfDay time = TimeOfDay.now();
  Category? category;

  void setTitleTask(String title) {
    titleTask = title;
    notifyListeners();
  }

  void setNotes(String note) {
    notes = note;
    notifyListeners();
  }

  void setDate(DateTime date) {
    this.date = date;
    notifyListeners();
  }

  void setTime(TimeOfDay time) {
    this.time = time;
    notifyListeners();
  }

  void setCategory(Category category) {
    this.category = category;
    notifyListeners();
  }

  Future<void> saveTask({TodoEntity? todo, required HomeProvider homeProvider}) async {
    final day = AppDateUtils.dateToStringISO8601(date, time);
    final userId = supabase.auth.currentUser!.id;
    final newTodo = TodoEntity(
      id: todo?.id,
      title: titleTask,
      notes: notes,
      time: day,
      category: category,
      isCompleted: todo?.isCompleted ?? false,
      userId: userId,
      createdAt: todo?.createdAt ?? AppDateUtils.formatDateNow(DateTime.now()),
    );

    if (todo?.id != null) {
      await homeProvider.updateTodo(todo!.id!, newTodo);
    } else {
      await  homeProvider.addNewTask(newTodo);
    }
  }
}
