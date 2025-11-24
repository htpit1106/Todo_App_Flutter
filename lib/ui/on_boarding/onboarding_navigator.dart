import 'package:go_router/go_router.dart';
import 'package:todo_app/common/app_navigator.dart';
import 'package:todo_app/router/app_router.dart';


class OnboardingNavigator extends AppNavigator {
  OnboardingNavigator({required super.context, this.isMounted});
  final bool Function()? isMounted;
  void openHome() {
    Future.delayed(const Duration(seconds: 3), () {
      if (isMounted == null || isMounted!()) {
        context.pushReplacementNamed(AppRouter.home);
      }
    });
  }
}
