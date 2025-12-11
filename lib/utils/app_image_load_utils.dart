import 'package:flutter/material.dart';
import 'package:todo_app/model/entities/profile/profile_entity.dart';
import 'package:todo_app/services/storage_service.dart';
import 'package:todo_app/ui/page/profile/update_profile/update_profile_provider.dart';

class AppImageLoadUtils{
  static void showImageSourceDialog (
      BuildContext context, UpdateProfileProvider provider, ProfileEntity profileEntity
      ) {
    showModalBottomSheet(
      context: context,
      builder: (BuildContext bc) {
        return SafeArea(
          child: Wrap(
            children: <Widget>[
              // Tùy chọn 1: Camera
              ListTile(
                leading: const Icon(Icons.photo_camera),
                title: const Text('Camera'),
                onTap: () {
                  Navigator.of(context).pop();
                  provider.updateAvatar(profileEntity, ImageSourceType.camera);
                },
              ),
              // Tùy chọn 2: Gallery
              ListTile(
                leading: const Icon(Icons.photo_library),
                title: const Text('Gallery'),
                onTap: () {
                  Navigator.of(context).pop();
                  provider.updateAvatar(profileEntity, ImageSourceType.gallery);
                },
              ),
            ],
          ),
        );
      },
    );
  }

}