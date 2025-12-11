import 'package:supabase_flutter/supabase_flutter.dart';

import '../main.dart';

class Auth {
  Auth._();

  static Future<bool> signUp(String email, String password) async {
    final res = await supabase.auth.signUp(email: email, password: password);

    return res.user != null;
  }

  static Future<bool> signIn(String email, String password) async {
    try {
      await supabase.auth.signInWithPassword(email: email, password: password);
      await Future.delayed(const Duration(milliseconds: 300));
      return true;
    } catch (e) {
      return false;
    }
  }

  static Future<void> deleteAccount() async {}

  static Future<void> logout() async {
    await supabase.auth.signOut(scope: SignOutScope.global);
  }

  // change password
  static Future<String?> changePassword(String oldPassword, String newPassword) async {

    // Login again
    final user = supabase.auth.currentUser;
    if (user == null) return "User not found";

    final res = await signIn(supabase.auth.currentUser!.email!, oldPassword);
    if (res == false) {
      return "Old password is incorrect";
    }
    await supabase.auth.updateUser(
      UserAttributes(password: newPassword),
    );
    return "Password changed successfully";
  }
}
