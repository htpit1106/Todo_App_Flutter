import 'package:go_router/go_router.dart';
import 'package:todo_app/common/app_navigator.dart';

import '../../../../router/app_router.dart';

class LogInNavigator extends AppNavigator {
  LogInNavigator({required super.context});

  void goSignUp(){
    context.pushReplacementNamed(AppRouter.signUp);
  }

  void goHome(){
    context.pushReplacementNamed(AppRouter.home);
  }

}