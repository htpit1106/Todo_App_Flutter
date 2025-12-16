import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:todo_app/app.dart';
import 'package:todo_app/repository/auth_repository.dart';
import 'package:todo_app/repository/profile_repository.dart';
import 'package:todo_app/repository/todo_repository.dart';
import 'package:todo_app/services/supabase_service.dart';
import 'package:intl/date_symbol_data_local.dart';

import 'network/supabase_client.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initializeDateFormatting('en_US', null);
  await Supabase.initialize(url: SupabaseService.url, anonKey: SupabaseService.anonKey);
  runApp(
    MultiProvider(
      providers: [
        Provider<AuthRepository>(create: (_) => AuthRepositoryImpl()),
        Provider<TodoRepository>(create: (_) => TodoRepositorImpl(SupabaseApiClient(supabase))),
        Provider<ProfileRepository> (create: (_)=>ProfileRepositoryImpl(),)
      ],
      child: const TodoApp(),
    ),
  );
}

final supabase = Supabase.instance.client;
