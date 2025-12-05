import 'package:todo_app/services/auth.dart';

abstract class AuthRepository {
  Future<void> logIn(String email, String password);
  Future<void> signUp(String email, String password);
  Future<void> logOut();
}

class AuthRepositoryImpl extends AuthRepository {

  @override
  Future<void> logIn(String email, String password) async {
     Auth.signIn(email, password);
  }

  @override
  Future<void> logOut()  async {
    Auth.logout();
  }

  @override
  Future<void> signUp(String email, String password)  async {
    Auth.signUp(email, password);
  }

}
