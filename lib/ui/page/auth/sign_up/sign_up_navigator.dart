import 'package:flutter/cupertino.dart';
import 'package:go_router/go_router.dart';
import 'package:todo_app/common/app_navigator.dart';

import '../../../../router/app_router.dart';

class SignUpNavigator extends AppNavigator{
  SignUpNavigator({required super.context});

  void goHome(BuildContext context){
    context.pushReplacementNamed(AppRouter.home);
  }

  void goLogin(BuildContext context) {
    context.pushReplacementNamed(AppRouter.logIn);
  }

}