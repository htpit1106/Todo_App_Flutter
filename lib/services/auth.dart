import 'package:supabase_flutter/supabase_flutter.dart';

import '../main.dart';

class Auth {
  Auth._();

  static Future<bool> signUp(String email, String password) async {
    final res = await supabase.auth.signUp(
      email: email,
      password: password,
    );

    return res.user != null;
  }

  static Future<bool> signIn(String email, String password) async {
    try {
       await supabase.auth.signInWithPassword(
        email: email,
        password: password,
      );
      await Future.delayed(const Duration(milliseconds: 300));
      return true;
    } catch (e) {
      return false ;
    }

  }

  static Future<void> logout() async {
    await supabase.auth.signOut(scope: SignOutScope.global);
  }
}
