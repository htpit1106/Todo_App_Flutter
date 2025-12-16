import 'package:flutter/widgets.dart';
import 'package:todo_app/model/entities/profile/profile_entity.dart';
import 'package:todo_app/repository/profile_repository.dart';
import 'package:todo_app/services/storage_service.dart';
import 'package:todo_app/ui/page/profile/update_profile/update_profile_navigator.dart';

class UpdateProfileProvider extends ChangeNotifier {
  final ProfileRepository profileRepo;
  final UpdateProfileNavigator navigator;
  final StorageService storageService;
  String? _avatarUrl;

  String? get avatarUrl => _avatarUrl;
  bool _isLoading = false;

  bool get isLoading => _isLoading;

  UpdateProfileProvider({
    required this.profileRepo,
    required this.navigator,
    required this.storageService,
  });

  void setAvatarUrl(String? url) {
    _avatarUrl = url;
    notifyListeners();
  }

  // update profile
  Future<void> updateProfile({required ProfileEntity profile}) async {
    if (profile.id == null) return;

    try {
      await profileRepo.updateProfile(profile, profile.id!);
      navigator.goBackHome(reload: true);
    } catch (e) {
      debugPrint("Error: $e");
    }
  }

  Future<void> updateAvatar(ProfileEntity currentProfile, ImageSourceType sourceType) async {
    final imageFile = await storageService.pickerImage(sourceType);
    if (imageFile == null) return;
    String? userId = currentProfile.id;
    if (userId == null) return;

    _isLoading = true;
    notifyListeners();

    try {
      _avatarUrl = await storageService.uploadImage(imageFile, userId);
    } catch (e) {
      debugPrint("Error: $e");
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }
}
