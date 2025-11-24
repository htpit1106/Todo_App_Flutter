import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_app/global/app_provider.dart';
import 'package:todo_app/ui/page/home/home_provider.dart';

void main() {
  runApp(MultiProvider(providers: [
    ChangeNotifierProvider(create: (_) => AppProvider()),
    ChangeNotifierProvider(create: (_) => HomeProvider()),

  ]));
}
