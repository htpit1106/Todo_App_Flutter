import 'package:flutter/widgets.dart';
import 'package:todo_app/services/auth.dart';
import 'package:todo_app/ui/page/auth/sign_up/sign_up_navigator.dart';


class SignUpProvider extends ChangeNotifier {
  String? _email;
  String? _password;
  String? _confirmPassword;

  String? get email => _email;

  String? get password => _password;

  String? get confirmPassword => _confirmPassword;

  bool? get isMatchPassword => _password == _confirmPassword;

  final SignUpNavigator navigator;
  SignUpProvider({required this.navigator});
  void setEmail(String value) {
    _email = value;
    notifyListeners();
  }

  void setPassword(String value) {
    _password = value;
    notifyListeners();
  }

  void setConfirmPassword(String value) {
    _confirmPassword = value;
    notifyListeners();
  }

  Future<void> signUp() async {
    await Auth.signUp(_email!, _password!);
  }

  void goLogin() {
    navigator.goLogin();
  }
}
