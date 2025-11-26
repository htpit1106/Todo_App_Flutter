import 'package:go_router/go_router.dart';
import 'package:todo_app/common/app_navigator.dart';

class AddTaskNavigator extends AppNavigator {
  AddTaskNavigator({required super.context});
  void backToHome () {
    context.pop();
  }
}