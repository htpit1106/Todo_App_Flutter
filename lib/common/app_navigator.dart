
import 'package:flutter/material.dart';

import 'package:go_router/go_router.dart';


import '../router/app_router.dart';
import 'app_colors.dart';

class AppNavigator {
  BuildContext context;

  AppNavigator({required this.context});

  void pop<T extends Object?>([T? result]) {
    GoRouter.of(context).pop(result);
  }

  void popUntilNamed(String name) {
    Navigator.popUntil(context, ModalRoute.withName(name));
  }

  Future<dynamic> pushNamed(
      String name, {
        Map<String, String> pathParameters = const <String, String>{},
        Map<String, dynamic> queryParameters = const <String, dynamic>{},
        Object? extra,
      }) async {
    return GoRouter.of(context).pushNamed(
      name,
      pathParameters: pathParameters,
      queryParameters: queryParameters,
      extra: extra,
    );
  }

  Future<dynamic> pushReplacementNamed(
      String name, {
        Map<String, String> pathParameters = const <String, String>{},
        Map<String, dynamic> queryParameters = const <String, dynamic>{},
        Object? extra,
      }) async {
    return GoRouter.of(context).pushReplacementNamed(
      name,
      pathParameters: pathParameters,
      queryParameters: queryParameters,
      extra: extra,
    );
  }

  // void showLoadingOverlay() {
  //   context.loaderOverlay.show();
  // }
  //
  // void hideLoadingOverlay() {
  //   context.loaderOverlay.hide();
  // }


  Future<void> openHomePage() {
    while (GoRouter.of(context).canPop()) {
      GoRouter.of(context).pop();
    }
    return GoRouter.of(context).pushNamed(AppRouter.home);
  }

  void openAddTask({required String id}) {
    GoRouter.of(context).push(AppRouter.addTask, extra: id);
  }

  /// Show dialog


}
