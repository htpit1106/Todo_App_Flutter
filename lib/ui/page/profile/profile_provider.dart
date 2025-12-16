import 'package:flutter/material.dart';
import 'package:todo_app/main.dart';
import 'package:todo_app/model/entities/profile/profile_entity.dart';
import 'package:todo_app/repository/auth_repository.dart';
import 'package:todo_app/repository/profile_repository.dart';
import 'package:todo_app/router/app_router.dart';
import 'package:todo_app/ui/page/profile/profile_navigator.dart';

class ProfileProvider extends ChangeNotifier {
  final ProfileNavigator navigator;
  final AuthRepository authRepo;
  final ProfileRepository profileRepo;
  final _user = supabase.auth.currentUser;

  ProfileEntity? _profile;
  ProfileEntity? get profile => _profile;

  ProfileProvider({
    required this.navigator,
    required this.authRepo,
    required this.profileRepo,

  });

  Future<void> getProfileById() async {
    if (_user == null) return;
    _profile = await profileRepo.getProfileById(_user.id);
    notifyListeners();
  }

  Future<void> logout() async {
    await authRepo.logOut();
    navigator.pushReplacementNamed(AppRouter.logIn);
  }


  Future<void> onPressUpdateProfile() async {
    if (_profile == null) return;
    final result = await navigator.goUpdatePage(_profile!);
    if (result == true) {
      getProfileById();
    }
  }
  void onBackHome(){
    navigator.goBackHome(_profile?.avatarLink);
  }
}
