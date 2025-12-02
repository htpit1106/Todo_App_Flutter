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

  static Future<String> signIn(String email, String password) async {
    final current = supabase.auth.currentUser;

    // ❗ Chỉ signOut nếu đang anonymous
    if (current != null && current.isAnonymous == true) {
      await supabase.auth.signOut();
    }

    try {
      final res = await supabase.auth.signInWithPassword(
        email: email,
        password: password,
      );

      return res.user!.id;
    } catch (e) {
      print("Login error: $e");
      return "wrong";
    }
  }

  static Future<void> logout() async {
    // 1. Xóa session của user hiện tại
    await supabase.auth.signOut();

    // 2. Tạo lại Anonymous user
    final anonRes = await supabase.auth.signInAnonymously();

    print("Anonymous user: ${anonRes.user?.id}");
  }
}
