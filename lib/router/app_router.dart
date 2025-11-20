import 'package:go_router/go_router.dart';
import 'package:todo_app/main.dart';
import 'package:todo_app/ui/on_boarding/onboarding_screen.dart';
import 'package:todo_app/ui/page/home/home_page.dart';

class AppRouter {
  AppRouter._();

  static const String splash = "/";
  static const String home = "home";
  static const String addTask = "add_task";

  static final GoRouter router = GoRouter(
    routes: [
      GoRoute(
        path: splash,
        builder: (context, state) => HomePage(),
        routes: [
          GoRoute(path: home, name: home,  builder: (context, state) => OnboardingScreen() ),
          GoRoute(path: addTask, name: addTask,  builder: (context, state) => OnboardingScreen()),
        ],
      ),
    ],
  );
}
