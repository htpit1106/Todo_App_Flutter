import 'package:flutter/widgets.dart';
import 'package:todo_app/ui/page/auth/sign_in/log_in_navigator.dart';

import '../../../../services/auth.dart';
class LogInProvider extends ChangeNotifier {
  String? email = "";
  String? password = "";

  void setEmail(String value) {
    email = value;
    notifyListeners();
  }

  void setPassword(String value) {
    password = value;
    notifyListeners();
  }

  Future<void> signIn() async {
    Auth.signIn(email!, password!);
  }


}