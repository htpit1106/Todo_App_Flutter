import 'package:todo_app/main.dart';
import 'package:todo_app/model/entities/todo_entity.dart';
import 'package:todo_app/network/supabase_client.dart';

abstract class TodoRepository {

  Future<List<TodoEntity>> getTodos(String userId);

  Future<void> toggleCompleted(String id, bool isCompleted);

  Future<void> updateTodo(String id, TodoEntity todo);

  Future<bool> addNewTask(TodoEntity todo);

  Future<void> deleteTask(String id);
}

class TodoRepositorImpl extends TodoRepository{
  final SupabaseApiClient supabaseClient;
  TodoRepositorImpl(this.supabaseClient);

  @override
  Future<bool> addNewTask(TodoEntity todo) async {
    return supabaseClient.addNewTask(todo);
  }

  @override
  Future<void> deleteTask(String id) async {
    supabaseClient.deleteTask(id);
  }

  @override
  Future<List<TodoEntity>> getTodos(String userId) async {
    return supabaseClient.getTodos(userId);
  }

  @override
  Future<void> toggleCompleted  (String id, bool isCompleted) async{
    return supabaseClient.toggleCompleted(id, isCompleted);
  }

  @override
  Future<void> updateTodo(String id, TodoEntity todo) async {
     return supabaseClient.updateTodo(id, todo);
  }

}
