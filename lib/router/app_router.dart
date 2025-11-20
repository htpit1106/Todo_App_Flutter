import 'package:go_router/go_router.dart';
import 'package:todo_app/main.dart';
import 'package:todo_app/ui/on_boarding/on_boarding_screen.dart';

class AppRouter {
  AppRouter._();

  static const String splash = "/";
  static const String home = "home";
  static const String addTask = "add_task";

  static final GoRouter router = GoRouter(
    routes: [
      GoRoute(
        path: splash,
        builder: (context, state) => OnBoardingScreen(),
        routes: [
          GoRoute(path: home, name: home,  builder: (context, state) => OnBoardingScreen() ),
          GoRoute(path: addTask, name: addTask,  builder: (context, state) => OnBoardingScreen()),
        ],
      ),
    ],
  );
}
