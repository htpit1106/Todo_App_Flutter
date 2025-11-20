import 'package:todo_app/common/app_navigator.dart';
import 'package:todo_app/router/app_router.dart';

class OnboardingNavigator extends AppNavigator {
  OnboardingNavigator({required super.context});

  void openHome(){
    pushReplacementNamed(AppRouter.home);
  }

}