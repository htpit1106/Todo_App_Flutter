import 'package:flutter/widgets.dart';
import 'package:todo_app/model/enum/auth_status.dart';

class AppProvider extends ChangeNotifier{
   AuthStatus authStatus = AuthStatus.loading;
}