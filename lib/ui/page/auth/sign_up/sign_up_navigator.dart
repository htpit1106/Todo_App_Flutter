import 'package:go_router/go_router.dart';
import 'package:todo_app/common/app_navigator.dart';
import 'package:todo_app/router/app_router.dart';


class SignUpNavigator extends AppNavigator{
  SignUpNavigator({required super.context});

  void goHome(){
    context.pushReplacementNamed(AppRouter.home);
  }

  void goLogin() {
    context.pushReplacementNamed(AppRouter.logIn);
  }

}