import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_app/common/app_themes.dart';
import 'package:todo_app/configs/app_config.dart';
import 'package:todo_app/repository/auth_repository.dart';
import 'package:todo_app/repository/todo_repository.dart';
import 'package:todo_app/router/app_router.dart';
import 'package:todo_app/generated/l10n.dart';

class TodoApp extends StatelessWidget {
  const TodoApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        Provider<AuthRepository>(create: (_) => AuthRepositoryImpl()),
        Provider<TodoRepository>(create: (_) => TodoRepositorImpl()),
        // ChangeNotifierProvider(
        //   create: (context) =>
        //       HomeProvider(authRepo: context.read<AuthRepository>(), todoRepo: context.read<TodoRepository>()),
        // ),
      ],
      child: const TodoAppChild(),
    );
  }
}

class TodoAppChild extends StatefulWidget {
  const TodoAppChild({super.key});

  @override
  State<TodoAppChild> createState() => _TodoAppState();
}

class _TodoAppState extends State<TodoAppChild> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routerConfig: AppRouter.router,
      title: AppConfigs.appName,
      theme: AppThemes().theme,
      locale: const Locale('en'),
      localizationsDelegates: const [S.delegate],
      supportedLocales: S.delegate.supportedLocales,
    );
  }
}
