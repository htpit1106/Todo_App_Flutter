import 'package:todo_app/common/app_navigator.dart';
import 'package:todo_app/router/app_router.dart';


class SplashNavigator extends AppNavigator {
  SplashNavigator({required super.context, this.isMounted});

  final bool Function()? isMounted;

  void openHome() {
    Future.delayed(const Duration(seconds: 3));
    pushReplacementNamed(AppRouter.signUp);
  }
}
