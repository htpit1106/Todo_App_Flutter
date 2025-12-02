import 'package:flutter/widgets.dart';

import '../../../../services/auth.dart';

class SignUpProvider extends ChangeNotifier {

  String? email;
  String? password;
  String? confirmPassword;




  void setEmail(String value) {
    email = value;
    notifyListeners();
  }


  void setPassword(String value) {
    password = value;
    notifyListeners();
  }


  void setConfirmPassword(String value) {
    confirmPassword = value;
    notifyListeners();
  }

  Future<void> signUp() async {
    await Auth.signUp(email!, password!);

  }


}