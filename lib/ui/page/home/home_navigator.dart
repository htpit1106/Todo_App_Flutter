import 'package:go_router/go_router.dart';
import 'package:todo_app/common/app_navigator.dart';

import '../../../model/entities/todo_entity.dart';
import '../../../router/app_router.dart';

class HomeNavigator extends AppNavigator {
  HomeNavigator({required super.context});

  void openNewTaskPage(){
    context.pushNamed(AppRouter.addTask);
  }

  void openDetailTask(TodoEntity todo){
    context.pushNamed(AppRouter.addTask, extra: todo);
  }


}