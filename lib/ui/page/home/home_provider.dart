import 'package:flutter/cupertino.dart';
import 'package:todo_app/main.dart';
import 'package:todo_app/model/entities/todo_entity.dart';
import 'package:todo_app/repository/auth_repository.dart';
import 'package:todo_app/repository/profile_repository.dart';
import 'package:todo_app/repository/todo_repository.dart';

import 'home_navigator.dart';

class HomeProvider extends ChangeNotifier {
  final TodoRepository todoRepo;
  final AuthRepository authRepo;
  final HomeNavigator navigator;
  final ProfileRepository profileRepo;
  HomeProvider({required this.authRepo, required this.todoRepo, required this.navigator, required this.profileRepo});



  List<TodoEntity> _todoItems = [];

  List<TodoEntity> get getCompletedTodos => _todoItems.where((e) => e.isCompleted == true).toList();

  List<TodoEntity> get getUnCompletedTodos =>
      _todoItems.where((e) => e.isCompleted == false).toList();

  bool _isLoading = false;
  bool get isLoading => _isLoading;

  String? _avatarUrl;
  String? get avatarUrl => _avatarUrl;


  Future<void> loadListTodos() async {
    _isLoading = true;
    if (supabase.auth.currentUser == null) return;
    final userId = supabase.auth.currentUser!.id;

    final profile = await profileRepo.getProfileById(userId);
    _avatarUrl = profile.avatarLink;
    refreshData();
  }

  Future<void> refreshData() async {
    _isLoading = true;
    try {
      if (supabase.auth.currentUser == null) return;
      final userId = supabase.auth.currentUser!.id;
      final todos = await todoRepo.getTodos(userId);
      _todoItems = todos;
      _isLoading = false;
      notifyListeners();
    } catch (e) {
      debugPrint('get todo error: $e');
    }
  }

  Future<void> toggleCompleted(String id, bool isCompleted) async {
    try {
      await todoRepo.toggleCompleted(id, isCompleted);
      refreshData();
    } catch (e) {
      debugPrint('Toggle completed error: $e');
    }
  }

  Future<void> deleteTask(String id) async {
    try {
      await todoRepo.deleteTask(id);
      refreshData();
    } catch (e) {
      debugPrint('Delete task error: $e');
    }
  }

  void onPressItem(TodoEntity todo) async {
    final result = await navigator.openDetailTask<bool>(todo);
    if (result == true) {
      refreshData();
    }
  }

  void onPressAddTaskBtn() async {
    final result = await navigator.openNewTaskPage<bool>();
    if (result == true) {
      refreshData();
    }
  }

  Future<void> onPressAvatar() async {
    final urlAvatarResult = await navigator.openProfilePage();

    if (urlAvatarResult != null) {
      _avatarUrl = urlAvatarResult;
      notifyListeners();
    }
  }
}
