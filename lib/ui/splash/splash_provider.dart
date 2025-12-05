import 'package:todo_app/database/share_preferences_helper.dart';
import 'package:todo_app/global/app_provider.dart';
import 'package:todo_app/main.dart';
import 'package:todo_app/ui/splash/splash_navigator.dart';

class SplashProvider extends AppProvider {
  final SplashNavigator navigator;

  SplashProvider({required this.navigator});

  Future<void> autoLogin() async {

    final isFistRun = await SharedPreferencesHelper.isFirstRun();
    if (isFistRun) {
      navigator.goOnboarding();
      await SharedPreferencesHelper.setFirstRun();
      return;
    }
    final session = supabase.auth.currentSession;
    session != null ? navigator.goHome() : navigator.goLogin();
  }
}
