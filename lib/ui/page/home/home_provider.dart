import 'package:flutter/cupertino.dart';
import 'package:todo_app/main.dart';
import 'package:todo_app/repository/todo_repository.dart';
import '../../../model/entities/todo_entity.dart';
import '../../../network/udid.dart';

class HomeProvider extends ChangeNotifier {
  List<TodoEntity> todos = [];
  List<TodoEntity> completedTodos = [];
  List<TodoEntity> unCompletedTodos = [];
  final TodoRepository repository;

  HomeProvider({required this.repository});
  Future<void> loadTodos() async {

    try {
      todos = await repository.getTodos();
      completedTodos = todos.where((e) => e.isCompleted == true).toList();
      unCompletedTodos = todos.where((e) => e.isCompleted == false).toList();
      notifyListeners();
    } catch (e) {
      debugPrint('Other error: $e');
    }
  }

  Future<void> toggleCompleted(String id, bool isCompleted) async {
    try {
      await repository.toggleCompleted(id, isCompleted);
      loadTodos();
    } catch (e) {
      debugPrint('Toggle completed error: $e');
    }
  }

  Future<void> updateTodo(String id, TodoEntity todo) async {
    try {
      await repository.updateTodo(id, todo);
      loadTodos();
    } catch (e) {
      debugPrint('Update error: $e');
    }
  }

  Future<void> addNewTask(TodoEntity todo) async {
    try {
         TodoEntity? newTodo = await repository.addNewTask(todo);
        if (newTodo!= null) {
          unCompletedTodos.add(newTodo);
        }

      notifyListeners();
    } catch (e) {
      debugPrint('Add task error: $e');
    }
  }

  Future<void> deleteTask(String id) async {
    try {
      await repository.deleteTask(id);
      loadTodos();
    } catch (e) {
      debugPrint('Delete task error: $e');
    }
  }
}
