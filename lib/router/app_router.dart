import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:todo_app/model/entities/todo_entity.dart';
import 'package:todo_app/ui/page/add_task/add_task_page.dart';
import 'package:todo_app/ui/page/auth/sign_in/log_in_page.dart';
import 'package:todo_app/ui/page/auth/sign_up/sign_up_page.dart';
import 'package:todo_app/ui/page/home/home_page.dart';
import 'package:todo_app/ui/page/onboarding/onboarding_page.dart';
import 'package:todo_app/ui/splash/splash_screen.dart';

class AppRouter {
  AppRouter._();

  static const String splash = "/";
  static const String onboarding = "/onboarding";
  static const String home = "/home";
  static const String addTask = "/add_task";
  static const String logIn = "/log_in";
  static const String signUp = "/sign_up";
  static final navigationKey = GlobalKey<NavigatorState>();

  static final GoRouter router = GoRouter(
    routes: <RouteBase>[
      GoRoute(path: onboarding, name: onboarding, builder: (context, state) => OnboardingPage()),
      GoRoute(path: splash, name: splash, builder: (context, state) => SplashScreen()),
      GoRoute(path: home, name: home, builder: (context, state) => HomePage()),
      GoRoute(
        path: addTask,
        name: addTask,
        builder: (context, state) {
          final todo = state.extra as TodoEntity?;
          return AddTaskPage(todo: todo);
        },
      ),
      GoRoute(path: signUp, name: signUp, builder: (context, state) => SignUpPage()),
      GoRoute(path: logIn, name: logIn, builder: (context, state) => LogInPage()),
    ],
    initialLocation: splash,
    debugLogDiagnostics: false,
    navigatorKey: navigationKey,
  );
}
