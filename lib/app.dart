import 'package:flutter/material.dart';
import 'package:todo_app/common/app_themes.dart';
import 'package:todo_app/configs/app_config.dart';
import 'package:todo_app/router/app_router.dart';
import 'package:todo_app/generated/l10n.dart';

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
      theme: AppThemes().theme,
      locale: const Locale('en'),
      localizationsDelegates: const [
        S.delegate,
      ],
      supportedLocales: S.delegate.supportedLocales,
    );
  }
}
