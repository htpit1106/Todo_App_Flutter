import 'package:flutter/material.dart';
import 'package:todo_app/services/auth.dart';

abstract class AuthRepository {
  Future<void> logIn(String email, String password);

  Future<void> signUp(String email, String password);

  Future<void> logOut();
}

class AuthRepositoryImpl extends AuthRepository {
  @override
  Future<void> logIn(String email, String password) async {
    try {
      Auth.signIn(email, password);
    } catch (e) {
      debugPrint("error log in: $e");
    }
  }

  @override
  Future<void> logOut() async {
    try {
      Auth.logout();
    } catch (e) {
      debugPrint("error log out: $e");
    }
  }

  @override
  Future<void> signUp(String email, String password) async {
    try {
      Auth.signUp(email, password);
    } catch (e) {
      debugPrint("error sign up: $e");
    }
  }
}
