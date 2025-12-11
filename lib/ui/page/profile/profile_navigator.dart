import 'package:go_router/go_router.dart';
import 'package:todo_app/common/app_navigator.dart';
import 'package:todo_app/model/entities/profile/profile_entity.dart';
import 'package:todo_app/router/app_router.dart';

class ProfileNavigator extends AppNavigator {
  ProfileNavigator({required super.context});

  Future<T?> goUpdatePage <T>(ProfileEntity profile) async {
    return context.push<T>(AppRouter.updateProfile, extra: profile);

  }

  void goBackHome(String? avatarLink){
    context.pop(avatarLink);
  }



}