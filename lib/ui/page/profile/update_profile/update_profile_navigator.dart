import 'package:go_router/go_router.dart';
import 'package:todo_app/common/app_navigator.dart';

class UpdateProfileNavigator extends AppNavigator {
  UpdateProfileNavigator({required super.context});

  void goBackHome({required bool reload}) {
    context.pop(reload);
  }
}

