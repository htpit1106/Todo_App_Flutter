import 'package:flutter/widgets.dart';
import 'package:todo_app/services/auth.dart';
import 'package:todo_app/ui/page/auth/sign_in/log_in_navigator.dart';

class LogInProvider extends ChangeNotifier {
  String? _email = "phuonggm204@gmail.com";
  String? _password = "123456";
  String? get email => _email;
  String? get password => _password;
  final LogInNavigator navigator;
  LogInProvider({required this.navigator});
  void setEmail(String value) {
    _email = value;
    notifyListeners();
  }

  void setPassword(String value) {
    _password = value;
    notifyListeners();
  }

  Future<void> signIn() async {
    final result = await Auth.signIn(_email!, _password!);
    if (!result){
      navigator.showError("Email or password is not true");
      return;
    }
    navigator.goHome();
    navigator.showSuccess("login success");

  }


  void onPressSignup() {
    navigator.goSignUp();
  }

}