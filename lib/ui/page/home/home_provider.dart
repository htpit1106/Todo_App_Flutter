import 'package:flutter/cupertino.dart';
import 'package:todo_app/main.dart';

import '../../../model/entities/todo_entity.dart';


class HomeProvider extends ChangeNotifier {
  List<TodoEntity> todos = [];
  List<TodoEntity> completedTodos = [];
  List<TodoEntity> unCompletedTodos = [];

  HomeProvider() {
    loadTodos();
  }

  Future<void> loadTodos() async {
    try {
      final res = await supabase.from('todo_list').select();
      todos = res.map((e) => TodoEntity.fromJson(e)).toList();
      completedTodos = todos.where((e)=> e.isCompleted == true).toList();
      unCompletedTodos = todos.where((e)=> e.isCompleted == false).toList();
      notifyListeners();
    } catch (e) {
      print(e);

    }
  }

  Future<void> toggleCompleted(String id, bool isCompleted) async {
    try{
      await supabase.from('todo_list').update({'is_completed': !isCompleted}).eq('id', id);
      loadTodos();
      notifyListeners();

    } catch (e) {
        print(e);
    }
  }
}
