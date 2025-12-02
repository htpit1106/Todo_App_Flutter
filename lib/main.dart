import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:todo_app/app.dart';
import 'package:todo_app/services/supabase_service.dart';
import 'package:todo_app/ui/page/home/home_provider.dart';
import 'package:intl/date_symbol_data_local.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initializeDateFormatting('en_US', null);
  await Supabase.initialize(url: SupabaseService.url, anonKey: SupabaseService.anonKey);

  if (supabase.auth.currentUser == null) {
    await supabase.auth.signInAnonymously();
  }

  runApp(ChangeNotifierProvider(create: (_) => HomeProvider(), child: TodoApp()));
}

final supabase = Supabase.instance.client;
