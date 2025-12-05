import 'package:flutter/material.dart';
import 'package:todo_app/main.dart';
import 'package:todo_app/model/entities/todo_entity.dart';
import 'package:todo_app/model/enum/category.dart';
import 'package:todo_app/repository/todo_repository.dart';
import 'package:todo_app/ui/page/add_task/add_task_navigator.dart';
import 'package:todo_app/utils/app_date_utils.dart';


class AddTaskProvider extends ChangeNotifier {
  String? _titleTask;
  String? _notes;
  DateTime _date = DateTime.now();
  TimeOfDay _time = TimeOfDay.now();
  Category? _category;

  String? get titleTask => _titleTask;

  String? get notes => _notes;

  DateTime get date => _date;

  TimeOfDay get time => _time;

  Category? get category => _category;

  final TodoRepository todoRepo;

  final AddTaskNavigator navigator;
  AddTaskProvider({required this.todoRepo, required this.navigator});

  void setTitleTask(String? title) {
    _titleTask = title;
    notifyListeners();
  }

  void setNotes(String? note) {
    _notes = note;
    notifyListeners();
  }

  void setDate(DateTime date) {
    _date = date;
    notifyListeners();
  }

  void setTime(TimeOfDay time) {
    _time = time;
    notifyListeners();
  }

  void setCategory(Category? category) {
    _category = category;
    notifyListeners();
  }

  Future<void> saveTask({TodoEntity? todo}) async {
    final day = AppDateUtils.dateToStringISO8601(_date, _time);
    final userId = supabase.auth.currentUser!.id;
    final newTodo = TodoEntity(
      id: todo?.id,
      title: _titleTask,
      notes: _notes,
      time: day,
      category: _category,
      isCompleted: todo?.isCompleted ?? false,
      userId: userId,
      createdAt: todo?.createdAt ?? AppDateUtils.formatDateNow(DateTime.now()),
    );


    if (todo != null && todo.id != null) {
      await todoRepo.updateTodo(todo.id!, newTodo);
    } else {
      final result = await todoRepo.addNewTask(newTodo);
      if (result) {
        navigator.showSuccess("Add new task success");
      } else {
        navigator.showError("Add new task fail");
      }
    }
  }

  void goBackHome({bool? result}){
    navigator.goBackHome(result: result);
  }
}
