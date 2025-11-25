import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:todo_app/app.dart';
import 'package:todo_app/global/app_provider.dart';
import 'package:todo_app/services/supabase_service.dart';
import 'package:todo_app/ui/page/home/home_provider.dart';
import 'package:intl/date_symbol_data_local.dart';
Future<void> main() async {

  WidgetsFlutterBinding.ensureInitialized();
  await initializeDateFormatting('en_US', null);
  await Supabase.initialize(
    url: SupabaseService.url,
    anonKey: SupabaseService.anonKey,
  );

  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => AppProvider()),
        ChangeNotifierProvider(create: (_) => HomeProvider()),
      ],
      child: TodoApp(),
    ),
  );
}

final supabase = Supabase.instance.client;
