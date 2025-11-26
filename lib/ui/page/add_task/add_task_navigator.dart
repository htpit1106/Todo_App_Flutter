import 'package:go_router/go_router.dart';
import 'package:todo_app/common/app_navigator.dart';
import 'package:todo_app/router/app_router.dart';

class AddTaskNavigator extends AppNavigator {
  AddTaskNavigator({required super.context});
  void backToHome () {
    context.pop();
  }
}