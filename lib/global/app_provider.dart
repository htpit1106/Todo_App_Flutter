import 'package:flutter/widgets.dart';
import 'package:todo_app/main.dart';
import 'package:todo_app/model/enum/auth_status.dart';

class AppProvider extends ChangeNotifier{
   AuthStatus authStatus = AuthStatus.loading;



   Future <void> _checkAuth() async {
     final user = supabase.auth.currentUser;

     user == null ? authStatus = AuthStatus.loggedOut : authStatus = AuthStatus.loggedIn;
     notifyListeners();
   }





}