import 'package:flutter/material.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:todo_app/app.dart';
import 'package:todo_app/services/notification_service.dart';
import 'package:todo_app/services/supabase_service.dart';
import 'package:intl/date_symbol_data_local.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await NotificationService().init();
  await NotificationService().requestPermissions();
  await initializeDateFormatting('en_US', null);
  await Supabase.initialize(url: SupabaseService.url, anonKey: SupabaseService.anonKey);

  runApp(TodoApp());
}

final supabase = Supabase.instance.client;
