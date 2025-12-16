import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:todo_app/model/entities/todo_entity.dart';

class SupabaseApiClient {
  final SupabaseClient client;
  SupabaseApiClient(this.client);
  Future<bool> addNewTask(TodoEntity todo) async {
    final res = await client.from('todo_list').insert(todo.toJsonInsert()).select();
    if (res.isNotEmpty) {
      return true;

    }
    return false;
  }

  Future<void> deleteTask(String id) async {
    await client.from('todo_list').delete().eq('id', id);
  }


  Future<List<TodoEntity>> getTodos(String userId) async {
    final data = await client.from('todo_list').select().eq('user_id', userId);
    return data.map((e)=> TodoEntity.fromJson(e)).toList();
  }

  Future<void> toggleCompleted  (String id, bool isCompleted) async{
    await client.from('todo_list').update({'is_completed': !isCompleted}).eq('id', id);

  }

  Future<void> updateTodo(String id, TodoEntity todo) async {
    await client.from('todo_list').update(todo.toJson()).eq('id', id);
  }
}
