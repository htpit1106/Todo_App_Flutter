import 'package:flutter/material.dart';
import 'package:todo_app/configs/app_config.dart';
import 'package:todo_app/router/app_router.dart';

class TodoApp extends StatefulWidget {
  const TodoApp({super.key});

  @override
  State<TodoApp> createState() => _TodoAppState();
}

class _TodoAppState extends State<TodoApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routerConfig: AppRouter.router,
      title: AppConfigs.appName,

    );
  }
}
