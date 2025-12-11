import 'package:flutter/widgets.dart';
import 'package:todo_app/main.dart';
import 'package:todo_app/model/entities/profile/profile_entity.dart';
import 'package:todo_app/repository/profile_repository.dart';
import 'package:todo_app/services/auth.dart';
import 'package:todo_app/ui/page/auth/sign_up/sign_up_navigator.dart';

class SignUpProvider extends ChangeNotifier {
  String? _email;
  String? _password;
  String? _confirmPassword;
  String? _name;

  String? get email => _email;

  String? get name => _name;

  String? get password => _password;

  String? get confirmPassword => _confirmPassword;

  bool? get isMatchPassword => _password == _confirmPassword;

  final ProfileRepository profileRepo;
  final SignUpNavigator navigator;

  SignUpProvider({required this.navigator, required this.profileRepo});

  void setName(String value) {
    _name = value;
    notifyListeners();
  }

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
    final user = supabase.auth.currentUser;
    final id = user?.id;

    ProfileEntity profile = ProfileEntity(id: id, name: _name, email: _email);
    profileRepo.addProfile(profile);
    navigator.goHome();
  }

  void goLogin() {
    navigator.goLogin();
  }
}
