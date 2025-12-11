import 'package:flutter/cupertino.dart';
import 'package:todo_app/main.dart';
import 'package:todo_app/model/entities/profile/profile_entity.dart';
abstract class ProfileRepository {
  Future<ProfileEntity> getProfileById(String id);

  Future<void> addProfile(ProfileEntity profile);

  Future<void> updateProfile(ProfileEntity profile, String id);
}

class ProfileRepositoryImpl extends ProfileRepository {
  @override
  Future<ProfileEntity> getProfileById(String id) async {
    final data = await supabase.from('profile').select().eq('id', id);
    return ProfileEntity.fromJson(data.first);
  }

  @override
  Future<void> addProfile(ProfileEntity profile) async {
    final res = await supabase.from('profile').insert(profile.toJson()).select();
    if (res.isEmpty) {
      debugPrint("Error add profile");
    }
  }

  @override
  Future<void> updateProfile(ProfileEntity profile, String id) async {
    try {
      await supabase.from('profile').update(profile.toJson()).eq('id', id).select();
    } catch (e) {
      debugPrint("error update");
    }
  }
}
