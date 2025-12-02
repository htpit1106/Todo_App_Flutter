import 'package:flutter/cupertino.dart';
import 'package:todo_app/main.dart';
import 'package:todo_app/repository/todo_repository.dart';
import '../../../model/entities/todo_entity.dart';
import '../../../services/auth.dart';

class HomeProvider extends ChangeNotifier {

  List<TodoEntity> completedTodos = [];
  List<TodoEntity> unCompletedTodos = [];
  final TodoRepositorImpl repository = TodoRepositorImpl();
  bool isLoading = false;
  Future<void> loadTodos() async {
    try {
      isLoading = true;
      final userId = supabase.auth.currentUser!.id;
      print("Userid: :: $userId");
      final todos = await repository.getTodos(userId);
      completedTodos = todos.where((e) => e.isCompleted == true).toList();
      unCompletedTodos = todos.where((e) => e.isCompleted == false).toList();
      isLoading = false;
      notifyListeners();
    } catch (e) {
      debugPrint('Other error: $e');
    }
  }

  /// c617a51d-0ede-4bd9-89f0-03ec9571882b

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

  Future<void> logout() async {
    try {
      await Auth.logout();
      unCompletedTodos = [];
      completedTodos = [];
      notifyListeners();
    } catch (e) {
      debugPrint('Logout error: $e');
    }
  }
}
